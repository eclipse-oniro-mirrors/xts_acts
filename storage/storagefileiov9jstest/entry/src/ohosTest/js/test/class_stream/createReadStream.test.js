/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect, isIntNum
} from '../Common';
import fs from '@ohos.file.fs';
import { TestType, Size, Level } from '@ohos/hypium';

export default function fscreateReadStream() {
  describe('fileIO_fs_create_stream', function () {

    /**
     * @tc.name   fileIO_test_create_ReadStream_001
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0100
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let rs = fs.createReadStream(fpath);
        let rsSize = 0;
        rs.on('readable', () => {
          let data = rs.read();
          rsSize = rsSize + data.length;
          console.log('fileIO_test_create_ReadStream_001 content ' + data.slice(0, 10) + ', data.length: ' + data.length);
          const filesize = fileIO.lstatSycn(fpath).size;
          console.log('fileIO_test_create_ReadStream_001 rsSize ' + rsSize + ', filesize: ' + filesize);
          expect(rsSize == filesize).assertTrue();
        });
        fs.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_ReadStream_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_002
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0200
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_002');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let start = 1;
        let end = 11;
        let rs = fs.createReadStream(fpath, { start, end });
        let rsSize = 0;
        rs.on('readable', () => {
          let data = rs.read();
          rsSize = rsSize + data.length;
          console.log('fileIO_test_create_ReadStream_002 content ' + data.slice(0, 10) + ', data.length: ' + data.length);
          const filesize = fileIO.lstatSycn(fpath).size;
          console.log('fileIO_test_create_ReadStream_001 rsSize ' + rsSize + ', filesize: ' + filesize);
          expect(rsSize == end - start).assertTrue();
        });
        fs.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_ReadStream_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_003
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0300
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_003');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let rs = fs.createReadStream(fpath);
        let rsSize = 0;
        rs.on('data', (emitData) => {
          let data = emitData?.data;
          rsSize = rsSize + data?.length;
          console.log('fileIO_test_create_ReadStream_003 content ' + data.slice(0, 10) + ', data.length: ' + data?.length);
          let filesize = fs.lstatSycn(fpath).size;
          console.log('fileIO_test_create_ReadStream_003 rsSize ' + rsSize + ', filesize: ' + filesize);
          expect(rsSize == filesize).assertTrue();
        });
        fs.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_ReadStream_003 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_004
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0400
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_004');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let seekPos = 4;
        let rs = fs.createReadStream(fpath);
        let rsSize = 0;
        rs.seek(seekPos);
        rs.on('data', (emitData) => {
          let data = emitData?.data;
          rsSize = rsSize + data?.length;
          console.log('fileIO_test_create_ReadStream_004 content ' + data.slice(0, 10) + ', data.length: ' + data?.length);
          let filesize = fs.lstatSycn(fpath).size;
          console.log('fileIO_test_create_ReadStream_004 rsSize ' + rsSize + ', filesize-seekPos: ' + filesize - seekPos);
          expect(rsSize == filesize - seekPos).assertTrue();
        });
        fs.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_ReadStream_004 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_005
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0500
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_005');
      let wpath = await nextFileName('fileIO_test_create_ReadStream_00501');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(prepareFile(wpath, '')).assertTrue();

      try {
        let rs = fs.createReadStream(fpath);
        let ws = fs.createWriteStream(wpath);
        rs.on('data', (emitData) => {
          let data = emitData?.data;
          ws.write(data);
          rsSize = rsSize + data?.length;
          console.log('fileIO_test_create_ReadStream_005 content ' + data.slice(0, 10) + ', data.length: ' + data?.length);
          let filesize = fs.lstatSycn(wpath).size;
          console.log('fileIO_test_create_ReadStream_005 rsSize ' + rsSize + ', filesize: ' + filesize);
          expect(rsSize == filesize).assertTrue();
        });
        fs.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_ReadStream_005 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_006
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0600
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_006');
      let wpath = await nextFileName('fileIO_test_create_ReadStream_00601');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(prepareFile(wpath, '')).assertTrue();

      try {
        let rs = fs.createReadStream(fpath);
        let ws = fs.createWriteStream(wpath);
        rs.on('data', (emitData) => {
          let data = emitData?.data;
          ws.write(data);
          rsSize = rsSize + data?.length;
          console.log('fileIO_test_create_ReadStream_006 content ' + data.slice(0, 10) + ', data.length: ' + data?.length);
          let filesize = fs.lstatSycn(wpath).size;
          console.log('fileIO_test_create_ReadStream_005 rsSize ' + rsSize + ', filesize: ' + filesize);
          expect(rsSize == filesize).assertTrue();
          rs.close();
          ws.close();
        });
        fs.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_ReadStream_006 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_007
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0700
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {

      try {
        let rs = fs.createReadStream(-1);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_create_ReadStream_007 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_008
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0800
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_008');

      try {
        let start = 1;
        let end = 11;
        let rs = fs.createReadStream(fpath, { start, end });
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_create_ReadStream_008 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_009
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0900
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {

      try {
        let ws = fs.createWriteStream(-1);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_create_ReadStream_009 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_010
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1000
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_010');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ReadStream = fs.createReadStream(fpath);
        let rb = ReadStream.bytesRead;
        let rpath = ReadStream.path;
        expect(isIntNum(rb)).assertTrue();
        expect(rpath == fpath).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_ReadStream_010 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_011
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1100
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_011');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ReadStream = fs.createReadStream(fpath);
        let offset = 5;
        let curoff = ReadStream.seek(offset, fs.WhenceType.SEEK_SET);
        expect(offset == curoff).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_ReadStream_011 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_012
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1200
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_012');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ReadStream = fs.createReadStream(fpath);
        let curoff = ReadStream.seek();
        expect(false).assertTrue();
      } catch (e) {
        fs.unlinkSync(fpath);
        console.log('fileIO_test_create_ReadStream_012 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_013
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1300
     * @tc.desc   Test the createWriteStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_013');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let WriteStream = fs.createWriteStream(fpath);
        let wb = WriteStream.bytesWritten;
        let wpath = WriteStream.path;
        expect(isIntNum(wb)).assertTrue();
        expect(wpath == fpath).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_ReadStream_013 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_014
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1400
     * @tc.desc   Test the createWriteStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_014');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let WriteStream = fs.createWriteStream(fpath);
        let curOff = WriteStream.seek(5, fs.WhenceType.SEEK_SET);
        console.log('fileIO_test_create_ReadStream_014 curOff: ' + curOff);
        expect(curOff == 5).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_ReadStream_014 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_014
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1400
     * @tc.desc   Test the createWriteStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_014');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let WriteStream = fs.createWriteStream(fpath);
        let curOff = WriteStream.seek();
        expect(false).assertTrue();
      } catch (e) {
        fs.unlinkSync(fpath);
        console.log('fileIO_test_create_ReadStream_014 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_015
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1500
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_015');
      let wpath = await nextFileName('fileIO_test_create_ReadStream_015');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(prepareFile(wpath, '')).assertTrue();

      try {
        let rs = fs.createReadStream(fpath);
        let ws = fs.createWriteStream(wpath, 0);
        let rsSize = 0;
        rs.on('data', (emitData) => {
          let data = emitData?.data;
          ws.write(data);
          rsSize = rsSize + data?.length;
          console.log('fileIO_test_create_ReadStream_015 content ' + data.slice(0, 10) + ', data.length: ' + data?.length);
          let filesize = fs.lstatSycn(wpath).size;
          console.log('fileIO_test_create_ReadStream_015 rsSize ' + rsSize + ', filesize: ' + filesize);
          expect(rsSize == filesize).assertTrue();
          rs.close();
          ws.close();
        });
        fs.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_ReadStream_015 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_016
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1600
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_016');
      let wpath = await nextFileName('fileIO_test_create_ReadStream_016');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(prepareFile(wpath, '')).assertTrue();

      try {
        let rs = fs.createReadStream(fpath);
        let ws = fs.createWriteStream(wpath, 0o2);
        let rsSize = 0;
        rs.on('data', (emitData) => {
          let data = emitData?.data;
          ws.write(data);
          rsSize = rsSize + data?.length;
          console.log('fileIO_test_create_ReadStream_016 content ' + data.slice(0, 10) + ', data.length: ' + data?.length);
          let filesize = fs.lstatSycn(wpath).size;
          console.log('fileIO_test_create_ReadStream_016 rsSize ' + rsSize + ', filesize: ' + filesize);
          expect(rsSize == filesize).assertTrue();
          rs.close();
          ws.close();
        });
        fs.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_ReadStream_016 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_017
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1700
     * @tc.desc   Test the createWriteStream() interface of class Stream. WriteStream.seek is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_017');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let WriteStream = fs.createWriteStream(fpath);
        let curOff = WriteStream.seek(null, fs.WhenceType.SEEK_SET);
        console.log('fileIO_test_create_ReadStream_017 curOff: ' + curOff);
        expect().assertFail();
      } catch (e) {
        fs.unlinkSync(fpath);
        console.log('fileIO_test_create_ReadStream_017 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_018
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1800
     * @tc.desc   Test the createWriteStream() interface of class Stream. WriteStream.seek is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
      let fpath = await nextFileName('fileIO_test_create_ReadStream_018');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let WriteStream = fs.createWriteStream(fpath);
        let curOff = WriteStream.seek(undefined, fs.WhenceType.SEEK_SET);
        console.log('fileIO_test_create_ReadStream_018 curOff: ' + curOff);
        expect().assertFail();
      } catch (e) {
        fs.unlinkSync(fpath);
        console.log('fileIO_test_create_ReadStream_018 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
  })
}
