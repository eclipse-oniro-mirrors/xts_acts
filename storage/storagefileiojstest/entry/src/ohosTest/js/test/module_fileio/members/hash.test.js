/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
  fileio, FILE_CONTENT, prepareFile, nextFileName,
  describe, it, expect,
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioHash() {
describe('fileio_hash', function () {
  console.log('fileio_hash test start');

  /**
   * @tc.name   fileio_test_hash_async_000
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0000
   * @tc.desc   Test hashAsync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_hash_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_hash_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = await fileio.hash(fpath,'md5');
      console.log('fileio_test_hash_async_000 hash value is ' + str);
      expect(str == '5EB63BBBE01EEED093CB22BB8F5ACDC3').assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_test_hash_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_hash_async_001
   * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0100
   * @tc.desc   Test hashAsync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_hash_async_001', Level.LEVEL0, async function (done) {
    console.log('fileio_hash test fileio_test_hash_async_001 start');
    let fpath = await nextFileName('fileio_test_hash_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.hash(fpath, "sha256", (err, hashStr) => {
        if (hashStr) {
          console.info("fileio_test_hash_async_001 calculate file hash succeed:" + hashStr);
          expect(hashStr == 'B94D27B9934D3E08A52E52D7DA7DABFAC484EFE37A5380EE9088F7ACE2EFCDE9').assertTrue();
          expect(fileio.unlinkSync(fpath) == null).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_hash_async_001 has failed for ' + e);
      expect(null).assertFail();
      done();
    }
    console.log('fileio_hash test fileio_test_hash_async_001 end');
  });

  /**
 	    * @tc.name   fileio_test_hash_async_error_002
 	    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0200
 	    * @tc.desc   Test hashAsync() interface with invalid parameters.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_hash_async_error_002', Level.LEVEL2, async function (done) {
 	     let fpath = await nextFileName('fileio_test_hash_async_error_002');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	 
 	     try {
 	       await fileio.hash("", 'md5');
 	       expect(false).assertTrue();
 	     } catch (e) {
 	       console.log('fileio_test_hash_async_error_002 has failed for ' + e.message + ', code: ' + e.code);
 	       expect(e.message == 'No such file or directory').assertTrue();
 	       expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	       done();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_hash_async_error_003
 	    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0300
 	    * @tc.desc   Test hashAsync() interface with invalid parameters.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_hash_async_error_003', Level.LEVEL2, async function (done) {
 	     let fpath = await nextFileName('fileio_test_hash_async_error_003');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	 
 	     try {
 	       await fileio.hash(null, 'md5');
 	       expect(false).assertTrue();
 	     } catch (e) {
 	       console.log('fileio_test_hash_async_error_003 has failed for ' + e.message + ', code: ' + e.code);
 	       expect(e.message == 'Invalid path').assertTrue();
 	       expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	       done();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_hash_async_error_004
 	    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0400
 	    * @tc.desc   Test hashAsync() interface with invalid parameters.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_hash_async_error_004', Level.LEVEL2, async function (done) {
 	     let fpath = await nextFileName('fileio_test_hash_async_error_004');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	 
 	     try {
 	       await fileio.hash(undefined, 'md5');
 	       expect(false).assertTrue();
 	     } catch (e) {
 	       console.log('fileio_test_hash_async_error_004 has failed for ' + e.message + ', code: ' + e.code);
 	       expect(e.message == 'Invalid path').assertTrue();
 	       expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	       done();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_hash_async_error_005
 	    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0500
 	    * @tc.desc   Test hashAsync() interface with invalid parameters.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_hash_async_error_005', Level.LEVEL2, async function (done) {
 	     let fpath = await nextFileName('fileio_test_hash_async_error_005');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	 
 	     try {
 	       await fileio.hash(fpath, "");
 	       expect(false).assertTrue();
 	     } catch (e) {
 	       console.log('fileio_test_hash_async_error_005 has failed for ' + e.message + ', code: ' + e.code);
 	       expect(e.message == 'Invalid algorithm').assertTrue();
 	       expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	       done();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_hash_async_error_006
 	    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0600
 	    * @tc.desc   Test hashAsync() interface with invalid parameters.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_hash_async_error_006', Level.LEVEL2, async function (done) {
 	     let fpath = await nextFileName('fileio_test_hash_async_error_006');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	 
 	     try {
 	       await fileio.hash(fpath, null);
 	       expect(false).assertTrue();
 	     } catch (e) {
 	       console.log('fileio_test_hash_async_error_006 has failed for ' + e.message + ', code: ' + e.code);
 	       expect(e.message == 'Invalid algorithm').assertTrue();
 	       expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	       done();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_hash_async_error_007
 	    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0700
 	    * @tc.desc   Test hashAsync() interface with invalid parameters.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_hash_async_error_007', Level.LEVEL2, async function (done) {
 	     let fpath = await nextFileName('fileio_test_hash_async_error_007');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	 
 	     try {
 	       await fileio.hash(fpath, undefined);
 	       expect(false).assertTrue();
 	     } catch (e) {
 	       console.log('fileio_test_hash_async_error_007 has failed for ' + e.message + ', code: ' + e.code);
 	       expect(e.message == 'Invalid algorithm').assertTrue();
 	       expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	       done();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_hash_async_callback_error_008
 	    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0800
 	    * @tc.desc   Test hashAsync() interface with callback and invalid parameters.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_hash_async_callback_error_008', Level.LEVEL2, async function (done) {
 	     let fpath = await nextFileName('fileio_test_hash_async_callback_error_008');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	 
 	     try {
 	       fileio.hash("", 'md5', (err, hashStr) => {
 	         if (err) {
 	           console.log('fileio_test_hash_async_callback_error_008 error: ' + err.message + ', code: ' + err.code);
 	           expect(err.message == 'No such file or directory').assertTrue();
 	           expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	           done();
 	         } else {
 	           expect(false).assertTrue();
 	           done();
 	         }
 	       });
 	     } catch (e) {
 	       console.log('fileio_test_hash_async_callback_error_008 has failed for ' + e.message + ', code: ' + e.code);
 	       expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	       done();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_hash_async_callback_error_009
 	    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0900
 	    * @tc.desc   Test hashAsync() interface with callback and invalid parameters.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_hash_async_callback_error_009', Level.LEVEL2, async function (done) {
 	     let fpath = await nextFileName('fileio_test_hash_async_callback_error_009');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	 
 	     try {
 	       fileio.hash(null, 'md5', (err, hashStr) => {
 	         if (err) {
 	           console.log('fileio_test_hash_async_callback_error_009 error: ' + err.message + ', code: ' + err.code);
 	           expect(err.message == 'Invalid path').assertTrue();
 	           expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	           done();
 	         } else {
 	           expect(false).assertTrue();
 	           done();
 	         }
 	       });
 	     } catch (e) {
 	       console.log('fileio_test_hash_async_callback_error_009 has failed for ' + e.message + ', code: ' + e.code);
 	       expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	       done();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_hash_async_callback_error_010
 	    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1000
 	    * @tc.desc   Test hashAsync() interface with callback and invalid parameters.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_hash_async_callback_error_010', Level.LEVEL2, async function (done) {
 	     let fpath = await nextFileName('fileio_test_hash_async_callback_error_010');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	 
 	     try {
 	       fileio.hash(undefined, 'md5', (err, hashStr) => {
 	         if (err) {
 	           console.log('fileio_test_hash_async_callback_error_010 error: ' + err.message + ', code: ' + err.code);
 	           expect(err.message == 'Invalid path').assertTrue();
 	           expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	           done();
 	         } else {
 	           expect(false).assertTrue();
 	           done();
 	         }
 	       });
 	     } catch (e) {
 	       console.log('fileio_test_hash_async_callback_error_010 has failed for ' + e.message + ', code: ' + e.code);
 	       expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	       done();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_hash_async_callback_error_011
 	    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1100
 	    * @tc.desc   Test hashAsync() interface with callback and invalid parameters.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_hash_async_callback_error_011', Level.LEVEL2, async function (done) {
 	     let fpath = await nextFileName('fileio_test_hash_async_callback_error_011');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	 
 	     try {
 	       fileio.hash(fpath, "", (err, hashStr) => {
 	         if (err) {
 	           console.log('fileio_test_hash_async_callback_error_011 error: ' + err.message + ', code: ' + err.code);
 	           expect(err.message == 'Invalid algorithm').assertTrue();
 	           expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	           done();
 	         } else {
 	           expect(false).assertTrue();
 	           done();
 	         }
 	       });
 	     } catch (e) {
 	       console.log('fileio_test_hash_async_callback_error_011 has failed for ' + e.message + ', code: ' + e.code);
 	       expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	       done();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_hash_async_callback_error_012
 	    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1200
 	    * @tc.desc   Test hashAsync() interface with callback and invalid parameters.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_hash_async_callback_error_012', Level.LEVEL2, async function (done) {
 	     let fpath = await nextFileName('fileio_test_hash_async_callback_error_012');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	 
 	     try {
 	       fileio.hash(fpath, null, (err, hashStr) => {
 	         if (err) {
 	           console.log('fileio_test_hash_async_callback_error_012 error: ' + err.message + ', code: ' + err.code);
 	           expect(err.message == 'Invalid algorithm').assertTrue();
 	           expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	           done();
 	         } else {
 	           expect(false).assertTrue();
 	           done();
 	         }
 	       });
 	     } catch (e) {
 	       console.log('fileio_test_hash_async_callback_error_012 has failed for ' + e.message + ', code: ' + e.code);
 	       expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	       done();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_hash_async_callback_error_013
 	    * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1300
 	    * @tc.desc   Test hashAsync() interface with callback and invalid parameters.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_hash_async_callback_error_013', Level.LEVEL2, async function (done) {
 	     let fpath = await nextFileName('fileio_test_hash_async_callback_error_013');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	 
 	     try {
 	       fileio.hash(fpath, undefined, (err, hashStr) => {
 	         if (err) {
 	           console.log('fileio_test_hash_async_callback_error_013 error: ' + err.message + ', code: ' + err.code);
 	           expect(err.message == 'Invalid algorithm').assertTrue();
 	           expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	           done();
 	         } else {
 	           expect(false).assertTrue();
 	           done();
 	         }
 	       });
 	     } catch (e) {
 	       console.log('fileio_test_hash_async_callback_error_013 has failed for ' + e.message + ', code: ' + e.code);
 	       expect(fileio.unlinkSync(fpath) == null).assertTrue();
 	       done();
 	     }
 	   });
  console.log('fileio_hash test end');
});}