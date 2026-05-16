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

export default function fileioCreateStream() {
describe('fileio_createStream', function () {

  /**
   * @tc.name   fileio_test_stream_create_stream_async_000
   * @tc.number SUB_DF_FILEIO_STREAM_CREATE_STREAM_ASYNC_0000
   * @tc.desc   Test createStreamAsync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_stream_create_stream_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_create_stream_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = await fileio.createStream(fpath, 'r+');
      expect(ss !== null).assertTrue();
      expect(ss.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(ss.closeSync() == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_test_stream_create_stream_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_stream_create_stream_async_001
   * @tc.number SUB_DF_FILEIO_STREAM_CREATE_STREAM_ASYNC_0010
   * @tc.desc   Test createStreamAsync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_stream_create_stream_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_create_stream_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.createStream(fpath, 'r+', function (err, stream) {
        expect(stream.closeSync() == null).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileio_test_stream_create_stream_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_stream_create_stream_async_002
   * @tc.number SUB_DF_FILEIO_STREAM_CREATE_STREAM_ASYNC_0020
   * @tc.desc   Test createStreamAsync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_stream_create_stream_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_create_stream_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.createStream(fpath, 'r+', function (err, stream) {
        expect(stream.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(stream.closeSync() == null).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileio_test_stream_create_stream_async_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_stream_create_stream_async_003
   * @tc.number SUB_DF_FILEIO_STREAM_CREATE_STREAM_ASYNC_0030
   * @tc.desc   Test createStreamAsync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_stream_create_stream_async_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_create_stream_async_003');

    try {
      fileio.createStream(fpath, 'r+', function (err) {
        done();
      });
    } catch (e) {
      expect(!!e).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_stream_create_stream_async_004
   * @tc.number SUB_DF_FILEIO_STREAM_CREATE_STREAM_ASYNC_0030
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_stream_create_stream_async_004', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_create_stream_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.createStream(fpath, 'ohos', function (err) {
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.info("fileio_test_stream_create_stream_async_004 has failed for " + e);
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
 	    * @tc.name   fileio_test_stream_create_sync_error_001
 	    * @tc.number SUB_DF_FILEIO_STREAM_CREATE_SYNC_ERROR_001
 	    * @tc.desc   Test createStreamSync() interface with empty string path.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_stream_create_sync_error_001', Level.LEVEL2, async function () {
 	     try {
 	       fileio.createStreamSync("", "r");
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_stream_create_sync_error_001: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_stream_create_sync_error_002
 	    * @tc.number SUB_DF_FILEIO_STREAM_CREATE_SYNC_ERROR_002
 	    * @tc.desc   Test createStreamSync() interface with null path.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_stream_create_sync_error_002', Level.LEVEL2, async function () {
 	     try {
 	       fileio.createStreamSync(null, "r");
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_stream_create_sync_error_002: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid path').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_stream_create_sync_error_003
 	    * @tc.number SUB_DF_FILEIO_STREAM_CREATE_SYNC_ERROR_003
 	    * @tc.desc   Test createStreamSync() interface with undefined path.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_stream_create_sync_error_003', Level.LEVEL2, async function () {
 	     try {
 	       fileio.createStreamSync(undefined, "r");
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_stream_create_sync_error_003: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid path').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_stream_create_sync_error_004
 	    * @tc.number SUB_DF_FILEIO_STREAM_CREATE_SYNC_ERROR_004
 	    * @tc.desc   Test createStreamSync() interface with empty string mode.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_stream_create_sync_error_004', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_stream_create_sync_error_004');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.createStreamSync(fpath, "");
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_stream_create_sync_error_004: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid argument').assertTrue();
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_stream_create_sync_error_005
 	    * @tc.number SUB_DF_FILEIO_STREAM_CREATE_SYNC_ERROR_005
 	    * @tc.desc   Test createStreamSync() interface with null mode.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_stream_create_sync_error_005', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_stream_create_sync_error_005');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.createStreamSync(fpath, null);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_stream_create_sync_error_005: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid mode').assertTrue();
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_stream_create_sync_error_006
 	    * @tc.number SUB_DF_FILEIO_STREAM_CREATE_SYNC_ERROR_006
 	    * @tc.desc   Test createStreamSync() interface with undefined mode.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_stream_create_sync_error_006', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_stream_create_sync_error_006');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.createStreamSync(fpath, undefined);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_stream_create_sync_error_006: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid mode').assertTrue();
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_stream_create_promise_error_001
 	    * @tc.number SUB_DF_FILEIO_STREAM_CREATE_PROMISE_ERROR_001
 	    * @tc.desc   Test createStream() interface with empty string path. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_stream_create_promise_error_001', Level.LEVEL2, async function () {
 	     try {
 	       await fileio.createStream("", "r");
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_stream_create_promise_error_001: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_stream_create_promise_error_002
 	    * @tc.number SUB_DF_FILEIO_STREAM_CREATE_PROMISE_ERROR_002
 	    * @tc.desc   Test createStream() interface with null path. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_stream_create_promise_error_002', Level.LEVEL2, async function () {
 	     try {
 	       await fileio.createStream(null, "r");
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_stream_create_promise_error_002: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid path').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_stream_create_promise_error_003
 	    * @tc.number SUB_DF_FILEIO_STREAM_CREATE_PROMISE_ERROR_003
 	    * @tc.desc   Test createStream() interface with undefined path. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_stream_create_promise_error_003', Level.LEVEL2, async function () {
 	     try {
 	       await fileio.createStream(undefined, "r");
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_stream_create_promise_error_003: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid path').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_stream_create_promise_error_004
 	    * @tc.number SUB_DF_FILEIO_STREAM_CREATE_PROMISE_ERROR_004
 	    * @tc.desc   Test createStream() interface with empty string mode. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_stream_create_promise_error_004', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_stream_create_promise_error_004');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       await fileio.createStream(fpath, "");
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_stream_create_promise_error_004: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid argument').assertTrue();
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_stream_create_promise_error_005
 	    * @tc.number SUB_DF_FILEIO_STREAM_CREATE_PROMISE_ERROR_005
 	    * @tc.desc   Test createStream() interface with null mode. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_stream_create_promise_error_005', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_stream_create_promise_error_005');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       await fileio.createStream(fpath, null);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_stream_create_promise_error_005: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid mode').assertTrue();
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_stream_create_promise_error_006
 	    * @tc.number SUB_DF_FILEIO_STREAM_CREATE_PROMISE_ERROR_006
 	    * @tc.desc   Test createStream() interface with undefined mode. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_stream_create_promise_error_006', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_stream_create_promise_error_006');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       await fileio.createStream(fpath, undefined);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_stream_create_promise_error_006: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid mode').assertTrue();
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_stream_create_callback_error_001
 	    * @tc.number SUB_DF_FILEIO_STREAM_CREATE_CALLBACK_ERROR_001
 	    * @tc.desc   Test createStream() interface with empty string path. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_stream_create_callback_error_001', Level.LEVEL2, async function (done) {
 	     fileio.createStream("", "r", function (err) {
 	       if (err) {
 	         console.log('fileio_test_stream_create_callback_error_001: ' + err.message + ', code: ' + err.code);
 	         expect(err.message == 'No such file or directory').assertTrue();
 	         done();
 	       } else {
 	         expect(false).assertTrue();
 	         done();
 	       }
 	     });
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_stream_create_callback_error_002
 	    * @tc.number SUB_DF_FILEIO_STREAM_CREATE_CALLBACK_ERROR_002
 	    * @tc.desc   Test createStream() interface with null path. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_stream_create_callback_error_002', Level.LEVEL2, async function (done) {
      try {
 	     fileio.createStream(null, "r", function (err) {
 	       if (err) {
 	         console.log('fileio_test_stream_create_callback_error_002: ' + err.message + ', code: ' + err.code);
 	         expect(err.message == 'Invalid path').assertTrue();
 	         done();
 	       }
 	     });
       console.log('fileio_test_stream_create_callback_error_002 res');
       done();
      } catch (err) {
        console.log('fileio_test_stream_create_callback_error_002 err: ' + err.message + ', code: ' + err.code);
        expect(err.message == 'Invalid path').assertTrue();
        done();
 	    }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_stream_create_callback_error_003
 	    * @tc.number SUB_DF_FILEIO_STREAM_CREATE_CALLBACK_ERROR_003
 	    * @tc.desc   Test createStream() interface with undefined path. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_stream_create_callback_error_003', Level.LEVEL2, async function (done) {
      try {
 	     fileio.createStream(undefined, "r", function (err) {
 	       if (err) {
 	         console.log('fileio_test_stream_create_callback_error_003: ' + err.message + ', code: ' + err.code);
 	         expect(err.message == 'Invalid path').assertTrue();
 	         done();
 	       }
 	     });
       console.log('fileio_test_stream_create_callback_error_003 res');
       done();
      } catch (err) {
        console.log('fileio_test_stream_create_callback_error_003 err: ' + err.message + ', code: ' + err.code);
        expect(err.message == 'Invalid path').assertTrue();
        done();
 	    }
 	   });
	
	/**
	* @tc.name   fileio_test_stream_create_callback_error_004
	* @tc.number SUB_DF_FILEIO_STREAM_CREATE_CALLBACK_ERROR_004
	* @tc.desc   Test createStream() interface with empty string path. Callback.
	* @tc.type   FUNCTION
	* @tc.size   MEDIUMTEST
	* @tc.level  LEVEL2
	*/
	it('fileio_test_stream_create_callback_error_004', Level.LEVEL2, async function (done) {
		let fpath = await nextFileName('fileio_test_stream_create_callback_error_004');
 	    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
		fileio.createStream(fpath, "", function (err) {
		if (err) {
			console.log('fileio_test_stream_create_callback_error_004: ' + err.message + ', code: ' + err.code);
			expect(err.message == 'Invalid argument').assertTrue();
			done();
		} else {
			expect(false).assertTrue();
			done();
		}
		});
	});
	
	/**
	* @tc.name   fileio_test_stream_create_callback_error_005
	* @tc.number SUB_DF_FILEIO_STREAM_CREATE_CALLBACK_ERROR_005
	* @tc.desc   Test createStream() interface with null path. Callback.
	* @tc.type   FUNCTION
	* @tc.size   MEDIUMTEST
	* @tc.level  LEVEL2
	*/
	it('fileio_test_stream_create_callback_error_005', Level.LEVEL2, async function (done) {
		let fpath = await nextFileName('fileio_test_stream_create_callback_error_005');
 	    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
		try {
			fileio.createStream(fpath, null, function (err) {
			if (err) {
				console.log('fileio_test_stream_create_callback_error_005: ' + err.message + ', code: ' + err.code);
				expect(err.message == 'Invalid argument').assertTrue();
				done();
			}
			});
		console.log('fileio_test_stream_create_callback_error_005 res');
		done();
		} catch (err) {
		console.log('fileio_test_stream_create_callback_error_005 err: ' + err.message + ', code: ' + err.code);
		expect(err.message == 'Invalid mode').assertTrue();
		done();
		}
	});
	
	/**
	* @tc.name   fileio_test_stream_create_callback_error_006
	* @tc.number SUB_DF_FILEIO_STREAM_CREATE_CALLBACK_ERROR_006
	* @tc.desc   Test createStream() interface with undefined path. Callback.
	* @tc.type   FUNCTION
	* @tc.size   MEDIUMTEST
	* @tc.level  LEVEL2
	*/
	it('fileio_test_stream_create_callback_error_006', Level.LEVEL2, async function (done) {
		let fpath = await nextFileName('fileio_test_stream_create_callback_error_006');
 	    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
		try {
			fileio.createStream(fpath, undefined, function (err) {
			if (err) {
				console.log('fileio_test_stream_create_callback_error_006: ' + err.message + ', code: ' + err.code);
				expect(err.message == 'Invalid mode').assertTrue();
				done();
			}
			});
		console.log('fileio_test_stream_create_callback_error_006 res');
		done();
		} catch (err) {
		console.log('fileio_test_stream_create_callback_error_006 err: ' + err.message + ', code: ' + err.code);
		expect(err.message == 'Invalid mode').assertTrue();
		done();
	    }
	});
});
}
