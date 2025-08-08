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

export default function fileIOSymlink() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_symlink", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_symlink start');

    /**
     * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_0000
     * @tc.name fileIO_test_symlink_sync_static_000
     * @tc.desc Test symlinkSync() interfaces.
     * Create a symbolic link to verify normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_symlink_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_symlink_sync_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_symlink_sync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fs.symlinkSync(fpath, fpath + 'link01');
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_symlink_sync_static_000 has failed for' + JSON.stringify(e));
        expect(e.message == 'Permission denied').assertTrue();
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0100
     * @tc.name fileIO_test_symlink_async_static_001
     * @tc.desc Test SymlinkAsync interfaces. await Promise.
     * Create a symbolic link to verify normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_symlink_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_symlink_async_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_symlink_async_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        await fs.symlink(fpath, fpath + 'link2');
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_symlink_async_static_001 has failed for' + JSON.stringify(e));
        expect(e.message == 'Permission denied').assertTrue();
        fs.unlinkSync(fpath);
        done();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_symlink end');

}