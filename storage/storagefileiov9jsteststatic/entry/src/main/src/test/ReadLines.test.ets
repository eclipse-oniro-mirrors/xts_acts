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
const FILE_CONTENTS = 'hello world\nhello js\nhello world1';

export default function fileIOReadLines() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_readLines", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_readLines start');

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_0100
     * @tc.name fileIO_test_readLines_sync_static_001
     * @tc.desc Test readLinesSync() interfaces.
     * Read file content by line through path, verify normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_readLines_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readLines_sync_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
        let readerIterator = fs.readLinesSync(fpath);
        for (let i = 0; i < arr.length; i++) {
          let it = readerIterator.next();
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_001 readLen1: ' + it.value);
          expect(it.value.trim() == arr[i]).assertTrue();
        }
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_0200
     * @tc.name fileIO_test_readLines_sync_static_002
     * @tc.desc Test readLinesSync() interfaces.
     * Read file content by line through path when encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_readLines_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_002 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readLines_sync_static_002');
        expect(await Utils.prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
        let readerIterator = fs.readLinesSync(fpath, {
          encoding: 'utf-8'
        });
        for (let i = 0; i < arr.length; i++) {
          let it = readerIterator.next();
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_002 readLen1: ' + it.value);
          expect(it.value.trim() == arr[i]).assertTrue();
        }
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_0400
     * @tc.name fileIO_test_readLines_sync_static_004
     * @tc.desc Test readLinesSync() interfaces.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readLines_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_004 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readLines_sync_static_004');
        fs.readLinesSync(fpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_004 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_0500
     * @tc.name fileIO_test_readLines_sync_static_005
     * @tc.desc Test readLinesSync() interfaces.
     * Undefined options arguments,use default option.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readLines_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_005 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readLines_sync_static_005');
        expect(await Utils.prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
        let readerIterator = fs.readLinesSync(fpath, undefined);
        for (let i = 0; i < arr.length; i++) {
          let it = readerIterator.next();
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_005 readLen1: ' + it.value);
          expect(it.value.trim() == arr[i]).assertTrue();
        }
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_005 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_0700
     * @tc.name fileIO_test_readLines_sync_static_007
     * @tc.desc Test readLinesSync() interfaces.
     * Read file content by line through path when encoding = 'utf-16'.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_readLines_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_007 start');
      let fpath = await Utils.nextFileName('fileIO_test_readLines_sync_static_007');
      try {
        expect(await Utils.prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
        fs.readLinesSync(fpath, {
          encoding: 'utf-16'
        });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_007 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_0800
     * @tc.name fileIO_test_readLines_sync_static_008
     * @tc.desc Test readLinesSync() interfaces.
     * Read file content by line through path, verify normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_readLines_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_008 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readLines_sync_static_008');
        expect(await Utils.prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
        let readerIterator = fs.readLinesSync(fpath);
        for (let i = 0; i < arr.length; i++) {
          let it = readerIterator.next();
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_008 readLen1: ' + it.value + it.done);
          expect(it.value.trim() == arr[i]).assertTrue();
          expect(it.done == false).assertTrue();
        }
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_sync_static_008 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_0100
     * @tc.name fileIO_test_readLines_async_static_001
     * @tc.desc Test readLines() interfaces. Promise.
     * Read file content by line through path, verify normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_readLines_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readLines_async_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
        let readerIterator = await fs.readLines(fpath, {
          encoding: 'utf-8'
        });
        for (let i = 0; i < arr.length; i++) {
          let it = readerIterator.next();
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_001 readLen1: ' + it.value + it.done);
          expect(it.value.trim() == arr[i]).assertTrue();
        }
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_0200
     * @tc.name fileIO_test_readLines_async_static_002
     * @tc.desc Test readLines() interfaces. Callback.
     * Read file content by line through path, verify normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_readLines_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_002 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readLines_async_static_002');
        expect(await Utils.prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
        fs.readLines(fpath, { encoding: 'utf-8' }, (err: BusinessError | null, readerIterator: fs.ReaderIterator | undefined) => {
          for (let i = 0; i < arr.length; i++) {
            let it = readerIterator?.next();
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_002 readLen1: ' + it?.value + it?.done);
            expect(it?.value.trim() == arr[i]).assertTrue();
            expect(it?.done == false).assertTrue();
          }
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_0300
     * @tc.name fileIO_test_readLines_async_static_003
     * @tc.desc Test readLines() interfaces. Promise.
     * Read file content by line through path when encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readLines_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_003 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readLines_async_static_003');
        expect(await Utils.prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
        let readerIterator = await fs.readLines(fpath, {
          encoding : 'utf-8'
        });
        for (let i = 0; i < arr.length; i++) {
          let it = readerIterator.next();
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_003 readLen1: ' + it.value + it.done);
          expect(it.value.trim() == arr[i]).assertTrue();
          expect(it.done == false).assertTrue();
        }
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_0400
     * @tc.name fileIO_test_readLines_async_static_004
     * @tc.desc Test readLines() interfaces. Callback.
     * Read file content by line through path when encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readLines_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_004 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readLines_async_static_004');
        expect(await Utils.prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
        fs.readLines(fpath, {
          encoding : 'utf-8'
        },  (err: BusinessError | null, readerIterator: fs.ReaderIterator | undefined) => {
          for (let i = 0; i < arr.length; i++) {
            let it = readerIterator?.next();
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_004 readLen1: ' + it?.value + it?.done);
            expect(it?.value.trim() == arr[i]).assertTrue();
            expect(it?.done == false).assertTrue();
          }
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_0500
     * @tc.name fileIO_test_readLines_async_static_005
     * @tc.desc Test readLines() interfaces. Promise.then().catch()
     * Read file content by line through path when encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_readLines_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_005 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_readLines_async_static_005');
        expect(await Utils.prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
        fs.readLines(fpath, {
          encoding: 'utf-8'
        }).then((readerIterator: fs.ReaderIterator) => {
          for (let i = 0; i < arr.length; i++) {
            let it = readerIterator.next();
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_005 readLen1: ' + it.value + it.done);
            expect(it.value.trim() == arr[i]).assertTrue();
            expect(it.done == false).assertTrue();
          }
          fs.unlinkSync(fpath);
          done();
        }).catch((err: ()=>void): Promise<void> => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_005 error: ' + JSON.stringify(err));
          expect(false).assertTrue();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_readLines_async_static_005 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });


  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_readLines end');

}