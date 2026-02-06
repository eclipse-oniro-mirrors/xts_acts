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
    describe, it, expect
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioDirListfile() {
describe('fileio_dir_listfile', function () {

    /**
     * @tc.number SUB_STORAGE_FileIO_DIR_LISTFILE_SYNC_0000
     * @tc.name fileio_test_dir_listfile_sync_000
     * @tc.desc Test Dir listfileSync() interface.
     * List all files and subfolders in the directory directory entry Dirent.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_dir_listfile_sync_000', Level.LEVEL0, async function () {
        let dpath = await nextFileName('fileio_test_dir_listfile_sync_000') + 'd';
        let fpath = dpath + '/listfile_sync_000';
        let ffpath = dpath + '/listfile_async_000_1';
        let ddpath = dpath + '/listfile_sync_000_1d';
        fileio.mkdirSync(dpath);
        fileio.mkdirSync(ddpath);
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();

        try {
            let dir = fileio.opendirSync(dpath);
            let dirents = dir.listfileSync(0);
            for (let i = 0; i < dirents.length; i++) {
                if (dirents[i].isFile()) {
                    console.info('fileio_test_dir_listfile_sync_000 File: ' + dirents[i].name);
                } else if (dirents[i].isDirectory()) {
                    console.info('fileio_test_dir_listfile_sync_000 Directory: ' + dirents[i].name);
                }
            }
            dir.closeSync();
            fileio.rmdirSync(dpath);
        } catch (err) {
            console.info('fileio_test_dir_listfile_sync_000 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_DIR_LISTFILE_SYNC_0100
     * @tc.name fileio_test_dir_listfile_sync_001
     * @tc.desc Test Dir listfileSync() interface.
     * Loop to obtain the files and subfolders directory items in the directory Dirent.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_dir_listfile_sync_001', Level.LEVEL0, async function () {
        let dpath = await nextFileName('fileio_test_dir_listfile_sync_001') + 'd';
        fileio.mkdirSync(dpath);
        let spath = dpath;
        let fdpath = dpath;

        try {
            for (let i = 0; i < 113; i++) {
                let fpath = dpath + '/f' + randomString(10) + i;
                fileio.openSync(fpath, 0o102, 0o777);
                dpath = dpath + '/d' + randomString(10) + i;
                fileio.mkdirSync(dpath);
            }
            let dir = fileio.opendirSync(fdpath);
            let dirents = dir.listfileSync(0);
            while (dirents.length) {
                for (let i = 0; i < dirents.length; i++) {
                    if (dirents[i].isFile()) {
                        console.info('fileio_test_dir_listfile_sync_001 File: ' + dirents[i].name);
                    } else if (dirents[i].isDirectory()) {
                        fdpath = fdpath + '/' + dirents[i].name;
                        console.info('fileio_test_dir_listfile_sync_001 Directory: ' + dirents[i].name);
                    }
                }
                dir = fileio.opendirSync(fdpath);
                dirents = dir.listfileSync(0);
            }
            fileio.rmdirSync(spath);
        } catch (err) {
            console.info('fileio_test_dir_listfile_sync_001 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_DIR_LISTFILE_SYNC_0200
     * @tc.name fileio_test_dir_listfile_sync_002
     * @tc.desc Test Dir listfileSync() interface.
     * List the specified number of files and subfolders in the directory Dirent.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_dir_listfile_sync_002', Level.LEVEL0, async function () {
        let dpath = await nextFileName('fileio_test_dir_listfile_sync_002') + 'd';
        let fpath = dpath + '/listfile_sync_002';
        let ffpath = dpath + '/listfile_async_002_1';
        let ddpath = dpath + '/listfile_sync_002_1d';
        fileio.mkdirSync(dpath);
        fileio.mkdirSync(ddpath);
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();

        try {
            let dir = fileio.opendirSync(dpath);
            let dirents = dir.listfileSync(2);
            for (let i = 0; i < dirents.length; i++) {
                if (dirents[i].isFile()) {
                    console.info('fileio_test_dir_listfile_sync_002 File: ' + dirents[i].name);
                } else if (dirents[i].isDirectory()) {
                    console.info('fileio_test_dir_listfile_sync_002 Directory: ' + dirents[i].name);
                }
            }
            dir.closeSync();
            fileio.rmdirSync(dpath);
        } catch (err) {
            console.info('fileio_test_dir_listfile_sync_002 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_DIR_LISTFILE_SYNC_0300
     * @tc.name fileio_test_dir_listfile_sync_003
     * @tc.desc Test Dir listfileSync() interface.
     * List all files and subfolders in the directory directory entry Dirent.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_dir_listfile_sync_003', Level.LEVEL0, async function () {
        let dpath = await nextFileName('fileio_test_dir_listfile_sync_003') + 'd';
        fileio.mkdirSync(dpath);

        try {
            let dir = fileio.opendirSync(dpath);
            let dirents = dir.listfileSync(0);
            expect(dirents.length == 0).assertTrue();
            dir.closeSync();
            fileio.rmdirSync(dpath);
        } catch (err) {
            console.info('fileio_test_dir_listfile_sync_003 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_DIR_LISTFILE_SYNC_0400
     * @tc.name fileio_test_dir_listfile_sync_004
     * @tc.desc Test Dir listfileSync() interface. Invalid listNum.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_dir_listfile_sync_004', Level.LEVEL0, async function () {
        let dpath = await nextFileName('fileio_test_dir_listfile_sync_004') + 'd';
        fileio.mkdirSync(dpath);

        try {
            let dir = fileio.opendirSync(dpath);
            dir.listfileSync(dpath);
        } catch (err) {
            console.info('fileio_test_dir_listfile_sync_004 has failed for ' + err);
            expect(isInclude(err.message, 'Invalid listNum')).assertTrue();
            fileio.rmdirSync(dpath);
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_DIR_LISTFILE_SYNC_0400
     * @tc.name fileio_test_dir_listfile_sync_004
     * @tc.desc Test Dir listfileSync() interface. No parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_dir_listfile_sync_005', Level.LEVEL0, async function () {
        let dpath = await nextFileName('fileio_test_dir_listfile_sync_005') + 'd';
        fileio.mkdirSync(dpath);

        try {
            let dir = fileio.opendirSync(dpath);
            dir.listfileSync();
        } catch (err) {
            console.info('fileio_test_dir_listfile_sync_005 has failed for ' + err);
            expect(isInclude(err.message, 'Number of arguments unmatched')).assertTrue();
            fileio.rmdirSync(dpath);
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_DIR_LISTFILE_ASYNC_0000
     * @tc.name fileio_test_dir_listfile_async_000
     * @tc.desc Test Dir listfile() interface. return in callback mode.
     * List all files and subfolders in the directory directory entry Dirent.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_dir_listfile_async_000', Level.LEVEL0, async function (done) {
        let dpath = await nextFileName('fileio_test_dir_listfile_async_000') + 'd';
        let fpath = dpath + '/listfile_async_000';
        let ffpath = dpath + '/listfile_async_000_1';
        let ddpath = dpath + '/listfile_async_000_1d';
        fileio.mkdirSync(dpath);
        fileio.mkdirSync(ddpath);
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();

        try {
            let dir = fileio.opendirSync(dpath);
            dir.listfile(0, function (err, dirents) {
                for (let i = 0; i < dirents.length; i++) {
                    if (dirents[i].isFile()) {
                        console.info('fileio_test_dir_listfile_async_000 File: ' + dirents[i].name);
                    } else if (dirents[i].isDirectory()) {
                        console.info('fileio_test_dir_listfile_async_000 Directory: ' + dirents[i].name);
                    }
                }
                dir.closeSync();
                fileio.rmdirSync(dpath);
                done();
            });
        } catch (err) {
            console.info('fileio_test_dir_listfile_async_000 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_DIR_LISTFILE_ASYNC_0100
     * @tc.name fileio_test_dir_listfile_async_001
     * @tc.desc Test Dir listfile() interface. return in promise mode.
     * Loop to obtain the files and subfolders directory items in the directory Dirent.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_dir_listfile_async_001', Level.LEVEL0, async function (done) {
        let dpath = await nextFileName('fileio_test_dir_listfile_async_001') + 'd';
        fileio.mkdirSync(dpath);
        let spath = dpath;
        let fdpath = dpath;

        try {
            for (let i = 0; i < 113; i++) {
                let fpath = dpath + '/f' + randomString(10) + i;
                fileio.openSync(fpath, 0o102, 0o777);
                dpath = dpath + '/d' + randomString(10) + i;
                fileio.mkdirSync(dpath);
            }
            let dir = fileio.opendirSync(fdpath);
            let dirents = await dir.listfile(0);
            while (dirents.length) {
                for (let i = 0; i < dirents.length; i++) {
                    if (dirents[i].isFile()) {
                        console.info('fileio_test_dir_listfile_async_001 File: ' + dirents[i].name);
                    } else if (dirents[i].isDirectory()) {
                        fdpath = fdpath + '/' + dirents[i].name;
                        console.info('fileio_test_dir_listfile_async_001 Directory: ' + dirents[i].name);
                    }
                }
                dir = fileio.opendirSync(fdpath);
                dirents = await dir.listfile(0);
            }
            fileio.rmdirSync(spath);
            done();
        } catch (err) {
            console.info('fileio_test_dir_listfile_async_001 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_DIR_LISTFILE_ASYNC_0200
     * @tc.name fileio_test_dir_listfile_async_002
     * @tc.desc Test Dir listfile() interface. return in promise mode.
     * List the specified number of files and subfolders in the directory Dirent.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_dir_listfile_async_002', Level.LEVEL0, async function (done) {
        let dpath = await nextFileName('fileio_test_dir_listfile_async_002') + 'd';
        let fpath = dpath + '/listfile_async_002';
        let ffpath = dpath + '/listfile_async_002_1';
        let ddpath = dpath + '/listfile_async_002_1d';
        fileio.mkdirSync(dpath);
        fileio.mkdirSync(ddpath);
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();

        try {
            let dir = fileio.opendirSync(dpath);
            let dirents = await dir.listfile(2);
            for (let i = 0; i < dirents.length; i++) {
                if (dirents[i].isFile()) {
                    console.info('fileio_test_dir_listfile_async_002 File: ' + dirents[i].name);
                } else if (dirents[i].isDirectory()) {
                    console.info('fileio_test_dir_listfile_async_002 Directory: ' + dirents[i].name);
                }
            }
            dir.closeSync();
            fileio.rmdirSync(dpath);
            done();
        } catch (err) {
            console.info('fileio_test_dir_listfile_async_002 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_DIR_LISTFILE_ASYNC_0300
     * @tc.name fileio_test_dir_listfile_async_003
     * @tc.desc Test Dir listfile() interface. return in promise mode.
     * List all files and subfolders in the directory directory entry Dirent.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_dir_listfile_async_003', Level.LEVEL0, async function (done) {
        let dpath = await nextFileName('fileio_test_dir_listfile_async_003') + 'd';
        fileio.mkdirSync(dpath);

        try {
            let dir = fileio.opendirSync(dpath);
            let dirents = await dir.listfile(0);
            expect(dirents.length == 0).assertTrue();
            dir.closeSync();
            fileio.rmdirSync(dpath);
            done();
        } catch (err) {
            console.info('fileio_test_dir_listfile_async_003 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_DIR_LISTFILE_ASYNC_0400
     * @tc.name fileio_test_dir_listfile_async_004
     * @tc.desc Test Dir listfile() interface. Invalid listNum.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_dir_listfile_async_004', Level.LEVEL0, async function (done) {
        let dpath = await nextFileName('fileio_test_dir_listfile_async_004') + 'd';
        fileio.mkdirSync(dpath);

        try {
            let dir = fileio.opendirSync(dpath);
            dir.listfile(dpath, function (err, dirents) {
            });
        } catch (err) {
            console.info('fileio_test_dir_listfile_async_004 has failed for ' + err);
            expect(isInclude(err.message, 'Invalid listNum')).assertTrue();
            fileio.rmdirSync(dpath);
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_DIR_LISTFILE_ASYNC_0500
     * @tc.name fileio_test_dir_listfile_async_005
     * @tc.desc Test Dir listfile() interface. No parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_test_dir_listfile_async_005', Level.LEVEL0, async function (done) {
        let dpath = await nextFileName('fileio_test_dir_listfile_async_005') + 'd';
        fileio.mkdirSync(dpath);

        try {
            let dir = fileio.opendirSync(dpath);
            await dir.listfile();
        } catch (err) {
            console.info('fileio_test_dir_listfile_async_005 has failed for ' + err);
            expect(isInclude(err.message, 'Number of arguments unmatched')).assertTrue();
            fileio.rmdirSync(dpath);
            done();
        }
    });
})
}