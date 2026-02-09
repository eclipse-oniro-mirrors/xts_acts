import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import statvfs from '@ohos.file.statvfs';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';

export default function statvfs_test() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  describe("statvfs_test", (): void => {
    hilog.info(domain, tag, '%{public}s', 'statvfs_test start');

    /**
     * @tc.name   statvfs_test_get_free_size_sync_static_000
     * @tc.number SUB_DF_STATFS_GET_FREE_SIZE_SYNC_0000
     * @tc.desc   Test getFreeSizeSync() interfaces, when the path is a sandbox path, promise way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('statvfs_test_get_free_size_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_sync_static_000 start');
      try {
        let data = context.filesDir;
        let num = statvfs.getFreeSizeSync(data);
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_sync_static_000 getFreeSize getFilesDir===> '+ (num / 1024));
        expect(await Utils.isIntNum(num)).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_sync_static_000 has failed for' + e.message + ' code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   statvfs_test_get_free_size_sync_static_001
     * @tc.number SUB_DF_STATFS_GET_FREE_SIZE_SYNC_0100
     * @tc.desc   Test getFreeSizeSync() interfaces, when the path is dev, callback way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('statvfs_test_get_free_size_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_sync_static_001 start');
      try {
        let num = statvfs.getFreeSizeSync("/dev");
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_sync_static_001 getFreeSize dev===> '+ (num / 1024));
        expect(await Utils.isIntNum(num)).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_sync_static_001 has failed for' + e.message + ' code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   statvfs_test_get_free_size_sync_static_002
     * @tc.number SUB_DF_STATFS_GET_FREE_SIZE_SYNC_0200
     * @tc.desc   Test getFreeSizeSync() interfaces, when the parameter type is wrong.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('statvfs_test_get_free_size_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_sync_static_002 start');
      try {
        statvfs.getFreeSizeSync("1");
        expect(false).assertTrue()
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_sync_static_002 has failed for' + e.message + ' code: ' + e.code);
        //expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.name   statvfs_test_get_free_size_sync_static_003
     * @tc.number SUB_DF_STATFS_GET_FREE_SIZE_SYNC_0300
     * @tc.desc   Test getFreeSizeSync() interfaces, when the path is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('statvfs_test_get_free_size_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_sync_static_003 start');
      try {
        statvfs.getFreeSizeSync("");
        expect(false).assertTrue()
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_sync_static_003 has failed for' + e.message + ' code: ' + e.code);
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.name   statvfs_test_get_total_size_sync_static_000
     * @tc.number SUB_DF_STATFS_GET_TOTAL_SIZE_SYNC_0000
     * @tc.desc   Test getTotalSizeSync() interfaces, when the path is a sandbox path, promise way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('statvfs_test_get_total_size_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_sync_static_000 start');
      try {
        let data = context.filesDir;
        let num = statvfs.getTotalSizeSync(data);
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_sync_static_000 getTotalSizeNumber getFilesDir===> '+ (num / 1024));
        expect(await Utils.isIntNum(num)).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_sync_static_000 has failed for' + e.message + ' code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   statvfs_test_get_total_size_sync_static_001
     * @tc.number SUB_DF_STATFS_GET_TOTAL_SIZE_SYNC_0100
     * @tc.desc   Test getTotalSizeSync() interfaces, when the path is dev, callback way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('statvfs_test_get_total_size_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_sync_static_001 start');
      try {
        let num = statvfs.getTotalSizeSync("/dev");
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_sync_static_001 getTotalSizeNumber dev===> '+ (num / 1024));
        expect(await Utils.isIntNum(num)).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_sync_static_001 has failed for' + e.message + ' code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   statvfs_test_get_total_size_sync_static_002
     * @tc.number SUB_DF_STATFS_GET_TOTAL_SIZE_SYNC_0200
     * @tc.desc   Test getTotalSizeSync() interfaces, when the parameter type is wrong.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('statvfs_test_get_total_size_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_sync_static_002 start');
      try {
        statvfs.getTotalSizeSync("1");
        expect(false).assertTrue()
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_sync_static_002 has failed for' + e.message + ' code: ' + e.code);
        //expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.name   statvfs_test_get_total_size_sync_static_003
     * @tc.number SUB_DF_STATFS_GET_TOTAL_SIZE_SYNC_0300
     * @tc.desc   Test getTotalSizeSync() interfaces, when the path is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('statvfs_test_get_total_size_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_sync_static_003 start');
      try {
        statvfs.getTotalSizeSync("");
        expect(false).assertTrue()
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_sync_static_003 has failed for' + e.message + ' code: ' + e.code);
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.name   statvfs_test_get_free_size_async_static_000
     * @tc.number SUB_DF_STATFS_GET_FREE_SIZE_0000
     * @tc.desc   Test getFreeSize() interfaces, when the path is a sandbox path, promise way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('statvfs_test_get_free_size_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_async_static_000 start');
      try {
        let data = context.filesDir;
        let num = await statvfs.getFreeSize(data);
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_async_static_000 getFreeSize getFilesDir===> '+ (num / 1024));
        expect(await Utils.isIntNum(num)).assertTrue();
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_async_static_000 has failed for' + e.message + ' code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   statvfs_test_get_free_size_async_static_001
     * @tc.number SUB_DF_STATFS_GET_FREE_SIZE_0100
     * @tc.desc   Test getFreeSize() interfaces, when the path is dev, callback way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('statvfs_test_get_free_size_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_async_static_001 start');
      try {
        statvfs.getFreeSize("/dev", (err: BusinessError | null, num: long | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_async_static_001 has error ' + err?.message + ' code: ' + err?.code);
            expect(false).assertTrue();
          }
          hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_async_static_001 getFreeSize dev===> ');
          if (num !== undefined) {
              expect(await Utils.isIntNum(Number(num)) as boolean).assertTrue();
          }
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_async_static_001 has failed for' + e.message + ' code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   statvfs_test_get_free_size_async_static_002
     * @tc.number SUB_DF_STATFS_GET_FREE_SIZE_0200
     * @tc.desc   Test getFreeSize() interfaces, when the parameter type is wrong.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('statvfs_test_get_free_size_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_async_static_002 start');
      try {
        await statvfs.getFreeSize("1");
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_async_static_002 has failed for' + e.message + ' code: ' + e.code);
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
        done();
      }
    });

    /**
     * @tc.name   statvfs_test_get_free_size_async_static_003
     * @tc.number SUB_DF_STATFS_GET_FREE_SIZE_0300
     * @tc.desc   Test getFreeSize() interfaces, when the path is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('statvfs_test_get_free_size_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_async_static_003 start');
      try {
        await statvfs.getFreeSize("");
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_async_static_003 has failed for' + e.message + ' code: ' + e.code);
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
        done();
      }
    });

    /**
     * @tc.name   statvfs_test_get_free_size_async_static_004
     * @tc.number SUB_DF_STATFS_GET_FREE_SIZE_0400
     * @tc.desc   Test getFreeSize() interfaces, when the path is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('statvfs_test_get_free_size_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_async_static_004 start');
      try {
        statvfs.getFreeSize("", (err: BusinessError | null, num: long | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_async_static_004 has error ' + err?.message + ' code: ' + err?.code);
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_free_size_async_static_004 has failed for' + e.message + ' code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   statvfs_test_get_total_size_async_static_000
     * @tc.number SUB_DF_STATFS_GET_TOTAL_SIZE_0000
     * @tc.desc   Test getTotalSize() interfaces, when the path is a sandbox path, promise way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('statvfs_test_get_total_size_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_async_static_000 start');
      try {
        let data = context.filesDir;
        let num = await statvfs.getTotalSize(data);
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_async_static_000 getTotalSize getFilesDir===> '+ (num / 1024));
        expect(await Utils.isIntNum(num)).assertTrue();
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_async_static_000 has failed for' + e.message + ' code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   statvfs_test_get_total_size_async_static_001
     * @tc.number SUB_DF_STATFS_GET_TOTAL_SIZE_0100
     * @tc.desc   Test getTotalSize() interfaces, when the path is dev, callback way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('statvfs_test_get_total_size_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_async_static_001 start');
      try {
        statvfs.getTotalSize("/dev", (err: BusinessError | null, num: long | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_async_static_001 has error ' + err?.message + ' code: ' + err?.code);
            expect(false).assertTrue();
          }
          hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_async_static_001 getTotalSize dev===> ');
          if (num !== undefined) {
            expect(await Utils.isIntNum(Number(num)) as boolean).assertTrue();
          }
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_async_static_001 has failed for' + e.message + ' code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   statvfs_test_get_total_size_async_static_002
     * @tc.number SUB_DF_STATFS_GET_TOTAL_SIZE_0200
     * @tc.desc   Test getTotalSize() interfaces, when the parameter type is wrong.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('statvfs_test_get_total_size_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_async_static_002 start');
      try {
        await statvfs.getTotalSize("1");
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_async_static_002 has failed for' + e.message + ' code: ' + e.code);
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
        done();
      }
    });

    /**
     * @tc.name   statvfs_test_get_total_size_async_static_003
     * @tc.number SUB_DF_STATFS_GET_TOTAL_SIZE_0300
     * @tc.desc   Test getTotalSize() interfaces, when the path is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('statvfs_test_get_total_size_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_async_static_003 start');
      try {
        await statvfs.getTotalSize("");
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_async_static_003 has failed for' + e.message + ' code: ' + e.code);
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
        done();
      }
    });

    /**
     * @tc.name   statvfs_test_get_total_size_async_static_004
     * @tc.number SUB_DF_STATFS_GET_TOTAL_SIZE_0400
     * @tc.desc   Test getTotalSize() interfaces, when the path is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('statvfs_test_get_total_size_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_async_static_004 start');
      try {
        statvfs.getTotalSize("", (err: BusinessError | null, num: long | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_async_static_004 has error ' + err?.message + ' code: ' + err?.code);
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'statvfs_test_get_total_size_async_static_004 has failed for' + e.message + ' code: ' + e.code);
        expect(false).assertTrue();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'statvfs_test end');

}