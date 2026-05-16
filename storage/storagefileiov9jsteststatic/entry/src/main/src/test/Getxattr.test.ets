/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOGetxattr() {
  describe('fileIO_test_getxattr', (): void => {

    /**
     * @tc.name   test_FileIO_Getxattr_Sync_Static_001
     * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_Sync_0100
     * @tc.desc   Test getxattr() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_Sync_Static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
 	    * @tc.name   test_FileIO_Getxattr_Sync_Static_002
 	    * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_Sync_0200
 	    * @tc.desc   Test getxattrSync() interface with empty string as path parameter.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL3
 	    */
    it('test_FileIO_Getxattr_Sync_Static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let attrKey = 'user.comment';
      try {
        let attrValue = fs.getxattrSync('', attrKey);
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_Sync_Static_002 should not succeed,attrValue:' + attrValue);
        expect(attrValue == "").assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_Sync_Static_002 error: ' + e.code);
        expect(e.code === 13900020 && e.message === 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Getxattr_Sync_Static_003
     * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_Sync_0300
     * @tc.desc   Test getxattrSync() interface with empty string as key parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_FileIO_Getxattr_Sync_Static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Getxattr_Sync_Static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let attrValue = fs.getxattrSync(fpath, '');
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_Sync_Static_003 should not succeed,attrValue:' + attrValue);
        expect(attrValue == "").assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_Sync_Static_003 error: ' + e.code);
        expect(e.code === 13900020 && e.message === 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Getxattr_ASync_Static_001
     * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_ASync_0100
     * @tc.desc   Test getxattr() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_ASync_Static_001 has error' + JSON.stringify(err));
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_ASync_Static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
 	      * @tc.name   test_FileIO_Getxattr_ASync_Static_002
 	      * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_ASync_0200
 	      * @tc.desc   Test getxattr() interface with empty string as path parameter.
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
    it('test_FileIO_Getxattr_ASync_Static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let attrValue = 'Test file.';
      let attrKey = 'user.comment';
      try {
        fs.getxattr('', attrKey).then((attrValue: string) => {
          hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_ASync_Static_002 should not succeed,attrValue:' + attrValue);
          expect(attrValue=="").assertTrue();
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_ASync_Static_002 error: ' + err.code);
          expect(err.code === 13900020 && err.message === 'Invalid argument').assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_ASync_Static_002 end error' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Getxattr_ASync_Static_003
     * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_ASync_0300
     * @tc.desc   Test getxattr() interface with empty string as key parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_FileIO_Getxattr_ASync_Static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Getxattr_ASync_Static_003');
      let attrValue = 'Test file.';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fs.getxattr(fpath, '').then((attrValue: string) => {
          hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_ASync_Static_003 should not succeed,attrValue:' + attrValue);
          expect(attrValue=="").assertTrue();
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_ASync_Static_003 error: ' + err.code);
          expect(err.code === 13900020 && err.message === 'Invalid argument').assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Getxattr_ASync_Static_003 end error' + e.code);
        expect(false).assertTrue();
      }
    });
  });
}