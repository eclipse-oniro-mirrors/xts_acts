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

export default function fileioChmod() {
describe('fileio_chmod', function () {

  /**
   * @tc.name   fileio_test_chmod_sync_000
   * @tc.number SUB_DF_FILEIO_CHMODSYNC_0000
   * @tc.desc   Test chmodSync() interfaces, mode = 0o660. Test file permissions modified successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_chmod_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_chmod_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.chmodSync(fpath, 0o770);
      expect((fileio.statSync(fpath).mode & 0o777) == 0o664).assertTrue();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.info('fileio_test_chmod_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_chmod_async_000
   * @tc.number SUB_DF_FILEIO_CHMODASYNC_0000
   * @tc.desc   Test the chmodAsync() interface with promise, mode = 0o660. Test file permissions modified successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_chmod_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_chmod_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.chmod(fpath, 0o770);
      expect((fileio.statSync(fpath).mode & 0o777) == 0o664).assertTrue();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.info('fileio_test_chmod_async_000 has failed for ' + e);
      expect(null).assertFail();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_chmod_async_001
   * @tc.number SUB_DF_FILEIO_CHMODASYNC_0100
   * @tc.desc   Test the chmodAsync() interface with callback, mode = 0o660. Test file permissions modified successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_chmod_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_chmod_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.chmod(fpath, 0o770, (err) => {
        if (err) {
          console.error('fileio_test_chmod_async_001 has failed in callback: ' + err);
        }
        expect((fileio.statSync(fpath).mode & 0o777) == 0o664).assertTrue();
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.info('fileio_test_chmod_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
 	    * @tc.name   fileio_test_chmod_sync_error_001
 	    * @tc.number SUB_DF_FILEIO_CHMODSYNC_ERROR_001
 	    * @tc.desc   Test chmodSync() interface with empty string path.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chmod_sync_error_001', Level.LEVEL2, async function () {
 	     try {
 	       fileio.chmodSync("", 0o666);
         console.log('fileio_test_chmod_sync_error_001 res');
 	     } catch (err) {
 	       console.log('fileio_test_chmod_sync_error_001: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chmod_sync_error_002
 	    * @tc.number SUB_DF_FILEIO_CHMODSYNC_ERROR_002
 	    * @tc.desc   Test chmodSync() interface with null path.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chmod_sync_error_002', Level.LEVEL2, async function () {
 	     try {
 	       fileio.chmodSync(null, 0o666);
         console.log('fileio_test_chmod_sync_error_002 res');
 	     } catch (err) {
 	       console.log('fileio_test_chmod_sync_error_002: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chmod_sync_error_003
 	    * @tc.number SUB_DF_FILEIO_CHMODSYNC_ERROR_003
 	    * @tc.desc   Test chmodSync() interface with undefined path.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chmod_sync_error_003', Level.LEVEL2, async function () {
 	     try {
 	       fileio.chmodSync(undefined, 0o666);
 	       console.log('fileio_test_chmod_sync_error_003 res');
 	     } catch (err) {
 	       console.log('fileio_test_chmod_sync_error_003: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chmod_sync_error_004
 	    * @tc.number SUB_DF_FILEIO_CHMODSYNC_ERROR_004
 	    * @tc.desc   Test chmodSync() interface with null mode.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chmod_sync_error_004', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_chmod_sync_error_004');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.chmodSync(fpath, null);
 	       fileio.unlinkSync(fpath);
 	       console.log('fileio_test_chmod_sync_error_004 res');
 	     } catch (err) {
 	       console.log('fileio_test_chmod_sync_error_004: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chmod_sync_error_005
 	    * @tc.number SUB_DF_FILEIO_CHMODSYNC_ERROR_005
 	    * @tc.desc   Test chmodSync() interface with undefined mode.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chmod_sync_error_005', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_chmod_sync_error_005');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.chmodSync(fpath, undefined);
 	       fileio.unlinkSync(fpath);
         console.log('fileio_test_chmod_sync_error_005 res');
 	     } catch (err) {
 	       console.log('fileio_test_chmod_sync_error_005: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chmod_promise_error_001
 	    * @tc.number SUB_DF_FILEIO_CHMOD_PROMISE_ERROR_001
 	    * @tc.desc   Test chmod() interface with empty string path. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chmod_promise_error_001', Level.LEVEL2, async function () {
 	     try {
 	       await fileio.chmod("", 0o666);
         console.log('fileio_test_chmod_promise_error_001 res');
 	     } catch (err) {
 	       console.log('fileio_test_chmod_promise_error_001 err: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chmod_promise_error_002
 	    * @tc.number SUB_DF_FILEIO_CHMOD_PROMISE_ERROR_002
 	    * @tc.desc   Test chmod() interface with null path. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chmod_promise_error_002', Level.LEVEL2, async function () {
 	     try {
 	       await fileio.chmod(null, 0o666);
         console.log('fileio_test_chmod_promise_error_002 res');
 	     } catch (err) {
 	       console.log('fileio_test_chmod_promise_error_002: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chmod_promise_error_003
 	    * @tc.number SUB_DF_FILEIO_CHMOD_PROMISE_ERROR_003
 	    * @tc.desc   Test chmod() interface with undefined path. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chmod_promise_error_003', Level.LEVEL2, async function () {
 	     try {
 	       await fileio.chmod(undefined, 0o666);
         console.log('fileio_test_chmod_promise_error_003 res');
 	     } catch (err) {
 	       console.log('fileio_test_chmod_promise_error_003: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chmod_promise_error_004
 	    * @tc.number SUB_DF_FILEIO_CHMOD_PROMISE_ERROR_004
 	    * @tc.desc   Test chmod() interface with null mode. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chmod_promise_error_004', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_chmod_promise_error_004');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       await fileio.chmod(fpath, null);
 	       fileio.unlinkSync(fpath);
 	       console.log('fileio_test_chmod_promise_error_004 res');
 	     } catch (err) {
 	       console.log('fileio_test_chmod_promise_error_004: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chmod_promise_error_005
 	    * @tc.number SUB_DF_FILEIO_CHMOD_PROMISE_ERROR_005
 	    * @tc.desc   Test chmod() interface with undefined mode. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chmod_promise_error_005', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_chmod_promise_error_005');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       await fileio.chmod(fpath, undefined);
 	       fileio.unlinkSync(fpath);
 	       console.log('fileio_test_chmod_promise_error_005 res');
 	     } catch (err) {
 	       console.log('fileio_test_chmod_promise_error_005: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chmod_callback_error_001
 	    * @tc.number SUB_DF_FILEIO_CHMOD_CALLBACK_ERROR_001
 	    * @tc.desc   Test chmod() interface with empty string path. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chmod_callback_error_001', Level.LEVEL2, async function (done) {
      try {
 	     fileio.chmod("", 0o666, function (err) {
 	       if (err) {
 	         console.log('fileio_test_chmod_callback_error_001: ' + err.message + ', code: ' + err.code);
 	         expect(err.message == 'No such file or directory').assertTrue();
 	       } 
         done();
 	     });
      } catch (err) {
         expect(false).assertTrue();
 	       done();
 	    }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chmod_callback_error_002
 	    * @tc.number SUB_DF_FILEIO_CHMOD_CALLBACK_ERROR_002
 	    * @tc.desc   Test chmod() interface with null path. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chmod_callback_error_002', Level.LEVEL2, async function (done) {
      try {
 	     fileio.chmod(null, 0o666, function (err) {
 	       if (err) {
 	         console.log('fileio_test_chmod_callback_error_002: ' + err.message + ', code: ' + err.code);
 	         expect(err.message == 'No such file or directory').assertTrue();
 	       }
 	     });
       console.log('fileio_test_chmod_callback_error_002 res');
       done();
      } catch (err) {
         expect(false).assertTrue();
 	       done();
 	    }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chmod_callback_error_003
 	    * @tc.number SUB_DF_FILEIO_CHMOD_CALLBACK_ERROR_003
 	    * @tc.desc   Test chmod() interface with undefined path. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chmod_callback_error_003', Level.LEVEL2, async function (done) {
      try {
 	     fileio.chmod(undefined, 0o666, function (err) {
 	       if (err) {
 	         console.log('fileio_test_chmod_callback_error_003: ' + err.message + ', code: ' + err.code);
 	         expect(err.message == 'No such file or directory').assertTrue();
 	       }
 	     });
       console.log('fileio_test_chmod_callback_error_003 res');
       done();
      } catch (err) {
         expect(false).assertTrue();
 	       done();
 	    }
 	   });

	/**
	* @tc.name   fileio_test_chmod_callback_error_004
	* @tc.number SUB_DF_FILEIO_CHMOD_CALLBACK_ERROR_004
	* @tc.desc   Test chmod() interface with null path. Callback.
	* @tc.type   FUNCTION
	* @tc.size   MEDIUMTEST
	* @tc.level  LEVEL2
	*/
	it('fileio_test_chmod_callback_error_004', Level.LEVEL2, async function (done) {
		let fpath = await nextFileName('fileio_test_chmod_callback_error_004');
 	    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
		try {
			fileio.chmod(fpath, null, function (err) {
			if (err) {
				console.log('fileio_test_chmod_callback_error_004: ' + err.message + ', code: ' + err.code);
				expect(err.message == 'No such file or directory').assertTrue();
			}
			});
		console.log('fileio_test_chmod_callback_error_004 res');
		done();
		} catch (err) {
			expect(false).assertTrue();
			done();
		}
	});
	
	/**
	* @tc.name   fileio_test_chmod_callback_error_005
	* @tc.number SUB_DF_FILEIO_CHMOD_CALLBACK_ERROR_005
	* @tc.desc   Test chmod() interface with undefined path. Callback.
	* @tc.type   FUNCTION
	* @tc.size   MEDIUMTEST
	* @tc.level  LEVEL2
	*/
	it('fileio_test_chmod_callback_error_005', Level.LEVEL2, async function (done) {
		let fpath = await nextFileName('fileio_test_chmod_callback_error_005');
 	    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
		try {
			fileio.chmod(fpath, undefined, function (err) {
			if (err) {
				console.log('fileio_test_chmod_callback_error_005: ' + err.message + ', code: ' + err.code);
				expect(err.message == 'No such file or directory').assertTrue();
			}
			});
		console.log('fileio_test_chmod_callback_error_005 res');
		done();
		} catch (err) {
			expect(false).assertTrue();
			done();
		}
	});
});
}
