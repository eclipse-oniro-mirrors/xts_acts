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

import {
  FILE_CONTENT, prepareFile, nextFileName, describe, it, expect
} from '../Common';
import fs from '@ohos.file.fs';
import { TestType, Size, Level } from '@ohos/hypium';

export default function fileIOGetxattr() {
describe('fileIO_test_getxattr', function () {

/**
 * @tc.name   test_FileIO_Getxattr_Sync_001
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_Sync_0100
 * @tc.desc   Test getxattr() interface.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('test_FileIO_Getxattr_Sync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
  let fpath = await nextFileName('test_FileIO_Getxattr_Sync_001');
  let attrKey = 'user.comment';
  let attrValue = 'Test file.';
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  await fs.setxattr(fpath, attrKey, attrValue);
  
  try {
    let attrValue = fs.getxattrSync(fpath, attrKey);
    console.log("test_FileIO_Getxattr_Sync_001 the value is: " + attrValue);
    expect(attrValue).assertEqual('Test file.');
  } catch (e) {
    console.log('test_FileIO_Getxattr_Sync_001 has failed for ' + e.message + ', code: ' + e.code);
    expect(false).assertTrue();
  }
 });

/**
 * @tc.name   test_FileIO_Getxattr_Sync_002
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_Sync_0200
 * @tc.desc   Test getxattr() interface.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('test_FileIO_Getxattr_Sync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
  let fpath = await nextFileName('test_FileIO_Getxattr_Sync_002');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
  try {
    fs.getxattrSync(fpath);
    expect(false).assertTrue();
  } catch (e) {
    console.log('test_FileIO_Getxattr_Sync_002 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
  }
});

/**
 * @tc.name   test_FileIO_Getxattr_Sync_003
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_Sync_0300
 * @tc.desc   Test getxattrSync() interface. Test first parameter is null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('test_FileIO_Getxattr_Sync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
  let fpath = await nextFileName('test_FileIO_Getxattr_Sync_003');
  let attrKey = 'user.comment';
  let attrValue = 'Test file.';
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  await fs.setxattrSync(fpath, attrKey, attrValue);

  try {
    fs.getxattrSync(null, attrKey);
    expect(false).assertTrue();
  } catch (e) {
    fs.unlinkSync(fpath);
    console.log('test_FileIO_Getxattr_Sync_003 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
  }
});

/**
 * @tc.name   test_FileIO_Getxattr_Sync_004
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_Sync_0400
 * @tc.desc   Test getxattrSync() interface. Test first parameter is undefined.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('test_FileIO_Getxattr_Sync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
  let fpath = await nextFileName('test_FileIO_Getxattr_Sync_004');
  let attrKey = 'user.comment';
  let attrValue = 'Test file.';
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  await fs.setxattrSync(fpath, attrKey, attrValue);

  try {
    fs.getxattrSync(undefined, attrKey);
    expect(false).assertTrue();
  } catch (e) {
    fs.unlinkSync(fpath);
    console.log('test_FileIO_Getxattr_Sync_004 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
  }
});

/**
 * @tc.name   test_FileIO_Getxattr_Sync_005
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_Sync_0500
 * @tc.desc   Test getxattrSync() interface. Test second parameter is null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('test_FileIO_Getxattr_Sync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
  let fpath = await nextFileName('test_FileIO_Getxattr_Sync_005');
  let attrKey = 'user.comment';
  let attrValue = 'Test file.';
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  await fs.setxattrSync(fpath, attrKey, attrValue);

  try {
    fs.getxattrSync(fpath, null);
    expect(false).assertTrue();
  } catch (e) {
    fs.unlinkSync(fpath);
    console.log('test_FileIO_Getxattr_Sync_005 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
  }
});

/**
 * @tc.name   test_FileIO_Getxattr_Sync_006
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_Sync_0600
 * @tc.desc   Test getxattrSync() interface. Test second parameter is undefined.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('test_FileIO_Getxattr_Sync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
  let fpath = await nextFileName('test_FileIO_Getxattr_Sync_006');
  let attrKey = 'user.comment';
  let attrValue = 'Test file.';
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  await fs.setxattrSync(fpath, attrKey, attrValue);

  try {
    fs.getxattrSync(fpath, undefined);
    expect(false).assertTrue();
  } catch (e) {
    fs.unlinkSync(fpath);
    console.log('test_FileIO_Getxattr_Sync_006 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
  }
});

/**
 * @tc.name   test_FileIO_Getxattr_ASync_001
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_ASync_0100
 * @tc.desc   Test getxattr() interface.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('test_FileIO_Getxattr_ASync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
  let fpath = await nextFileName('test_FileIO_Getxattr_ASync_001');
  let attrKey = 'user.comment';
  let attrValue = 'Test file.';
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  fs.setxattrSync(fpath, attrKey, attrValue);

  try {
    fs.getxattr(fpath, attrKey).then((attrValue) => {
      console.info("test_FileIO_Getxattr_ASync_001 value is: " + attrValue);
      expect(attrValue).assertEqual('Test file.');
      done();
    }).catch((err) => {
      console.error("test_FileIO_Getxattr_ASync_001 get extended attribute with error message: " + err.message + ", error code: " + err.code);
    });
  } catch (e) {
    console.log('test_FileIO_Getxattr_ASync_001 has failed for ' + e.message + ', code: ' + e.code);
    expect(false).assertTrue();
  }
});


/**
 * @tc.name   test_FileIO_Getxattr_ASync_007
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_ASync_0700
 * @tc.desc   Test getxattr() interface. Callback. Test first parameter is null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('test_FileIO_Getxattr_ASync_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('test_FileIO_Getxattr_ASync_007');
  let attrKey = 'user.comment';
  let attrValue = 'Test file.';
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  fs.setxattrSync(fpath, attrKey, attrValue);

  try {
    fs.getxattr(null, attrKey, (err, attrValue) => {
      if (err) {
    console.log('test_FileIO_Getxattr_ASync_007 error: {message: ' + err.message + ', code: ' + err.code + '}');
    expect(false).assertTrue();
    done();
      }
    });
  } catch (e) {
    console.log('test_FileIO_Getxattr_ASync_007 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code === 13900020).assertTrue();
      done();
  }
});

/**
 * @tc.name   test_FileIO_Getxattr_ASync_008
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_ASync_0800
 * @tc.desc   Test getxattr() interface. Callback. Test first parameter is undefined.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('test_FileIO_Getxattr_ASync_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('test_FileIO_Getxattr_ASync_008');
  let attrKey = 'user.comment';
  let attrValue = 'Test file.';
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  fs.setxattrSync(fpath, attrKey, attrValue);

  try {
    fs.getxattr(undefined, attrKey, (err, attrValue) => {
      if (err) {
          console.log('test_FileIO_Getxattr_ASync_008 error: {message: ' + err.message + ', code: ' + err.code + '}');
    expect(false).assertTrue();
    done();
      }
    });
  } catch (e) {
    console.log('test_FileIO_Getxattr_ASync_008 has failed for ' + e.message + ', code: ' + e.code);
  expect(e.code === 13900020).assertTrue();
    done();
  }
});

/**
 * @tc.name   test_FileIO_Getxattr_ASync_009
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_ASync_0900
 * @tc.desc   Test getxattr() interface. Callback. Test second parameter is null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('test_FileIO_Getxattr_ASync_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('test_FileIO_Getxattr_ASync_009');
  let attrKey = 'user.comment';
  let attrValue = 'Test file.';
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  fs.setxattrSync(fpath, attrKey, attrValue);

  try {
    fs.getxattr(fpath, null, (err, attrValue) => {
      if (err) {
        fs.unlinkSync(fpath);
        console.log('test_FileIO_Getxattr_ASync_009 error: {message: ' + err.message + ', code: ' + err.code + '}');
        expect(false).assertTrue();
        done();
      }
    });
  } catch (e) {
      console.log('test_FileIO_Getxattr_ASync_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020).assertTrue();
    done();
  }
});

/**
 * @tc.name   test_FileIO_Getxattr_ASync_010
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_ASync_1000
 * @tc.desc   Test getxattr() interface. Callback. Test second parameter is undefined.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('test_FileIO_Getxattr_ASync_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('test_FileIO_Getxattr_ASync_010');
  let attrKey = 'user.comment';
  let attrValue = 'Test file.';
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  fs.setxattrSync(fpath, attrKey, attrValue);

  try {
    fs.getxattr(fpath, undefined, (err, attrValue) => {
      if (err) {
        fs.unlinkSync(fpath);
        console.log('test_FileIO_Getxattr_ASync_010 error: {message: ' + err.message + ', code: ' + err.code + '}');
        expect(false).assertTrue();
        done();
      }
    });
  } catch (e) {
    console.log('test_FileIO_Getxattr_ASync_010 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code === 13900020).assertTrue();
  done();
  }
});

/**
 * @tc.name   test_FileIO_Getxattr_ASync_002
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_ASync_0200
 * @tc.desc   Test getxattr() interface.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('test_FileIO_Getxattr_ASync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
  let fpath = await nextFileName('test_FileIO_Getxattr_ASync_002');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
  try {
    fs.getxattr(fpath).then((attrValue) => {
      console.info("test_FileIO_Getxattr_ASync_002 value is: " + attrValue);
    }).catch((err) => {
      console.error("test_FileIO_Getxattr_ASync_002 get extended attribute with error message: " + err.message + ", error code: " + err.code);
      expect(false).assertTrue();
    });
  } catch (e) {
    console.log('test_FileIO_Getxattr_ASync_002 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code === 13900020  && e.message == 'Invalid argument').assertTrue();
    done();
  }
});

/**
 * @tc.name   test_FileIO_Getxattr_ASync_003
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_ASync_0300
 * @tc.desc   Test getxattr() interface. Promise. Test first parameter is null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('test_FileIO_Getxattr_ASync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('test_FileIO_Getxattr_ASync_003');
  let attrKey = 'user.comment';
  let attrValue = 'Test file.';
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  await fs.setxattrSync(fpath, attrKey, attrValue);

  try {
    await fs.getxattr(null, attrKey);
    expect(false).assertTrue();
  } catch (e) {
    fs.unlinkSync(fpath);
    console.log('test_FileIO_Getxattr_ASync_003 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
    done();
  }
});

/**
 * @tc.name   test_FileIO_Getxattr_ASync_004
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_ASync_0400
 * @tc.desc   Test getxattr() interface. Promise. Test first parameter is undefined.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('test_FileIO_Getxattr_ASync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('test_FileIO_Getxattr_ASync_004');
  let attrKey = 'user.comment';
  let attrValue = 'Test file.';
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  await fs.setxattrSync(fpath, attrKey, attrValue);

  try {
    await fs.getxattr(undefined, attrKey);
    expect(false).assertTrue();
  } catch (e) {
    fs.unlinkSync(fpath);
    console.log('test_FileIO_Getxattr_ASync_004 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
    done();
  }
});

/**
 * @tc.name   test_FileIO_Getxattr_ASync_005
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_ASync_0500
 * @tc.desc   Test getxattr() interface. Promise. Test second parameter is null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('test_FileIO_Getxattr_ASync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('test_FileIO_Getxattr_ASync_005');
  let attrKey = 'user.comment';
  let attrValue = 'Test file.';
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  await fs.setxattrSync(fpath, attrKey, attrValue);

  try {
    await fs.getxattr(fpath, null);
    expect(false).assertTrue();
  } catch (e) {
    fs.unlinkSync(fpath);
    console.log('test_FileIO_Getxattr_ASync_005 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
    done();
  }
});

/**
 * @tc.name   test_FileIO_Getxattr_ASync_006
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_GETXATTR_ASync_0600
 * @tc.desc   Test getxattr() interface. Promise. Test second parameter is undefined.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('test_FileIO_Getxattr_ASync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('test_FileIO_Getxattr_ASync_006');
  let attrKey = 'user.comment';
  let attrValue = 'Test file.';
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  await fs.setxattrSync(fpath, attrKey, attrValue);

  try {
    await fs.getxattr(fpath, undefined);
    expect(false).assertTrue();
  } catch (e) {
    fs.unlinkSync(fpath);
    console.log('test_FileIO_Getxattr_ASync_006 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
    done();
  }
});
});
}