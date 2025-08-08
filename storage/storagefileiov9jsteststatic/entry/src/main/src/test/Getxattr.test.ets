import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOGetxattr() {
  describe('fileIO_test_getxattr', (): void => {

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_Sync_0100
     * @tc.name test_FileIO_Getxattr_Sync_Static_001
     * @tc.desc Test getxattr() interface.
     * This interface shall work properly in normal case.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_FileIO_Getxattr_Sync_Static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Getxattr_Sync_Static_001');
      let attrKey = 'user.comment';
      let attrValue = 'Test file.';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      await fs.setxattr(fpath, attrKey, attrValue);

      try {
        let attrValue = fs.getxattrSync(fpath, attrKey);
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_Sync_Static_001 the value is: ' + attrValue);
        expect(attrValue).assertEqual('Test file.');
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_Sync_Static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_ASync_0100
     * @tc.name test_FileIO_Getxattr_ASync_Static_001
     * @tc.desc Test getxattr() interface.
     * This interface shall work properly in normal case.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_FileIO_Getxattr_ASync_Static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Getxattr_ASync_Static_001');
      let attrKey = 'user.comment';
      let attrValue = 'Test file.';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      fs.setxattrSync(fpath, attrKey, attrValue);

      try {
        fs.getxattr(fpath, attrKey).then((attrValue: string) => {
          hilog.info(domain, tag, '%{public}s', "test_FileIO_Getxattr_ASync_Static_001 value is: " + attrValue);
          expect(attrValue).assertEqual('Test file.');
          done();
        }).catch((err: ()=>void): Promise<void> => {
          hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_ASync_Static_001 has error' + JSON.stringify(err));
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_ASync_Static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}