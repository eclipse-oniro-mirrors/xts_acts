/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import fileuri from '@ohos.file.fileuri';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOFileGetParent() {
  describe('fileIO_fs_file_getParent', (): void => {

    /**
     * @tc.name   fileIO_test_filegetParent_static_001
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_FILEGETPARENT_0100
     * @tc.desc   Test getParent() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_filegetParent_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_filegetParent_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let index = fpath.lastIndexOf("\/");
      let str = fpath.substring(0, index+1);
      str = str.slice(0, -1);

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        expect(file.getParent() == str).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_filegetParent_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_filegetParent_static_002
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_FILEGETPARENT_0200
     * @tc.desc   Test getParent() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_filegetParent_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_filegetParent_static_002');
      let index = fpath.lastIndexOf("\/");
      let str = fpath.substring(0, index+1);
      str = str.slice(0, -1);

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        expect(file.getParent() == str).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_filegetParent_static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_filegetParent_static_003
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_FILEGETPARENT_0300
     * @tc.desc   Test getParent() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_filegetParent_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_filegetParent_static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let filenew = fs.dup(file.fd);
        expect(file.getParent() == filenew.getParent()).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_filegetParent_static_003 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_filegetParent_static_004
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_FILEGETPARENT_0400
     * @tc.desc   Test getParent() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_filegetParent_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_filegetParent_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let index = fpath.lastIndexOf("\/");
      let str = fpath.substring(0, index+1);
      str = str.slice(0, -1);

      try {
        let uri = fileuri.getUriFromPath(fpath);
        let file = fs.openSync(uri, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        expect(file.getParent() == str).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_filegetParent_static_004 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}