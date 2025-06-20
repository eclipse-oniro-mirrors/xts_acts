/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import fileUri from '@ohos.file.fileuri';
import fs from '@ohos.file.fs';
import {
  describe,
  it,
  expect
}
from '@ohos/hypium'

export default function fileuri_test() {
describe('file_uri_test', function () {

  const CONTENT = "Hello World!";
  /**
   * @tc.number SUB_STORAGE_FileUri_GetUriFromPath_0000
   * @tc.name test_FileUri_GetUriFromPath_000
   * @tc.desc Function of API, get Uri from Path. Test normal function.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   */
  it('test_FileUri_GetUriFromPath_000', 0, async function () {
    try {
      let path = "/data/storage/el2/base/haps/entry/files/sync.jpg";
      let uri = fileUri.getUriFromPath(path);
      let result = "file://ohos.acts.storage.fileuri/data/storage/el2/base/haps/entry/files/sync.jpg"
      console.log("test_FileUri_GetUriFromPath_000 uri:" + uri);
      console.log("test_FileUri_GetUriFromPath_000 result:" + result);
      expect(uri != "").assertTrue();
      expect(uri == result).assertTrue();
    } catch (e) {
      console.log('test_FileUri_GetUriFromPath_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileUri_GetUriFromPath_0100
   * @tc.name test_FileUri_GetUriFromPath_001
   * @tc.desc Function of API, get Uri from Path. Test path is empty.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   */
  it('test_FileUri_GetUriFromPath_001', 0, async function () {
    try {
      let uri = fileUri.getUriFromPath("");
      let result = "file://ohos.acts.storage.fileuri"
      console.log("test_FileUri_GetUriFromPath_001 uri:" + uri);
      console.log("test_FileUri_GetUriFromPath_001 result:" + result);
      expect(uri != "").assertTrue();
      expect(uri == result).assertTrue();
    } catch (e) {
      console.log('test_FileUri_GetUriFromPath_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileUri_GetUriFromPath_0200
   * @tc.name test_FileUri_GetUriFromPath_002
   * @tc.desc Function of API, get Uri from Path. Test argument is empty.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   */
  it('test_FileUri_GetUriFromPath_002', 0, async function () {
    try {
      fileUri.getUriFromPath();
      expect(false).assertTrue();
    } catch (e) {
      console.log('test_FileUri_GetUriFromPath_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileUri_GetUriFromPath_0300
   * @tc.name test_FileUri_GetUriFromPath_003
   * @tc.desc Function of API, get Uri from Path. Test argument is number.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   */
  it('test_FileUri_GetUriFromPath_003', 0, async function () {
    try {
      fileUri.getUriFromPath(5);
      expect(false).assertTrue();
    } catch (e) {
      console.log('test_FileUri_GetUriFromPath_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileUri_Parameter_0000
   * @tc.name test_FileUri_Parameter_Name_000
   * @tc.desc Get the FileURI object through 'path' and validates the properties of the FileURI object.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('test_FileUri_Parameter_Name_000', 0, async function () {
    try {
      let name = 'sync_000.txt';
      let path = '/data/storage/el2/base/haps/sync_000.txt';
      let uri = fileUri.getUriFromPath(path);
      let fileFromPath = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.writeSync(fileFromPath.fd, CONTENT);
      let fileUriObject = new fileUri.FileUri(fileFromPath.path);
      expect(name === fileUriObject.name).assertTrue();
      expect(path === fileUriObject.path).assertTrue();
      expect(uri === fileUriObject.toString()).assertTrue();
      fs.closeSync(fileFromPath);
      let fileFromUri = fs.openSync(fileUriObject.toString(), fs.OpenMode.READ_ONLY);
      let readLen = fs.readSync(fileFromUri.fd, new ArrayBuffer(32), { offset: 0 });
      expect(readLen === CONTENT.length).assertTrue();
      fs.closeSync(fileFromUri);
      fs.unlinkSync(path);
    } catch (e) {
      console.log('test_FileUri_Parameter_Name_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileUri_Parameter_0100
   * @tc.name test_FileUri_Parameter_Name_001
   * @tc.desc Get the FileURI object through 'uri' and validates the properties of the FileURI object.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('test_FileUri_Parameter_Name_001', 0, async function () {
    try {
      let name = 'sync_001.txt';
      let path = '/data/storage/el2/base/haps/sync_001.txt';
      let uri = fileUri.getUriFromPath(path);
      let fileUriObject = new fileUri.FileUri(uri);
      expect(name === fileUriObject.name).assertTrue();
      expect(path === fileUriObject.path).assertTrue();
      expect(uri === fileUriObject.toString()).assertTrue();
      let fileFromPath = fs.openSync(fileUriObject.path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.writeSync(fileFromPath.fd, CONTENT);
      expect(name === fileFromPath.name).assertTrue();
      expect(path === fileFromPath.path).assertTrue();
      fs.closeSync(fileFromPath);
      let fileFromUri = fs.openSync(fileUriObject.toString(), fs.OpenMode.READ_ONLY);
      let readLen = fs.readSync(fileFromUri.fd, new ArrayBuffer(32), { offset: 0 });
      expect(readLen === CONTENT.length).assertTrue();
      fs.closeSync(fileFromUri);
      fs.unlinkSync(path);
    } catch (e) {
      console.log('test_FileUri_Parameter_Name_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileUri_Parameter_0200
   * @tc.name test_FileUri_Parameter_Name_002
   * @tc.desc Get the FileURI object through an empty string or uri which has no suffix directories.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileUri_Parameter_Name_002', 3, async function () {
    try {
      let uri = fileUri.getUriFromPath('');
      let fileUriObject01 = new fileUri.FileUri(uri);
      expect(fileUriObject01.name === '').assertTrue();
      expect(fileUriObject01.path === '').assertTrue();
      expect(uri === fileUriObject01.toString() && uri === 'file://ohos.acts.storage.fileuri').assertTrue();
      let fileUriObject02 = new fileUri.FileUri('');
      expect(fileUriObject02.name === '').assertTrue();
      expect(fileUriObject02.path === '').assertTrue();
      expect(uri === fileUriObject02.toString() && uri === 'file://ohos.acts.storage.fileuri').assertTrue();
    } catch (e) {
      console.log('test_FileUri_Parameter_Name_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileUri_Parameter_0300
   * @tc.name test_FileUri_Parameter_Name_003
   * @tc.desc Enter the illegal parameter type.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileUri_Parameter_Name_003', 3, async function () {
    try {
      new fileUri.FileUri(0);
      expect(false).assertTrue();
    } catch (e) {
      console.log('test_FileUri_Parameter_Name_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

   /**
   * @tc.number SUB_STORAGE_FileUri_Other_Function_0000
   * @tc.name test_FileUri_Other_Function_000
   * @tc.desc Get the FileURI object through 'uri' and validates the properties of the FileURI object.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('test_FileUri_Other_Function_000', 0, async function () {
    try {
      let testUri = 'file://com.demo.b/data/storage/el2/distributedfiles/test/../test1.txt?query=1#other';
      let exceptPath = '/storage/Users/currentUser/appdata/el2/distributedfiles/com.demo.b/test1.txt';
      let testUri2 = 'file://com.demo.b/data/storage/el2/distributedfiles/test/../test1.txt';
      let uri = new fileUri.FileUri(testUri);
      let uri2 = new fileUri.FileUri(testUri);
      let uri3 = new fileUri.FileUri(testUri2);
      expect(uri.checkIsAbsolute() === true).assertTrue();
      expect(uri.scheme === 'file').assertTrue();
      expect(uri.userInfo === '').assertTrue();
      expect(uri.port === '-1').assertTrue();
      expect(uri.query === 'query=1').assertTrue();
      expect(uri.fragment === 'other').assertTrue();
      expect(uri.authority === 'com.demo.b').assertTrue();
      expect(uri.host === 'com.demo.b').assertTrue();
      expect(uri.ssp === '//com.demo.b/data/storage/el2/distributedfiles/test/../test1.txt?query=1').assertTrue();
      expect(uri.name === 'test1.txt').assertTrue();
      expect(testUri === uri.toString()).assertTrue();
      expect(uri.equalsTo(uri2) === true).assertTrue();
      expect(uri.equalsTo(uri3) === false).assertTrue();
      expect(uri.equals(uri2) === true).assertTrue();
      expect(uri.equals(uri3) === false).assertTrue();
      if (uri.path === '/storage/Users/currentUser/appdata/el2/distributedfiles/com.demo.b/test/../test1.txt' && uri.normalize().path === exceptPath){
        expect(true).assertTrue();
      }else{
        expect(uri.path == '/data/storage/el2/share/r/com.demo.b/data/storage/el2/distributedfiles/test/../test1.txt' 
          && uri.normalize().path == '/data/storage/el2/share/r/com.demo.b/data/storage/el2/distributedfiles/test1.txt').assertTrue();
      }
    } catch (e) {
      console.log('test_FileUri_Other_Function_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_EqualsTo_0000
   * @tc.name test_FileUri_EqualsTo_000
   * @tc.desc Enter the illegal parameter type.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileUri_EqualsTo_000', 3, async function () {
    try {
      let testUri = 'file://com.demo.b/data/storage/el2/distributedfiles/test/../test1.txt?query=1#other';
      let uri = new fileUri.FileUri(testUri);
      uri.equalsTo(testUri);
      expect(false).assertTrue();
    } catch (e) {
      console.log('test_FileUri_EqualsTo_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_EqualsTo_0100
   * @tc.name test_FileUri_EqualsTo_001
   * @tc.desc Enter the illegal parameter num.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileUri_EqualsTo_001', 3, async function () {
    try {
      let testUri = 'file://com.demo.b/data/storage/el2/distributedfiles/test/../test1.txt?query=1#other';
      let uri = new fileUri.FileUri(testUri);
      uri.equalsTo(testUri, 3);
      expect(false).assertTrue();
    } catch (e) {
      console.log('test_FileUri_EqualsTo_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_Equals_0000
   * @tc.name test_FileUri_Equals_000
   * @tc.desc Enter the illegal parameter type.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileUri_Equals_000', 3, async function () {
    try {
      let testUri = 'file://com.demo.b/data/storage/el2/distributedfiles/test/../test1.txt?query=1#other';
      let uri = new fileUri.FileUri(testUri);
      uri.equals(testUri);
      expect(false).assertTrue();
    } catch (e) {
      console.log('test_FileUri_Equals_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_Equals_0100
   * @tc.name test_FileUri_Equals_001
   * @tc.desc Enter the illegal parameter num.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileUri_Equals_001', 3, async function () {
    try {
      let testUri = 'file://com.demo.b/data/storage/el2/distributedfiles/test/../test1.txt?query=1#other';
      let uri = new fileUri.FileUri(testUri);
      uri.equals(testUri, 3);
      expect(false).assertTrue();
    } catch (e) {
      console.log('test_FileUri_Equals_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_CheckIsAbsolute_0000
   * @tc.name test_FileUri_CheckIsAbsolute_000
   * @tc.desc Enter the illegal parameter num.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileUri_CheckIsAbsolute_000', 3, async function () {
    try {
      let testUri = 'file://com.demo.b/data/storage/el2/distributedfiles/test/../test1.txt?query=1#other';
      let uri = new fileUri.FileUri(testUri);
      uri.checkIsAbsolute(3);
      expect(false).assertTrue();
    } catch (e) {
      console.log('test_FileUri_CheckIsAbsolute_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileUri_Normalize_0000
   * @tc.name test_FileUri_Normalize_000
   * @tc.desc Enter the illegal parameter num.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileUri_Normalize_000', 3, async function () {
    try {
      let testUri = 'file://com.demo.b/data/storage/el2/distributedfiles/test/../test1.txt?query=1#other';
      let uri = new fileUri.FileUri(testUri);
      uri.normalize(testUri);
      expect(false).assertTrue();
   } catch (e) {
      console.log('test_FileUri_Normalize_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });
});
}
