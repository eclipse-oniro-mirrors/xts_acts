/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import fileHash from '@ohos.file.hash';
import {
  fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect,
} from '../Common';

export default function fileIOHash() {
describe('fileIO_fs_hash', function () {

  /**
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0000
   * @tc.name fileIO_test_hash_async_000
   * @tc.desc Test hash() interface. Promise.
   * Encrypt files using the MD5 hashing algorithm
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_hash_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_hash_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = await fileHash.hash(fpath,'md5');
      console.log('fileIO_test_hash_async_000 hash value is ' + str);
      expect(str == '5EB63BBBE01EEED093CB22BB8F5ACDC3').assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_hash_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0100
   * @tc.name fileIO_test_hash_async_001
   * @tc.desc Test hash() interface. Callback.
   * Encrypt files using the MD5 hashing algorithm.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_hash_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_hash_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileHash.hash(fpath, 'md5', (err, str) => {
        if (err) {
          console.log('fileIO_test_hash_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        console.log('fileIO_test_hash_async_001 hash value is ' + str);
        expect(str == '5EB63BBBE01EEED093CB22BB8F5ACDC3').assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_hash_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0200
   * @tc.name fileIO_test_hash_async_002
   * @tc.desc Test hash() interface. Promise.
   * Encrypt files using the sha1 hashing algorithm.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_hash_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_hash_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = await fileHash.hash(fpath, 'sha1');
      console.log('fileIO_test_hash_async_000 hash value is ' + str);
      expect(str == '2AAE6C35C94FCFB415DBE95F408B9CE91EE846ED').assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_hash_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0300
   * @tc.name fileIO_test_hash_async_003
   * @tc.desc Test hash() interface. Callback.
   * Encrypt files using the sha1 hashing algorithm.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_hash_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_hash_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileHash.hash(fpath, 'sha1', (err, str) => {
        if (err) {
          console.log('fileIO_test_hash_async_003 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        console.log('fileIO_test_hash_async_003 hash value is ' + str);
        expect(str == '2AAE6C35C94FCFB415DBE95F408B9CE91EE846ED').assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_hash_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0400
   * @tc.name fileIO_test_hash_async_004
   * @tc.desc Test hash() interface. Promise.
   * Encrypt files using the sha256 hashing algorithm.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_hash_async_004', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_hash_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = await fileHash.hash(fpath, 'sha256');
      console.log('fileIO_test_hash_async_001 hash value is ' + str);
      expect(str == 'B94D27B9934D3E08A52E52D7DA7DABFAC484EFE37A5380EE9088F7ACE2EFCDE9').assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_hash_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0500
   * @tc.name fileIO_test_hash_async_005
   * @tc.desc Test hash() interface. Callback.
   * Encrypt files using the sha256 hashing algorithm.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_hash_async_005', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_hash_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileHash.hash(fpath, 'sha256', (err, str) => {
        if (err) {
          console.log('fileIO_test_hash_async_005 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        console.log('fileIO_test_hash_async_005 hash value is ' + str);
        expect(str == 'B94D27B9934D3E08A52E52D7DA7DABFAC484EFE37A5380EE9088F7ACE2EFCDE9').assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_hash_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0600
   * @tc.name fileIO_test_hash_async_006
   * @tc.desc Test hash() interface. Promise.
   * Invalid mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_hash_async_006', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_hash_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileHash.hash(fpath, '256');
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_hash_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0700
   * @tc.name fileIO_test_hash_async_007
   * @tc.desc Test hash() interface. Promise.
   * Missing parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_hash_async_007', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_hash_async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileHash.hash(fpath, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_hash_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });
})
}
