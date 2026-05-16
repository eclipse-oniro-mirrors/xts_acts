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
  fileio, FILE_CONTENT, prepareFile, nextFileName, isIntNum,
  describe, it, expect,
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioAccess() {
describe('fileio_access', function () {

  /**
   * @tc.name   fileio_test_access_sync_000
   * @tc.number SUB_DF_FILEIO_ACCESSSYNC_0000
   * @tc.desc   Test accessSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_access_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_access_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.accessSync(fpath);
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_access_sync_000 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_access_sync_001
   * @tc.number SUB_DF_FILEIO_ACCESSSYNC_0100
   * @tc.desc   Test accessSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_access_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_access_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.accessSync(fpath, 2);
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_access_sync_001 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_access_sync_002
   * @tc.number SUB_DF_FILEIO_ACCESSSYNC_0200
   * @tc.desc   Test accessSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_access_sync_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_access_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.accessSync(fpath, 4);
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_access_sync_002 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_access_sync_003
   * @tc.number SUB_DF_FILEIO_ACCESSSYNC_0300
   * @tc.desc   Test accessSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_access_sync_003', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_access_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.accessSync(fpath, 2 | 4);
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_access_sync_003 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_access_sync_004
   * @tc.number SUB_DF_FILEIO_ACCESSSYNC_0400
   * @tc.desc   Test accessSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_access_sync_004', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_access_sync_004');
    fileio.openSync(fpath, 0o102, 0o777);

    try {
      fileio.accessSync(fpath, 1);
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_access_sync_004 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_access_sync_005
   * @tc.number SUB_DF_FILEIO_ACCESSSYNC_0500
   * @tc.desc   Test accessSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_access_sync_005', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_access_sync_005');

    try {
      fileio.accessSync(fpath);
    } catch (err) {
      console.info('fileio_test_access_sync_005 has failed for ' + err);
      expect(err.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_access_sync_006
   * @tc.number SUB_DF_FILEIO_ACCESSSYNC_0600
   * @tc.desc   Test accessSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_access_sync_006', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_access_sync_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.accessSync(fpath, undefined);
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_access_sync_006 has failed for ' + err);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_access_async_000
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0000
   * @tc.desc   Test access() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_access_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.access(fpath);
      fileio.unlinkSync(fpath);
      done();
    } catch (err) {
      console.info('fileio_test_access_async_000 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_access_async_001
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0100
   * @tc.desc   Test access() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_access_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.access(fpath, 4);
      let fd = fileio.openSync(fpath);
      expect(isIntNum(fd)).assertTrue();
      expect((await fileio.read(fd, new ArrayBuffer(4096))) != null).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (err) {
      console.info('fileio_test_access_async_001 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_access_async_002
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0200
   * @tc.desc   Test access() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_access_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.access(fpath, function (error) {
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (err) {
      console.info('fileio_test_access_async_002 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_access_async_003
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0300
   * @tc.desc   Test access() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_access_async_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.access(fpath, 4, async function (error) {
        let fd = fileio.openSync(fpath);
        expect(isIntNum(fd)).assertTrue();
        expect((await fileio.read(fd, new ArrayBuffer(4096))) != null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      });
      done();
    } catch (err) {
      console.info('fileio_test_access_async_003 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_access_async_004
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0400
   * @tc.desc   Test access() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_access_async_004', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_004');
    fileio.openSync(fpath, 0o102, 0o777);

    try {
      await fileio.access(fpath, 1);
      fileio.unlinkSync(fpath);
      done();
    } catch (err) {
      console.info('fileio_test_access_async_004 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_access_async_005
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0500
   * @tc.desc   Test access() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_access_async_005', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.access(fpath, 2, function (error) {
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (err) {
      console.info('fileio_test_access_async_005 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_access_async_006
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0600
   * @tc.desc   Test access() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_access_async_006', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_006');

    try {
      await fileio.access(fpath);
    } catch (err) {
      console.info('fileio_test_access_async_006 has failed for ' + err);
      expect(err.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_access_async_007
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0700
   * @tc.desc   Test access() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_access_async_007', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.access(fpath, undefined, (error) => {
        if (error) {
          console.info('fileio_test_access_async_007 error: ' + err);
          expect(flase).assertTrue();
        }
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (err) {
      console.info('fileio_test_access_async_007 has failed for ' + err);
      expect(flase).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_access_async_008
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0800
   * @tc.desc   Test access() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_access_async_008', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.access(fpath, undefined);
      fileio.unlinkSync(fpath);
      done();
    } catch (err) {
      console.info('fileio_test_access_async_008 has failed for ' + err);
      expect(flase).assertTrue();
    }
  });

 	   /**
 	    * @tc.name   fileio_test_access_sync_error_001
 	    * @tc.number SUB_DF_FILEIO_ACCESSSYNC_ERROR_001
 	    * @tc.desc   Test accessSync() interface with empty string path.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_access_sync_error_001', Level.LEVEL2, async function () {
 	     try {
 	       fileio.accessSync("");
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_access_sync_error_001: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_access_sync_error_002
 	    * @tc.number SUB_DF_FILEIO_ACCESSSYNC_ERROR_002
 	    * @tc.desc   Test accessSync() interface with null path.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_access_sync_error_002', Level.LEVEL2, async function () {
 	     try {
 	       fileio.accessSync(null);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_access_sync_error_002: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid path').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_access_sync_error_003
 	    * @tc.number SUB_DF_FILEIO_ACCESSSYNC_ERROR_003
 	    * @tc.desc   Test accessSync() interface with undefined path.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_access_sync_error_003', Level.LEVEL2, async function () {
 	     try {
 	       fileio.accessSync(undefined);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_access_sync_error_003: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid path').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_access_sync_error_004
 	    * @tc.number SUB_DF_FILEIO_ACCESSSYNC_ERROR_004
 	    * @tc.desc   Test accessSync() interface with null mode.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_access_sync_error_004', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_access_sync_error_004');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.accessSync(fpath, null);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_access_sync_error_004: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid mode').assertTrue();
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_access_sync_error_005
 	    * @tc.number SUB_DF_FILEIO_ACCESSSYNC_ERROR_005
 	    * @tc.desc   Test accessSync() interface with undefined mode.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_access_sync_error_005', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_access_sync_error_005');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.accessSync(fpath, undefined);
 	       fileio.unlinkSync(fpath);
 	     } catch (err) {
 	       console.log('fileio_test_access_sync_error_005: ' + err.message + ', code: ' + err.code);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_access_promise_error_001
 	    * @tc.number SUB_DF_FILEIO_ACCESS_PROMISE_ERROR_001
 	    * @tc.desc   Test access() interface with empty string path. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_access_promise_error_001', Level.LEVEL2, async function () {
 	     try {
 	       await fileio.access("");
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_access_promise_error_001: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_access_promise_error_002
 	    * @tc.number SUB_DF_FILEIO_ACCESS_PROMISE_ERROR_002
 	    * @tc.desc   Test access() interface with null path. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_access_promise_error_002', Level.LEVEL2, async function () {
 	     try {
 	       await fileio.access(null);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_access_promise_error_002: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid path').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_access_promise_error_003
 	    * @tc.number SUB_DF_FILEIO_ACCESS_PROMISE_ERROR_003
 	    * @tc.desc   Test access() interface with undefined path. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_access_promise_error_003', Level.LEVEL2, async function () {
 	     try {
 	       await fileio.access(undefined);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_access_promise_error_003: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid path').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_access_promise_error_004
 	    * @tc.number SUB_DF_FILEIO_ACCESS_PROMISE_ERROR_004
 	    * @tc.desc   Test access() interface with null mode. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_access_promise_error_004', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_access_promise_error_004');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       await fileio.access(fpath, null);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_access_promise_error_004: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid mode').assertTrue();
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_access_promise_error_005
 	    * @tc.number SUB_DF_FILEIO_ACCESS_PROMISE_ERROR_005
 	    * @tc.desc   Test access() interface with undefined mode. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_access_promise_error_005', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_access_promise_error_005');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       await fileio.access(fpath, undefined);
 	       fileio.unlinkSync(fpath);
 	     } catch (err) {
 	       console.log('fileio_test_access_promise_error_005: ' + err.message + ', code: ' + err.code);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_access_callback_error_001
 	    * @tc.number SUB_DF_FILEIO_ACCESS_CALLBACK_ERROR_001
 	    * @tc.desc   Test access() interface with empty string path. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_access_callback_error_001', Level.LEVEL2, async function (done) {
 	     fileio.access("", function (err) {
 	       if (err) {
 	         console.log('fileio_test_access_callback_error_001: ' + err.message + ', code: ' + err.code);
 	         expect(err.message == 'No such file or directory').assertTrue();
 	         done();
 	       } else {
 	         expect(false).assertTrue();
 	         done();
 	       }
 	     });
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_access_callback_error_002
 	    * @tc.number SUB_DF_FILEIO_ACCESS_CALLBACK_ERROR_002
 	    * @tc.desc   Test access() interface with null path. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_access_callback_error_002', Level.LEVEL2, async function (done) {
      try {
 	     fileio.access(null, function (err) {
 	       if (err) {
           console.log('fileio_test_access_callback_error_002: ' + err.message + ', code: ' + err.code);
 	         done();
 	       } else {
 	         expect(false).assertTrue();
 	         done();
 	       }
 	     });
        done();
      } catch (err) {
 	       console.log('fileio_test_access_callback_error_002 err: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid path').assertTrue();
 	       done();
 	    }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_access_callback_error_003
 	    * @tc.number SUB_DF_FILEIO_ACCESS_CALLBACK_ERROR_003
 	    * @tc.desc   Test access() interface with undefined path. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_access_callback_error_003', Level.LEVEL2, async function (done) {
      try {
 	     fileio.access(undefined, function (err) {
 	       if (err) {
 	         console.log('fileio_test_access_callback_error_003: ' + err.message + ', code: ' + err.code);
 	         done();
 	       } else {
           expect(false).assertTrue();
 	         done();
 	       }
 	     });
      } catch (err) {
 	       console.log('fileio_test_access_callback_error_003 err: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid path').assertTrue();
 	       done();
 	    }
 	   });

    /**
      * @tc.name   fileio_test_access_callback_error_004
      * @tc.number SUB_DF_FILEIO_ACCESS_CALLBACK_ERROR_004
      * @tc.desc   Test access() interface with empty string path. Callback.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
      it('fileio_test_access_callback_error_004', Level.LEVEL2, async function (done) {
        fileio.access("", 0, function (err) {
          if (err) {
            console.log('fileio_test_access_callback_error_004: ' + err.message + ', code: ' + err.code);
            expect(err.message == 'No such file or directory').assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      });
    
      /**
      * @tc.name   fileio_test_access_callback_error_005
      * @tc.number SUB_DF_FILEIO_ACCESS_CALLBACK_ERROR_005
      * @tc.desc   Test access() interface with null path. Callback.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
      it('fileio_test_access_callback_error_005', Level.LEVEL2, async function (done) {
      try {
        fileio.access(null, 0, function (err) {
          if (err) {
            console.log('fileio_test_access_callback_error_005: ' + err.message + ', code: ' + err.code);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
        done();
      } catch (err) {
          console.log('fileio_test_access_callback_error_005 err: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid path').assertTrue();
          done();
      }
      });
    
      /**
      * @tc.name   fileio_test_access_callback_error_006
      * @tc.number SUB_DF_FILEIO_ACCESS_CALLBACK_ERROR_006
      * @tc.desc   Test access() interface with undefined path. Callback.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
      it('fileio_test_access_callback_error_006', Level.LEVEL2, async function (done) {
      try {
        fileio.access(undefined, 0, function (err) {
          if (err) {
            console.log('fileio_test_access_callback_error_006: ' + err.message + ', code: ' + err.code);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
          console.log('fileio_test_access_callback_error_006 err: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid path').assertTrue();
          done();
      }
      });
      
      /**
      * @tc.name   fileio_test_access_callback_error_007
      * @tc.number SUB_DF_FILEIO_ACCESS_CALLBACK_ERROR_007
      * @tc.desc   Test access() interface with null mode. Callback.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
      it('fileio_test_access_callback_error_007', Level.LEVEL2, async function (done) {
        let fpath = await nextFileName('fileio_test_access_callback_error_007');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        
        try {
          fileio.access(fpath, null, function (err) {
            if (err) {
              console.log('fileio_test_access_callback_error_007: ' + err.message + ', code: ' + err.code);
              expect(err.message == 'Invalid mode').assertTrue();
              fileio.unlinkSync(fpath);
              done();
            } else {
              expect(false).assertTrue();
              fileio.unlinkSync(fpath);
              done();
            }
          });
        } catch (err) {
          console.log('fileio_test_access_callback_error_007 err: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid mode').assertTrue();
          fileio.unlinkSync(fpath);
          done();
        }
      });

      /**
      * @tc.name   fileio_test_access_callback_error_008
      * @tc.number SUB_DF_FILEIO_ACCESS_CALLBACK_ERROR_008
      * @tc.desc   Test access() interface with undefined mode. Callback.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
      it('fileio_test_access_callback_error_008', Level.LEVEL2, async function (done) {
        let fpath = await nextFileName('fileio_test_access_callback_error_008');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        
        try {
          fileio.access(fpath, undefined, function (err) {
            if (err) {
              console.log('fileio_test_access_callback_error_008: ' + err.message + ', code: ' + err.code);
              expect(false).assertTrue();
              fileio.unlinkSync(fpath);
              done();
            } else {
              fileio.unlinkSync(fpath);
              done();
            }
          });
        } catch (err) {
          console.log('fileio_test_access_callback_error_008 err: ' + err.message + ', code: ' + err.code);
          expect(false).assertTrue();
          fileio.unlinkSync(fpath);
          done();
        }
      });
});
}
