import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOCreateStream() {
  describe('fileIO_fs_createStream', (): void => {

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0100
     * @tc.name fileIO_test_create_stream_sync_static_001
     * @tc.desc Test createStreamSync() interface.
     * File does not exist.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_stream_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_001');

      try {
        fs.createStreamSync(fpath, 'r');
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_000 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0200
     * @tc.name fileIO_test_create_stream_sync_static_002
     * @tc.desc Test createStreamSync() interface.
     * Create stream in 'r+' mode, reading and writing data from this stream.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0300
     * @tc.name fileIO_test_create_stream_sync_static_003
     * @tc.desc Test createStreamSync() interface.
     * Create stream in 'r+' mode, file does not exist.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_stream_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_003');

      try {
        fs.createStreamSync(fpath, 'r+');
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_003 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0400
     * @tc.name fileIO_test_create_stream_sync_static_004
     * @tc.desc Test createStreamSync() interface.
     * Invalid mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_stream_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.createStreamSync(fpath, 'ohos');
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_004 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0600
     * @tc.name fileIO_test_create_stream_sync_static_006
     * @tc.desc Test createStreamSync() interface.
     * Create stream in 'w' mode, writing data to file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        sw.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_006 end error' + JSON.stringify(e));
        expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0700
     * @tc.name fileIO_test_create_stream_sync_static_007
     * @tc.desc Test createStreamSync() interface.
     * Create stream in 'w' mode and empty contents.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_007 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0800
     * @tc.name fileIO_test_create_stream_sync_static_008
     * @tc.desc Test createStreamSync() interface.
     * Create stream in 'w' mode, creat a file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_stream_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_008');

      try {
        let sw = fs.createStreamSync(fpath, 'w');
        expect(sw !== null).assertTrue();
        expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sw.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_008 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0900
     * @tc.name fileIO_test_create_stream_sync_static_009
     * @tc.desc Test createStreamSync() interface.
     * Create stream in 'w+' mode and empty contents.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_009 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1000
     * @tc.name fileIO_test_create_stream_sync_static_010
     * @tc.desc Test createStreamSync() interface.
     * Create stream in 'w+' mode and creat a file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_010 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1100
     * @tc.name fileIO_test_create_stream_sync_static_011
     * @tc.desc Test createStreamSync() interface.
     * Create stream in 'a' mode and append contents.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_011 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1200
     * @tc.name fileIO_test_create_stream_sync_static_012
     * @tc.desc Test createStreamSync() interface.
     * Create stream in 'a' mode and creat a file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_stream_sync_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_sync_static_012');

      try {
        let sa = fs.createStreamSync(fpath, 'a');
        expect(sa !== null).assertTrue();
        expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sa.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_012 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1300
     * @tc.name fileIO_test_create_stream_sync_static_013
     * @tc.desc Test createStreamSync() interface.
     * Create stream in 'a' mode and write data to file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        sa.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_012 end error' + JSON.stringify(e));
        expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1400
     * @tc.name fileIO_test_create_stream_sync_static_014
     * @tc.desc Test createStreamSync() interface.
     * Create stream in 'a+' mode and append contents.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_014 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1500
     * @tc.name fileIO_test_create_stream_sync_static_015
     * @tc.desc Test createStreamSync() interface.
     * Create stream in 'a+' mode and creat a file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_sync_static_015 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0200
     * @tc.name fileIO_test_create_stream_async_static_002
     * @tc.desc Test createStream() interfaces. Promise.
     * Create stream in 'r' mode, file does not exist.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_stream_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_002');

      try {
        await fs.createStream(fpath, 'r');
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_002 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0300
     * @tc.name fileIO_test_create_stream_async_static_003
     * @tc.desc Test createStream() interfaces. Callback.
     * Create stream in 'r' mode, file does not exist.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_003 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });


    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0400
     * @tc.name fileIO_test_create_stream_async_static_004
     * @tc.desc Test createStream() interfaces. Promise.
     * Create stream in 'r+' mode, reading and writing data from this stream.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_004 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0500
     * @tc.name fileIO_test_create_stream_async_static_005
     * @tc.desc Test createStream() interfaces. Callback.
     * Create stream in 'r+' mode, reading and writing data from this stream.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_005 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0600
     * @tc.name fileIO_test_create_stream_async_static_006
     * @tc.desc Test createStream() interfaces. Promise.
     * Create stream in 'r+' mode, File does not exist.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_stream_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_006');

      try {
        await fs.createStream(fpath, 'r+');
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_006 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0700
     * @tc.name fileIO_test_create_stream_async_static_007
     * @tc.desc Test createStream() interfaces. Callback.
     * Create stream in 'r+' mode, file does not exist.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_007 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1000
     * @tc.name fileIO_test_create_stream_async_static_010
     * @tc.desc Test createStream() interfaces. Promise.
     * Create stream in 'w' mode and write data to file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_010 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1100
     * @tc.name fileIO_test_create_stream_async_static_011
     * @tc.desc Test createStream() interfaces. Promise.
     * Create stream in 'w' mode, can't to read data from this stream.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_stream_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_011');
      let sw = await fs.createStream(fpath, 'w');

      try {
        expect(sw !== null).assertTrue();
        expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sw.readSync(new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        sw.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_011 end error' + JSON.stringify(e));
        expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1200
     * @tc.name fileIO_test_create_stream_async_static_012
     * @tc.desc Test createStream() interfaces. Callback.
     * Create stream in 'w' mode, can't to read data from this stream.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_012 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1300
     * @tc.name fileIO_test_create_stream_async_static_013
     * @tc.desc Test createStream() interfaces. Promise.
     * Create stream in 'w+' mode and write/read data from this stream.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_013 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1400
     * @tc.name fileIO_test_create_stream_async_static_014
     * @tc.desc Test createStream() interfaces. Promise.
     * Create stream in 'w+' mode and creat a file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_014 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1500
     * @tc.name fileIO_test_create_stream_async_static_015
     * @tc.desc Test createStream() interfaces. Callback.
     * Create stream in 'w+' mode and creat a file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_015 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1600
     * @tc.name fileIO_test_create_stream_async_static_016
     * @tc.desc Test createStream() interfaces. Promise.
     * Create stream in 'a' mode and append content to file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_016 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1700
     * @tc.name fileIO_test_create_stream_async_static_017
     * @tc.desc Test createStream() interfaces. Promise.
     * Create stream in 'a' mode and can't to read data from stream.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_stream_async_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_stream_async_static_017');
      let sa = await fs.createStream(fpath, 'a');

      try {
        expect(sa !== null).assertTrue();
        expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sa.readSync(new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        sa.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_017 end error' + JSON.stringify(e));
        expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1800
     * @tc.name fileIO_test_create_stream_async_static_018
     * @tc.desc Test createStream() interfaces. Callback.
     * Create stream in 'a' mode and can't to read data from stream.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_018 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1900
     * @tc.name fileIO_test_create_stream_async_static_019
     * @tc.desc Test createStream() interfaces. Promise.
     * Create stream in 'a+' mode and append content to file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_019 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_2000
     * @tc.name fileIO_test_create_stream_async_static_020
     * @tc.desc Test createStream() interfaces. Promise.
     * Create stream in 'a+' mode and creat a file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_020 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_2100
     * @tc.name fileIO_test_create_stream_async_static_021
     * @tc.desc Test createStream() interfaces. Callback.
     * Create stream in 'a+' mode and append content to file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_stream_async_static_021 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}