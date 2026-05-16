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

let domain: int = 0x0000;
let tag: string = 'testTag';
export const FILE_CONTENT: string = 'hello world';

export default function fileIOFileMappingStatic() {
  describe('fileIO_fs_filemapping_static', (): void => {

    /**
     * @tc.name   fileIO_test_mmap_sync_static_000
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_STATIC_0000
     * @tc.desc   Test mmapSync() interfaces. mode=READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_mmap_sync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_000 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_static_001
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_STATIC_0100
     * @tc.desc   Test mmapSync() interfaces. mode=READ_ONLY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_mmap_sync_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_ONLY, 0, 11);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_001 capacity ' + mapping.capacity());
        expect(mapping.capacity() === 11).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_static_002
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_STATIC_0200
     * @tc.desc   Test mmapSync() interfaces. mode=PRIVATE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_mmap_sync_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.PRIVATE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_002 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_static_003
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_STATIC_0300
     * @tc.desc   Test mmapSync() interfaces. Using fd instead of File object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_003 start');
      let fpath = await Utils.nextFileName('fileIO_test_mmap_sync_static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file.fd, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_003 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_static_004
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_STATIC_0400
     * @tc.desc   Test mmapSync() interfaces. Invalid fd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_004 start');
      try {
        fs.mmapSync(-1, fs.MappingMode.READ_WRITE, 0, 1024);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_004 has failed for' + JSON.stringify(e));
        expect(e.code === 13900008 || e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_static_005
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_STATIC_0500
     * @tc.desc   Test mmapSync() interfaces. Invalid offset (negative).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_005 start');
      let fpath = await Utils.nextFileName('fileIO_test_mmap_sync_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.mmapSync(file, fs.MappingMode.READ_WRITE, -1, 1024);
        expect(false).assertTrue();
      } catch (e) {      
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_005 has failed for' + JSON.stringify(e));
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_static_006
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_STATIC_0600
     * @tc.desc   Test mmapSync() interfaces. Invalid size (negative) size = 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_006 start');
      let fpath = await Utils.nextFileName('fileIO_test_mmap_sync_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 0);
        expect(false).assertTrue();
      } catch (e) {
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_006 has failed for' + JSON.stringify(e));
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_static_007
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_STATIC_0700
     * @tc.desc   Test mmapSync() interfaces. Invalid size (negative) size = -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_007 start');
      let fpath = await Utils.nextFileName('fileIO_test_mmap_sync_static_007');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, -1);
        expect(false).assertTrue();
      } catch (e) {       
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_007 has failed for' + JSON.stringify(e));
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_static_008
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_STATIC_0800
     * @tc.desc   Test mmapSync() with offset exceeding file size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_008 start');
      let fpath = await Utils.nextFileName('fileIO_test_mmap_sync_static_008');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 4096, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_008 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_sync_static_008 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });


    /**
     * @tc.name   fileIO_test_mmap_async_static_001
     * @tc.number SUB_DF_FILEIO_MMAP_ASYNC_STATIC_0100
     * @tc.desc   Test mmap() interfaces. mode=READ_ONLY. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_async_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_mmap_async_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = await fs.mmap(file, fs.MappingMode.READ_ONLY, 0, 11);
		    hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_async_static_001 capacity' + mapping.capacity());
        expect(mapping.capacity() === 11).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_async_static_002
     * @tc.number SUB_DF_FILEIO_MMAP_ASYNC_STATIC_0200
     * @tc.desc   Test mmap() interfaces. mode=PRIVATE. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_async_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_mmap_async_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.mmap(file, fs.MappingMode.PRIVATE, 0, 1024).then((mapping: fs.FileMapping): void => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_async_static_002 capacity' + mapping.capacity());
          expect(mapping.capacity() === 1024).assertTrue();
          mapping.unmapSync();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_async_static_002 error: ' + JSON.stringify(err));
          expect(false).assertTrue();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mmap_async_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });


    /**
     * @tc.name   fileIO_test_setPosition_static_000
     * @tc.number SUB_DF_FILEIO_SETPOSITION_STATIC_0000
     * @tc.desc   Test setPosition() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setPosition_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_setPosition_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_setPosition_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_setPosition_static_000 capacity' + mapping.capacity() );
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.setPosition(100);
        let pos = mapping.getPosition();
        expect(pos === 100).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_setPosition_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_setPosition_static_001
     * @tc.number SUB_DF_FILEIO_SETPOSITION_STATIC_0100
     * @tc.desc   Test setPosition() interfaces. Invalid position (negative).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setPosition_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_setPosition_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_setPosition_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      try {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_setPosition_static_001 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.setPosition(-1);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_setPosition_static_001 has failed for' + JSON.stringify(e));
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_setPosition_static_002
     * @tc.number SUB_DF_FILEIO_SETPOSITION_STATIC_0200
     * @tc.desc   Test setPosition() interfaces. Position exceeds limit.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setPosition_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_setPosition_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_setPosition_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_setPosition_static_002 capacity' + mapping.capacity());
      try {
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.setPosition(2000);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_setPosition_static_002 has failed for' + JSON.stringify(e));
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_getPosition_static_000
     * @tc.number SUB_DF_FILEIO_GETPOSITION_STATIC_0000
     * @tc.desc   Test getPosition() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_getPosition_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_getPosition_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_getPosition_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_getPosition_static_000 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        let pos = mapping.getPosition();
        expect(pos === 0).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_getPosition_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_capacity_static_000
     * @tc.number SUB_DF_FILEIO_CAPACITY_STATIC_0000
     * @tc.desc   Test capacity() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_capacity_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_capacity_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_capacity_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_capacity_static_000 capacity' + mapping.capacity());
        let cap = mapping.capacity();
        expect(cap === 1024).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_capacity_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_setLimit_static_000
     * @tc.number SUB_DF_FILEIO_SETLIMIT_STATIC_0000
     * @tc.desc   Test setLimit() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setLimit_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_setLimit_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_setLimit_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_setLimit_static_000 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.setLimit(512);
        let lim = mapping.getLimit();
        expect(lim === 512).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_setLimit_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_setLimit_static_001
     * @tc.number SUB_DF_FILEIO_SETLIMIT_STATIC_0100
     * @tc.desc   Test setLimit() interfaces. Invalid limit (negative).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setLimit_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_setLimit_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_setLimit_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_setLimit_static_001 capacity' + mapping.capacity());
      try {
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.setLimit(-1);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_setLimit_static_001 has failed for' + JSON.stringify(e));
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_setLimit_static_002
     * @tc.number SUB_DF_FILEIO_SETLIMIT_STATIC_0200
     * @tc.desc   Test setLimit() interfaces. Limit exceeds capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setLimit_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_setLimit_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_setLimit_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_setLimit_static_002 capacity' + mapping.capacity());
      try {
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.setLimit(2000);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_setLimit_static_002 has failed for' + JSON.stringify(e));
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_getLimit_static_000
     * @tc.number SUB_DF_FILEIO_GETLIMIT_STATIC_0000
     * @tc.desc   Test getLimit() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_getLimit_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_getLimit_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_getLimit_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_getLimit_static_000 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        let lim = mapping.getLimit();
        expect(lim === 1024).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_getLimit_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_flip_static_000
     * @tc.number SUB_DF_FILEIO_FLIP_STATIC_0000
     * @tc.desc   Test flip() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_flip_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_flip_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_flip_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_flip_static_000 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.setPosition(50);
        mapping.flip();
        let pos = mapping.getPosition();
        let lim = mapping.getLimit();
        expect(pos === 0).assertTrue();
        expect(lim === 50).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_flip_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_remaining_static_000
     * @tc.number SUB_DF_FILEIO_REMAINING_STATIC_0000
     * @tc.desc   Test remaining() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_remaining_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_remaining_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_remaining_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_remaining_static_000 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.setPosition(100);
        let rem = mapping.remaining();
        expect(rem === 924).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_remaining_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_buffer_static_000
     * @tc.number SUB_DF_FILEIO_READ_BUFFER_STATIC_0000
     * @tc.desc   Test read(buffer) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_buffer_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_buffer_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_read_buffer_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_buffer_static_000 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesRead = mapping.read(buffer);
        expect(bytesRead === 100).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_buffer_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_buffer_static_001
     * @tc.number SUB_DF_FILEIO_READ_BUFFER_STATIC_0100
     * @tc.desc   Test read(buffer, length) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_buffer_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_buffer_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_read_buffer_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_buffer_static_001 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesRead = mapping.read(buffer, 50);
        expect(bytesRead === 50).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_buffer_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_position_static_000
     * @tc.number SUB_DF_FILEIO_READ_POSITION_STATIC_0000
     * @tc.desc   Test read(position, buffer) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_position_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_position_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_read_position_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_position_static_000 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesRead = mapping.read(50, buffer);
        expect(bytesRead === 100).assertTrue();
        let pos = mapping.getPosition();
        expect(pos === 0).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_position_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_position_static_001
     * @tc.number SUB_DF_FILEIO_READ_POSITION_STATIC_0100
     * @tc.desc   Test read(position, buffer, length) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_position_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_position_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_read_position_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_position_static_001 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesRead = mapping.read(50, buffer, 50);
        expect(bytesRead === 50).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_position_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_error_static_000
     * @tc.number SUB_DF_FILEIO_READ_ERROR_STATIC_0000
     * @tc.desc   Test read() interfaces. Invalid position (negative).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_error_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_error_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_read_error_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_error_static_000 capacity' + mapping.capacity());
      try { 
        expect(mapping.capacity() === 1024).assertTrue();
        let buffer = new ArrayBuffer(100);
        mapping.read(-1, buffer);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_error_static_000 has failed for' + JSON.stringify(e));
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_read_error_static_001
     * @tc.number SUB_DF_FILEIO_READ_ERROR_STATIC_0100
     * @tc.desc   Test read() interfaces. Position exceeds limit.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_error_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_error_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_read_error_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_error_static_001 capacity' + mapping.capacity());
      try {
        expect(mapping.capacity() === 1024).assertTrue();
        let buffer = new ArrayBuffer(100);
        mapping.read(2000, buffer);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_error_static_001 has failed for' + JSON.stringify(e));
        expect(e.code === 13900051 || e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_read_error_static_002
     * @tc.number SUB_DF_FILEIO_READ_ERROR_STATIC_0200
     * @tc.desc   Test read() after unmap .Error code 13900052
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_error_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_error_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_read_error_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_error_static_002 capacity' + mapping.capacity());
      try {
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.unmapSync();
        let buffer = new ArrayBuffer(100);
        mapping.read(2000, buffer);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_error_static_002 has failed for' + JSON.stringify(e));
        expect(e.code === 13900052).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_write_buffer_static_000
     * @tc.number SUB_DF_FILEIO_WRITE_BUFFER_STATIC_0000
     * @tc.desc   Test write(buffer) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_buffer_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_buffer_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_buffer_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_buffer_static_000 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesWritten = mapping.write(buffer);
        expect(bytesWritten === 100).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_buffer_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_buffer_static_001
     * @tc.number SUB_DF_FILEIO_WRITE_BUFFER_STATIC_0100
     * @tc.desc   Test write(buffer, length) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_buffer_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_buffer_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_buffer_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_buffer_static_001 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesWritten = mapping.write(buffer, 50);
        expect(bytesWritten === 50).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_buffer_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_position_static_000
     * @tc.number SUB_DF_FILEIO_WRITE_POSITION_STATIC_0000
     * @tc.desc   Test write(position, buffer) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_position_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_position_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_position_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_position_static_000 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesWritten = mapping.write(50, buffer);
        expect(bytesWritten === 100).assertTrue();
        let pos = mapping.getPosition();
        expect(pos === 0).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_position_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_position_static_001
     * @tc.number SUB_DF_FILEIO_WRITE_POSITION_STATIC_0100
     * @tc.desc   Test write(position, buffer, length) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_position_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_position_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_position_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_position_static_001 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesWritten = mapping.write(50, buffer, 50);
        expect(bytesWritten === 50).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_position_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_error_static_000
     * @tc.number SUB_DF_FILEIO_WRITE_ERROR_STATIC_0000
     * @tc.desc   Test write() interfaces. READ_ONLY mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_error_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_error_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_error_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_ONLY, 0, 11);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_error_static_000 capacity' + mapping.capacity());
      try {
        expect(mapping.capacity() === 11).assertTrue();
        let buffer = new ArrayBuffer(100);
        mapping.write(buffer);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_error_static_000 has failed for' + JSON.stringify(e));
        expect(e.code === 13900053).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_write_error_static_001
     * @tc.number SUB_DF_FILEIO_WRITE_ERROR_STATIC_0100
     * @tc.desc   Test write() interfaces. Invalid position (negative).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_error_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_error_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_error_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_error_static_001 capacity' + mapping.capacity());
      try {
        expect(mapping.capacity() === 1024).assertTrue();
        let buffer = new ArrayBuffer(100);
        mapping.write(-1, buffer);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_error_static_001 has failed for' + JSON.stringify(e));
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_write_error_static_002
     * @tc.number SUB_DF_FILEIO_WRITE_ERROR_STATIC_0200
     * @tc.desc   Test write() after unmap. Error code 13900052
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_error_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_error_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_error_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_error_static_002 capacity' + mapping.capacity());
      try {
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.unmapSync();
        let buffer = new ArrayBuffer(100);
        mapping.write(buffer);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_error_static_002 has failed for' + JSON.stringify(e));
        expect(e.code === 13900052).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });



    /**
     * @tc.name   fileIO_test_msync_static_000
     * @tc.number SUB_DF_FILEIO_MSYNC_STATIC_0000
     * @tc.desc   Test msync() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msync_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_msync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msync_static_000 capacity' + mapping.capacity());
      try {
        expect(mapping.capacity() === 1024).assertTrue();
        let buffer = new ArrayBuffer(100);
        mapping.write(buffer);
        await mapping.msync();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_msync_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }finally{
        if(mapping) mapping.unmapSync();
        if(file) fs.closeSync(file);
        if(fpath) fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_msync_static_001
     * @tc.number SUB_DF_FILEIO_MSYNC_STATIC_0100
     * @tc.desc   Test msync(position, length) interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msync_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_msync_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msync_static_001 capacity' + mapping.capacity());
      try { 
        expect(mapping.capacity() === 1024).assertTrue();
        let buffer = new ArrayBuffer(100);
        mapping.write(50, buffer);
        await mapping.msync(50, 100);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_msync_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }finally{
        if(mapping) mapping.unmapSync();
        if(file)  fs.closeSync(file);
        if(fpath)  fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_msync_error_static_000
     * @tc.number SUB_DF_FILEIO_MSYNC_ERROR_STATIC_0000
     * @tc.desc   Test msync() interfaces. Invalid position.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msync_error_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msync_error_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_msync_error_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msync_error_static_000 capacity' + mapping.capacity());
      try {
        expect(mapping.capacity() === 1024).assertTrue();
        await mapping.msync(-1, 100);
        expect(false).assertTrue();
        } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_msync_error_static_000 has failed for' + JSON.stringify(e));
        expect(e.code === 13900020).assertTrue();
      }finally{
        if(mapping) mapping.unmapSync();
        if(file)  fs.closeSync(file);
        if(fpath)  fs.unlinkSync(fpath);
      } 
    });

    /**
     * @tc.name   fileIO_test_msync_error_static_001
     * @tc.number SUB_DF_FILEIO_MSYNC_ERROR_STATIC_0100
     * @tc.desc   Test msync() interfaces. Invalid length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msync_error_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msync_error_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_msync_error_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msync_error_static_001 capacity' + mapping.capacity());
      try { 
        expect(mapping.capacity() === 1024).assertTrue();
        await mapping.msync(0, -1);
        expect(false).assertTrue();
        }catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_msync_error_static_001 has failed for' + JSON.stringify(e));
        expect(e.code === 13900020).assertTrue();
      }finally{
        if(mapping) mapping.unmapSync();
        if(file)  fs.closeSync(file);
        if(fpath)  fs.unlinkSync(fpath);
      } 
    });

    /**
     * @tc.name   fileIO_test_msyncSync_static_000
     * @tc.number SUB_DF_FILEIO_MSYNCSYNC_STATIC_0000
     * @tc.desc   Test msyncSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msyncSync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msyncSync_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_msyncSync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msyncSync_static_000 capacity' + mapping.capacity());
      try {
        expect(mapping.capacity() === 1024).assertTrue();
        let buffer = new ArrayBuffer(100);
        mapping.write(buffer);
        mapping.msyncSync();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_msyncSync_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_msyncSync_static_001
     * @tc.number SUB_DF_FILEIO_MSYNCSYNC_STATIC_0100
     * @tc.desc   Test msyncSync(position, length) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msyncSync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msyncSync_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_msyncSync_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msyncSync_static_001 capacity' + mapping.capacity());
      try {
        expect(mapping.capacity() === 1024).assertTrue();
        let buffer = new ArrayBuffer(100);
        mapping.write(50, buffer);
        mapping.msyncSync(50, 100);
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_msyncSync_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_msyncSync_error_static_000
     * @tc.number SUB_DF_FILEIO_MSYNCSYNC_ERROR_STATIC_0000
     * @tc.desc   Test msyncSync() interfaces. Invalid position.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msyncSync_error_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msyncSync_error_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_msyncSync_error_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msyncSync_error_static_000 capacity' + mapping.capacity());
      try {
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.msyncSync(-1, 100);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_msyncSync_error_static_000 has failed for' + JSON.stringify(e));
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_msyncSync_error_static_001
     * @tc.number SUB_DF_FILEIO_MSYNCSYNC_ERROR_STATIC_0100
     * @tc.desc   Test msyncSync() interfaces. Invalid length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msyncSync_error_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msyncSync_error_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_msyncSync_error_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_msyncSync_error_static_001 capacity' + mapping.capacity());
      try {
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.msyncSync(0, -1);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_msyncSync_error_static_001 has failed for' + JSON.stringify(e));
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_unmap_static_000
     * @tc.number SUB_DF_FILEIO_UNMAP_STATIC_0000
     * @tc.desc   Test unmap() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_unmap_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_unmap_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();
      let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_static_000 capacity' + mapping.capacity());
      try { 
        expect(mapping.capacity() === 1024).assertTrue();
        await mapping.unmap();
        }catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }finally{
        if(file)  fs.closeSync(file);
        if(fpath)  fs.unlinkSync(fpath);
      } 
    });

    /**
     * @tc.name   fileIO_test_unmapSync_static_000
     * @tc.number SUB_DF_FILEIO_UNMAPSYNC_STATIC_0000
     * @tc.desc   Test unmapSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_unmapSync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmapSync_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_unmapSync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmapSync_static_000 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.unmapSync();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmapSync_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_unmap_released_static_000
     * @tc.number SUB_DF_FILEIO_UNMAP_RELEASED_STATIC_0000
     * @tc.desc   Test access after unmap. Error code 13900052.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_unmap_released_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_unmap_released_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_000 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.unmapSync();
        mapping.getPosition();
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_000 has failed for' + JSON.stringify(e));
        expect(e.code === 13900052).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_unmap_released_static_001
     * @tc.number SUB_DF_FILEIO_UNMAP_RELEASED_STATIC_0100
     * @tc.desc   Test read after unmap. Error code 13900052.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_unmap_released_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_unmap_released_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_001 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.unmapSync();
        let buffer = new ArrayBuffer(100);
        mapping.read(buffer);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_001 has failed for' + JSON.stringify(e));
        expect(e.code === 13900052).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_unmap_released_static_002
     * @tc.number SUB_DF_FILEIO_UNMAP_RELEASED_STATIC_0200
     * @tc.desc   Test write after unmap. Error code 13900052.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_unmap_released_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_unmap_released_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_002 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.unmapSync();
        let buffer = new ArrayBuffer(100);
        mapping.write(buffer);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_002 has failed for' + JSON.stringify(e));
        expect(e.code === 13900052).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_unmap_released_static_003
     * @tc.number SUB_DF_FILEIO_UNMAP_RELEASED_STATIC_0300
     * @tc.desc   Test flip after unmap. Error code 13900052.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_unmap_released_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_003 start');
      let fpath = await Utils.nextFileName('fileIO_test_unmap_released_static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_003 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.unmapSync();
        mapping.flip();
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_003 has failed for' + JSON.stringify(e));
        expect(e.code === 13900052).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_unmap_released_static_004
     * @tc.number SUB_DF_FILEIO_UNMAP_RELEASED_STATIC_0400
     * @tc.desc   Test remaining after unmap. Error code 13900052.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_unmap_released_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_004 start');
      let fpath = await Utils.nextFileName('fileIO_test_unmap_released_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_004 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.unmapSync();
        mapping.remaining();
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_004 has failed for' + JSON.stringify(e));
        expect(e.code === 13900052).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_unmap_released_static_005
     * @tc.number SUB_DF_FILEIO_UNMAP_RELEASED_STATIC_0500
     * @tc.desc   Test getLimit after unmap. Error code 13900052.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_unmap_released_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_005 start');
      let fpath = await Utils.nextFileName('fileIO_test_unmap_released_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_005 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.unmapSync();
        mapping.getLimit();
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_005 has failed for' + JSON.stringify(e));
        expect(e.code === 13900052).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_unmap_released_static_006
     * @tc.number SUB_DF_FILEIO_UNMAP_RELEASED_STATIC_0600
     * @tc.desc   Test capacity after unmap. Error code 13900052.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_unmap_released_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_006 start');
      let fpath = await Utils.nextFileName('fileIO_test_unmap_released_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let mapping = fs.mmapSync(file, fs.MappingMode.READ_WRITE, 0, 1024);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_006 capacity' + mapping.capacity());
        expect(mapping.capacity() === 1024).assertTrue();
        mapping.unmapSync();
        mapping.capacity();
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unmap_released_static_006 has failed for' + JSON.stringify(e));
        expect(e.code === 13900052).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      }
    });

  });
}