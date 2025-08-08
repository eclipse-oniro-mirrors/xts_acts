import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOMkdtemp() {
  describe('fileIO_fs_mkdtemp', (): void => {

    /**
     * @tc.number SUB_DF_FILEIO_MKDTEMP_SYNC_0000
     * @tc.name fileIO_test_mkdtemp_sync_static_000
     * @tc.desc Test mkdtempSync() interface.
     * Create a temporary directory, verify the normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_mkdtemp_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdtemp_sync_static_000');

      try {
        dpath = dpath + 'XXXXXX';
        let res = fs.mkdtempSync(dpath);
        expect(fs.accessSync(res)).assertTrue();
        fs.rmdirSync(res);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_sync_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MKDTEMP_SYNC_0100
     * @tc.name fileIO_test_mkdtemp_sync_static_001
     * @tc.desc Test mkdtempSync() interface.
     * The directory should end in XXXXXX.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdtemp_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdtemp_sync_static_000');

      try {
        fs.mkdtempSync(dpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_sync_static_001 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0000
     * @tc.name fileIO_test_mkdtemp_async_static_000
     * @tc.desc Test mkdtemp() interface. Promise.
     * Create a temporary directory, verify the normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdtemp_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdtemp_async_static_000');

      try {
        dpath = dpath + 'XXXXXX';
        let res = await fs.mkdtemp(dpath);
        expect(fs.accessSync(res)).assertTrue();
        fs.rmdirSync(res);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_async_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0100
     * @tc.name fileIO_test_mkdtemp_async_static_001
     * @tc.desc Test mkdtemp() interface. Callback.
     * Create a temporary directory, verify the normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdtemp_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdtemp_async_static_001');

      try {
        dpath = dpath + 'XXXXXX';
        fs.mkdtemp(dpath, (err: BusinessError | null, res: string | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_async_static_001 res' + res);
          // expect(fs.accessSync(res)).assertTrue();
          // fs.rmdirSync(res);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_async_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0200
     * @tc.name fileIO_test_mkdtemp_async_static_002
     * @tc.desc Test mkdtemp() interface. Promise.
     * The directory should end in XXXXXX.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdtemp_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdtemp_async_static_002');

      try {
        await fs.mkdtemp(dpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_async_static_002 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0300
     * @tc.name fileIO_test_mkdtemp_async_static_003
     * @tc.desc Test mkdtemp() interface. Callback.
     * The directory should end in XXXXXX.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdtemp_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdtemp_async_static_003');

      try {
        fs.mkdtemp(dpath, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_async_static_003 error package: ' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_async_static_003 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}