import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import securityLabel from '@ohos.file.securityLabel';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';
let s0: securityLabel.DataLevel = "s0";
let s1: securityLabel.DataLevel = "s1";
let s2: securityLabel.DataLevel = "s2";
let s3: securityLabel.DataLevel = "s3";
let s4: securityLabel.DataLevel = "s4";

  export default function security_label() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("security_label", (): void => {
    hilog.info(domain, tag, '%{public}s', 'security_label start');

    /**
     * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0100
     * @tc.name securitylabel_test_set_security_label_sync_static_000
     * @tc.desc Test the setSecurityLabelSync() interface, and the getSecurityLabelSync() interface to get the data label s0.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('securitylabel_test_set_security_label_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_000 start');
      try {
        let fpath = await Utils.nextFileName('test' + s0 + '.txt');
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_000 fpath' + fpath);
        let prepareFile = await Utils.prepareFile(fpath, FILE_CONTENT);
        expect(prepareFile).assertTrue();
        securityLabel.setSecurityLabelSync(fpath, s0);
        let level = securityLabel.getSecurityLabelSync(fpath);
        expect(level == s0).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_000 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0200
     * @tc.name securitylabel_test_set_security_label_sync_static_001
     * @tc.desc Test the setSecurityLabelSync() interface, and the getSecurityLabelSync() interface to get the data label s1.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('securitylabel_test_set_security_label_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_001 start');
      try {
        let fpath = await Utils.nextFileName('test' + s1 + '.txt');
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_001 fpath' + fpath);
        let prepareFile = await Utils.prepareFile(fpath, FILE_CONTENT);
        expect(prepareFile).assertTrue();
        securityLabel.setSecurityLabelSync(fpath, s1);
        let level = securityLabel.getSecurityLabelSync(fpath);
        expect(level == s1).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_001 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0300
     * @tc.name securitylabel_test_set_security_label_sync_static_002
     * @tc.desc Test the setSecurityLabelSync() interface, and the getSecurityLabelSync() interface to get the data label s2.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('securitylabel_test_set_security_label_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_002 start');
      try {
        let fpath = await Utils.nextFileName('test' + s2 + '.txt');
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_002 fpath' + fpath);
        let prepareFile = await Utils.prepareFile(fpath, FILE_CONTENT);
        expect(prepareFile).assertTrue();
        securityLabel.setSecurityLabelSync(fpath, s2);
        let level = securityLabel.getSecurityLabelSync(fpath);
        expect(level == s2).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_002 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0400
     * @tc.name securitylabel_test_set_security_label_sync_static_003
     * @tc.desc Test the setSecurityLabelSync() interface, and the getSecurityLabelSync() interface to get the data label s3.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('securitylabel_test_set_security_label_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_003 start');
      try {
        let fpath = await Utils.nextFileName('test' + s3 + '.txt');
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_003 fpath' + fpath);
        let prepareFile = await Utils.prepareFile(fpath, FILE_CONTENT);
        expect(prepareFile).assertTrue();
        securityLabel.setSecurityLabelSync(fpath, s3);
        let level = securityLabel.getSecurityLabelSync(fpath);
        expect(level == s3).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_003 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0500
     * @tc.name securitylabel_test_set_security_label_sync_static_004
     * @tc.desc Test the setSecurityLabelSync() interface, and the getSecurityLabelSync() interface to get the data label s4.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('securitylabel_test_set_security_label_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_004 start');
      try {
        let fpath = await Utils.nextFileName('test' + s4 + '.txt');
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_004 fpath' + fpath);
        let prepareFile = await Utils.prepareFile(fpath, FILE_CONTENT);
        expect(prepareFile).assertTrue();
        securityLabel.setSecurityLabelSync(fpath, s4);
        let level = securityLabel.getSecurityLabelSync(fpath);
        expect(level == s4).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_004 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0600
     * @tc.name securitylabel_test_set_security_label_sync_static_005
     * @tc.desc Test the setSecurityLabelSync() interface, when the path does not exist.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('securitylabel_test_set_security_label_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_005 start');
      try {
        securityLabel.setSecurityLabelSync("/data/aaa.txt", s0);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_005 has failed for ' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0700
     * @tc.name securitylabel_test_set_security_label_sync_static_006
     * @tc.desc Test the setSecurityLabelSync() interface, return false when the securitylabel is lower than before.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('securitylabel_test_set_security_label_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_006 start');
      let fpath = await Utils.nextFileName('securitylabel_test_set_security_label_sync_static_006');
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_006 fpath' + fpath);
      let prepareFile = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(prepareFile).assertTrue();
      try {
        securityLabel.setSecurityLabelSync(fpath, s4);
        securityLabel.setSecurityLabelSync(fpath, s3);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_sync_static_006 has failed for ' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0000
     * @tc.name securitylabel_test_set_security_label_async_static_000
     * @tc.desc Test that the setSecurityLabel() interface callback to set the data label.
     * Test the getSecurityLabel() interface callback to get the data label.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('securitylabel_test_set_security_label_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_000 start');
      try {
        let fpath = await Utils.nextFileName('securitylabel_test_set_security_label_async_static_000');
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_000 fpath' + fpath);
        let prepareFile = await Utils.prepareFile(fpath, FILE_CONTENT);
        expect(prepareFile).assertTrue();
        securityLabel.setSecurityLabel(fpath, s0, (err: BusinessError<void> | null) => {
          securityLabel.getSecurityLabel(fpath, (err: BusinessError | null, level: string | undefined) => {
            expect(level == s0).assertTrue();
            fs.unlinkSync(fpath);
            done();
          });
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_000 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0100
     * @tc.name securitylabel_test_set_security_label_async_static_001
     * @tc.desc Test that the setSecurityLabel() interface callback to set the data label.
     * Test the getSecurityLabel() interface promises to get the data label.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('securitylabel_test_set_security_label_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_001 start');
      try {
        let fpath = await Utils.nextFileName('securitylabel_test_set_security_label_async_static_001');
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_001 fpath' + fpath);
        let prepareFile = await Utils.prepareFile(fpath, FILE_CONTENT);
        expect(prepareFile).assertTrue();
        securityLabel.setSecurityLabel(fpath, s1, (err: BusinessError<void> | null) => {
          let level = await securityLabel.getSecurityLabel(fpath);
          expect(level == s1).assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_001 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0200
     * @tc.name securitylabel_test_set_security_label_async_static_002
     * @tc.desc Test that the setSecurityLabel() interface promises to set the data label.
     * Test the getSecurityLabel() interface callback to get the data label.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('securitylabel_test_set_security_label_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_002 start');
      try {
        let fpath = await Utils.nextFileName('securitylabel_test_set_security_label_async_static_002');
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_002 fpath' + fpath);
        let prepareFile = await Utils.prepareFile(fpath, FILE_CONTENT);
        expect(prepareFile).assertTrue();
        await securityLabel.setSecurityLabel(fpath, s2);
        securityLabel.getSecurityLabel(fpath, (err: BusinessError | null, level: string | undefined) => {
          expect(level == s2).assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_000 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0300
     * @tc.name securitylabel_test_set_security_label_async_static_003
     * @tc.desc Test that the setSecurityLabel() interface promises to set the data label.
     * Test the getSecurityLabel() interface promises to get the data label.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('securitylabel_test_set_security_label_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_003 start');
      try {
        let fpath = await Utils.nextFileName('securitylabel_test_set_security_label_async_static_003');
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_003 fpath' + fpath);
        let prepareFile = await Utils.prepareFile(fpath, FILE_CONTENT);
        expect(prepareFile).assertTrue();
        await securityLabel.setSecurityLabel(fpath, s3);
        let level = await securityLabel.getSecurityLabel(fpath);
        expect(level == s3).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_003 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0400
     * @tc.name securitylabel_test_set_security_label_async_static_004
     * @tc.desc Test that the setSecurityLabel() interface promises to set the data label.
     * Test the getSecurityLabel() interface promises to get the data label.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('securitylabel_test_set_security_label_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_004 start');
      try {
        let fpath = await Utils.nextFileName('securitylabel_test_set_security_label_async_static_004');
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_004 fpath' + fpath);
        let prepareFile = await Utils.prepareFile(fpath, FILE_CONTENT);
        expect(prepareFile).assertTrue();
        await securityLabel.setSecurityLabel(fpath, s4);
        let level = await securityLabel.getSecurityLabel(fpath);
        expect(level == s4).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_004 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0600
     * @tc.name securitylabel_test_set_security_label_async_static_006
     * @tc.desc Test setSecurityLabel() interfaces, return false when the path is invalid.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('securitylabel_test_set_security_label_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_006 start');
      try {
        await securityLabel.setSecurityLabel('/data/test.txt', s3);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_006 has failed for ' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0700
     * @tc.name securitylabel_test_set_security_label_async_static_007
     * @tc.desc Test setSecurityLabel() interfaces, return false when the path is invalid.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('securitylabel_test_set_security_label_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_007 start');
      try {
        securityLabel.setSecurityLabel('/data/test.txt', s1, (err: BusinessError<void> | null) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_007 has failed for ' + JSON.stringify(err));
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_007 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0800
     * @tc.name securitylabel_test_set_security_label_async_static_008
     * @tc.desc Test setSecurityLabel() interfaces, return false when the securitylabel is lower than before.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('securitylabel_test_set_security_label_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_008 start');
      let fpath = await Utils.nextFileName('securitylabel_test_set_security_label_async_static_008');
      hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_008 fpath' + fpath);
      let prepareFile = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(prepareFile).assertTrue();
      try {
        securityLabel.setSecurityLabelSync(fpath, s4);
        securityLabel.setSecurityLabel(fpath, s3, (err: BusinessError<void> | null) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_008 has failed for ' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'securitylabel_test_set_security_label_async_static_008 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'abilityTest end');

}