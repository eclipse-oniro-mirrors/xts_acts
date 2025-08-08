/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import fileuri from 'libfileuri.so';
import { fileUri } from '@kit.CoreFileKit';
import fs from '@ohos.file.fs';

export default function ActsStorageFileUriNdkTest(){
  describe('ActsStorageFileUriNdkTest', async () => {

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_getfileuri_0100
     * @tc.name geturifrompath_ndktest_001
     * @tc.desc function of API, Test GetUriFromPath, normal function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('geturifrompath_ndktest_001', 0, async (done: Function) => {
      try{
        let ret = fileuri.GetUriFromPath();
        console.info("geturifrompath_ndktest_001 test napi ret = " + JSON.stringify(ret));
        expect(ret).assertEqual(0);
        console.info("geturifrompath_ndktest_001 test successful!");
        done();
      }catch(e){
        console.info('geturifrompath_ndktest_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_getfileuri_0200
     * @tc.name getpathfromuri_ndktest_001
     * @tc.desc function of API, Test GetPathFromUri, normal function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('getpathfromuri_ndktest_001', 0, async (done: Function) => {
      try{
        let ret = fileuri.GetPathFromUri();
        console.info("getpathfromuri_ndktest_001 test napi ret = " + JSON.stringify(ret));
        expect(ret).assertEqual(0);
        console.info("getpathfromuri_ndktest_001 test successful!");
        done();
      }catch(e){
        console.info('getpathfromuri_ndktest_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_getfileuri_0300
     * @tc.name getfulldirectory_ndktest_001
     * @tc.desc function of API, Test getfulldirectory, normal function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('getfulldirectory_ndktest_001', 0, async (done: Function) => {
      try{
        let filepath = "/data/storage/el2/base/files/test3.txt";
        fs.openSync(filepath,0o102);
        let uri = new fileUri.FileUri(filepath);
        console.info("getfulldirectory_ndktest_001 uri: "+ uri);
        let ret = fileuri.GetFullDirectoryUri();
        console.info("getfulldirectory_ndktest_001 test napi ret = "+ JSON.stringify(ret));
        expect(ret).assertEqual(0);
        console.info("getpathfromuri_ndktest_001 test successful!");
        done();
      }catch(e){
        console.info('getfulldirectory_ndktest_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_getfileuri_0400
     * @tc.name isvaliduri_ndktest_001
     * @tc.desc function of API, Test IsValidUri, normal function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('isvaliduri_ndktest_001', 0, async (done: Function) => {
      try{
        let filepath = "/data/storage/el2/base/files/test4.txt";
        fs.openSync(filepath,0o102);
        let uri = new fileUri.FileUri(filepath);
        console.info("isvaliduri_ndktest_001 test napi uri = "+ uri);
        let ret = fileuri.IsValidUri();
        console.info("isvaliduri_ndktest_001 test napi ret = "+ JSON.stringify(ret));
        expect(ret).assertEqual(1);
        console.info("isvaliduri_ndktest_001 test successful!");
        done();
      }catch(e){
        console.info('isvaliduri_ndktest_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
       * @tc.number SUB_BASIC_FM_FileAPI_getfileuri_0500
       * @tc.name getfilename_ndktest_001
       * @tc.desc function of API, Test GetFileName, normal function
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 0
       * @tc.require
       */
      it('getfilename_ndktest_001', 0, async (done: Function) => {
         try{
            let filepath = "/data/storage/el2/base/files/test5.txt";
            fs.openSync(filepath,0o102);
            let uri = new fileUri.FileUri(filepath);
            console.info("getfilename_ndktest_001 test napi uri = "+ uri);
            let ret = fileuri.GetFileName();
            console.info("getfilename_ndktest_001 test napi ret = "+ JSON.stringify(ret));
            expect(ret == "test5.txt").assertTrue();
            done();
         }catch(e){
            console.info('getfilename_ndktest_001 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
         }
      });
  });
}