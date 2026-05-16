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

import fileHash from '@ohos.file.hash';
import {
  fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect,
} from '../Common';
import fs from '@ohos.file.fs';
import Hash from '@ohos.file.hash';
import { Level } from '@ohos/hypium';

export default function fileIOHash() {
describe('fileIO_fs_hash', function () {

  /**
   * @tc.name   fileIO_test_hash_async_000
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0000
   * @tc.desc   Test hash() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_hash_async_000', Level.LEVEL0, async function (done) {
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
   * @tc.name   fileIO_test_hash_async_001
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0100
   * @tc.desc   Test hash() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_hash_async_001', Level.LEVEL0, async function (done) {
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
   * @tc.name   fileIO_test_hash_async_002
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0200
   * @tc.desc   Test hash() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_hash_async_002', Level.LEVEL0, async function (done) {
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
   * @tc.name   fileIO_test_hash_async_003
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0300
   * @tc.desc   Test hash() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_hash_async_003', Level.LEVEL0, async function (done) {
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
   * @tc.name   fileIO_test_hash_async_004
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0400
   * @tc.desc   Test hash() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_hash_async_004', Level.LEVEL0, async function (done) {
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
   * @tc.name   fileIO_test_hash_async_005
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0500
   * @tc.desc   Test hash() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_hash_async_005', Level.LEVEL0, async function (done) {
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
   * @tc.name   fileIO_test_hash_async_006
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0600
   * @tc.desc   Test hash() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_hash_async_006', Level.LEVEL0, async function (done) {
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
   * @tc.name   fileIO_test_hash_async_007
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0700
   * @tc.desc   Test hash() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_hash_async_007', Level.LEVEL0, async function (done) {
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

  /**
   * @tc.name   fileIO_test_hash_createHash_008
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0800
   * @tc.desc   Test createHash() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_hash_createHash_008', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_hash_createHash_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let rs = fs.createReadStream(fpath);
      let hsMd5 = Hash.createHash('md5');
      rs.on('data', (emitData) => {
        const data = emitData?.data;
        hsMd5.update(new Uint8Array(data?.split('').map((x) => x.charCodeAt(0))).buffer);
        console.log('fileIO_test_hash_createHash_008 readlen ' + data?.length + ', content: ' + data?.slice(0, 10));
      });
      rs.on('close', async () => {
        const fileHash = await Hash.hash(fpath, 'md5');
        const streamHash = hsMd5.digest();
        console.info(`hashResult: ${streamHash}, fileHash: ${fileHash}`);
        expect(streamHash == fileHash).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_hash_createHash_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_hash_createHash_009
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0900
   * @tc.desc   Test createHash() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_hash_createHash_009', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_hash_createHash_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let rs = fs.createReadStream(fpath);
      let hsSha1 = Hash.createHash('sha1');
      rs.on('data', (emitData) => {
        const data = emitData?.data;
        hsSha1.update(new Uint8Array(data?.split('').map((x) => x.charCodeAt(0))).buffer);
        console.log('fileIO_test_hash_createHash_009 readlen ' + data?.length + ', content: ' + data?.slice(0, 10));
      });
      rs.on('close', async () => {
        const fileHash = await Hash.hash(fpath, 'sha1');
        const streamHash = hsSha1.digest();
        console.info(`hashResult: ${streamHash}, fileHash: ${fileHash}`);
        expect(streamHash == fileHash).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_hash_createHash_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_hash_createHash_010
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1000
   * @tc.desc   Test createHash() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_hash_createHash_010', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_hash_createHash_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let rs = fs.createReadStream(fpath);
      let hsSha256 = Hash.createHash('sha256');
      rs.on('data', (emitData) => {
        const data = emitData?.data;
        hsSha256.update(new Uint8Array(data?.split('').map((x) => x.charCodeAt(0))).buffer);
        console.log('fileIO_test_hash_createHash_010 readlen ' + data?.length + ', content: ' + data?.slice(0, 10));
      });
      rs.on('close', async () => {
        const fileHash = await Hash.hash(fpath, 'sha256');
        const streamHash = hsSha256.digest();
        console.info(`fileIO_test_hash_createHash_010 hashResult: ${streamHash}, fileHash: ${fileHash}`);
        expect(streamHash == fileHash).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_hash_createHash_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_hash_createHash_011
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1100
   * @tc.desc   Test createHash() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_hash_createHash_011', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_hash_createHash_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let rs = fs.createReadStream(fpath);
      let hsSha256 = Hash.createHash('123');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_hash_createHash_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });
})
}
