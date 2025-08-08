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
    fileio, FILE_CONTENT, prepareFile, nextFileName, randomString, isInclude,
    describe, it, expect,
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioRmdir() {
describe('fileio_rmdir', function () {

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_SYNC_0000
     * @tc.name fileio_test_rmdir_sync_000
     * @tc.desc Test rmdirSync() interface.
     * Recursively delete all files and subfolders in a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_sync_000', Level.LEVEL0, async function () {
        let dpath = await nextFileName('fileio_test_rmdir_sync_000') + 'd';
        let fpath = dpath + '/rmdir_sync_000';
        let ddpath = dpath + '/rmdir_sync_000_1d';
        fileio.mkdirSync(dpath);
        fileio.mkdirSync(ddpath);
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fileio.rmdirSync(dpath);
        } catch (err) {
            console.info('fileio_test_rmdir_sync_000 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_SYNC_0100
     * @tc.name fileio_test_rmdir_sync_001
     * @tc.desc Test rmdirSync() interface.
     * Recursively delete all files and subfolders in a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_sync_001', Level.LEVEL0, async function () {
        let dpath = await nextFileName('fileio_test_rmdir_sync_001') + 'd';
        let fpath = dpath + '/rmdir_sync_001';
        let ffpath = dpath + '/rmdir_sync_001_1';
        let ddpath = dpath + '/rmdir_sync_001_1d';
        let fffpath = ddpath + '/rmdir_sync_002';
        fileio.mkdirSync(dpath);
        fileio.mkdirSync(ddpath);
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
        expect(prepareFile(fffpath, FILE_CONTENT)).assertTrue();

        try {
            fileio.rmdirSync(dpath);
        } catch (err) {
            console.info('fileio_test_rmdir_sync_001 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_SYNC_0200
     * @tc.name fileio_test_rmdir_sync_002
     * @tc.desc Test rmdirSync() interface.
     * Recursively delete all files and subfolders in a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_sync_002', Level.LEVEL0, async function () {
        let dpath = await nextFileName('fileio_test_rmdir_sync_002') + 'd';
        fileio.mkdirSync(dpath);
        let fdpath = dpath;

        try {
            for (let i = 0; i < 113; i++) {
                let fpath = dpath + '/f' + randomString(10) + i;
                fileio.openSync(fpath, 0o102, 0o777);
                dpath = dpath + '/d' + randomString(10) + i;
                fileio.mkdirSync(dpath);
            }
            fileio.rmdirSync(fdpath);
        } catch (err) {
            console.info('fileio_test_rmdir_sync_002 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_SYNC_0300
     * @tc.name fileio_test_rmdir_sync_003
     * @tc.desc Test rmdirSync() interface. The path contains ../, normal call.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_sync_003', Level.LEVEL0, async function () {
        let dpath = await nextFileName('../cache/fileio_test_rmdir_sync_003') + 'd';

        try {
            fileio.mkdirSync(dpath);
            fileio.rmdirSync(dpath);
        } catch (err) {
            console.info('fileio_test_rmdir_sync_003 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_SYNC_0400
     * @tc.name fileio_test_rmdir_sync_004
     * @tc.desc Test rmdirSync() interface. Invalid path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_sync_004', Level.LEVEL0, async function () {
        let dpath = await nextFileName('fileio_test_rmdir_sync_004') + 'd';

        try {
            fileio.rmdirSync(dpath);
        } catch (err) {
            console.info('fileio_test_rmdir_sync_004 has failed for ' + err);
            expect(isInclude(err.message, 'No such file or directory')).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_SYNC_0500
     * @tc.name fileio_test_rmdir_sync_005
     * @tc.desc Test rmdirSync() interface. No parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_sync_005', Level.LEVEL0, async function () {
        try {
            fileio.rmdirSync();
        } catch (err) {
            console.info('fileio_test_rmdir_sync_005 has failed for ' + err);
            expect(isInclude(err.message, 'Number of arguments unmatched')).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_SYNC_0600
     * @tc.name fileio_test_rmdir_sync_006
     * @tc.desc Test rmdirSync() interface. Invalid path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_sync_006', Level.LEVEL0, async function () {
        try {
            fileio.rmdirSync('');
        } catch (err) {
            console.info('fileio_test_rmdir_sync_006 has failed for ' + err);
            expect(isInclude(err.message, 'No such file or directory')).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_SYNC_0700
     * @tc.name fileio_test_rmdir_sync_007
     * @tc.desc Test rmdirSync() interface. Not a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_sync_007', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileio_test_rmdir_sync_007');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        try {
            fileio.rmdirSync(fpath);
        } catch (err) {
            console.info('fileio_test_rmdir_sync_007 has failed for ' + err);
            expect(isInclude(err.message, 'Not a directory')).assertTrue();
            fileio.unlinkSync(fpath);
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_ASYNC_0000
     * @tc.name fileio_test_rmdir_async_000
     * @tc.desc Test rmdir() interface, return in promise mode.
     * Recursively delete all files and subfolders in a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_async_000', Level.LEVEL0, async function (done) {
        let dpath = await nextFileName('fileio_test_rmdir_async_000') + 'd';
        fileio.mkdirSync(dpath);
        let fdpath = dpath;

        try {
            for (let i = 0; i < 113; i++) {
                let fpath = dpath + '/f' + randomString(10) + i;
                await fileio.open(fpath, 0o102, 0o777);
                dpath = dpath + '/d' + randomString(10) + i;
                await fileio.mkdir(dpath);
            }
            await fileio.rmdir(fdpath);
            done();
        } catch (err) {
            console.info('fileio_test_rmdir_async_000 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_ASYNC_0100
     * @tc.name fileio_test_rmdir_async_001
     * @tc.desc Test rmdir() interface, return in callback mode.
     * Recursively delete all files and subfolders in a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_async_001', Level.LEVEL0, async function (done) {
        let dpath = await nextFileName('fileio_test_rmdir_async_001') + 'd';
        fileio.mkdirSync(dpath);
        let fdpath = dpath;

        try {
            for (let i = 0; i < 113; i++) {
                let fpath = dpath + '/f' + randomString(10) + i;
                await fileio.open(fpath, 0o102, 0o777);
                dpath = dpath + '/d' + randomString(10) + i;
                await fileio.mkdir(dpath);
            }
            fileio.rmdir(fdpath, function () {
                done();
            });
        } catch (err) {
            console.info('fileio_test_rmdir_async_001 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_ASYNC_0200
     * @tc.name fileio_test_rmdir_async_002
     * @tc.desc Test rmdir() interface, return in promise mode.
     * Recursively delete all files and subfolders in a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_async_002', Level.LEVEL0, async function (done) {
        let dpath = await nextFileName('fileio_test_rmdir_async_002') + 'd';
        let fpath = dpath + '/rmdir_async_002';
        let ddpath = dpath + '/rmdir_async_002_1d';
        fileio.mkdirSync(dpath);
        fileio.mkdirSync(ddpath);
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            await fileio.rmdir(dpath);
            done()
        } catch (err) {
            console.info('fileio_test_rmdir_async_002 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_ASYNC_0300
     * @tc.name fileio_test_rmdir_async_003
     * @tc.desc Test rmdir() interface, return in callback mode.
     * Recursively delete all files and subfolders in a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_async_003', Level.LEVEL0, async function (done) {
        let dpath = await nextFileName('fileio_test_rmdir_async_003') + 'd';
        let fpath = dpath + '/rmdir_async_003';
        let ffpath = dpath + '/rmdir_async_003_1';
        let ddpath = dpath + '/rmdir_async_003_1d';
        let fffpath = ddpath + '/rmdir_async_003_2';
        fileio.mkdirSync(dpath);
        fileio.mkdirSync(ddpath);
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
        expect(prepareFile(fffpath, FILE_CONTENT)).assertTrue();

        try {
            fileio.rmdir(dpath, function () {
                done();
            });
        } catch (err) {
            console.info('fileio_test_rmdir_async_003 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_ASYNC_0400
     * @tc.name fileio_test_rmdir_async_004
     * @tc.desc Test rmdirSync() interface. The path contains ../, normal call.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_async_004', Level.LEVEL0, async function () {
        let dpath = await nextFileName('../cache/fileio_test_rmdir_async_004') + 'd';

        try {
            fileio.mkdirSync(dpath);
            await fileio.rmdir(dpath);
        } catch (err) {
            console.info('fileio_test_rmdir_async_004 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_ASYNC_0500
     * @tc.name fileio_test_rmdir_async_005
     * @tc.desc Test rmdir() interface. Invalid path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
     it('fileio_test_rmdir_async_005', Level.LEVEL0, async function (done) {
        let dpath = await nextFileName('fileio_test_rmdir_async_005') + 'd';

        try {
            await fileio.rmdir(dpath);
        } catch (err) {
            console.info('fileio_test_rmdir_async_005 has failed for ' + err);
            expect(isInclude(err.message, 'No such file or directory')).assertTrue();
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_ASYNC_0600
     * @tc.name fileio_test_rmdir_async_006
     * @tc.desc Test rmdir() interface. Parameter mismatch.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_async_006', Level.LEVEL0, async function (done) {
        let dpath = await nextFileName('fileio_test_rmdir_async_006') + 'd';
        try {
            fileio.rmdir(dpath, '', function() {
            });
        } catch (err) {
            console.info('fileio_test_rmdir_async_006 has failed for ' + err);
            expect(isInclude(err.message, 'Number of arguments unmatched')).assertTrue();
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_ASYNC_0700
     * @tc.name fileio_test_rmdir_async_007
     * @tc.desc Test rmdir() interface. Invalid path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_async_007', Level.LEVEL0, async function (done) {
        try {
            await fileio.rmdir('');
        } catch (err) {
            console.info('fileio_test_rmdir_async_007 has failed for ' + err);
            expect(isInclude(err.message, 'No such file or directory')).assertTrue();
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_RMDIR_ASYNC_0800
     * @tc.name fileio_test_rmdir_async_008
     * @tc.desc Test rmdir() interface. Not a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_rmdir_async_008', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileio_test_rmdir_async_008');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        try {
            await fileio.rmdir(fpath);
        } catch (err) {
            console.info('fileio_test_rmdir_async_008 has failed for ' + err);
            expect(isInclude(err.message, 'Not a directory')).assertTrue();
            fileio.unlinkSync(fpath);
            done();
        }
    });
})
}