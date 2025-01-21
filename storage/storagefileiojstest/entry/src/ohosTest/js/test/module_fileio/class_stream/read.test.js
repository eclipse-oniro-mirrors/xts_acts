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

export default function fileioStreamRead() {
describe('fileio_stream_read', function () {

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READSYNC_0000
   * @tc.name fileio_test_stream_read_sync_000
   * @tc.desc Test Stream.readSync() interface.
   * Undefined option arguments, use default options.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_stream_read_sync_000', 3, async function () {
    let fpath = await nextFileName('fileio_test_stream_read_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let readLen1 = sr.readSync(new ArrayBuffer(16), undefined);
      expect(readLen1 == FILE_CONTENT.length).assertTrue();
      let readLen2 = sr.readSync(new ArrayBuffer(8), undefined);
      expect(readLen2 == 0).assertTrue();
      sr.closeSync();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileio_test_stream_read_sync_000 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READSYNC_0100
   * @tc.name fileio_test_stream_read_sync_001
   * @tc.desc Test Stream.readSync() interface.
   * Undefined option arguments, use default options.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_stream_read_sync_001', 3, async function () {
    let fpath = await nextFileName('fileio_test_stream_read_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let readLen1 = sr.readSync(new ArrayBuffer(16), {
        offset: undefined,
        length: undefined
      });
      expect(readLen1 == FILE_CONTENT.length).assertTrue();
      let readLen2 = sr.readSync(new ArrayBuffer(8), {
        offset: undefined,
        length: undefined
      });
      expect(readLen2 == 0).assertTrue();
      sr.closeSync();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileio_test_stream_read_sync_001 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READASYNC_0000
   * @tc.name fileio_test_stream_read_async_000
   * @tc.desc Test read() interface,return in promise mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      let readout = await ss.read(new ArrayBuffer(4096));
      expect(readout.bytesRead == FILE_CONTENT.length).assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
      done();
    } catch (err) {
      console.info('fileio_test_stream_read_async_000 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READASYNC_0100
   * @tc.name fileio_test_stream_read_async_001
   * @tc.desc Test read() interface, return in callback mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_async_001', 0, async function () {
    let fpath = await nextFileName('fileio_test_stream_read_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      ss.read(new ArrayBuffer(4096), null, function (err, readout) {
        expect(readout.bytesRead == FILE_CONTENT.length).assertTrue();
        ss.closeSync();
        fileio.unlinkSync(fpath);
      });
    } catch (err) {
      console.info('fileio_test_stream_read_async_001 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READASYNC_0200
   * @tc.name fileio_test_stream_read_async_002
   * @tc.desc Test read() interface, When the offset is 1 and the length is 5.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      let options = {
        offset: 1,
        length: 5
      }
      let readout = await ss.read(new ArrayBuffer(4096),options);
      expect(readout.bytesRead == 5).assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
      done();
    } catch (err) {
      console.info('fileio_test_stream_read_async_002 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READASYNC_0300
   * @tc.name fileio_test_stream_read_async_003
   * @tc.desc Test read() interface, When offset equals buffer length.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      let readout = await ss.read(new ArrayBuffer(4096), {offset: 4096});
      expect(readout.bytesRead == 0).assertTrue();
      expect(readout.offset == 4096).assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
      done();
    } catch (err) {
      console.info('fileio_test_stream_read_async_003 has failed for ' + err);
      expect(null).assertFail();
    }
  });


  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READASYNC_0400
   * @tc.name fileio_test_stream_read_async_004
   * @tc.desc Test read() interface, When the offset is 1 and the position is 5.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_async_004', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      let options = {
        offset: 1,
        position:6
      }
      let readout = await ss.read(new ArrayBuffer(4096),options);
      expect(readout.bytesRead == FILE_CONTENT.length-6).assertTrue();
      expect(readout.offset == 1).assertTrue();
      let start = readout.offset;
      let end = readout.offset+readout.bytesRead;
      let result = String.fromCharCode.apply(null, new Uint8Array(readout.buffer.slice(start,end)));
      expect(result== "world").assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
      done();
    } catch (err) {
      console.info('fileio_test_stream_read_async_004 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READASYNC_0500
   * @tc.name fileio_test_stream_read_async_005
   * @tc.desc Test read() interface, When the offset is negative.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_async_005', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      await ss.read(new ArrayBuffer(4096), {offset: -1});
    } catch (err) {
      console.info('fileio_test_stream_read_async_005 has failed for ' + err);
      expect(err.message == "Invalid option.offset, positive integer is desired").assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READASYNC_0600
   * @tc.name fileio_test_stream_read_async_006
   * @tc.desc Test read() interface, When offset+length>buffer.size.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_async_006', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      await ss.read(new ArrayBuffer(4096), {offset: 1,length:4096});
    } catch (err) {
      console.info('fileio_test_stream_read_async_006 has failed for ' + err);
      expect(err.message == "Invalid option.length").assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READASYNC_0700
   * @tc.name fileio_test_stream_read_async_007
   * @tc.desc Test read() interface, When the offset is greater than the buffer length.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_async_007', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      await ss.read(new ArrayBuffer(4096), {offset: 4097});
    } catch (err) {
      console.info('fileio_test_stream_read_async_007 has failed for ' + err);
      expect(err.message == "Invalid option.offset, buffer limit exceeded").assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READASYNC_0800
   * @tc.name fileio_test_stream_read_async_008
   * @tc.desc Test read() interface, When the length is greater than the buffer length.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_async_008', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      await ss.read(new ArrayBuffer(4096), {length: 4097});
    } catch (err) {
      console.info('fileio_test_stream_read_async_008 has failed for ' + err);
      expect(err.message == "Invalid option.length").assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READASYNC_0900
   * @tc.name fileio_test_stream_read_async_009
   * @tc.desc Test read() interface, When the length is negative,equivalent to omitting the parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_async_009', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');

    try {
      expect(ss !== null).assertTrue();
      await ss.read(new ArrayBuffer(16), {offset:13, length: -1});
      expect(false).assertTrue();
    } catch (err) {
      ss.closeSync();
      fileio.unlinkSync(fpath);
      console.info('fileio_test_stream_read_async_009 has failed for ' + err);
      expect(err.message == "Invalid option.length").assertTrue();
      done();
    }
  });

   /**
   * @tc.number SUB_DF_FILEIO_STREAM_READASYNC_1000
   * @tc.name fileio_test_stream_read_async_010
   * @tc.desc Test read() interface, When there are no parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_async_010', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      await ss.read();
    } catch (err) {
      console.info('fileio_test_stream_read_async_010 has failed for ' + err);
      expect(err.message == "Number of arguments unmatched").assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
      done();
    }
  });

    /**
   * @tc.number SUB_DF_FILEIO_STREAM_READASYNC_1100
   * @tc.name fileio_test_stream_read_async_011
   * @tc.desc Test read() interface, When length>FILE_CONTENT.length.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_async_011', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      let readout = await ss.read(new ArrayBuffer(4096), {length: FILE_CONTENT.length+1});
      expect(readout.bytesRead == FILE_CONTENT.length).assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
      done();
    } catch (err) {
      console.info('fileio_test_stream_read_async_011 has failed for ' + err);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READASYNC_1200
   * @tc.name fileio_test_stream_read_async_012
   * @tc.desc Test read() interface, When the position is negative.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_async_012', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_012');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      await ss.read(new ArrayBuffer(4096), {position:-1});
    } catch (err) {
      console.info('fileio_test_stream_read_async_012 has failed for ' + err);
      expect(err.message == "option.position shall be positive number").assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READASYNC_1300
   * @tc.name fileio_test_stream_read_async_013
   * @tc.desc Test read() interface,When the parameter type is wrong.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_async_013', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_013');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      await ss.read("");
    } catch (err) {
      console.info('fileio_test_stream_read_async_013 has failed for ' + err);
      expect(err.message == "Invalid read buffer, expect arraybuffer").assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_1400
   * @tc.name fileio_test_stream_read_async_014
   * @tc.desc Test the read() interface of class Stream. Promise.
   * Undefined option arguments, use default options.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_stream_read_async_014', 3, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_014');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let readRes1 = await sr.read(new ArrayBuffer(16), undefined);
      expect(readRes1.bytesRead == FILE_CONTENT.length).assertTrue();
      expect(readRes1.offset == 0).assertTrue();
      let readRes2 = await sr.read(new ArrayBuffer(8), undefined);
      expect(readRes2.bytesRead == 0).assertTrue();
      expect(readRes2.offset == 0).assertTrue();
      sr.closeSync();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_stream_read_async_014 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_1500
   * @tc.name fileio_test_stream_read_async_015
   * @tc.desc Test the read() interface of class Stream. Callback.
   * Undefined option arguments, use default options.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_stream_read_async_015', 3, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_015');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.read(new ArrayBuffer(16), undefined, (err, readRes1) => {
        if (err) {
          console.log('fileio_test_stream_read_async_015 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(readRes1.bytesRead == FILE_CONTENT.length).assertTrue();
        expect(readRes1.offset == 0).assertTrue();
        sr.read(new ArrayBuffer(8), undefined, (err, readRes2) => {
          if (err) {
            console.log('fileio_test_stream_read_async_015 error package2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(readRes2.bytesRead == 0).assertTrue();
          expect(readRes2.offset == 0).assertTrue();
          sr.closeSync();
          fileio.unlinkSync(fpath);
          done();
        });
      });
    } catch (e) {
      console.log('fileio_test_stream_read_async_015 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_1600
   * @tc.name fileio_test_stream_read_async_016
   * @tc.desc Test the read() interface of class Stream. Promise.
   * Undefined option arguments, use default options.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_stream_read_async_016', 3, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_016');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let readRes1 = await sr.read(new ArrayBuffer(16), {
        position: undefined,
        offset: undefined,
        length: undefined
      });
      expect(readRes1.bytesRead == FILE_CONTENT.length).assertTrue();
      expect(readRes1.offset == 0).assertTrue();
      let readRes2 = await sr.read(new ArrayBuffer(8), {
        offset: undefined,
        length: undefined
      });
      expect(readRes2.bytesRead == 0).assertTrue();
      expect(readRes2.offset == 0).assertTrue();
      sr.closeSync();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_stream_read_async_016 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_1700
   * @tc.name fileio_test_stream_read_async_017
   * @tc.desc Test the read() interface of class Stream. Callback.
   * Undefined option arguments, use default options.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_stream_read_async_017', 3, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_read_async_017');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.read(new ArrayBuffer(4096), {
        position: undefined,
        offset: undefined,
        length: undefined
      }, (err, readRes1) => {
        if (err) {
          console.log('fileio_test_stream_read_async_017 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(readRes1.bytesRead == FILE_CONTENT.length).assertTrue();
        expect(readRes1.offset == 0).assertTrue();
        sr.read(new ArrayBuffer(8), {
          offset: undefined,
          length: undefined
        }, (err, readRes2) => {
          if (err) {
            console.log('fileio_test_stream_read_async_017 error package2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(readRes2.bytesRead == 0).assertTrue();
          expect(readRes2.offset == 0).assertTrue();
          sr.closeSync();
          fileio.unlinkSync(fpath);
          done();
        });
      });
    } catch (e) {
      console.log('fileio_test_stream_read_async_017 has failed for ' + e);
      expect(false).assertTrue();
    }
  });
});
}
