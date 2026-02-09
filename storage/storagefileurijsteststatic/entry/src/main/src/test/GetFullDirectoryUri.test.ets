/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import fileUri from '@ohos.file.fileuri';
import fs from "@ohos.file.fs";
import { BusinessError } from "@ohos.base";
let domain: int = 0x0000;
let tag: string = 'testTag';

export const CONTENT = "Hello World!";

export default function filegetFullDirectoryUri_test() {
  describe('filegetFullDirectoryUri_test', (): void => {
    hilog.info(domain, tag, '%{public}s', 'filegetFullDirectoryUri_test start');

    /**
     * @tc.name   test_Fileuri_Isremoteuri_static_001
     * @tc.number SUB_BASIC_FM_FileUri_ISRemoteUri_0100
     * @tc.desc   Function of API, Test isRemoteUri normal function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Fileuri_Isremoteuri_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
     async (): Promise<void> => {
      try{
        let fileuristr = "file://com.example.demo/data/stroage/el2/distributedfiles/.remote_share/data/stroage/el2/base/files/test.txt?networkid=authSourc1a1a1**e=admin";
        let uriOBJ = new fileUri.FileUri(fileuristr);
        let TorF = uriOBJ.isRemoteUri();
        expect(TorF == true).assertTrue();
      }catch(e: BusinessError){
        hilog.error(domain, tag, 'test_Fileuri_Isremoteuri_static_001 has failed for:' + e.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_Fileuri_Isremoteuri_static_002
     * @tc.number SUB_BASIC_FM_FileUri_ISRemoteUri_0200
     * @tc.desc   Function of API, Test isRemoteUri normal function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Fileuri_Isremoteuri_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
     async (): Promise<void> => {
      try{
        let fileuristr = "file://com.example.demo/data/stroage/el2/distributedfiles/.remote_share/data/stroage/el2/base/files/test.txt?networkid=?#.123";
        let uriOBJ = new fileUri.FileUri(fileuristr);
        let TorF = uriOBJ.isRemoteUri();
        expect(TorF == true).assertTrue();
      }catch(e: BusinessError){
        hilog.error(domain, tag, 'test_Fileuri_Isremoteuri_static_002 has failed for:' + e.message);
        expect(false).assertTrue();
      };
    });

    /**
     * @tc.name   test_Fileuri_Isremoteuri_static_003
     * @tc.number SUB_BASIC_FM_FileUri_ISRemoteUri_0300
     * @tc.desc   Function of API, Test isRemoteUri normal function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Fileuri_Isremoteuri_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
     async (): Promise<void> => {
      hilog.info(domain, tag, "test_Fileuri_Isremoteuri_static_003 start")
      try{
        let fileuristr = "file://com.example.demo/data/stroage/el2/distributedfiles/.remote_share/data/stroage/el2/base/files/test#?$@.txt/test.txt?networkid=***";
        let uriOBJ = new fileUri.FileUri(fileuristr);
        let TorF = uriOBJ.isRemoteUri();
        expect(TorF == true).assertTrue();
      }catch(e: BusinessError){
        hilog.error(domain, tag, 'test_Fileuri_Isremoteuri_static_003 has failed for:' + e.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_Fileuri_Isremoteuri_static_004
     * @tc.number SUB_BASIC_FM_FileUri_ISRemoteUri_0400
     * @tc.desc   Function of API, Test isRemoteUri with 100 layers of folders.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Fileuri_Isremoteuri_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
     async (): Promise<void> => {
      hilog.info(domain, tag, "test_Fileuri_Isremoteuri_static_004 start")
      try{
        let diruri = 'file://com.example.demo/data/stroage/el2/distributedfiles/.remote_share/data/stroage/el2/base/files/test#?$@.txt/';
        for(let i = 1;i <= 100;i++){
          let diruri100 = "test" + i + "/";
          diruri = diruri + diruri100;
        }
        let fileuri100 = diruri + 'test.txt?networkid=***';
        let uriOBJ = new fileUri.FileUri(fileuri100);
        let TorF = uriOBJ.isRemoteUri();
        expect(TorF == true).assertTrue();
      }catch(e: BusinessError){
        hilog.error(domain, tag, 'test_Fileuri_Isremoteuri_static_004 has failed for:' + e.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_Fileuri_Isremoteuri_static_005
     * @tc.number SUB_BASIC_FM_FileUri_ISRemoteUri_0500
     * @tc.desc   Function of API, Test isRemoteUri with empty networkid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_Fileuri_Isremoteuri_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
     async (): Promise<void> => {
      hilog.info(domain, tag, "test_Fileuri_Isremoteuri_static_005 start")
      try{
        let fileuristr = "file://com.example.demo/data/stroage/el2/distributedfiles/.remote_share/data/stroage/el2/base/files/test#?$@.txt/test.txt?networkid=";
        let uriOBJ = new fileUri.FileUri(fileuristr);
        let TorF = uriOBJ.isRemoteUri();
        expect(TorF == false).assertTrue();
      }catch(e: BusinessError){
        hilog.error(domain, tag, 'test_Fileuri_Isremoteuri_static_005 has failed for:' + e.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_Fileuri_Isremoteuri_static_006
     * @tc.number SUB_BASIC_FM_FileUri_ISRemoteUri_0600
     * @tc.desc   Function of API, Test isRemoteUri with native uri.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_Fileuri_Isremoteuri_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
     async (): Promise<void> => {
      try{
        let fileuristr = "file://com.example.demo/data/stroage/el2/distributedfiles/.remote_share/data/stroage/el2/base/files";
        let uriOBJ = new fileUri.FileUri(fileuristr);
        let TorF = uriOBJ.isRemoteUri();
        expect(TorF == false).assertTrue();
      }catch(e: BusinessError){
        hilog.error(domain, tag, 'test_Fileuri_Isremoteuri_static_006 has failed for:' + e.message);
        expect(false).assertTrue();
      }
    });

    /**
   * @tc.name   test_Fileuri_GetFullDirectoryUri_static_001
   * @tc.number SUB_BASIC_FM_FileAPI_FileUri_getFullDirectory_0100
   * @tc.desc   Test getFullDirectoryUri() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
    it('test_Fileuri_GetFullDirectoryUri_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
     async (): Promise<void> => {
      let fpath = '/data/storage/el2/base/haps/test_Fileuri_GetFullDirectoryUri_static_001';
      fs.openSync(fpath,fs.OpenMode.CREATE|fs.OpenMode.READ_WRITE);
    
      try {
        let fileUriObject = new fileUri.FileUri(fpath);
        let directoryUri = fileUriObject.getFullDirectoryUri();
        expect(directoryUri + '/test_Fileuri_GetFullDirectoryUri_static_001' == fileUriObject.toString()).assertTrue();
      } catch(e: BusinessError) {
        hilog.error(domain, tag, 'test_Fileuri_GetFullDirectoryUri_static_001 has failed for ' + e);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_Fileuri_GetFullDirectoryUri_static_002
     * @tc.number SUB_BASIC_FM_FileAPI_FileUri_getFullDirectory_0200
     * @tc.desc   Test getFullDirectoryUri() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Fileuri_GetFullDirectoryUri_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
     async (): Promise<void> => {
      let dpath = '/data/storage/el2/base/haps/test_Fileuri_GetFullDirectoryUri_static_002';
      fs.mkdirSync(dpath);
    
      try {
        let fileUriObject = new fileUri.FileUri(dpath);
        let directoryUri = fileUriObject.getFullDirectoryUri();
        expect(directoryUri == fileUriObject.toString()).assertTrue();
      } catch(e: BusinessError) {
        hilog.error(domain, tag, 'test_Fileuri_GetFullDirectoryUri_static_002 has failed for ' + e);
        expect(false).assertTrue();
      }
    });
    
    /**
     * @tc.name   test_Fileuri_GetFullDirectoryUri_static_003
     * @tc.number SUB_BASIC_FM_FileAPI_FileUri_getFullDirectory_0300
     * @tc.desc   Test getFullDirectoryUri() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_Fileuri_GetFullDirectoryUri_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
     async (): Promise<void> => {
      let fpath = '/data/storage/el2/base/haps/entry/files/test_Fileuri_GetFullDirectoryUri_static_003.txt';

      try {
        let fileUriObject = new fileUri.FileUri(fpath);
        fileUriObject.getFullDirectoryUri();
        expect(false).assertTrue();
      } catch(e: BusinessError) {
        hilog.error(domain, tag, 'test_Fileuri_GetFullDirectoryUri_static_003 has failed for ' + e);
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });
    hilog.info(domain, tag, '%{public}s', 'filegetFullDirectoryUri_test end');
  })
}
