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
 * limitations under the License.e
 */

import {
  fileio, FILE_CONTENT, prepareFile, nextFileName, isIntNum,
  describe, it, expect,
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioFtruncate() {
describe('fileio_ftruncate', function () {

  /**
   * @tc.name   fileio_test_ftruncate_async_000
   * @tc.number SUB_DF_FILEIO_FTRUNCATE_ASYNC_0000
   * @tc.desc   Test ftruncateAsync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_ftruncate_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_ftruncate_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let fd = fileio.openSync(fpath, 0o2);
    expect(isIntNum(fd)).assertTrue();
    let truncateLen = 5;
    try {
      fileio.ftruncate(fd, truncateLen, function (err) {
        let len = fileio.readSync(fd, new ArrayBuffer(4096));
        expect(len == truncateLen).assertTrue();
        expect(fileio.closeSync(fd) == null).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
        done();
      })
    } catch (e) {
      console.log('fileio_test_ftruncate_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_ftruncate_async_001
   * @tc.number SUB_DF_FILEIO_FTRUNCATE_ASYNC_0100
   * @tc.desc   Test ftruncateAsync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_ftruncate_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_ftruncate_async_001');
    expect(prepareFile(fpath, 'truncate')).assertTrue();
    let fd = fileio.openSync(fpath, 0o2);
    expect(isIntNum(fd)).assertTrue();
    let truncateLen = 2;
    try {
      fileio.ftruncate(fd, truncateLen)
        .then(function (err) {
          expect(err == null).assertTrue();
          let len = fileio.readSync(fd, new ArrayBuffer(4096));
          expect(len == truncateLen).assertTrue();
          expect(fileio.closeSync(fd) == null).assertTrue();
          expect(fileio.unlinkSync(fpath) == null).assertTrue();
          done();
        })
        .catch(function (e) {
          console.log('catch ' + e);
        })
    } catch (e) {
      console.log('fileio_test_ftruncate_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_ftruncate_async_002
   * @tc.number SUB_DF_FILEIO_FTRUNCATE_ASYNC_0200
   * @tc.desc   Test ftruncateAsync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_ftruncate_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_ftruncate_async_002');
    let truncateLen = 2;
    try {
      fileio.ftruncate(fpath, truncateLen, function (err) {
        done();
      })
    } catch (e) {
      console.log('fileio_test_ftruncate_async_002 has failed for ' + e);
      expect(!!e).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_ftruncate_async_003
   * @tc.number SUB_DF_FILEIO_FTRUNCATE_ASYNC_0300
   * @tc.desc   Test ftruncate() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_ftruncate_async_003', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_ftruncate_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      await fileio.ftruncate(fd, undefined);
      let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(readLen == 0).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_ftruncate_async_003 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_ftruncate_async_004
   * @tc.number SUB_DF_FILEIO_FTRUNCATE_ASYNC_0400
   * @tc.desc   Test ftruncate() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_ftruncate_async_004', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_ftruncate_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      fileio.ftruncate(fd, undefined, (err) => {
        if (err) {
          console.log('fileio_test_ftruncate_async_004 error: ' + e);
          expect(false).assertTrue();
        }
        let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
        expect(readLen == 0).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
        done();
      });
      
    } catch (e) {
      console.log('fileio_test_ftruncate_async_004 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_ftruncate_async_004Adapt001
   * @tc.number SUB_DF_FILEIO_FTRUNCATE_ASYNC_0400
   * @tc.desc   Test ftruncate() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_ftruncate_async_004Adapt001', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_ftruncate_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      await fileio.ftruncate(fd);
      let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(readLen == 0).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_ftruncate_async_004 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

   /**
    * @tc.name   fileio_test_ftruncate_sync_000
    * @tc.number SUB_DF_FILEIO_FTRUNCATE_SYNC_0000
    * @tc.desc   Test ftruncateSync() interfaces.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_ftruncate_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_ftruncate_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let fd = fileio.openSync(fpath, 0o2);
    expect(isIntNum(fd)).assertTrue();
    let truncateLen = 5;
    try {
      fileio.ftruncateSync(fd, truncateLen);
      let len = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(len == truncateLen).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_ftruncate_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_ftruncate_sync_001
   * @tc.number SUB_DF_FILEIO_FTRUNCATE_SYNC_0100
   * @tc.desc   Test ftruncateSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_ftruncate_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_ftruncate_sync_001');
    expect(prepareFile(fpath, 'truncate')).assertTrue();
    let fd = fileio.openSync(fpath, 0o2);
    expect(isIntNum(fd)).assertTrue();
    let truncateLen = 2;
    try {
      fileio.ftruncateSync(fd, truncateLen);
      let len = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(len == truncateLen).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_ftruncate_sync_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_ftruncate_sync_002
   * @tc.number SUB_DF_FILEIO_FTRUNCATE_SYNC_0200
   * @tc.desc   Test ftruncateSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_ftruncate_sync_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_ftruncate_sync_002');
    let truncateLen = 2;
    try {
      fileio.ftruncateSync(fpath, truncateLen);
    } catch (e) {
      console.log('fileio_test_ftruncate_sync_002 has failed for ' + e);
      expect(!!e).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_ftruncate_sync_003
   * @tc.number SUB_DF_FILEIO_FTRUNCATE_SYNC_0300
   * @tc.desc   Test ftruncateSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_ftruncate_sync_003', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_ftruncate_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      fileio.ftruncateSync(fd, undefined);
      let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(readLen == 0).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_ftruncate_sync_003 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
 	    * @tc.name   fileio_test_ftruncate_sync_error_001
 	    * @tc.number SUB_DF_FILEIO_FTRUNCATE_SYNC_ERROR_001
 	    * @tc.desc   Test ftruncateSync() interface with null fd.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_ftruncate_sync_error_001', Level.LEVEL2, async function () {
 	     try {
 	       fileio.ftruncateSync(null, 5);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_ftruncate_sync_error_001: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid fd').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_ftruncate_sync_error_002
 	    * @tc.number SUB_DF_FILEIO_FTRUNCATE_SYNC_ERROR_002
 	    * @tc.desc   Test ftruncateSync() interface with undefined fd.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_ftruncate_sync_error_002', Level.LEVEL2, async function () {
 	     try {
 	       fileio.ftruncateSync(undefined, 5);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_ftruncate_sync_error_002: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid fd').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_ftruncate_sync_error_003
 	    * @tc.number SUB_DF_FILEIO_FTRUNCATE_SYNC_ERROR_003
 	    * @tc.desc   Test ftruncateSync() interface with null len.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_ftruncate_sync_error_003', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_ftruncate_sync_error_003');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     let fd = fileio.openSync(fpath, 0o2);
 	     
 	     try {
 	       fileio.ftruncateSync(fd, null);
 	       fileio.closeSync(fd);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_ftruncate_sync_error_003: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid len').assertTrue();
 	       fileio.closeSync(fd);
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_ftruncate_sync_error_004
 	    * @tc.number SUB_DF_FILEIO_FTRUNCATE_SYNC_ERROR_004
 	    * @tc.desc   Test ftruncateSync() interface with undefined len.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_ftruncate_sync_error_004', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_ftruncate_sync_error_004');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     let fd = fileio.openSync(fpath, 0o2);
 	     
 	     try {
 	       fileio.ftruncateSync(fd, undefined);
         let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
         console.log('fileio_test_ftruncate_sync_error_004: ' + readLen);
         expect(readLen == 0).assertTrue();
 	       fileio.closeSync(fd);
 	       fileio.unlinkSync(fpath);
 	     } catch (err) {
 	       console.log('fileio_test_ftruncate_sync_error_004: ' + err.message + ', code: ' + err.code);
 	       fileio.closeSync(fd);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_ftruncate_promise_error_001
 	    * @tc.number SUB_DF_FILEIO_FTRUNCATE_PROMISE_ERROR_001
 	    * @tc.desc   Test ftruncate() interface with null fd. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_ftruncate_promise_error_001', Level.LEVEL2, async function () {
 	     try {
 	       await fileio.ftruncate(null, 5);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_ftruncate_promise_error_001: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid fd').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_ftruncate_promise_error_002
 	    * @tc.number SUB_DF_FILEIO_FTRUNCATE_PROMISE_ERROR_002
 	    * @tc.desc   Test ftruncate() interface with undefined fd. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_ftruncate_promise_error_002', Level.LEVEL2, async function () {
 	     try {
 	       await fileio.ftruncate(undefined, 5);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_ftruncate_promise_error_002: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid fd').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_ftruncate_promise_error_003
 	    * @tc.number SUB_DF_FILEIO_FTRUNCATE_PROMISE_ERROR_003
 	    * @tc.desc   Test ftruncate() interface with null len. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_ftruncate_promise_error_003', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_ftruncate_promise_error_003');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     let fd = fileio.openSync(fpath, 0o2);
 	     
 	     try {
 	       await fileio.ftruncate(fd, null);
 	       fileio.closeSync(fd);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_test_ftruncate_promise_error_003: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid len').assertTrue();
 	       fileio.closeSync(fd);
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_ftruncate_promise_error_004
 	    * @tc.number SUB_DF_FILEIO_FTRUNCATE_PROMISE_ERROR_004
 	    * @tc.desc   Test ftruncate() interface with undefined len. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_ftruncate_promise_error_004', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_test_ftruncate_promise_error_004');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     let fd = fileio.openSync(fpath, 0o2);
 	     
 	     try {
 	       await fileio.ftruncate(fd, undefined);
         let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
         console.log('fileio_test_ftruncate_promise_error_004: ' + readLen);
         expect(readLen == 0).assertTrue();
 	       fileio.closeSync(fd);
 	       fileio.unlinkSync(fpath);
 	     } catch (err) {
 	       console.log('fileio_test_ftruncate_promise_error_004: ' + err.message + ', code: ' + err.code);
 	       fileio.closeSync(fd);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_ftruncate_callback_error_001
 	    * @tc.number SUB_DF_FILEIO_FTRUNCATE_CALLBACK_ERROR_001
 	    * @tc.desc   Test ftruncate() interface with null fd. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_ftruncate_callback_error_001', Level.LEVEL2, async function (done) {
      try {
 	     fileio.ftruncate(null, 5, function (err) {
 	       if (err) {
 	         console.log('fileio_test_ftruncate_callback_error_001: ' + err.message + ', code: ' + err.code);
 	         expect(err.message == 'Invalid fd').assertTrue();
 	         done();
 	       }
 	     });
       console.log('fileio_test_ftruncate_callback_error_001 res');
       done();
      } catch (err) {
        console.log('fileio_test_ftruncate_callback_error_001 err: ' + err.message + ', code: ' + err.code);
        expect(err.message == 'Invalid fd').assertTrue();
        done();
 	    }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_ftruncate_callback_error_002
 	    * @tc.number SUB_DF_FILEIO_FTRUNCATE_CALLBACK_ERROR_002
 	    * @tc.desc   Test ftruncate() interface with undefined fd. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_ftruncate_callback_error_002', Level.LEVEL2, async function (done) {
      try {
 	     fileio.ftruncate(undefined, 5, function (err) {
 	       if (err) {
 	         console.log('fileio_test_ftruncate_callback_error_002: ' + err.message + ', code: ' + err.code);
 	         expect(err.message == 'Invalid fd').assertTrue();
 	         done();
 	       }
 	     });
       console.log('fileio_test_ftruncate_callback_error_002 res');
       done();
      } catch (err) {
        console.log('fileio_test_ftruncate_callback_error_002 err: ' + err.message + ', code: ' + err.code);
        expect(err.message == 'Invalid fd').assertTrue();
        done();
 	    }
 	   });

    /**
 	    * @tc.name   fileio_test_ftruncate_callback_error_003
 	    * @tc.number SUB_DF_FILEIO_FTRUNCATE_CALLBACK_ERROR_003
 	    * @tc.desc   Test ftruncate() interface with null fd. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_ftruncate_callback_error_003', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileio_test_ftruncate_callback_error_003');
 	    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	    let fd = fileio.openSync(fpath, 0o2);
      try {
 	     fileio.ftruncate(fd, null, function (err) {
 	       if (err) {
 	         console.log('fileio_test_ftruncate_callback_error_003: ' + err.message + ', code: ' + err.code);
 	         expect(err.message == 'Invalid len').assertTrue();
 	         done();
 	       }
 	     });
       console.log('fileio_test_ftruncate_callback_error_003 res');
       done();
      } catch (err) {
        console.log('fileio_test_ftruncate_callback_error_003 err: ' + err.message + ', code: ' + err.code);
        fileio.closeSync(fd);
 	      fileio.unlinkSync(fpath);
        expect(err.message == 'Invalid len').assertTrue();
        done();
 	    }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_test_ftruncate_callback_error_004
 	    * @tc.number SUB_DF_FILEIO_FTRUNCATE_CALLBACK_ERROR_004
 	    * @tc.desc   Test ftruncate() interface with undefined fd. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_test_ftruncate_callback_error_004', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileio_test_ftruncate_callback_error_004');
 	    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	    let fd = fileio.openSync(fpath, 0o2);
      try {
 	     fileio.ftruncate(fd, undefined, function (err) {
 	       if (err) {
 	         console.log('fileio_test_ftruncate_callback_error_004: ' + err.message + ', code: ' + err.code);
 	         expect(err.message == 'Invalid len').assertTrue();
 	         done();
 	       }
 	     });
       console.log('fileio_test_ftruncate_callback_error_004 res');
       done();
      } catch (err) {
        console.log('fileio_test_ftruncate_callback_error_004 err: ' + err.message + ', code: ' + err.code);
        expect(err.message == 'Invalid len').assertTrue();
        fileio.closeSync(fd);
 	      fileio.unlinkSync(fpath);
        done();
 	    }
 	   });
});
}
