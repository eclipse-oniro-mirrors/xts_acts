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

export default function fileIOCreateStream() {
  describe('fileIO_fs_createStream', (): void => {

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_001
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0100
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_001');

      try {
        fs.createStreamSync(fpath, 'r');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_000 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_002
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0200
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        expect(sr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
        expect(sr.writeSync(FILE_CONTENT, { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_003
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0300
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_003');

      try {
        fs.createStreamSync(fpath, 'r+');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_003 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_004
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0400
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.createStreamSync(fpath, 'ohos');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_004 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_006
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0600
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let sw = fs.createStreamSync(fpath, 'w');

      try {
        expect(sw !== null).assertTrue();
        expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sw.readSync(new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        sw.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_006 end error' + JSON.stringify(e));
        expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_007
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0700
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_007');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sw = fs.createStreamSync(fpath, 'w');
        expect(sw !== null).assertTrue();
        expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sw.closeSync();

        let sr = fs.createStreamSync(fpath, 'r');
        expect(sr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_007 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_008
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0800
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_008');

      try {
        let sw = fs.createStreamSync(fpath, 'w');
        expect(sw !== null).assertTrue();
        expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sw.closeSync();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_008 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_009
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0900
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_009');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sw = fs.createStreamSync(fpath, 'w+');
        expect(sw !== null).assertTrue();
        expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(sw.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        sw.closeSync();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_009 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_010
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1000
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_010');

      try {
        let sw = fs.createStreamSync(fpath, 'w+');
        expect(sw !== null).assertTrue();
        expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(sw.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        sw.closeSync();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_010 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_011
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1100
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sa = fs.createStreamSync(fpath, 'a');
        expect(sa !== null).assertTrue();
        expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sa.closeSync();

        let sr = fs.createStreamSync(fpath, 'r');
        expect(sr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length * 2).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_011 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_012
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1200
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_012');

      try {
        let sa = fs.createStreamSync(fpath, 'a');
        expect(sa !== null).assertTrue();
        expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sa.closeSync();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_012 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_013
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1300
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_013');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let sa = fs.createStreamSync(fpath, 'a');

      try {
        expect(sa !== null).assertTrue();
        expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sa.readSync(new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        sa.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_013 end error' + JSON.stringify(e));
        expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_014
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1400
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_014');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sa = fs.createStreamSync(fpath, 'a+');
        expect(sa !== null).assertTrue();
        expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(sa.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length * 2).assertTrue();
        sa.closeSync();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_014 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_015
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1500
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_015');

      try {
        let sa = fs.createStreamSync(fpath, 'a+');
        expect(sa !== null).assertTrue();
        expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(sa.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        sa.closeSync();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_015 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_016
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1600
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        fs.createStreamSync("", 'r');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_016 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_sync_static_017
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1700
     * @tc.desc   Test createStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_sync_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_017');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.createStreamSync(fpath, '');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_017 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_000
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0000
     * @tc.desc   Test createStream() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      try {
        await fs.createStream("", 'r');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_000 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_001
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0100
     * @tc.desc   Test createStream() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        await fs.createStream(fpath, '');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_001 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_002
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0200
     * @tc.desc   Test createStream() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_002');

      try {
        await fs.createStream(fpath, 'r');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_002 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_003
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0300
     * @tc.desc   Test createStream() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_003');

      try {
        fs.createStream(fpath, 'r', (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_003 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_003 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });


    /**
     * @tc.name   fileIO_test_create_stream_async_static_004
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0400
     * @tc.desc   Test createStream() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = await fs.createStream(fpath, 'r+');
        expect(sr !== null).assertTrue();
        expect(sr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
        expect(sr.writeSync(FILE_CONTENT, { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_004 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_005
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0500
     * @tc.desc   Test createStream() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.createStream(fpath, 'r+', (err: BusinessError | null, sr: fs.Stream | undefined) => {
          expect(sr !== null).assertTrue();
          expect(sr?.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
          expect(sr?.writeSync(FILE_CONTENT, { offset: 0 }) == FILE_CONTENT.length).assertTrue();
          sr?.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_005 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_006
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0600
     * @tc.desc   Test createStream() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_006');

      try {
        await fs.createStream(fpath, 'r+');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_006 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_007
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0700
     * @tc.desc   Test createStream() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_007');

      try {
        fs.createStream(fpath, 'r+', (err: BusinessError<void> | null) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_007 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_007 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_008
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0800
     * @tc.desc   Test createStream() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      try {
        fs.createStream("", 'r+', (err: BusinessError<void> | null) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_008 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_008 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_009
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0900
     * @tc.desc   Test createStream() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_009');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.createStream(fpath, '', (err: BusinessError<void> | null) => {
          if(err?.code != 0){
            fs.unlinkSync(fpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_009 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_009 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_010
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1000
     * @tc.desc   Test createStream() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_010');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sw = await fs.createStream(fpath, 'w');
        expect(sw !== null).assertTrue();
        expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sw.closeSync();

        let sr = fs.createStreamSync(fpath, 'r');
        expect(sr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_010 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_011
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1100
     * @tc.desc   Test createStream() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_011');
      let sw = await fs.createStream(fpath, 'w');

      try {
        expect(sw !== null).assertTrue();
        expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sw.readSync(new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        sw.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_011 end error' + JSON.stringify(e));
        expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_012
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1200
     * @tc.desc   Test createStream() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_012');

      try {
        fs.createStream(fpath, 'w', (err: BusinessError | null, sw: fs.Stream | undefined) => {
          expect(sw !== null).assertTrue();
          expect(sw?.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_012 start');
          sw?.read(new ArrayBuffer(4096), {
            length: 5
          }, (err: BusinessError<void> | null) => {
            if (err?.code != 0) {
              hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_012 start111');
              sw?.closeSync();
              fs.unlinkSync(fpath);
              hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_012 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
              expect(err?.code == 13900005 && err?.message == 'I/O error').assertTrue();
              done();
            } else {
              expect(false).assertTrue();
            }
          });
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_012 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_013
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1300
     * @tc.desc   Test createStream() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_013');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sw = await fs.createStream(fpath, 'w+');
        expect(sw !== null).assertTrue();
        expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(sw.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        sw.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_013 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_014
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1400
     * @tc.desc   Test createStream() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_014');

      try {
        let sw = await fs.createStream(fpath, 'w+');
        expect(sw !== null).assertTrue();
        expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(sw.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        sw.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_014 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_015
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1500
     * @tc.desc   Test createStream() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_015');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.createStream(fpath, 'w+', (err: BusinessError | null, sw: fs.Stream | undefined) => {
          expect(sw !== null).assertTrue();
          expect(sw?.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
          expect(sw?.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
          sw?.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_015 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_016
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1600
     * @tc.desc   Test createStream() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_016');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sa = await fs.createStream(fpath, 'a');
        expect(sa !== null).assertTrue();
        expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sa.closeSync();

        let sr = fs.createStreamSync(fpath, 'r');
        expect(sr.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length * 2).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_016 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_017
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1700
     * @tc.desc   Test createStream() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_017');
      let sa = await fs.createStream(fpath, 'a');

      try {
        expect(sa !== null).assertTrue();
        expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sa.readSync(new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        sa.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_017 end error' + JSON.stringify(e));
        expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_018
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1800
     * @tc.desc   Test createStream() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_018');

      try {
        fs.createStream(fpath, 'a', (err: BusinessError | null, sa: fs.Stream | undefined) => {
          expect(sa !== null).assertTrue();
          expect(sa?.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_018 read start ');
          sa?.read(new ArrayBuffer(4096), {
            length: 5
          }, (err: BusinessError<void> | null) => {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_018 read 1111');
            if (err?.code != 0) {
              sa?.closeSync();
              fs.unlinkSync(fpath);
              hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_018 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
              expect(err?.code == 13900005 && err?.message == 'I/O error').assertTrue();
              done();
            } else {
              expect(false).assertTrue();
            }
          })
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_018 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_019
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1900
     * @tc.desc   Test createStream() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_019');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sa = await fs.createStream(fpath, 'a+');
        expect(sa !== null).assertTrue();
        expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(sa.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length * 2).assertTrue();
        sa.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_019 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_020
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_2000
     * @tc.desc   Test createStream() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_020');

      try {
        let sa = await fs.createStream(fpath, 'a+');
        expect(sa !== null).assertTrue();
        expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(sa.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        sa.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_020 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_stream_async_static_021
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_2100
     * @tc.desc   Test createStream() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_stream_async_static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_021');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.createStream(fpath, 'a+', (err: BusinessError | null, sa: fs.Stream | undefined) => {
          expect(sa !== null).assertTrue();
          expect(sa?.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
          expect(sa?.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length * 2).assertTrue();
          sa?.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_021 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}