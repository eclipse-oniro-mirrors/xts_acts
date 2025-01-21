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

export default function fileioStreamWrite() {
describe('fileio_stream_write', function () {

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0000
   * @tc.name fileio_test_stream_write_async_000
   * @tc.desc Test write() interface,When the position is 1,return in promise mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_write_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      let length = 4096;
      ss.write(new ArrayBuffer(length), {
        position: 1
      }).then(function (len) {
        expect(len == length).assertTrue();
        fileio.unlinkSync(fpath);
        ss.closeSync();
        done();
      })
    } catch (err) {
      console.info('fileio_test_stream_write_async_000 has failed for ' + err);
      expect(null).assertFail();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0100
   * @tc.name fileio_test_stream_write_async_001
   * @tc.desc Test write() interface,return in callback mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_write_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      ss.write(new ArrayBuffer(4096), { offset: 1, encoding: 'utf-8' }, function (err, bytesWritten) {
        expect(bytesWritten == 4095).assertTrue();
        fileio.unlinkSync(fpath);
        ss.closeSync();
        done();
      });
    } catch (err) {
      console.info('fileio_test_stream_write_async_001 has failed for ' + err);
      expect(null).assertFail();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0200
   * @tc.name fileio_test_stream_write_async_002
   * @tc.desc Test write() interface,When the offset is 1.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('fileio_test_stream_write_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      let content = "hello, world";
      let bytesWritten = await ss.write(content, { offset: 1, length: 5, encoding: 'utf-8' });
      expect(bytesWritten == 5).assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    } catch (err) {
      console.info('fileio_test_stream_write_async_002 has failed for ' + err);
      expect(null).assertFail();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0300
   * @tc.name fileio_test_stream_write_async_003
   * @tc.desc Test write() interface,When the offset is 1 and position is 5.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('fileio_test_stream_write_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      let content = "test";
      let bytesWritten = await ss.write(content, {offset:1, position:5, encoding: 'utf-8' });
      expect(bytesWritten == content.length-1).assertTrue();
      let readOut = await ss.read(new ArrayBuffer(4096), {offset:0,position: 0});
      let start = readOut.offset;
      let end = readOut.offset+readOut.bytesRead;
      let result = String.fromCharCode.apply(null, new Uint8Array(readOut.buffer.slice(start,end)));
      expect(result == "helloestrld").assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    } catch (err) {
      console.info('fileio_test_stream_write_async_003 has failed for ' + err);
      expect(null).assertFail();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0400
   * @tc.name fileio_test_stream_write_async_004
   * @tc.desc Test write() interface,When there is only the first parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('fileio_test_stream_write_async_004', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      let content = "hello, world";
      let bytesWritten = await ss.write(content);
      expect(bytesWritten == content.length).assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    } catch (err) {
      console.info('fileio_test_stream_write_async_004 has failed for ' + err);
      expect(null).assertFail();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0500
   * @tc.name fileio_test_stream_write_async_005
   * @tc.desc Test write() interface,When offset equals buffer length.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
     it('fileio_test_stream_write_async_005', 0, async function (done) {
      let fpath = await nextFileName('fileio_test_stream_write_async_005');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      try {
        let ss = fileio.createStreamSync(fpath, 'r+');
        expect(ss !== null).assertTrue();
        let content = "hello, world";
        let bytesWritten = await ss.write(content, {offset: content.length});
        expect(bytesWritten == 0).assertTrue();
        fileio.unlinkSync(fpath);
        ss.closeSync();
        done();
      } catch (err) {
        console.info('fileio_test_stream_write_async_005 has failed for ' + err);
        expect(null).assertFail();
        done();
      }
    });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0600
   * @tc.name fileio_test_stream_write_async_006
   * @tc.desc Test write() interface,When offset+length>buffer.size.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
     it('fileio_test_stream_write_async_006', 0, async function (done) {
      let fpath = await nextFileName('fileio_test_stream_write_async_006');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      try {
        let content = "hello, world";
        await ss.write(content,{offset: 5, length:10});
        done();
      } catch (err) {
        console.info('fileio_test_stream_write_async_006 has failed for ' + err);
        expect(err.message == "Invalid option.length, buffer limit exceeded").assertTrue();
        fileio.unlinkSync(fpath);
        ss.closeSync();
        done();
      }
    });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0700
   * @tc.name fileio_test_stream_write_async_007
   * @tc.desc Test write() interface,When the offset is greater than the buffer length.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('fileio_test_stream_write_async_007', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      let content = "hello, world";
      await ss.write(content, {offset:content.length+1});
    } catch (err) {
      console.info('fileio_test_stream_write_async_007 has failed for ' + err);
      expect(err.message == "Invalid option.offset, buffer limit exceeded").assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0800
   * @tc.name fileio_test_stream_write_async_008
   * @tc.desc Test write() interface,when encoding invalid.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('fileio_test_stream_write_async_008', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      await ss.write("hello, world", {encoding: 'GB2312' });
    } catch (err) {
      console.info('fileio_test_stream_write_async_008 has failed for ' + err);
      expect(err.message == "Illegal write buffer or encoding").assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0900
   * @tc.name fileio_test_stream_write_async_009
   * @tc.desc Test write() interface,When there are no parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('fileio_test_stream_write_async_009', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      await ss.write();
    } catch (err) {
      console.info('fileio_test_stream_write_async_009 has failed for ' + err);
      expect(err.message == "Number of arguments unmatched").assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_1000
   * @tc.name fileio_test_stream_write_async_010
   * @tc.desc Test write() interface,When the offset is negative.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('fileio_test_stream_write_async_010', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      
      let content = "hello, world";
      await ss.write(content, {offset:-1});
    } catch (err) {
      console.info('fileio_test_stream_write_async_010 has failed for ' + err);
      expect(err.message == "Invalid option.offset, positive integer is desired").assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_1100
   * @tc.name fileio_test_stream_write_async_011
   * @tc.desc Test write() interface,When the length is negative,equivalent to omitting the parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('fileio_test_stream_write_async_011', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      let content = "hello, world";
      let number = await ss.write(content, {offset:1 ,length:-1});
      expect(number == content.length-1).assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    } catch (err) {
      console.info('fileio_test_stream_write_async_011 has failed for ' + err);
    }
  });

    /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_1200
   * @tc.name fileio_test_stream_write_async_012
   * @tc.desc Test write() interface,When the buffer parameter type is wrong.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
     it('fileio_test_stream_write_async_012', 0, async function (done) {
      let fpath = await nextFileName('fileio_test_stream_write_async_012');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      try {
        
        await ss.write(12, {length:-1});
      } catch (err) {
        console.info('fileio_test_stream_write_async_012 has failed for ' + err);
        expect(err.message == "Illegal write buffer or encoding").assertTrue();
        fileio.unlinkSync(fpath);
        ss.closeSync();
        done();
      }
    });


  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_1300
   * @tc.name fileio_test_stream_write_async_013
   * @tc.desc Test write() interface,When the length is greater than the buffer length.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('fileio_test_stream_write_async_013', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_013');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      await ss.write(new ArrayBuffer(4096), {length:4097});
    } catch (err) {
      console.info('fileio_test_stream_write_async_013 has failed for ' + err);
      expect(err.message == "Invalid option.length, buffer limit exceeded").assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_1400
   * @tc.name fileio_test_stream_write_async_014
   * @tc.desc Test write() interface,When the length>content.length .
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('fileio_test_stream_write_async_014', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_014');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      let content = "hello,world";
      await ss.write(content,{length:content.length+1});
    } catch (err) {
      console.info('fileio_test_stream_write_async_014 has failed for ' + err);
      expect(err.message == "Invalid option.length, buffer limit exceeded").assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_1500
   * @tc.name fileio_test_stream_write_async_015
   * @tc.desc Test write() interface,When the position is negative.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('fileio_test_stream_write_async_015', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_015');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      let content = "hello, world";
      await ss.write(content, {position:-1});
    } catch (err) {
      console.info('fileio_test_stream_write_async_015 has failed for ' + err);
      expect(err.message == "option.position shall be positive number").assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    }
  });
});
}
