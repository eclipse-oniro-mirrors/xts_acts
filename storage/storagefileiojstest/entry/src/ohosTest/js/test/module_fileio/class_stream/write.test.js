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

export default function fileioStreamWrite() {
describe('fileio_stream_write', function () {

  /**
   * @tc.name   fileio_test_stream_write_sync_000
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0000
   * @tc.desc   Test the writeSync() interface of class Stream.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_sync_000', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_stream_write_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten1 = sr.writeSync(FILE_CONTENT, undefined);
      expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
      let bytesWritten2 = sr.writeSync(new ArrayBuffer(FILE_CONTENT.length), undefined);
      expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
      let readLen = sr.readSync(new ArrayBuffer(4096), { position: 0 });
      expect(readLen == FILE_CONTENT.length * 2).assertTrue();
      sr.closeSync();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileio_test_stream_write_sync_000 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_sync_001
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0100
   * @tc.desc   Test the writeSync() interface of class Stream.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_sync_001', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_stream_write_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten1 = sr.writeSync(FILE_CONTENT, {
        offset: undefined,
        length: undefined,
        encoding: undefined
      });
      expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
      let bytesWritten2 = sr.writeSync(new ArrayBuffer(FILE_CONTENT.length), {
        offset: undefined,
        length: undefined,
        encoding: undefined
      });
      expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
      let readLen = sr.readSync(new ArrayBuffer(4096), { position: 0 });
      expect(readLen == FILE_CONTENT.length * 2).assertTrue();
      sr.closeSync();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileio_test_stream_write_sync_001 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_sync_002
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0200
   * @tc.desc   Test the writeSync() interface of class Stream.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_sync_002', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_stream_write_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileio.createStreamSync(fpath, 'r+');
    try {
      expect(sr !== null).assertTrue();
      sr.writeSync(null, {offset:1});
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_stream_write_sync_002 has failed for ' + e);
      sr.closeSync();
      fileio.unlinkSync(fpath);
      expect(e.message == 'Illegal write buffer or encoding').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_sync_003
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0300
   * @tc.desc   Test the writeSync() interface of class Stream.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_sync_003', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_stream_write_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileio.createStreamSync(fpath, 'r+');
    try {
      expect(sr !== null).assertTrue();
      sr.writeSync(undefined, {offset:1});
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_stream_write_sync_003 has failed for ' + e);
      sr.closeSync();
      fileio.unlinkSync(fpath);
      expect(e.message == 'Illegal write buffer or encoding').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_sync_004
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0400
   * @tc.desc   Test the writeSync() interface of class Stream.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_sync_004', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_stream_write_sync_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten1 = sr.writeSync(new ArrayBuffer(FILE_CONTENT.length), null);
      expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileio_test_stream_write_sync_004 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_sync_005
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0500
   * @tc.desc   Test the writeSync() interface of class Stream.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_sync_005', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_stream_write_sync_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten1 = sr.writeSync(new ArrayBuffer(FILE_CONTENT.length), undefined);
      expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileio_test_stream_write_sync_005 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_sync_006
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0600
   * @tc.desc   Test the writeSync() interface of class Stream.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_sync_006', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_stream_write_sync_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileio.createStreamSync(fpath, 'r+');
    try {
      expect(sr !== null).assertTrue();
      sr.writeSync("", {offset:1});
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_stream_write_sync_006 has failed for ' + e);
      sr.closeSync();
      fileio.unlinkSync(fpath);
      expect(e.message == 'Invalid option.offset, buffer limit exceeded').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_async_000
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0000
   * @tc.desc   Test write() interface,When the position is 1,return in promise mode.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_stream_write_async_000', Level.LEVEL0, async function (done) {
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
   * @tc.name   fileio_test_stream_write_async_001
   * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0100
   * @tc.desc   Test write() interface,return in callback mode.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_stream_write_async_001', Level.LEVEL0, async function (done) {
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
    * @tc.name   fileio_test_stream_write_async_002
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0200
    * @tc.desc   Test write() interface,When the offset is 1.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_002', Level.LEVEL0, async function (done) {
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
    * @tc.name   fileio_test_stream_write_async_003
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0300
    * @tc.desc   Test write() interface,When the offset is 1 and position is 5.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_003', Level.LEVEL0, async function (done) {
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
    * @tc.name   fileio_test_stream_write_async_004
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0400
    * @tc.desc   Test write() interface,When there is only the first parameter.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_004', Level.LEVEL0, async function (done) {
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
      * @tc.name   fileio_test_stream_write_async_005
      * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0500
      * @tc.desc   Test write() interface,When offset equals buffer length.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('fileio_test_stream_write_async_005', Level.LEVEL0, async function (done) {
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
      * @tc.name   fileio_test_stream_write_async_006
      * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0600
      * @tc.desc   Test write() interface,When offset+length>buffer.size.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('fileio_test_stream_write_async_006', Level.LEVEL0, async function (done) {
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
        expect(err.message == "Invalid option.length").assertTrue();
        fileio.unlinkSync(fpath);
        ss.closeSync();
        done();
      }
    });

   /**
    * @tc.name   fileio_test_stream_write_async_007
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0700
    * @tc.desc   Test write() interface,When the offset is greater than the buffer length.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_007', Level.LEVEL0, async function (done) {
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
    * @tc.name   fileio_test_stream_write_async_008
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0800
    * @tc.desc   Test write() interface,when encoding invalid.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_008', Level.LEVEL0, async function (done) {
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
    * @tc.name   fileio_test_stream_write_async_009
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_0900
    * @tc.desc   Test write() interface,When there are no parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_009', Level.LEVEL0, async function (done) {
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
    * @tc.name   fileio_test_stream_write_async_010
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_1000
    * @tc.desc   Test write() interface,When the offset is negative.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_010', Level.LEVEL0, async function (done) {
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
    * @tc.name   fileio_test_stream_write_async_011
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_1100
    * @tc.desc   Test write() interface,When the length is negative,equivalent to omitting the parameter.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_011', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      let content = "hello, world";
      await ss.write(content, {offset:1 ,length:-1});
      expect(false).assertTrue();
    } catch (err) {
      ss.closeSync();
      fileio.unlinkSync(fpath);
      console.info('fileio_test_stream_write_async_011 has failed for ' + err);
      expect(err.message == "Invalid option.length").assertTrue();
      done();
    }
  });

     /**
      * @tc.name   fileio_test_stream_write_async_012
      * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_1200
      * @tc.desc   Test write() interface,When the buffer parameter type is wrong.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('fileio_test_stream_write_async_012', Level.LEVEL0, async function (done) {
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
    * @tc.name   fileio_test_stream_write_async_013
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_1300
    * @tc.desc   Test write() interface,When the length is greater than the buffer length.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_013', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_013');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      await ss.write(new ArrayBuffer(4096), {length:4097});
    } catch (err) {
      console.info('fileio_test_stream_write_async_013 has failed for ' + err);
      expect(err.message == "Invalid option.length").assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    }
  });

   /**
    * @tc.name   fileio_test_stream_write_async_014
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_1400
    * @tc.desc   Test write() interface,When the length>content.length .
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_014', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_014');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      let content = "hello,world";
      await ss.write(content,{length:content.length+1});
    } catch (err) {
      console.info('fileio_test_stream_write_async_014 has failed for ' + err);
      expect(err.message == "Invalid option.length").assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    }
  });

   /**
    * @tc.name   fileio_test_stream_write_async_015
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_1500
    * @tc.desc   Test write() interface,When the position is negative.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_015', Level.LEVEL0, async function (done) {
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

  /**
   * @tc.name   fileio_test_stream_write_async_016
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1600
   * @tc.desc   Test the write() interface of class Stream. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_async_016', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_016');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten1 = await sr.write(FILE_CONTENT, undefined);
      expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
      let bytesWritten2 = await sr.write(new ArrayBuffer(FILE_CONTENT.length), undefined);
      expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
      let readLen = sr.readSync(new ArrayBuffer(4096), { position: 0 });
      expect(readLen == FILE_CONTENT.length * 2).assertTrue();
      sr.closeSync();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_stream_write_async_016 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_async_017
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1700
   * @tc.desc   Test the write() interface of class Stream. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_async_017', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_017');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write(FILE_CONTENT, undefined, (err, bytesWritten1) => {
        if (err) {
          console.log('fileio_test_stream_write_async_017 err package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        sr.write(new ArrayBuffer(FILE_CONTENT.length), undefined, (err, bytesWritten2) => {
          if (err) {
            console.log('fileio_test_stream_write_async_017 err package2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
          let readLen = sr.readSync(new ArrayBuffer(4096), { position: 0 });
          expect(readLen == FILE_CONTENT.length * 2).assertTrue();
          sr.closeSync();
          fileio.unlinkSync(fpath);
          done();
        });
      });
    } catch (e) {
      console.log('fileio_test_stream_write_async_017 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_async_018
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1800
   * @tc.desc   Test the write() interface of class Stream. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_async_018', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_018');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten1 = await sr.write(FILE_CONTENT, {
        offset: undefined,
        length: undefined,
        encoding: undefined
      });
      expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
      let bytesWritten2 = await sr.write(new ArrayBuffer(FILE_CONTENT.length), {
        offset: undefined,
        length: undefined,
        encoding: undefined
      });
      expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
      let readLen = sr.readSync(new ArrayBuffer(4096), { position: 0 });
      expect(readLen == FILE_CONTENT.length * 2).assertTrue();
      sr.closeSync();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_stream_write_async_018 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_async_019
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1900
   * @tc.desc   Test the write() interface of class Stream. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_async_019', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_019');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write(FILE_CONTENT, {
        offset: undefined,
        length: undefined,
        encoding: undefined
      }, (err, bytesWritten1) => {
        if (err) {
          console.log('fileio_test_stream_write_async_019 err package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        sr.write(new ArrayBuffer(FILE_CONTENT.length), {
          offset: undefined,
          length: undefined,
          encoding: undefined
        }, (err, bytesWritten2) => {
          if (err) {
            console.log('fileio_test_stream_write_async_019 err package2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
          let readLen = sr.readSync(new ArrayBuffer(4096), { position: 0 });
          expect(readLen == FILE_CONTENT.length * 2).assertTrue();
          sr.closeSync();
          fileio.unlinkSync(fpath);
          done();
        });
      });
    } catch (e) {
      console.log('fileio_test_stream_write_async_019 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
    * @tc.name   fileio_test_stream_write_async_020
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_2000
    * @tc.desc   Test write() interface,When the offset is greater than the buffer length.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_020', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_020');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      await ss.write(null, {offset:1});
      expect(false).assertTrue();
      done();
    } catch (err) {
      console.info('fileio_test_stream_write_async_020 has failed for ' + err);
      expect(err.message == 'Illegal write buffer or encoding').assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    }
  });

  /**
    * @tc.name   fileio_test_stream_write_async_021
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_2100
    * @tc.desc   Test write() interface,When the offset is greater than the buffer length.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_021', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_021');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      await ss.write(undefined, {offset:1});
      expect(false).assertTrue();
      done();
    } catch (err) {
      console.info('fileio_test_stream_write_async_021 has failed for ' + err);
      expect(err.message == 'Illegal write buffer or encoding').assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    }
  });

  /**
    * @tc.name   fileio_test_stream_write_async_022
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_2200
    * @tc.desc   Test write() interface,When the offset is greater than the buffer length.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_022', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_022');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      let bytesWritten = await ss.write(new ArrayBuffer(FILE_CONTENT.length), null);
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    } catch (err) {
      console.info('fileio_test_stream_write_async_022 has failed for ' + err);
      expect(false).assertTrue();
      done();
    }
  });

  /**
    * @tc.name   fileio_test_stream_write_async_023
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_2300
    * @tc.desc   Test write() interface,When the offset is greater than the buffer length.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_023', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_023');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      let bytesWritten = await ss.write(new ArrayBuffer(FILE_CONTENT.length), undefined);
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    } catch (err) {
      console.info('fileio_test_stream_write_async_023 has failed for ' + err);
      expect(false).assertTrue();
      done();
    }
  });

  /**
    * @tc.name   fileio_test_stream_write_async_024
    * @tc.number SUB_DF_FILEIO_STREAM_WRITEASYNC_2400
    * @tc.desc   Test write() interface,When the offset is greater than the buffer length.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_write_async_024', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_024');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    try {
      await ss.write("", {offset:1});
      expect(false).assertTrue();
      done();
    } catch (err) {
      console.info('fileio_test_stream_write_async_024 has failed for ' + err);
      expect(err.message == "Invalid option.offset, buffer limit exceeded").assertTrue();
      fileio.unlinkSync(fpath);
      ss.closeSync();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_async_025
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_2500
   * @tc.desc   Test the write() interface of class Stream. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_async_025', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_025');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write(null, (err, bytesWritten1) => {
        if (err) {
          console.log('fileio_test_stream_write_async_025 err: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
      done();
    } catch (e) {
      console.log('fileio_test_stream_write_async_025 has failed for ' + e);
      expect(e.message == 'Illegal write buffer or encoding').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_async_026
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_2600
   * @tc.desc   Test the write() interface of class Stream. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_async_026', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_026');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write(undefined, (err, bytesWritten1) => {
        if (err) {
          console.log('fileio_test_stream_write_async_026 err: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
      done();
    } catch (e) {
      console.log('fileio_test_stream_write_async_026 has failed for ' + e);
      expect(e.message == 'Illegal write buffer or encoding').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_async_027
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_2700
   * @tc.desc   Test the write() interface of class Stream. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_async_027', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_027');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write("", (err, bytesWritten1) => {
        if (err) {
          console.log('fileio_test_stream_write_async_027 err: ' + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        }
        console.log('fileio_test_stream_write_async_027 succ');
        done();
      });
    } catch (e) {
      console.log('fileio_test_stream_write_async_027 has failed for ' + e);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_async_028
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_2800
   * @tc.desc   Test the write() interface of class Stream. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_async_028', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_028');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write(null, {offset:1}, (err, bytesWritten1) => {
        if (err) {
          console.log('fileio_test_stream_write_async_028 err: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
      done();
    } catch (e) {
      console.log('fileio_test_stream_write_async_028 has failed for ' + e);
      expect(e.message == 'Illegal write buffer or encoding').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_async_029
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_2900
   * @tc.desc   Test the write() interface of class Stream. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_async_029', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_029');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write(undefined, {offset:1}, (err, bytesWritten1) => {
        if (err) {
          console.log('fileio_test_stream_write_async_029 err: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
      done();
    } catch (e) {
      console.log('fileio_test_stream_write_async_029 has failed for ' + e);
      expect(e.message == 'Illegal write buffer or encoding').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_async_030
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_3000
   * @tc.desc   Test the write() interface of class Stream. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_async_030', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_030');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write(new ArrayBuffer(FILE_CONTENT.length), null, (err, bytesWritten1) => {
        if (err) {
          console.log('fileio_test_stream_write_async_030 err: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fileio.unlinkSync(fpath);
        done();
      });
      done();
    } catch (e) {
      console.log('fileio_test_stream_write_async_030 has failed for ' + e);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_stream_write_async_031
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_3100
   * @tc.desc   Test the write() interface of class Stream. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_stream_write_async_031', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_write_async_031');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileio.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write("", {offset:1}, (err, bytesWritten1) => {
        if (err) {
          console.log('fileio_test_stream_write_async_031 err: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
      done();
    } catch (e) {
      console.log('fileio_test_stream_write_async_031 has failed for ' + e);
      expect(e.message == "Invalid option.offset, buffer limit exceeded").assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });
});
}
