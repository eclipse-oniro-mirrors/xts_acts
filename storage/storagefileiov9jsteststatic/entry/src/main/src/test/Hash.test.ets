import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import fileHash from '@ohos.file.hash';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';

export default function fileIOHash() {
  describe("fileIO_fs_hash", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_hash start');

    /**
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0000
     * @tc.name fileIO_test_hash_async_static_000
     * @tc.desc Test hash() interface. Promise.
     * Encrypt files using the MD5 hashing algorithm
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_hash_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let str = await fileHash.hash(fpath,'md5');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_000 hash value is ' + str);
        expect(str == '5EB63BBBE01EEED093CB22BB8F5ACDC3').assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0100
     * @tc.name fileIO_test_hash_async_static_001
     * @tc.desc Test hash() interface. Callback.
     * Encrypt files using the MD5 hashing algorithm.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_hash_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileHash.hash(fpath, "md5", (err: BusinessError | null, str: string | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_001 error package: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_001 hash value is ' + str);
          expect(str == '5EB63BBBE01EEED093CB22BB8F5ACDC3').assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0200
     * @tc.name fileIO_test_hash_async_static_002
     * @tc.desc Test hash() interface. Promise.
     * Encrypt files using the sha1 hashing algorithm.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_hash_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let str = await fileHash.hash(fpath,'sha1');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_002 hash value is ' + str);
        expect(str == '2AAE6C35C94FCFB415DBE95F408B9CE91EE846ED').assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0300
     * @tc.name fileIO_test_hash_async_static_003
     * @tc.desc Test hash() interface. Callback.
     * Encrypt files using the sha1 hashing algorithm.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_hash_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_003 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileHash.hash(fpath, "sha1", (err: BusinessError | null, str: string | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_003 error package: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_003 hash value is ' + str);
          expect(str == '2AAE6C35C94FCFB415DBE95F408B9CE91EE846ED').assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0400
     * @tc.name fileIO_test_hash_async_static_004
     * @tc.desc Test hash() interface. Promise.
     * Encrypt files using the sha256 hashing algorithm.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_hash_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_004 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let str = await fileHash.hash(fpath,'sha256');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_004 hash value is ' + str);
        expect(str == 'B94D27B9934D3E08A52E52D7DA7DABFAC484EFE37A5380EE9088F7ACE2EFCDE9').assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0500
     * @tc.name fileIO_test_hash_async_static_005
     * @tc.desc Test hash() interface. Callback.
     * Encrypt files using the sha256 hashing algorithm.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_hash_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_005 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileHash.hash(fpath, "sha256", (err: BusinessError | null, str: string | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_005 error package: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_005 hash value is ' + str);
          expect(str == 'B94D27B9934D3E08A52E52D7DA7DABFAC484EFE37A5380EE9088F7ACE2EFCDE9').assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0600
     * @tc.name fileIO_test_hash_async_static_006
     * @tc.desc Test hash() interface. Promise.
     * Invalid mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_hash_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_006 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let str = await fileHash.hash(fpath,'256');
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_006 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        fs.unlinkSync(fpath);
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0700
     * @tc.name fileIO_test_hash_async_static_007
     * @tc.desc Test hash() interface. Promise.
     * Missing parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_hash_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_007 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_007');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileHash.hash(fpath, "256", (err: BusinessError | null, str: string | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_007 has error for' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            fs.unlinkSync(fpath);
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_007 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_hash end');

}