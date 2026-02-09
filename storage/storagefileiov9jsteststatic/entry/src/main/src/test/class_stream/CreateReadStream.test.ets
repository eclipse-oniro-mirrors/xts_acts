/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import { WriteStreamOptions } from '@ohos.file.fs';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fscreateReadStream() {
  describe('fileIO_fs_create_stream', (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_create_stream start');

    /**
     * @tc.name   fileIO_test_create_ReadStream_static_004
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0400
     * @tc.desc   Test the createWriteStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_create_ReadStream_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let WriteStream = fs.createWriteStream(fpath, undefined);
        let wb = WriteStream.bytesWritten;
        let wpath = WriteStream.path;
        expect(await Utils.isIntNum(wb)).assertTrue();
        expect(wpath == fpath).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   fileIO_test_create_ReadStream_static_005
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0500
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_create_ReadStream_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        fs.createWriteStream("");
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_005 has failed for' + e.code);
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    })

    /**
     * @tc.name   fileIO_test_create_ReadStream_static_006
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0600
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_create_ReadStream_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let ReadStream = fs.createReadStream(fpath, undefined);
        let rb = ReadStream.bytesRead;
        let rpath = ReadStream.path;
        expect(await Utils.isIntNum(rb)).assertTrue();
        expect(rpath == fpath).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_006 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   fileIO_test_create_ReadStream_static_007
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0700
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_create_ReadStream_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        fs.createReadStream("");
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_007 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    })

    /**
     * @tc.name   fileIO_test_create_ReadStream_static_008
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0800
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_create_ReadStream_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_008');
      try {
        let start = 1;
        let end = 11;
        let rs = fs.createReadStream(fpath, { start, end });
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_008 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    })

    /**
     * @tc.name   fileIO_test_create_ReadStream_static_009
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0900
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_create_ReadStream_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        fs.createWriteStream("-1");
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_009 has failed for' + JSON.stringify(e));
        expect(e.code == 13900012 && e.message == 'Permission denied').assertTrue();
      }
    })

    /**
     * @tc.name   fileIO_test_create_ReadStream_static_010
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1000
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_create_ReadStream_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_010');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let ReadStream = fs.createReadStream(fpath);
        let rb = ReadStream.bytesRead;
        let rpath = ReadStream.path;
        expect(await Utils.isIntNum(rb)).assertTrue();
        expect(rpath == fpath).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_010 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   fileIO_test_create_ReadStream_static_011
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1100
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_create_ReadStream_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let ReadStream = fs.createReadStream(fpath);
        let offset = 5;
        let curoff = ReadStream.seek(offset, fs.WhenceType.SEEK_SET);
        expect(offset == curoff).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_011 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   fileIO_test_create_ReadStream_static_012
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1200
     * @tc.desc   Test the createWriteStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_create_ReadStream_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_012');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let WriteStream = fs.createWriteStream(fpath);
        let wb = WriteStream.bytesWritten;
        let wpath = WriteStream.path;
        expect(await Utils.isIntNum(wb)).assertTrue();
        expect(wpath == fpath).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_012 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   fileIO_test_create_ReadStream_static_013
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1300
     * @tc.desc   Test the createWriteStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
        let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_013');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
          let WriteStream = fs.createWriteStream(fpath);
          let curOff = WriteStream.seek(5, fs.WhenceType.SEEK_SET);
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_013 curOff: ' + curOff);
          expect(curOff == 5).assertTrue();
          fs.unlinkSync(fpath);
        } catch (e) {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_013 has failed for ' + e.message + ', code: ' + e.code);
          expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_static_014
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1400
     * @tc.desc   Test the createWriteStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_014');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let WriteStream = fs.createWriteStream(fpath);
        let curOff = WriteStream.seek(5);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_014 curOff: ' + curOff);
        expect(curOff == 5).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_014 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_static_015
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1500
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_015');
      let wpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_015_01');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(wpath, '')).assertTrue();
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_015 fpath :' + fpath);


      try {
        let rs = fs.createReadStream(fpath);
        let writestreamoptions : WriteStreamOptions = {
          start : 0
        }
        let ws = fs.createWriteStream(wpath, writestreamoptions);
        rs.on('readable', () => {
          const data = rs.read();
          if (data == null) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_015 null');
            return;
          }
          let contest = data.toString();
          let callbackCalled = false;
          ws.on('error', (): void => {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_015 writable event test', callbackCalled.toString());
          });
          ws.write(contest, 'utf8', () => {
            let wb = ws.bytesWritten;
            expect(wb == FILE_CONTENT.length).assertTrue();
          })
          rs.close();
          ws.close();
        });
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_015 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_static_016
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1600
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_create_ReadStream_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_016');
      let wpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_016_01');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(wpath, '')).assertTrue();

      try {
        let rs = fs.createReadStream(fpath);
        let writestreamoptions : WriteStreamOptions = {
          mode :  fs.OpenMode.READ_WRITE
        }
        let ws = fs.createWriteStream(wpath, writestreamoptions);
        rs.on('readable', () => {
          const data = rs.read();
          if (data == null) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_016 null');
            return;
          }
          let contest = data.toString();
          let callbackCalled = false;
          ws.on('error', (): void => {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_016 writable event test', callbackCalled.toString());
          });
          ws.write(contest, 'utf8', () => {
            let wb = ws.bytesWritten;
            expect(wb == FILE_CONTENT.length).assertTrue();
          })
          rs.close();
          ws.close();
        });
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_016 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_create_ReadStream_static_017
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1700
     * @tc.desc   Test the createReadStream() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_create_ReadStream_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_017');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let ReadStream = fs.createReadStream(fpath);
        let offset = 5;
        let curoff = ReadStream.seek(offset);
        expect(offset == curoff).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_017 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    })
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_create_stream end');
  })
}
