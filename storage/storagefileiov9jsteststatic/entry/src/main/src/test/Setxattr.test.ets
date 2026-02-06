import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOSetxattr() {
  describe('fileIO_test_setxattr', (): void => {
    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIo_SETXATTR_Async_0100
     * @tc.name test_FileIO_Setxattr_Async_Static_001
     * @tc.desc Test setxattr() interface.
     * Set file extension properties.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_FileIO_Setxattr_Async_Static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Setxattr_Async_Static_001');
      let attrKey = 'user.comment';
      let attrValue = 'Test file.';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fs.setxattr(fpath, attrKey, attrValue).then(() => {
          let getValue = fs.getxattrSync(fpath, attrKey);
          hilog.info(domain, tag, '%{public}s', 'test_FileIO_Setxattr_Async_Static_001 the value is: ' + getValue);
          expect(getValue).assertEqual(attrValue);
          done();
        }).catch((err: ()=>void): Promise<void> => {
          hilog.info(domain, tag, '%{public}s', 'test_FileIO_Setxattr_Async_Static_001 error' + JSON.stringify(err));
          expect(false).assertTrue();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Setxattr_Async_Static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIo_SETXATTR_Sync_0200
     * @tc.name test_FileIO_Setxattr_Sync_Static_002
     * @tc.desc Test setxattr() interface.
     * The test file is not exist.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_FileIO_Setxattr_Sync_Static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Setxattr_Sync_Static_002');
      let attrKey = 'user.comment';
      let attrValue = 'Test file.';
      try {
        fs.setxattr(fpath, attrKey, attrValue).then(() => {
          hilog.info(domain, tag, '%{public}s', 'test_FileIO_Setxattr_Sync_Static_002 error');
        }).catch((err: BusinessError): Promise<void> => {
          hilog.info(domain, tag, '%{public}s', 'test_FileIO_Setxattr_Sync_Static_002 Failed to set extended attribute' + JSON.stringify(err));
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Setxattr_Sync_Static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIo_SETXATTR_Async_0300
     * @tc.name test_FileIO_Setxattr_Async_Static_003
     * @tc.desc Test setxattrSync() interface.
     * Set file extension properties.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_FileIO_Setxattr_Async_Static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Setxattr_Async_Static_003');
      let attrKey = 'user.comment';
      let attrValue = 'Test file.';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fs.setxattrSync(fpath, attrKey, attrValue);
        let getValue = fs.getxattrSync(fpath, attrKey);
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Setxattr_Async_Static_003 the value is: ' + getValue);
        expect(getValue).assertEqual(attrValue);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Setxattr_Async_Static_003 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIo_SETXATTR_Async_0400
     * @tc.name test_FileIO_Setxattr_Async_Static_004
     * @tc.desc Test setxattrSync() interface.
     * No such file or directory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_FileIO_Setxattr_Async_Static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Setxattr_Async_Static_004');
      let attrKey = 'user.comment';
      let attrValue = 'Test file.';
      try {
        fs.setxattrSync(fpath, attrKey, attrValue);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Setxattr_Async_Static_004 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

  });
}