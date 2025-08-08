import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';

export default function fileIOReadtext() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_readtext", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_readLines start');

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0000
     * @tc.name fileIO_test_readtext_sync_static_000
     * @tc.desc Test readtextSync() interfaces.
     * Read file content by path, verify normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_readtext_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_sync_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let str = fs.readTextSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_000 readLen1: ' + str);
        expect(str == FILE_CONTENT).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0100
     * @tc.name fileIO_test_readtext_sync_static_001
     * @tc.desc Test readtextSync() interfaces.
     * str.substring(startIndex, [endIndex - 1]): Extracts and returns a string by index.
     * Read file content by path when offset = 1.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_sync_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let str = fs.readTextSync(fpath, { offset: 2 });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_001 readLen1: ' + str + str.length);
        expect(str == FILE_CONTENT.substring(2, FILE_CONTENT.length + 1)).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0200
     * @tc.name fileIO_test_readtext_sync_static_002
     * @tc.desc Test readtextSync() interfaces.
     * Read file content by path when offset = 2, length = 4.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_002 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_sync_static_002');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let str = fs.readTextSync(fpath, {
          offset: 2,
          length: 4
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_002 readLen1: ' + str + str.length);
        expect(str == FILE_CONTENT.substring(2, 6)).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0300
     * @tc.name fileIO_test_readtext_sync_static_003
     * @tc.desc Test readtextSync() interfaces.
     * Read file content by path when offset = 1, length = 11, encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_003 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_sync_static_003');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let str = fs.readTextSync(fpath, {
          offset: 1,
          length: FILE_CONTENT.length,
          encoding: 'utf-8'
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_003 readLen1: ' + str +str.length);
        expect(str == FILE_CONTENT.substring(1, FILE_CONTENT.length + 1)).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0500
     * @tc.name fileIO_test_readtext_sync_static_005
     * @tc.desc Test readtextSync() interfaces.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_005 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_sync_static_005');
        fs.readTextSync(fpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_005 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0600
     * @tc.name fileIO_test_readtext_sync_static_006
     * @tc.desc Test readtextSync() interfaces.
     * Read file content with invalid offset < 0.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_006 start');
      let fpath = await Utils.nextFileName('fileIO_test_readtext_sync_static_006');
      try {
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        const invalidOffset = -1;
        fs.readTextSync(fpath, { offset: invalidOffset });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_006 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0700
     * @tc.name fileIO_test_readtext_sync_static_007
     * @tc.desc Test readtextSync() interfaces.
     * Read file content with invalid offset = 9999.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_007 start');
      let fpath = await Utils.nextFileName('fileIO_test_readtext_sync_static_007');
      try {
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        const invalidOffset = 9999;
        fs.readTextSync(fpath, { offset: invalidOffset });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_007 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0800
     * @tc.name fileIO_test_readtext_sync_static_008
     * @tc.desc Test readtextSync() interfaces.
     * Read file content with invalid length < 0.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_008 start');
      let fpath = await Utils.nextFileName('fileIO_test_readtext_sync_static_008');
      try {
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        const invalidLength = -1;
        fs.readTextSync(fpath, { length: invalidLength });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_008 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0900
     * @tc.name fileIO_test_readtext_sync_static_009
     * @tc.desc Test readtextSync() interfaces.
     * Use default option.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_sync_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_009 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_sync_static_009');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let str = fs.readTextSync(fpath, undefined);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_009 readLen1: ' + str);
        expect(str == FILE_CONTENT).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_009 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_1000
     * @tc.name fileIO_test_readtext_sync_static_010
     * @tc.desc Test readtextSync() interfaces.
     * Use default option.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_sync_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_010 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_sync_static_010');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let str = fs.readTextSync(fpath, {
          offset: undefined,
          length: undefined,
          encoding: undefined
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_010 readLen1: ' + str);
        expect(str == FILE_CONTENT).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_010 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_1100
     * @tc.name fileIO_test_readtext_sync_static_011
     * @tc.desc Test readtextSync() interfaces.
     * Is a directory.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_readtext_sync_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_011 start');
      let fpath = await Utils.nextFileName('fileIO_test_readtext_sync_static_011');
      try {
        fs.mkdirSync(fpath);
        fs.readTextSync(fpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_sync_static_011 has failed for' + JSON.stringify(e));
        expect(e.code == 13900019 && e.message == 'Is a directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0000
     * @tc.name fileIO_test_readtext_async_static_000
     * @tc.desc Test readtext() interfaces. Promise.
     * Read file content by path, verify normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let str = await fs.readText(fpath, { length: 11 });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_000 readLen1: ' + str);
        expect(str == FILE_CONTENT).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0100
     * @tc.name fileIO_test_readtext_async_static_001
     * @tc.desc Test readtext() interfaces. Callback.
     * Read file content by path, verify normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.readText(fpath, { length: 11 }, (err: BusinessError | null, str: string | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_001 readLen1: ' + str);
          expect(str == FILE_CONTENT).assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0200
     * @tc.name fileIO_test_readtext_async_static_002
     * @tc.desc Test readtext() interfaces. Promise.
     * Read file content by path when offset = 1.
     * str.substr(startIndex, [length]): Extracts and returns a string by index and length of str.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_002 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_002');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let str = await fs.readText(fpath, { offset: 1 });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_002 readLen1: ' + str);
        expect(str == FILE_CONTENT.substr(1, FILE_CONTENT.length - 1)).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0300
     * @tc.name fileIO_test_readtext_async_static_003
     * @tc.desc Test readtext() interfaces. Callback.
     * Read file content by path when offset = 1.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_003 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_003');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.readText(fpath, { offset: 1 }, (err: BusinessError | null, str: string | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_003 readLen1: ' + str);
          expect(str == FILE_CONTENT.substr(1, FILE_CONTENT.length - 1)).assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0400
     * @tc.name fileIO_test_readtext_async_static_004
     * @tc.desc Test readtext() interfaces. Promise.
     * Read file content by path when offset = 1, length = 2.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_004 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_004');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let str = await fs.readText(fpath, {
          offset: 1,
          length: 2
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_004 readLen1: ' + str);
        expect(str == FILE_CONTENT.substr(1, 2)).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0500
     * @tc.name fileIO_test_readtext_async_static_005
     * @tc.desc Test readtext() interfaces. Callback.
     * Read file content by path when offset = 1, length = 2.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_005 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_005');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.readText(fpath, {
          offset: 1,
          length: 2
        },  (err: BusinessError | null, str: string | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_005 readLen1: ' + str);
          expect(str == FILE_CONTENT.substr(1, 2)).assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_005 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0600
     * @tc.name fileIO_test_readtext_async_static_006
     * @tc.desc Test readtext() interfaces. Promise.
     * Read file content by path when offset = 1, length = 11, encoding = 'utf-8'.
     * str.slice(startIndex, [endIndex - 1]): Extracts and returns a string by index.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_006 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_006');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let str = await fs.readText(fpath, {
          offset: 1,
          length: FILE_CONTENT.length,
          encoding: 'utf-8'
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_006 readLen1: ' + str);
        expect(str == FILE_CONTENT.slice(1, FILE_CONTENT.length + 1)).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_006 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0700
     * @tc.name fileIO_test_readtext_async_static_007
     * @tc.desc Test readtext() interfaces. Promise.then().catch()
     * Read file content by path when offset = 1, length = 11, encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_007 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_007');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let str = await fs.readText(fpath, {
          offset: 1,
          length: FILE_CONTENT.length,
          encoding: 'utf-8'
        }).then((str: string) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_007 readLen1: ' + str);
          expect(str == FILE_CONTENT.slice(1, FILE_CONTENT.length + 1)).assertTrue();
          fs.unlinkSync(fpath);
          done();
        }).catch((err: ()=>void): Promise<void> => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_007 has error' + JSON.stringify(err));
          expect(false).assertTrue();
        });

      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_007 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0800
     * @tc.name fileIO_test_readtext_async_static_008
     * @tc.desc Test readtext() interfaces. Callback.
     * Read file content by path when offset = 1, length = 11, encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_008 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_008');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.readText(fpath, {
          offset: 1,
          length: FILE_CONTENT.length,
          encoding: 'utf-8'
        },  (err: BusinessError | null, str: string | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_008 readLen1: ' + str);
          expect(str == FILE_CONTENT.slice(1, FILE_CONTENT.length + 1)).assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_008 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0900
     * @tc.name fileIO_test_readtext_async_static_009
     * @tc.desc Test readtext() interfaces. Promise.
     * Read file content by path when option parameter is empty.
     * str.slice(startIndex, [endIndex - 1]): Extracts and returns a string by index.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_009 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_009');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let str = await fs.readText(fpath, {});
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_009 readLen1: ' + str);
        expect(str == FILE_CONTENT).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_009 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1000
     * @tc.name fileIO_test_readtext_async_static_010
     * @tc.desc Test readtext() interfaces. Callback.
     * Read file content by path when option parameter is empty.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_010 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_010');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.readText(fpath, {},  (err: BusinessError | null, str: string | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_010 readLen1: ' + str);
          expect(str == FILE_CONTENT).assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_010 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1100
     * @tc.name fileIO_test_readtext_async_static_011
     * @tc.desc Test readtext() interfaces. Promise.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_011 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_011');
        await fs.readText(fpath,{});
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_011 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1200
     * @tc.name fileIO_test_readtext_async_static_012
     * @tc.desc Test readtext() interfaces. Callback.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_012 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_012');
        fs.readText(fpath, { length: 2 },  (err: BusinessError | null, str: string | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_012 readLen1: ' + JSON.stringify(err));
          if(err?.code != 0){
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_012 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1300
     * @tc.name fileIO_test_readtext_async_static_013
     * @tc.desc Test readtext() interfaces.
     * Read file content with invalid offset < 0.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_013 start');
      let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_013');
      try {
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        const invalidOffset = -1;
        await fs.readText(fpath, { offset: invalidOffset });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_013 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1400
     * @tc.name fileIO_test_readtext_async_static_014
     * @tc.desc Test readtext() interfaces.
     * Read file content with invalid offset = 9999.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_014 start');
      let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_014');
      try {
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        const invalidOffset = 9999;
        await fs.readText(fpath, { offset: invalidOffset });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_014 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1500
     * @tc.name fileIO_test_readtext_async_static_015
     * @tc.desc Test readtext() interfaces.
     * Read file content with invalid length < 0.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_015 start');
      let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_015');
      try {
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        const invalidLength = -1;
        await fs.readText(fpath, { length: invalidLength });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_015 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1800
     * @tc.name fileIO_test_readtext_async_static_018
     * @tc.desc Test readtext() interfaces. Promise.
     * Use default option.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_018 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_018');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let str = await fs.readText(fpath, {
          offset: undefined,
          length: undefined,
          encoding: undefined
        });
        expect(str == FILE_CONTENT).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_018 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1900
     * @tc.name fileIO_test_readtext_async_static_019
     * @tc.desc Test readtext() interfaces. Callback.
     * Use default option.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_019 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_019');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.readText(fpath, {
          offset: undefined,
          length: undefined,
          encoding: undefined
        },  (err: BusinessError | null, str: string | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_019 has error for' + JSON.stringify(err));
          expect(str == FILE_CONTENT).assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_019 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_2000
     * @tc.name fileIO_test_readtext_async_static_020
     * @tc.desc Test readtext() interfaces. Promise.
     * Is a directory.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_020 start');
      let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_020');
      fs.mkdirSync(fpath);
      try {
        await fs.readText(fpath, {});
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_020 has failed for' + JSON.stringify(e));
        expect(e.code == 13900019 && e.message == 'Is a directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_2100
     * @tc.name fileIO_test_readtext_async_static_021
     * @tc.desc Test readtext() interfaces. Callback.
     * Is a directory.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_readtext_async_static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_021 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readtext_async_static_021');
        fs.mkdirSync(fpath);
        fs.readText(fpath, {},  (err: BusinessError | null, str: string | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_021 fpath: ' + JSON.stringify(err));
          if(err?.code != 0){
            fs.rmdirSync(fpath);
            expect(err?.code == 13900019 && err?.message == 'Is a directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readtext_async_static_021 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_readLines end');

}