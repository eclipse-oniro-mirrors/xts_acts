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

export default function fileioChown() {
describe('fileio_chown', function () {

  /**
   * @tc.name   fileio_test_chown_sync_000
   * @tc.number SUB_DF_FILEIO_CHOWNSYNC_0000
   * @tc.desc   Test chownSync() interface. The test file was modified successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_chown_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_chown_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      fileio.chownSync(fpath, stat.uid + 1, stat.gid + 1);
      let stat1 = fileio.statSync(fpath);
      expect(stat.uid == stat1.uid).assertTrue();
      expect(stat.gid == stat1.gid).assertTrue();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.info('fileio_test_chown_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_chown_async_000
   * @tc.number SUB_DF_FILEIO_CHOWNASYNC_0000
   * @tc.desc   Test the chownAsync() interface with promise. The test file was modified successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_chown_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_chown_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      await fileio.chown(fpath, stat.uid + 1, stat.gid + 1);
      let stat1 = fileio.statSync(fpath);
      expect(stat.uid == stat1.uid).assertTrue();
      expect(stat.gid == stat1.gid).assertTrue();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.info('fileio_test_chown_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_chown_async_001
   * @tc.number SUB_DF_FILEIO_CHOWNASYNC_0100
   * @tc.desc   Test the chownAsync() interface with callback. The test file was modified successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_chown_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_chown_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      fileio.chown(fpath, stat.uid, stat.gid, (err) => {
        if (err) {
          console.error('fileio_test_chown_async_001 has failed in callback: ' + err);
        }
        let stat1 = fileio.statSync(fpath);
        expect(stat.uid == stat1.uid).assertTrue();
        expect(stat.gid == stat1.gid).assertTrue();
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.info('fileio_test_chown_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

    /**
 	    * @tc.name   fileio_test_chown_sync_error_001
 	    * @tc.number SUB_DF_FILEIO_CHOWNSYNC_ERROR_001
 	    * @tc.desc   Test chownSync() interface with empty string path.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_sync_error_001', Level.LEVEL2, async function () {
 	     try {
 	       fileio.chownSync("", 1000, 1000);
 	       console.log('fileio_test_chown_sync_error_001 res');
 	     } catch (err) {
 	       console.log('fileio_test_chown_sync_error_001: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_sync_error_002
 	    * @tc.number SUB_DF_FILEIO_CHOWNSYNC_ERROR_002
 	    * @tc.desc   Test chownSync() interface with null path.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_sync_error_002', Level.LEVEL2, async function () {
 	     try {
 	       fileio.chownSync(null, 1000, 1000);
 	       console.log('fileio_test_chown_sync_error_002 res');
 	     } catch (err) {
 	       console.log('fileio_test_chown_sync_error_002: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_sync_error_003
 	    * @tc.number SUB_DF_FILEIO_CHOWNSYNC_ERROR_003
 	    * @tc.desc   Test chownSync() interface with undefined path.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_sync_error_003', Level.LEVEL2, async function () {
 	     try {
 	       fileio.chownSync(undefined, 1000, 1000);
 	       console.log('fileio_test_chown_sync_error_003 res');
 	     } catch (err) {
 	       console.log('fileio_test_chown_sync_error_003: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_sync_error_004
 	    * @tc.number SUB_DF_FILEIO_CHOWNSYNC_ERROR_004
 	    * @tc.desc   Test chownSync() interface with null uid.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_sync_error_004', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_chown_sync_error_004');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.chownSync(fpath, null, 1000);
 	       fileio.unlinkSync(fpath);
 	       console.log('fileio_test_chown_sync_error_004 res');
 	     } catch (err) {
 	       console.log('fileio_test_chown_sync_error_004: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_sync_error_005
 	    * @tc.number SUB_DF_FILEIO_CHOWNSYNC_ERROR_005
 	    * @tc.desc   Test chownSync() interface with undefined uid.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_sync_error_005', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_chown_sync_error_005');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.chownSync(fpath, undefined, 1000);
 	       fileio.unlinkSync(fpath);
 	       console.log('fileio_test_chown_sync_error_005 res');
 	     } catch (err) {
 	       console.log('fileio_test_chown_sync_error_005: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_sync_error_006
 	    * @tc.number SUB_DF_FILEIO_CHOWNSYNC_ERROR_006
 	    * @tc.desc   Test chownSync() interface with null gid.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_sync_error_006', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_chown_sync_error_006');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.chownSync(fpath, 1000, null);
 	       fileio.unlinkSync(fpath);
 	       console.log('fileio_test_chown_sync_error_006 res');
 	     } catch (err) {
 	       console.log('fileio_test_chown_sync_error_006: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_sync_error_007
 	    * @tc.number SUB_DF_FILEIO_CHOWNSYNC_ERROR_007
 	    * @tc.desc   Test chownSync() interface with undefined gid.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_sync_error_007', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_chown_sync_error_007');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.chownSync(fpath, 1000, undefined);
 	       fileio.unlinkSync(fpath);
 	       console.log('fileio_test_chown_sync_error_007 res');
 	     } catch (err) {
 	       console.log('fileio_test_chown_sync_error_007: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_promise_error_001
 	    * @tc.number SUB_DF_FILEIO_CHOWN_PROMISE_ERROR_001
 	    * @tc.desc   Test chown() interface with empty string path. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_promise_error_001', Level.LEVEL2, async function () {
 	     try {
 	       await fileio.chown("", 1000, 1000);
 	       console.log('fileio_test_chown_promise_error_001 res');
 	     } catch (err) {
 	       console.log('fileio_test_chown_promise_error_001: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_promise_error_002
 	    * @tc.number SUB_DF_FILEIO_CHOWN_PROMISE_ERROR_002
 	    * @tc.desc   Test chown() interface with null path. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_promise_error_002', Level.LEVEL2, async function () {
 	     try {
 	       await fileio.chown(null, 1000, 1000);
 	       console.log('fileio_test_chown_promise_error_002 res');
 	     } catch (err) {
 	       console.log('fileio_test_chown_promise_error_002: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_promise_error_003
 	    * @tc.number SUB_DF_FILEIO_CHOWN_PROMISE_ERROR_003
 	    * @tc.desc   Test chown() interface with undefined path. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_promise_error_003', Level.LEVEL2, async function () {
 	     try {
 	       await fileio.chown(undefined, 1000, 1000);
 	       console.log('fileio_test_chown_promise_error_003 res');
 	     } catch (err) {
 	       console.log('fileio_test_chown_promise_error_003: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_promise_error_004
 	    * @tc.number SUB_DF_FILEIO_CHOWN_PROMISE_ERROR_004
 	    * @tc.desc   Test chown() interface with null uid. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_promise_error_004', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_chown_promise_error_004');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       await fileio.chown(fpath, null, 1000);
 	       fileio.unlinkSync(fpath);
 	       console.log('fileio_test_chown_promise_error_004 res');
 	     } catch (err) {
 	       console.log('fileio_test_chown_promise_error_004: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_promise_error_005
 	    * @tc.number SUB_DF_FILEIO_CHOWN_PROMISE_ERROR_005
 	    * @tc.desc   Test chown() interface with undefined uid. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_promise_error_005', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_chown_promise_error_005');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       await fileio.chown(fpath, undefined, 1000);
 	       fileio.unlinkSync(fpath);
 	       console.log('fileio_test_chown_promise_error_005 res');
 	     } catch (err) {
 	       console.log('fileio_test_chown_promise_error_005: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_promise_error_006
 	    * @tc.number SUB_DF_FILEIO_CHOWN_PROMISE_ERROR_006
 	    * @tc.desc   Test chown() interface with null gid. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_promise_error_006', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_chown_promise_error_006');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       await fileio.chown(fpath, 1000, null);
 	       fileio.unlinkSync(fpath);
 	      console.log('fileio_test_chown_promise_error_006 res');
 	     } catch (err) {
 	       console.log('fileio_test_chown_promise_error_006: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_promise_error_007
 	    * @tc.number SUB_DF_FILEIO_CHOWN_PROMISE_ERROR_007
 	    * @tc.desc   Test chown() interface with undefined gid. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_promise_error_007', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_chown_promise_error_007');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       await fileio.chown(fpath, 1000, undefined);
 	       fileio.unlinkSync(fpath);
 	       console.log('fileio_test_chown_promise_error_007 res');
 	     } catch (err) {
 	       console.log('fileio_test_chown_promise_error_007: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_callback_error_001
 	    * @tc.number SUB_DF_FILEIO_CHOWN_CALLBACK_ERROR_001
 	    * @tc.desc   Test chown() interface with empty string path. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_callback_error_001', Level.LEVEL2, async function (done) {
 	     fileio.chown("", 1000, 1000, function (err) {
 	       if (err) {
 	         console.log('fileio_test_chown_callback_error_001: err ' + err.message + ', code: ' + err.code);
 	         expect(err.message == 'No such file or directory').assertTrue();
 	       }
 	     });
       console.log('fileio_test_chown_callback_error_001 res');
       done();
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_callback_error_002
 	    * @tc.number SUB_DF_FILEIO_CHOWN_CALLBACK_ERROR_002
 	    * @tc.desc   Test chown() interface with null path. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_callback_error_002', Level.LEVEL2, async function (done) {
 	     fileio.chown(null, 1000, 1000, function (err) {
 	       if (err) {
 	         console.log('fileio_test_chown_callback_error_002: ' + err.message + ', code: ' + err.code);
 	         expect(err.message == 'No such file or directory').assertTrue();
 	       }
 	     });
       console.log('fileio_test_chown_callback_error_002 res');
       done();
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_chown_callback_error_003
 	    * @tc.number SUB_DF_FILEIO_CHOWN_CALLBACK_ERROR_003
 	    * @tc.desc   Test chown() interface with undefined path. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_chown_callback_error_003', Level.LEVEL2, async function (done) {
 	     fileio.chown(undefined, 1000, 1000, function (err) {
 	       if (err) {
 	         console.log('fileio_test_chown_callback_error_003: ' + err.message + ', code: ' + err.code);
 	         expect(err.message == 'No such file or directory').assertTrue();
 	       }
 	     });
       console.log('fileio_test_chown_callback_error_003 res');
       done();
 	   });

	/**
	* @tc.name   fileio_test_chown_callback_error_004
	* @tc.number SUB_DF_FILEIO_CHOWN_CALLBACK_ERROR_004
	* @tc.desc   Test chown() interface with null path. Callback.
	* @tc.type   FUNCTION
	* @tc.size   MEDIUMTEST
	* @tc.level  LEVEL2
	*/
	it('fileio_test_chown_callback_error_004', Level.LEVEL2, async function (done) {
		let fpath = await nextFileName('fileio_test_chown_promise_error_007');
 	    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
		fileio.chown(fpath, null, 1000, function (err) {
		if (err) {
			console.log('fileio_test_chown_callback_error_004: ' + err.message + ', code: ' + err.code);
			expect(err.message == 'No such file or directory').assertTrue();
		}
		});
	console.log('fileio_test_chown_callback_error_004 res');
	done();
	});
	
	/**
	* @tc.name   fileio_test_chown_callback_error_005
	* @tc.number SUB_DF_FILEIO_CHOWN_CALLBACK_ERROR_005
	* @tc.desc   Test chown() interface with undefined path. Callback.
	* @tc.type   FUNCTION
	* @tc.size   MEDIUMTEST
	* @tc.level  LEVEL2
	*/
	it('fileio_test_chown_callback_error_005', Level.LEVEL2, async function (done) {
		let fpath = await nextFileName('fileio_test_chown_callback_error_005');
 	    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
		fileio.chown(fpath, undefined, 1000, function (err) {
		if (err) {
			console.log('fileio_test_chown_callback_error_005: ' + err.message + ', code: ' + err.code);
			expect(err.message == 'No such file or directory').assertTrue();
		}
		});
	console.log('fileio_test_chown_callback_error_005 res');
	done();
	});

	/**
	* @tc.name   fileio_test_chown_callback_error_006
	* @tc.number SUB_DF_FILEIO_CHOWN_CALLBACK_ERROR_006
	* @tc.desc   Test chown() interface with null path. Callback.
	* @tc.type   FUNCTION
	* @tc.size   MEDIUMTEST
	* @tc.level  LEVEL2
	*/
	it('fileio_test_chown_callback_error_006', Level.LEVEL2, async function (done) {
		let fpath = await nextFileName('fileio_test_chown_callback_error_006');
 	    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
		fileio.chown(fpath, 1000, null, function (err) {
		if (err) {
			console.log('fileio_test_chown_callback_error_006: ' + err.message + ', code: ' + err.code);
			expect(err.message == 'No such file or directory').assertTrue();
		}
		});
	console.log('fileio_test_chown_callback_error_006 res');
	done();
	});
	
	/**
	* @tc.name   fileio_test_chown_callback_error_007
	* @tc.number SUB_DF_FILEIO_CHOWN_CALLBACK_ERROR_007
	* @tc.desc   Test chown() interface with undefined path. Callback.
	* @tc.type   FUNCTION
	* @tc.size   MEDIUMTEST
	* @tc.level  LEVEL2
	*/
	it('fileio_test_chown_callback_error_007', Level.LEVEL2, async function (done) {
		let fpath = await nextFileName('fileio_test_chown_callback_error_007');
 	    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
		fileio.chown(fpath, 1000, undefined, function (err) {
		if (err) {
			console.log('fileio_test_chown_callback_error_007: ' + err.message + ', code: ' + err.code);
			expect(err.message == 'No such file or directory').assertTrue();
		}
		});
	console.log('fileio_test_chown_callback_error_007 res');
	done();
	});
});
}
