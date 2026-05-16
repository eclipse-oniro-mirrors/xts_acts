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

export default function fileioCopyfile() {
describe('fileio_copyfile', function () {

  /**
   * @tc.name   fileio_copy_file_sync_000
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0000
   * @tc.desc   Test copyFileSync() interfaces. Test file copied successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_copy_file_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_copy_file_sync_000');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.copyFileSync(fpath, fpathTarget);
      fileio.accessSync(fpathTarget);
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(fpathTarget);
    } catch (e) {
      console.info('fileio_copy_file_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_copy_file_sync_001
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0100
   * @tc.desc   Test copyFileSync() interfaces. Test file copied successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_copy_file_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_copy_file_sync_001');
    let fpathTarget = fpath + 'tgt';
    let fd = fileio.openSync(fpath, 0o102, 0o666);

    try {
      fileio.copyFileSync(fd, fpathTarget);
      fileio.accessSync(fpathTarget);
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(fpathTarget);
    } catch (e) {
      console.info('fileio_copy_file_sync_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_copy_file_sync_002
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0200
   * @tc.desc   Test copyFileSync() interfaces, invalid path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_copy_file_sync_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_copy_file_sync_002');
    let fpathTarget = fpath + 'tgt';

    try {
      fileio.copyFileSync(fpath, fpathTarget);
    } catch (e) {
      console.info('fileio_copy_file_sync_002 has failed for ' + e);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_copy_file_sync_003
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0300
   * @tc.desc   Test copyFileSync() interfaces, No parameters.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_copy_file_sync_003', Level.LEVEL0, function () {
    try {
      fileio.copyFileSync();
    } catch (e) {
      console.info('fileio_copy_file_sync_003 has failed for ' + e);
      expect(e.message == 'Number of arguments unmatched').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_copy_file_sync_004
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0400
   * @tc.desc   Test copyFileSync() interfaces, No parameters.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_copy_file_sync_004', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_copy_file_sync_004');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.copyFileSync(fpath, fpathTarget, undefined);
      let stat1 = fileio.statSync(fpath);
      let stat2 = fileio.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(fpathTarget);
    } catch (e) {
      console.log('fileio_copy_file_sync_004 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_copy_file_async_000
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0000
   * @tc.desc   Test copyFile() interfaces, return in promise mode. Test file copied successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_copy_file_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_000');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.copyFile(fpath, fpathTarget);
      fileio.accessSync(fpathTarget);
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.info('fileio_copy_file_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_copy_file_async_001
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0100
   * @tc.desc   Test copyFile() interfaces, return in callback mode. Test file copied successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_copy_file_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_001');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.copyFile(fpath, fpathTarget, function (error) {
        fileio.accessSync(fpathTarget);
        fileio.unlinkSync(fpath);
        fileio.unlinkSync(fpathTarget);
        done();
      });
    } catch (e) {
      console.info('fileio_copy_file_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_copy_file_async_002
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0200
   * @tc.desc   Test copyFile() interfaces, return in promise mode. Test file copied successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_copy_file_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_002');
    let fpathTarget = fpath + 'tgt';
    let fd = fileio.openSync(fpath, 0o102, 0o666);

    try {
      await fileio.copyFile(fd, fpathTarget);
      fileio.accessSync(fpathTarget);
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.info('fileio_copy_file_async_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_copy_file_async_003
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0300
   * @tc.desc   Test copyFile() interfaces, Invalid path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_copy_file_async_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_003');
    let fpathTarget = fpath + 'tgt';
    try {
      await fileio.copyFile(fpath, fpathTarget);
    } catch (e) {
      console.info('fileio_copy_file_async_003 has failed for ' + e);
      expect(e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_copy_file_async_004
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0400
   * @tc.desc   Test copyFile() interfaces. Invalid argument fd < 0.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_copy_file_async_004', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_004');
    try {
      await fileio.copyFile(-1, fpath);
    } catch (e) {
      console.info('fileio_copy_file_async_004 has failed for ' + e);
      expect(e.message == 'The first/second argument requires filepath/fd').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_copy_file_async_005
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0500
   * @tc.desc   Test copyFile() interfaces, Invalid mode.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_copy_file_async_005', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_005');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.copyFile(fpath, fpathTarget, '1', function (error) {
      });
    } catch (e) {
      console.info('fileio_copy_file_async_005 has failed for ' + e);
      expect(e.message == 'Invalid mode' || e.message == 'Invalid arg').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_copy_file_async_006
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0600
   * @tc.desc   Test copyFile() interfaces, No parameters.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_copy_file_async_006', Level.LEVEL0, async function (done) {
    try {
      await fileio.copyFile();
    } catch (e) {
      console.info('fileio_copy_file_async_006 has failed for ' + e);
      expect(e.message == 'Number of arguments unmatched').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_copy_file_async_007
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0700
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_copy_file_async_007', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_007');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.copyFile(fpath, fpathTarget, undefined);
      let stat1 = fileio.statSync(fpath);
      let stat2 = fileio.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.log('fileio_copy_file_async_007 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_copy_file_async_008
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0800
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_copy_file_async_008', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_008');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.copyFile(fpath, fpathTarget, undefined, (err) => {
        if (err) {
          console.log('fileio_copy_file_async_008 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat1 = fileio.statSync(fpath);
        let stat2 = fileio.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fileio.unlinkSync(fpath);
        fileio.unlinkSync(fpathTarget);
        done();
      });
    } catch (e) {
      console.log('fileio_copy_file_async_008 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

   /**
 	    * @tc.name   fileio_copy_file_sync_error_001
 	    * @tc.number SUB_DF_FILEIO_COPYFILESYNC_ERROR_001
 	    * @tc.desc   Test copyFileSync() interface with null src.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_copy_file_sync_error_001', Level.LEVEL2, async function () {
 	     let fpathTarget = await nextFileName('fileio_copy_file_sync_error_001_target');
 	     try {
 	       fileio.copyFileSync(null, fpathTarget);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_copy_file_sync_error_001: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_copy_file_sync_error_002
 	    * @tc.number SUB_DF_FILEIO_COPYFILESYNC_ERROR_002
 	    * @tc.desc   Test copyFileSync() interface with undefined src.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_copy_file_sync_error_002', Level.LEVEL2, async function () {
 	     let fpathTarget = await nextFileName('fileio_copy_file_sync_error_002_target');
 	     try {
 	       fileio.copyFileSync(undefined, fpathTarget);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_copy_file_sync_error_002: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_copy_file_sync_error_003
 	    * @tc.number SUB_DF_FILEIO_COPYFILESYNC_ERROR_003
 	    * @tc.desc   Test copyFileSync() interface with null dest.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_copy_file_sync_error_003', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_copy_file_sync_error_003');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.copyFileSync(fpath, null);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_copy_file_sync_error_003: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_copy_file_sync_error_004
 	    * @tc.number SUB_DF_FILEIO_COPYFILESYNC_ERROR_004
 	    * @tc.desc   Test copyFileSync() interface with undefined dest.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_copy_file_sync_error_004', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_copy_file_sync_error_004');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.copyFileSync(fpath, undefined);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_copy_file_sync_error_004: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_copy_file_sync_error_005
 	    * @tc.number SUB_DF_FILEIO_COPYFILESYNC_ERROR_005
 	    * @tc.desc   Test copyFileSync() interface with null mode.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_copy_file_sync_error_005', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_copy_file_sync_error_005');
 	     let fpathTarget = await nextFileName('fileio_copy_file_sync_error_005_target');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.copyFileSync(fpath, fpathTarget, null);
 	       fileio.unlinkSync(fpath);
 	       fileio.unlinkSync(fpathTarget);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_copy_file_sync_error_005: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'Invalid mode' || err.message == 'Invalid arg').assertTrue();
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_copy_file_sync_error_006
 	    * @tc.number SUB_DF_FILEIO_COPYFILESYNC_ERROR_006
 	    * @tc.desc   Test copyFileSync() interface with undefined mode.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_copy_file_sync_error_006', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_copy_file_sync_error_006');
 	     let fpathTarget = await nextFileName('fileio_copy_file_sync_error_006_target');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.copyFileSync(fpath, fpathTarget, undefined);
 	       fileio.accessSync(fpathTarget);
         let stat1 = fileio.statSync(fpath);
         let stat2 = fileio.statSync(fpathTarget);
         expect(stat1.size == stat2.size).assertTrue();
 	       fileio.unlinkSync(fpath);
 	       fileio.unlinkSync(fpathTarget);
 	     } catch (err) {
 	       console.log('fileio_copy_file_sync_error_006: ' + err.message + ', code: ' + err.code);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_copy_file_sync_error_007
 	    * @tc.number SUB_DF_FILEIO_COPYFILESYNC_ERROR_007
 	    * @tc.desc   Test copyFileSync() interface with empty string src.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_copy_file_sync_error_007', Level.LEVEL2, async function () {
 	     let fpathTarget = await nextFileName('fileio_copy_file_sync_error_007_target');
 	     try {
 	       fileio.copyFileSync("", fpathTarget);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_copy_file_sync_error_007: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_copy_file_sync_error_008
 	    * @tc.number SUB_DF_FILEIO_COPYFILESYNC_ERROR_008
 	    * @tc.desc   Test copyFileSync() interface with empty string dest.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_copy_file_sync_error_008', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_copy_file_sync_error_008');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       fileio.copyFileSync(fpath, "");
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_copy_file_sync_error_008: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'No such file or directory').assertTrue();
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_copy_file_sync_error_009
 	    * @tc.number SUB_DF_FILEIO_COPYFILESYNC_ERROR_009
 	    * @tc.desc   Test copyFileSync() interface with string src and number dest.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_copy_file_sync_error_009', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_copy_file_sync_error_009');
 	     let fpathTarget = await nextFileName('fileio_copy_file_sync_error_009_target');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     let fdTarget = fileio.openSync(fpathTarget, 0o201 | 0o102, 0o666);
 	     try {
 	       fileio.copyFileSync(fpath, fdTarget);
 	     } catch (err) {
 	       console.log('fileio_copy_file_sync_error_009: ' + err.message + ', code: ' + err.code);
 	       fileio.closeSync(fdTarget);
 	       fileio.unlinkSync(fpath);
 	       fileio.unlinkSync(fpathTarget);
 	       expect(err.message == 'Bad file descriptor').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_copy_file_promise_error_001
 	    * @tc.number SUB_DF_FILEIO_COPYFILE_PROMISE_ERROR_001
 	    * @tc.desc   Test copyFile() interface with null src. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_copy_file_promise_error_001', Level.LEVEL2, async function () {
 	     let fpathTarget = await nextFileName('fileio_copy_file_promise_error_001_target');
 	     try {
 	       await fileio.copyFile(null, fpathTarget);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_copy_file_promise_error_001: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_copy_file_promise_error_002
 	    * @tc.number SUB_DF_FILEIO_COPYFILE_PROMISE_ERROR_002
 	    * @tc.desc   Test copyFile() interface with undefined src. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_copy_file_promise_error_002', Level.LEVEL2, async function () {
 	     let fpathTarget = await nextFileName('fileio_copy_file_promise_error_002_target');
 	     try {
 	       await fileio.copyFile(undefined, fpathTarget);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_copy_file_promise_error_002: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_copy_file_promise_error_003
 	    * @tc.number SUB_DF_FILEIO_COPYFILE_PROMISE_ERROR_003
 	    * @tc.desc   Test copyFile() interface with null dest. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_copy_file_promise_error_003', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_copy_file_promise_error_003');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       await fileio.copyFile(fpath, null);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_copy_file_promise_error_003: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_copy_file_promise_error_004
 	    * @tc.number SUB_DF_FILEIO_COPYFILE_PROMISE_ERROR_004
 	    * @tc.desc   Test copyFile() interface with undefined dest. Promise.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_copy_file_promise_error_004', Level.LEVEL2, async function () {
 	     let fpath = await nextFileName('fileio_copy_file_promise_error_004');
 	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 	     
 	     try {
 	       await fileio.copyFile(fpath, undefined);
 	       fileio.unlinkSync(fpath);
 	       expect(false).assertTrue();
 	     } catch (err) {
 	       console.log('fileio_copy_file_promise_error_004: ' + err.message + ', code: ' + err.code);
 	       expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
 	       fileio.unlinkSync(fpath);
 	     }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_copy_file_callback_error_001
 	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_ERROR_001
 	    * @tc.desc   Test copyFile() interface with null src. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
 	   it('fileio_copy_file_callback_error_001', Level.LEVEL2, async function (done) {
      try {
 	     let fpathTarget = await nextFileName('fileio_copy_file_callback_error_001_target');
 	     fileio.copyFile(null, fpathTarget, function (err) {
 	       if (err) {
 	         console.log('fileio_copy_file_callback_error_001: ' + err.message + ', code: ' + err.code);
 	         expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
 	         done();
 	       }
        });
        console.log('fileio_copy_file_callback_error_001 res');
        done();
      } catch (err) {
        console.log('fileio_copy_file_callback_error_001 err: ' + err.message + ', code: ' + err.code);
        expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
        done();
 	    }
 	   });
 	 
 	   /**
 	    * @tc.name   fileio_copy_file_callback_error_002
 	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_ERROR_002
 	    * @tc.desc   Test copyFile() interface with undefined src. Callback.
 	    * @tc.type   FUNCTION
 	    * @tc.size   MEDIUMTEST
 	    * @tc.level  LEVEL2
 	    */
  	   it('fileio_copy_file_callback_error_002', Level.LEVEL2, async function (done) {
       try {
  	     let fpathTarget = await nextFileName('fileio_copy_file_callback_error_002_target');
  	     fileio.copyFile(undefined, fpathTarget, function (err) {
  	       if (err) {
  	         console.log('fileio_copy_file_callback_error_002: ' + err.message + ', code: ' + err.code);
  	         expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
  	         done();
  	       }
  	     });
        console.log('fileio_copy_file_callback_error_002 res');
        done();
       } catch (err) {
         console.log('fileio_copy_file_callback_error_002 err: ' + err.message + ', code: ' + err.code);
         expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
         done();
  	    }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_error_003
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_ERROR_003
  	    * @tc.desc   Test copyFile() interface with null dest. Callback.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_error_003', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_error_003');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     try {
  	       fileio.copyFile(fpath, null, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_error_003: ' + err.message + ', code: ' + err.code);
  	           expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
  	           fileio.unlinkSync(fpath);
  	           done();
  	         }
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_error_003 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
  	       fileio.unlinkSync(fpath);
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_error_004
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_ERROR_004
  	    * @tc.desc   Test copyFile() interface with undefined dest. Callback.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_error_004', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_error_004');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     try {
  	       fileio.copyFile(fpath, undefined, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_error_004: ' + err.message + ', code: ' + err.code);
  	           expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
  	           fileio.unlinkSync(fpath);
  	           done();
  	         }
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_error_004 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
  	       fileio.unlinkSync(fpath);
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_error_005
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_ERROR_005
  	    * @tc.desc   Test copyFile() interface with null mode. Callback.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_error_005', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_error_005');
  	     let fpathTarget = await nextFileName('fileio_copy_file_callback_error_005_target');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     
  	     try {
  	       fileio.copyFile(fpath, fpathTarget, null, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_error_005: ' + err.message + ', code: ' + err.code);
  	           expect(err.message == 'Invalid mode' || err.message == 'Invalid arg').assertTrue();
  	           fileio.unlinkSync(fpath);
  	           done();
  	         }
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_error_005 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'Invalid mode' || err.essage == 'Invalid arg').assertTrue();
  	       fileio.unlinkSync(fpath);
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_error_006
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_ERROR_006
  	    * @tc.desc   Test copyFile() interface with undefined mode. Callback.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_error_006', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_error_006');
  	     let fpathTarget = await nextFileName('fileio_copy_file_callback_error_006_target');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     
  	     try {
  	       fileio.copyFile(fpath, fpathTarget, undefined, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_error_006: ' + err.message + ', code: ' + err.code);
  	           expect(false).assertTrue();
  	           fileio.unlinkSync(fpath);
  	           fileio.unlinkSync(fpathTarget);
  	           done();
  	         }
  	         let stat1 = fileio.statSync(fpath);
  	         let stat2 = fileio.statSync(fpathTarget);
  	         expect(stat1.size == stat2.size).assertTrue();
  	         fileio.unlinkSync(fpath);
  	         fileio.unlinkSync(fpathTarget);
  	         done();
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_error_006 err: ' + err.message + ', code: ' + err.code);
  	       expect(false).assertTrue();
  	       fileio.unlinkSync(fpath);
  	       done();
  	     }
  	   });

	   /**
  	    * @tc.name   fileio_copy_file_promise_error_005
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_PROMISE_ERROR_005
  	    * @tc.desc   Test copyFile() interface with null mode. Promise.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_promise_error_005', Level.LEVEL2, async function () {
  	     let fpath = await nextFileName('fileio_copy_file_promise_error_005');
  	     let fpathTarget = await nextFileName('fileio_copy_file_promise_error_005_target');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     
  	     try {
  	       await fileio.copyFile(fpath, fpathTarget, null);
  	       fileio.unlinkSync(fpath);
  	       fileio.unlinkSync(fpathTarget);
  	       expect(false).assertTrue();
  	     } catch (err) {
  	       console.log('fileio_copy_file_promise_error_005: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'Invalid mode' || err.message == 'Invalid arg').assertTrue();
  	       fileio.unlinkSync(fpath);
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_promise_error_006
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_PROMISE_ERROR_006
  	    * @tc.desc   Test copyFile() interface with empty string src. Promise.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_promise_error_006', Level.LEVEL2, async function () {
  	     let fpathTarget = await nextFileName('fileio_copy_file_promise_error_006_target');
  	     try {
  	       await fileio.copyFile("", fpathTarget);
  	       expect(false).assertTrue();
  	     } catch (err) {
  	       console.log('fileio_copy_file_promise_error_006: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'No such file or directory').assertTrue();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_promise_error_007
  	    * @tc.number SUB_DF_FILEIOCopyFILE_PROMISE_ERROR_007
  	    * @tc.desc   Test copyFile() interface with empty string dest. Promise.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_promise_error_007', Level.LEVEL2, async function () {
  	     let fpath = await nextFileName('fileio_copy_file_promise_error_007');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     
  	     try {
  	       await fileio.copyFile(fpath, "");
  	       fileio.unlinkSync(fpath);
  	       expect(false).assertTrue();
  	     } catch (err) {
  	       console.log('fileio_copy_file_promise_error_007: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'No such file or directory').assertTrue();
  	       fileio.unlinkSync(fpath);
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_error_007
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_ERROR_007
  	    * @tc.desc   Test copyFile() interface with empty string src. Callback.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_error_007', Level.LEVEL2, async function (done) {
  	     let fpathTarget = await nextFileName('fileio_copy_file_callback_error_007_target');
  	     try {
  	       fileio.copyFile("", fpathTarget, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_error_007: ' + err.message + ', code: ' + err.code);
  	           expect(err.message == 'No such file or directory').assertTrue();
  	           done();
  	         }
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_error_007 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'No such file or directory').assertTrue();
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_error_008
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_ERROR_008
  	    * @tc.desc   Test copyFile() interface with empty string dest. Callback.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_error_008', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_error_008');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     
  	     try {
  	       fileio.copyFile(fpath, "", function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_error_008: ' + err.message + ', code: ' + err.code);
  	           expect(err.message == 'No such file or directory').assertTrue();
  	           fileio.unlinkSync(fpath);
  	           done();
  	         }
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_error_008 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'No such file or directory').assertTrue();
  	       fileio.unlinkSync(fpath);
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_promise_error_008
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_PROMISE_ERROR_008
  	    * @tc.desc   Test copyFile() interface with number src and string dest. Promise.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_promise_error_008', Level.LEVEL2, async function () {
  	     let fpath = await nextFileName('fileio_copy_file_promise_error_008');
  	     let fpathTarget = await nextFileName('fileio_copy_file_promise_error_008_target');
  	     let fd = fileio.openSync(fpath, 0o102, 0o666);
  	     
  	     try {
  	       await fileio.copyFile(fd, fpathTarget);
  	       fileio.accessSync(fpathTarget);
  	       fileio.closeSync(fd);
  	       fileio.unlinkSync(fpath);
  	       fileio.unlinkSync(fpathTarget);
  	     } catch (err) {
  	       console.log('fileio_copy_file_promise_error_008: ' + err.message + ', code: ' + err.code);
  	       expect(false).assertTrue();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_promise_error_009
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_PROMISE_ERROR_009
  	    * @tc.desc   Test copyFile() interface with string src and number dest. Promise.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_promise_error_009', Level.LEVEL2, async function () {
  	     let fpath = await nextFileName('fileio_copy_file_promise_error_009');
  	     let fpathTarget = await nextFileName('fileio_copy_file_promise_error_009_target');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     let fdTarget = fileio.openSync(fpathTarget, 0o201 | 0o102, 0o666);
  	     
  	     try {
  	       await fileio.copyFile(fpath, fdTarget);
  	       fileio.closeSync(fdTarget);
  	       fileio.unlinkSync(fpath);
  	       fileio.unlinkSync(fpathTarget);
  	       expect(false).assertTrue();
  	     } catch (err) {
  	       console.log('fileio_copy_file_promise_error_009: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'Bad file descriptor').assertTrue();
  	     }
  	   });

	   /**
  	    * @tc.name   fileio_copy_file_promise_error_010
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_PROMISE_ERROR_010
  	    * @tc.desc   Test copyFile() interface with undefined mode. Promise.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_promise_error_010', Level.LEVEL2, async function () {
  	     let fpath = await nextFileName('fileio_copy_file_promise_error_010');
  	     let fpathTarget = await nextFileName('fileio_copy_file_promise_error_010');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     
  	     try {
  	       await fileio.copyFile(fpath, fpathTarget, undefined);
		   let stat1 = fileio.statSync(fpath);
		   let stat2 = fileio.statSync(fpathTarget);
		   expect(stat1.size == stat2.size).assertTrue();
  	       fileio.unlinkSync(fpath);
  	       fileio.unlinkSync(fpathTarget);
  	     } catch (err) {
  	       console.log('fileio_copy_file_promise_error_010: ' + err.message + ', code: ' + err.code);
  	       expect(false).assertTrue();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_error_009
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_ERROR_009
  	    * @tc.desc   Test copyFile() interface with number src and string dest. Callback.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_error_009', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_error_009');
  	     let fpathTarget = await nextFileName('fileio_copy_file_callback_error_009_target');
  	     let fd = fileio.openSync(fpath, 0o102, 0o666);
  	     
  	     try {
  	       fileio.copyFile(fd, fpathTarget, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_error_009: ' + err.message + ', code: ' + err.code);
  	           expect(false).assertTrue();
  	           fileio.closeSync(fd);
  	           fileio.unlinkSync(fpath);
  	           done();
  	         }
  	         fileio.accessSync(fpathTarget);
  	         fileio.closeSync(fd);
  	         fileio.unlinkSync(fpath);
  	         fileio.unlinkSync(fpathTarget);
  	         done();
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_error_009 err: ' + err.message + ', code: ' + err.code);
  	       expect(false).assertTrue();
  	       fileio.closeSync(fd);
  	       fileio.unlinkSync(fpath);
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_error_010
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_ERROR_010
  	    * @tc.desc   Test copyFile() interface with string src and number dest. Callback.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
   	   it('fileio_copy_file_callback_error_010', Level.LEVEL2, async function (done) {
   	     let fpath = await nextFileName('fileio_copy_file_callback_error_010');
   	     let fpathTarget = await nextFileName('fileio_copy_file_callback_error_010_target');
   	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
   	     let fdTarget = fileio.openSync(fpathTarget, 0o201 | 0o102, 0o666);
  	     
  	     try {
  	       fileio.copyFile(fpath, fdTarget, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_error_010: ' + err.message + ', code: ' + err.code);
  	           expect(err.message == 'Bad file descriptor').assertTrue();
  	           fileio.closeSync(fdTarget);
  	           fileio.unlinkSync(fpath);
  	           fileio.unlinkSync(fpathTarget);
  	           done();
  	         } else {
			   expect(false).assertTrue();
  	           done();
			 }
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_error_010 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'Bad file descriptor').assertTrue();
  	       fileio.closeSync(fdTarget);
  	       fileio.unlinkSync(fpath);
  	       fileio.unlinkSync(fpathTarget);
  	       done();
  	     }
   	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_error_011
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_ERROR_011
  	    * @tc.desc   Test copyFile() interface with number src and string dest. Callback.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_error_011', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_error_011');
  	     let fpathTarget = await nextFileName('fileio_copy_file_callback_error_011_target');
  	     let fd = fileio.openSync(fpath, 0o102, 0o666);
  	     
  	     try {
  	       fileio.copyFile(fd, fpathTarget, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_error_011: ' + err.message + ', code: ' + err.code);
  	           expect(false).assertTrue();
  	           fileio.closeSync(fd);
  	           fileio.unlinkSync(fpath);
  	           done();
  	         }
  	         fileio.accessSync(fpathTarget);
  	         fileio.closeSync(fd);
  	         fileio.unlinkSync(fpath);
  	         fileio.unlinkSync(fpathTarget);
  	         done();
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_error_011 err: ' + err.message + ', code: ' + err.code);
  	       expect(false).assertTrue();
  	       fileio.closeSync(fd);
  	       fileio.unlinkSync(fpath);
  	       done();
  	     }
   	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_error_012
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_ERROR_012
  	    * @tc.desc   Test copyFile() interface with empty string src. Callback.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_error_012', Level.LEVEL2, async function (done) {
  	     let fpathTarget = await nextFileName('fileio_copy_file_callback_error_012_target');
  	     try {
  	       fileio.copyFile("", fpathTarget, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_error_012: ' + err.message + ', code: ' + err.code);
  	           expect(err.message == 'No such file or directory').assertTrue();
  	           done();
  	         }
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_error_012 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'No such file or directory').assertTrue();
  	       done();
  	     }
   	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_error_013
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_ERROR_013
  	    * @tc.desc   Test copyFile() interface with empty string dest. Callback.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_error_013', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_error_013');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     
  	     try {
  	       fileio.copyFile(fpath, "", function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_error_013: ' + err.message + ', code: ' + err.code);
   	           expect(err.message == 'No such file or directory').assertTrue();
   	           fileio.unlinkSync(fpath);
   	           done();
   	         }
   	       });
   	     } catch (err) {
  	       console.log('fileio_copy_file_callback_error_013 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'No such file or directory').assertTrue();
  	       fileio.unlinkSync(fpath);
  	       done();
  	     }
     	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_mode_error_001
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_MODE_ERROR_001
  	    * @tc.desc   Test copyFile() interface with null src. Callback with mode.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_mode_error_001', Level.LEVEL2, async function (done) {
  	     let fpathTarget = await nextFileName('fileio_copy_file_callback_mode_error_001_target');
  	     try {
  	       fileio.copyFile(null, fpathTarget, 0, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_mode_error_001: ' + err.message + ', code: ' + err.code);
  	           expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
  	           done();
  	         }
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_mode_error_001 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_mode_error_002
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_MODE_ERROR_002
  	    * @tc.desc   Test copyFile() interface with undefined src. Callback with mode.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_mode_error_002', Level.LEVEL2, async function (done) {
  	     let fpathTarget = await nextFileName('fileio_copy_file_callback_mode_error_002_target');
  	     try {
  	       fileio.copyFile(undefined, fpathTarget, 0, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_mode_error_002: ' + err.message + ', code: ' + err.code);
  	           expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
  	           done();
  	         }
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_mode_error_002 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_mode_error_003
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_MODE_ERROR_003
  	    * @tc.desc   Test copyFile() interface with null dest. Callback with mode.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_mode_error_003', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_mode_error_003');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     try {
  	       fileio.copyFile(fpath, null, 0, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_mode_error_003: ' + err.message + ', code: ' + err.code);
  	           expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
  	           fileio.unlinkSync(fpath);
  	           done();
  	         }
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_mode_error_003 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
  	       fileio.unlinkSync(fpath);
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_mode_error_004
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_MODE_ERROR_004
  	    * @tc.desc   Test copyFile() interface with undefined dest. Callback with mode.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_mode_error_004', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_mode_error_004');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     try {
  	       fileio.copyFile(fpath, undefined, 0, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_mode_error_004: ' + err.message + ', code: ' + err.code);
  	           expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
  	           fileio.unlinkSync(fpath);
  	           done();
  	         }
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_mode_error_004 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'The first/second argument requires filepath/fd').assertTrue();
  	       fileio.unlinkSync(fpath);
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_mode_error_005
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_MODE_ERROR_005
  	    * @tc.desc   Test copyFile() interface with null mode. Callback with mode.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_mode_error_005', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_mode_error_005');
  	     let fpathTarget = await nextFileName('fileio_copy_file_callback_mode_error_005_target');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     try {
  	       fileio.copyFile(fpath, fpathTarget, null, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_mode_error_005: ' + err.message + ', code: ' + err.code);
  	           expect(err.message == 'Invalid mode' || err.message == 'Invalid arg').assertTrue();
  	           fileio.unlinkSync(fpath);
  	           done();
  	         }
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_mode_error_005 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'Invalid mode' || err.message == 'Invalid arg').assertTrue();
  	       fileio.unlinkSync(fpath);
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_mode_error_006
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_MODE_ERROR_006
  	    * @tc.desc   Test copyFile() interface with undefined mode. Callback with mode.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_mode_error_006', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_mode_error_006');
  	     let fpathTarget = await nextFileName('fileio_copy_file_callback_mode_error_006_target');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     try {
  	       fileio.copyFile(fpath, fpathTarget, undefined, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_mode_error_006: ' + err.message + ', code: ' + err.code);
  	           expect(false).assertTrue();
  	           fileio.unlinkSync(fpath);
  	           fileio.unlinkSync(fpathTarget);
  	           done();
  	         }
  	         let stat1 = fileio.statSync(fpath);
  	         let stat2 = fileio.statSync(fpathTarget);
  	         expect(stat1.size == stat2.size).assertTrue();
  	         fileio.unlinkSync(fpath);
  	         fileio.unlinkSync(fpathTarget);
  	         done();
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_mode_error_006 err: ' + err.message + ', code: ' + err.code);
  	       expect(false).assertTrue();
  	       fileio.unlinkSync(fpath);
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_mode_error_007
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_MODE_ERROR_007
  	    * @tc.desc   Test copyFile() interface with string src and string dest. Callback with mode.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_mode_error_007', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_mode_error_007');
  	     let fpathTarget = await nextFileName('fileio_copy_file_callback_mode_error_007_target');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     try {
  	       fileio.copyFile(fpath, fpathTarget, 0, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_mode_error_007: ' + err.message + ', code: ' + err.code);
  	           expect(false).assertTrue();
  	           fileio.unlinkSync(fpath);
  	           fileio.unlinkSync(fpathTarget);
  	           done();
  	         }
  	         fileio.accessSync(fpathTarget);
  	         fileio.unlinkSync(fpath);
  	         fileio.unlinkSync(fpathTarget);
  	         done();
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_mode_error_007 err: ' + err.message + ', code: ' + err.code);
  	       expect(false).assertTrue();
  	       fileio.unlinkSync(fpath);
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_mode_error_008
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_MODE_ERROR_008
  	    * @tc.desc   Test copyFile() interface with empty string src. Callback with mode.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_mode_error_008', Level.LEVEL2, async function (done) {
  	     let fpathTarget = await nextFileName('fileio_copy_file_callback_mode_error_008_target');
  	     try {
  	       fileio.copyFile("", fpathTarget, 0, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_mode_error_008: ' + err.message + ', code: ' + err.code);
  	           expect(err.message == 'No such file or directory').assertTrue();
  	           done();
  	         }
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_mode_error_008 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'No such file or directory').assertTrue();
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_mode_error_009
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_MODE_ERROR_009
  	    * @tc.desc   Test copyFile() interface with number src and string dest. Callback with mode.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_mode_error_009', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_mode_error_009');
  	     let fpathTarget = await nextFileName('fileio_copy_file_callback_mode_error_009_target');
  	     let fd = fileio.openSync(fpath, 0o102, 0o666);
  	     try {
  	       fileio.copyFile(fd, fpathTarget, 0, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_mode_error_009: ' + err.message + ', code: ' + err.code);
  	           expect(false).assertTrue();
  	           fileio.closeSync(fd);
  	           fileio.unlinkSync(fpath);
  	           done();
  	         }
  	         fileio.accessSync(fpathTarget);
  	         fileio.closeSync(fd);
  	         fileio.unlinkSync(fpath);
  	         fileio.unlinkSync(fpathTarget);
  	         done();
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_mode_error_009 err: ' + err.message + ', code: ' + err.code);
  	       expect(false).assertTrue();
  	       fileio.closeSync(fd);
  	       fileio.unlinkSync(fpath);
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_mode_error_010
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_MODE_ERROR_010
  	    * @tc.desc   Test copyFile() interface with string src and empty string dest. Callback with mode.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_mode_error_010', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_mode_error_010');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     try {
  	       fileio.copyFile(fpath, "", 0, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_mode_error_010: ' + err.message + ', code: ' + err.code);
  	           expect(err.message == 'No such file or directory').assertTrue();
  	           fileio.unlinkSync(fpath);
  	           done();
  	         }
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_mode_error_010 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'No such file or directory').assertTrue();
  	       fileio.unlinkSync(fpath);
  	       done();
  	     }
  	   });

  	   /**
  	    * @tc.name   fileio_copy_file_callback_mode_error_011
  	    * @tc.number SUB_DF_FILEIO_COPYFILE_CALLBACK_MODE_ERROR_011
  	    * @tc.desc   Test copyFile() interface with string src and number dest. Callback with mode.
  	    * @tc.type   FUNCTION
  	    * @tc.size   MEDIUMTEST
  	    * @tc.level  LEVEL2
  	    */
  	   it('fileio_copy_file_callback_mode_error_011', Level.LEVEL2, async function (done) {
  	     let fpath = await nextFileName('fileio_copy_file_callback_mode_error_011');
  	     let fpathTarget = await nextFileName('fileio_copy_file_callback_mode_error_011_target');
  	     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  	     let fdTarget = fileio.openSync(fpathTarget, 0o201 | 0o102, 0o666);
  	     try {
  	       fileio.copyFile(fpath, fdTarget, 0, function (err) {
  	         if (err) {
  	           console.log('fileio_copy_file_callback_mode_error_011: ' + err.message + ', code: ' + err.code);
  	           expect(err.message == 'Bad file descriptor').assertTrue();
  	           fileio.closeSync(fdTarget);
  	           fileio.unlinkSync(fpath);
  	           fileio.unlinkSync(fpathTarget);
  	           done();
  	         } else {
				expect(false).assertTrue();
  	            done();
			 }
  	       });
  	     } catch (err) {
  	       console.log('fileio_copy_file_callback_mode_error_011 err: ' + err.message + ', code: ' + err.code);
  	       expect(err.message == 'Bad file descriptor').assertTrue();
  	       fileio.closeSync(fdTarget);
  	       fileio.unlinkSync(fpath);
  	       fileio.unlinkSync(fpathTarget);
  	       done();
  	     }
  	   });
    });
}
