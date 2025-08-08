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

export default function fileIOUtimes() {
  describe("fileIO_fileIO_utimes", (): void => {

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0100
     * @tc.name fileIO_test_utimes_async_static_001
     * @tc.desc Test utimes() interfaces.
     * Modify File Last Access Time attribute,verify normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_utimes_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_utimes_async_static_001');
      expect(await Utils.prepareFile(fpath,FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime();
        fs.utimes(fpath, time);
        let stat = fs.statSync(fpath);
        let setime = Math.floor(time / 1000);
        expect(stat.mtime == setime).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_utimes_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0200
     * @tc.name fileIO_test_utimes_async_static_002
     * @tc.desc Test utimes() interfaces.
     * Modify the time(minus 10s) of the file,Verify normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_utimes_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_utimes_async_static_002');
      expect(await Utils.prepareFile(fpath,FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() - 10000;
        fs.utimes(fpath, time);
        let stat = fs.statSync(fpath);
        let setime = Math.floor(time / 1000);
        expect(stat.mtime == setime).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_utimes_async_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0300
     * @tc.name fileIO_test_utimes_async_static_003
     * @tc.desc Test utimes() interfaces.
     * Modify the time(add 3s) of the file, verify normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_utimes_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_utimes_async_static_003');
      expect(await Utils.prepareFile(fpath,FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() + 3000;
        fs.utimes(fpath, time);
        let stat = fs.statSync(fpath);
        let setime = Math.floor(time / 1000);
        expect(stat.mtime == setime).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_utimes_async_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0400
     * @tc.name fileIO_test_utimes_async_static_004
     * @tc.desc Test utimes() interfaces.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_utimes_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_utimes_async_static_004');

      try {
        fs.utimes(fpath,new Date().getTime());
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_utimes_async_static_004 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0600
     * @tc.name fileIO_test_utimes_async_static_006
     * @tc.desc Test utimes() interfaces.
     * Invalid parameter -1
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_utimes_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_utimes_async_static_006');
      expect(await Utils.prepareFile(fpath,FILE_CONTENT)).assertTrue();

      try {
        fs.utimes(fpath,-1);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_utimes_async_static_006 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
  })
}