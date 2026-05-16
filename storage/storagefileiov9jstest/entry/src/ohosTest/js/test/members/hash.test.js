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

  /**
    * @tc.name   fileIO_test_hash_error_012
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1200
    * @tc.desc   Test hash() interface with invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_error_012', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileIO_test_hash_error_012');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      try {
        await fileHash.hash("", 'md5');
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_hash_error_012 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900002 && e.message == 'No such file or directory').assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_error_013
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1300
    * @tc.desc   Test hash() interface with invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_error_013', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileIO_test_hash_error_013');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      try {
        await fileHash.hash(null, 'md5');
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_hash_error_013 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_error_014
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1400
    * @tc.desc   Test hash() interface with invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_error_014', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileIO_test_hash_error_014');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      try {
        await fileHash.hash(undefined, 'md5');
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_hash_error_014 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_error_015
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1500
    * @tc.desc   Test hash() interface with invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_error_015', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileIO_test_hash_error_015');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      try {
        await fileHash.hash(fpath, "");
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_hash_error_015 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_error_016
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1600
    * @tc.desc   Test hash() interface with invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_error_016', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileIO_test_hash_error_016');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      try {
        await fileHash.hash(fpath, null);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_hash_error_016 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_error_017
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1700
    * @tc.desc   Test hash() interface with invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_error_017', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileIO_test_hash_error_017');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      try {
        await fileHash.hash(fpath, undefined);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_hash_error_017 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_callback_error_018
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1800
    * @tc.desc   Test hash() interface with callback and invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_callback_error_018', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileIO_test_hash_callback_error_018');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      try {
        fileHash.hash("", 'md5', (err, str) => {
          if (err) {
            console.log('fileIO_test_hash_callback_error_018 error package: ' + JSON.stringify(err));
            expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
            fileIO.unlinkSync(fpath);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_hash_callback_error_018 has failed for ' + e.message + ', code: ' + e.code);
        fileIO.unlinkSync(fpath);
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_callback_error_019
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1900
    * @tc.desc   Test hash() interface with callback and invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_callback_error_019', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileIO_test_hash_callback_error_019');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      try {
        fileHash.hash(null, 'md5', (err, str) => {
          if (err) {
            console.log('fileIO_test_hash_callback_error_019 error package: ' + JSON.stringify(err));
            expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
            fileIO.unlinkSync(fpath);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_hash_callback_error_019 has failed for ' + e.message + ', code: ' + e.code);
        fileIO.unlinkSync(fpath);
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_callback_error_020
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_2000
    * @tc.desc   Test hash() interface with callback and invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_callback_error_020', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileIO_test_hash_callback_error_020');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      try {
        fileHash.hash(undefined, 'md5', (err, str) => {
          if (err) {
            console.log('fileIO_test_hash_callback_error_020 error package: ' + JSON.stringify(err));
            expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
            fileIO.unlinkSync(fpath);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_hash_callback_error_020 has failed for ' + e.message + ', code: ' + e.code);
        fileIO.unlinkSync(fpath);
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_callback_error_021
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_2100
    * @tc.desc   Test hash() interface with callback and invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_callback_error_021', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileIO_test_hash_callback_error_021');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      try {
        fileHash.hash(fpath, "", (err, str) => {
          if (err) {
            console.log('fileIO_test_hash_callback_error_021 error package: ' + JSON.stringify(err));
            expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
            fileIO.unlinkSync(fpath);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_hash_callback_error_021 has failed for ' + e.message + ', code: ' + e.code);
        fileIO.unlinkSync(fpath);
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_callback_error_022
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_2200
    * @tc.desc   Test hash() interface with callback and invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_callback_error_022', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileIO_test_hash_callback_error_022');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      try {
        fileHash.hash(fpath, null, (err, str) => {
          if (err) {
            console.log('fileIO_test_hash_callback_error_022 error package: ' + JSON.stringify(err));
            expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
            fileIO.unlinkSync(fpath);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_hash_callback_error_022 has failed for ' + e.message + ', code: ' + e.code);
        fileIO.unlinkSync(fpath);
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_callback_error_023
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_2300
    * @tc.desc   Test hash() interface with callback and invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_callback_error_023', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileIO_test_hash_callback_error_023');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      try {
        fileHash.hash(fpath, undefined, (err, str) => {
          if (err) {
            console.log('fileIO_test_hash_callback_error_023 error package: ' + JSON.stringify(err));
            expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
            fileIO.unlinkSync(fpath);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_hash_callback_error_023 has failed for ' + e.message + ', code: ' + e.code);
        fileIO.unlinkSync(fpath);
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_update_error_024
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_2400
    * @tc.desc   Test update() method with invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_update_error_024', Level.LEVEL2, async function (done) {
      try {
        let hs = Hash.createHash('md5');
        hs.update(null);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_hash_update_error_024 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_update_error_025
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_2500
    * @tc.desc   Test update() method with invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_update_error_025', Level.LEVEL2, async function (done) {
      try {
        let hs = Hash.createHash('md5');
        hs.update(undefined);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_hash_update_error_025 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_createHash_error_026
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_2600
    * @tc.desc   Test createHash() interface with invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_createHash_error_026', Level.LEVEL2, async function (done) {
      try {
        let hs = Hash.createHash("");
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_hash_createHash_error_026 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_createHash_error_027
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_2700
    * @tc.desc   Test createHash() interface with invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_createHash_error_027', Level.LEVEL2, async function (done) {
      try {
        let hs = Hash.createHash(null);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_hash_createHash_error_027 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
  
    /**
    * @tc.name   fileIO_test_hash_createHash_error_028
    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_2800
    * @tc.desc   Test createHash() interface with invalid parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileIO_test_hash_createHash_error_028', Level.LEVEL2, async function (done) {
      try {
        let hs = Hash.createHash(undefined);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_hash_createHash_error_028 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
})
}
