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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import fileHash from '@ohos.file.hash';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';

export default function fileIOHash() {
  describe("fileIO_fs_hash", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_hash start');

    /**
     * @tc.name   fileIO_test_hash_async_static_000
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0000
     * @tc.desc   Test hash() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_hash_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let str = await fileHash.hash(fpath,'md5');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_000 hash value is ' + str);
        expect(str == '5EB63BBBE01EEED093CB22BB8F5ACDC3').assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_hash_async_static_001
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0100
     * @tc.desc   Test hash() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_hash_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileHash.hash(fpath, "md5", (err: BusinessError | null, str: string | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_001 error package: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_001 hash value is ' + str);
          expect(str == '5EB63BBBE01EEED093CB22BB8F5ACDC3').assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_hash_async_static_002
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0200
     * @tc.desc   Test hash() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_hash_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let str = await fileHash.hash(fpath,'sha1');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_002 hash value is ' + str);
        expect(str == '2AAE6C35C94FCFB415DBE95F408B9CE91EE846ED').assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_hash_async_static_003
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0300
     * @tc.desc   Test hash() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_hash_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_003 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileHash.hash(fpath, "sha1", (err: BusinessError | null, str: string | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_003 error package: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_003 hash value is ' + str);
          expect(str == '2AAE6C35C94FCFB415DBE95F408B9CE91EE846ED').assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_hash_async_static_004
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0400
     * @tc.desc   Test hash() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_hash_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_004 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let str = await fileHash.hash(fpath,'sha256');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_004 hash value is ' + str);
        expect(str == 'B94D27B9934D3E08A52E52D7DA7DABFAC484EFE37A5380EE9088F7ACE2EFCDE9').assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_hash_async_static_005
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0500
     * @tc.desc   Test hash() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_hash_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_005 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileHash.hash(fpath, "sha256", (err: BusinessError | null, str: string | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_005 error package: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_005 hash value is ' + str);
          expect(str == 'B94D27B9934D3E08A52E52D7DA7DABFAC484EFE37A5380EE9088F7ACE2EFCDE9').assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_hash_async_static_006
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0600
     * @tc.desc   Test hash() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_hash_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_006 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let str = await fileHash.hash(fpath,'256');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_006 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        fs.unlinkSync(fpath);
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_hash_async_static_007
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0700
     * @tc.desc   Test hash() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_hash_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_007 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_async_static_007');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileHash.hash(fpath, "256", (err: BusinessError | null, str: string | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_007 has error for' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            fs.unlinkSync(fpath);
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_async_static_007 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_hash_createHash_static_008
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0800
     * @tc.desc   Test createHash() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_hash_createHash_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_createHash_static_008 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_createHash_static_008');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let rs = fs.createReadStream(fpath);
        let hsMd5 = fileHash.createHash('md5');
        rs.on('data', (emitData: buffer.Buffer|string) => {
          let a = emitData;
          if (a == undefined) {
            return;
          }
          if(a instanceof Record){
            return;
          }
          const data:string = a.toString();
          let b = data.split('').map((x):double => x.charCodeAt(0));
          hsMd5.update(new Uint8Array(b).buffer);
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_createHash_static_008 readlen ' + data?.length + ', content: ' + data?.slice(0, 10));
        });
        rs.on('close', async () => {
          const ret = await fileHash.hash(fpath, 'md5');
          const streamHash = hsMd5.digest();
          hilog.info(domain, tag, '%{public}s', `fileIO_test_hash_createHash_static_008 hashResult: ${streamHash}, fileHash: ${ret}`);
          expect(streamHash == ret).assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_createHash_static_008 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_hash_createHash_static_009
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_0900
     * @tc.desc   Test createHash() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_hash_createHash_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_createHash_static_009 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_createHash_static_009');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let rs = fs.createReadStream(fpath);
        let hsSha1 = fileHash.createHash('sha1');
        rs.on('data', (emitData: buffer.Buffer|string) => {
          let a = emitData;
          if (a == undefined) {
            return;
          }
          if(a instanceof Record){
            return;
          }
          const data:string = a.toString();
          let b = data.split('').map((x):double => x.charCodeAt(0));
          hsSha1.update(new Uint8Array(b).buffer);
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_createHash_static_009 readlen ' + data?.length + ', content: ' + data?.slice(0, 10));
        });
        rs.on('close', async () => {
          const ret = await fileHash.hash(fpath, 'sha1');
          const streamHash = hsSha1.digest();
          hilog.info(domain, tag, '%{public}s', `fileIO_test_hash_createHash_static_009 hashResult: ${streamHash}, fileHash: ${ret}`);
          expect(streamHash == ret).assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_createHash_static_009 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_hash_createHash_static_010
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1000
     * @tc.desc   Test createHash() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_hash_createHash_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_createHash_static_010 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_createHash_static_010');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let rs = fs.createReadStream(fpath);
        let hsSha256 = fileHash.createHash('sha256');
        rs.on('data', (emitData: buffer.Buffer|string) => {
          let a = emitData;
          if (a == undefined) {
            return;
          }
          if(a instanceof Record){
            return;
          }
          const data:string = a.toString();
          let b = data.split('').map((x):double => x.charCodeAt(0));
          hsSha256.update(new Uint8Array(b).buffer);
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_createHash_static_010 readlen ' + data?.length + ', content: ' + data?.slice(0, 10));
        });
        rs.on('close', async () => {
          const ret = await fileHash.hash(fpath, 'sha256');
          const streamHash = hsSha256.digest();
          hilog.info(domain, tag, '%{public}s', `fileIO_test_hash_createHash_static_010 hashResult: ${streamHash}, fileHash: ${ret}`);
          expect(streamHash == ret).assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_createHash_static_010 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_hash_createHash_static_011
     * @tc.number SUB_DF_FILEIO_HASH_ASYNC_1100
     * @tc.desc   Test createHash() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_hash_createHash_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_createHash_static_011 start');
      let fpath = await Utils.nextFileName('fileIO_test_hash_createHash_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let rs = fs.createReadStream(fpath);
        let hsSha256 = fileHash.createHash('123');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_hash_createHash_static_011 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_hash end');

}