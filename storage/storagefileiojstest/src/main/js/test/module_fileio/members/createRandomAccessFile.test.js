/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
    fileio, prepareFile, nextFileName, isIntNum, FILE_CONTENT,
    describe, it, expect
} from '../../Common';

export default function fileioCreateRandomAccessFile() {
describe('fileio_create_randomAccessFile', function () {

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0000
     * @tc.name fileio_create_randomaccessfile_sync_000
     * @tc.desc Test createRandomAccessFileSync() interface.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_000', 0, async function () {
        let fpath = await nextFileName('fileio_create_randomaccessfile_sync_000');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile = fileio.createRandomAccessFileSync(fpath, 0, 0o2);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_000 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0100
     * @tc.name fileio_create_randomaccessfile_sync_001
     * @tc.desc Test createRandomAccessFileSync() interface. fpointer = 5.
     * Create RandomAccessFile object to access file from fpointer location.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_001', 0, async function () {
        let fpath = await nextFileName('fileio_create_randomaccessfile_sync_001');

        try {
            let randomaccessfile = fileio.createRandomAccessFileSync(fpath, 5, 0o102);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.fpointer == 5).assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_001 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0200
     * @tc.name fileio_create_randomaccessfile_sync_002
     * @tc.desc Test createRandomAccessFileSync() interface.
     * Create RandomAccessFile object based on file descriptor to access file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_002', 0, async function () {
        let fpath = await nextFileName('fileio_create_randomaccessfile_sync_002');

        try {
            let fd = fileio.openSync(fpath, 0o102, 0o666);
            let randomaccessfile = fileio.createRandomAccessFileSync(fd, 0);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_002 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0300
     * @tc.name fileio_create_randomaccessfile_sync_003
     * @tc.desc Test createRandomAccessFileSync() interface. fpointer = 1.
     * Create RandomAccessFile object based on file descriptor to access file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_003', 0, async function () {
        let fpath = await nextFileName('fileio_create_randomaccessfile_sync_003');

        try {
            let fd = fileio.openSync(fpath, 0o102, 0o666);
            let randomaccessfile = fileio.createRandomAccessFileSync(fd, 1);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.fpointer == 1).assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_003 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0400
     * @tc.name fileio_create_randomaccessfile_sync_004
     * @tc.desc Test createRandomAccessFileSync() interface. No such file or directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_004', 0, async function () {
        let fpath = await nextFileName('fileio_create_randomaccessfile_sync_004');

        try {
            fileio.createRandomAccessFileSync(fpath, 0, 0o2);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_004 has failed for ' + err);
            expect(err.message == "No such file or directory").assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0500
     * @tc.name fileio_create_randomaccessfile_sync_005
     * @tc.desc Test createRandomAccessFileSync() interface. Invalid fd.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_005', 0, async function () {
        try {
            fileio.createRandomAccessFileSync(-1, 0);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_005 has failed for ' + err);
            expect(err.message == "Invalid fd").assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0600
     * @tc.name fileio_create_randomaccessfile_sync_006
     * @tc.desc Test createRandomAccessFileSync() interface. Invalid fp.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_006', 0, async function () {
        let fpath = await nextFileName('fileio_create_randomaccessfile_sync_006');
        let fd = fileio.openSync(fpath, 0o102, 0o666);

        try {
            fileio.createRandomAccessFileSync(fd, '1');
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_006 has failed for ' + err);
            expect(err.message == "Invalid fp").assertTrue();
            fileio.closeSync(fd);
            fileio.unlinkSync(fpath);
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0700
     * @tc.name fileio_create_randomaccessfile_sync_007
     * @tc.desc Test createRandomAccessFileSync() interface. Missing Parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_007', 0, async function () {
        let fpath = await nextFileName('fileio_create_randomaccessfile_sync_007');
        let fd = fileio.openSync(fpath, 0o102, 0o666);

        try {
            fileio.createRandomAccessFileSync(fd);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_007 has failed for ' + err);
            expect(err.message == "Number of arguments unmatched").assertTrue();
            fileio.closeSync(fd);
            fileio.unlinkSync(fpath);
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0800
     * @tc.name fileio_create_randomaccessfile_sync_008
     * @tc.desc Test createRandomAccessFileSync() interface. flags=0o202.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_008', 0, async function () {
        let fpath = await nextFileName('fileio_create_randomaccessfile_sync_008');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile = fileio.createRandomAccessFileSync(fpath, 0, 0o202);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_008 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0900
     * @tc.name fileio_create_randomaccessfile_sync_009
     * @tc.desc Test createRandomAccessFileSync() interface. flags=0o302. File exists.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_009', 0, async function () {
        let fpath = await nextFileName('fileio_create_randomaccessfile_sync_009');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            fileio.createRandomAccessFileSync(fpath, 0, 0o302);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_009 has failed for ' + err);
            expect(err.message == "File exists").assertTrue();
            fileio.unlinkSync(fpath);
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1000
     * @tc.name fileio_create_randomaccessfile_sync_010
     * @tc.desc Test createRandomAccessFileSync() interface. flags=0o1002.
     * If the file exists and the file is opened for write-only or read-write, trim its length to zero.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_010', 0, async function () {
        let fpath = await nextFileName('fileio_create_randomaccessfile_sync_010');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileio.createRandomAccessFileSync(fpath, 0, 0o1002);
            let number = randomaccessfile.readSync(new ArrayBuffer(4096));
            expect(number == 0).assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_010 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1100
     * @tc.name fileio_create_randomaccessfile_sync_011
     * @tc.desc Test createRandomAccessFileSync() interface. flags=0o2002.
     * Open as append, subsequent writes will append to the end of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_011', 0, async function () {
        let fpath = await nextFileName('fileio_create_randomaccessfile_sync_011');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileio.createRandomAccessFileSync(fpath, 0, 0o2002);
            let length = 100;
            let num = randomaccessfile.writeSync(new ArrayBuffer(length));
            expect(num == length).assertTrue();
            randomaccessfile.setFilePointerSync(0);
            let number = randomaccessfile.readSync(new ArrayBuffer(4096), { position: 0 });
            expect(number == length + FILE_CONTENT.length).assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_011 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1200
     * @tc.name fileio_create_randomaccessfile_sync_012
     * @tc.desc Test createRandomAccessFileSync() interface. flags=0o200002. Not a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_012', 0, async function () {
        let fpath = await nextFileName('fileio_create_randomaccessfile_sync_012');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            fileio.createRandomAccessFileSync(fpath, 0, 0o200002);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_012 has failed for ' + err);
            expect(err.message == "Not a directory").assertTrue();
            fileio.unlinkSync(fpath);
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1300
     * @tc.name fileio_create_randomaccessfile_sync_013
     * @tc.desc Test createRandomAccessFileSync() interface. flags=0o400002.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_013', 0, async function () {
        let fpath = await nextFileName('fileio_create_randomaccessfile_sync_013');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile = fileio.createRandomAccessFileSync(fpath, 0, 0o400002);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_013 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1400
     * @tc.name fileio_create_randomaccessfile_sync_014
     * @tc.desc Test createRandomAccessFileSync() interface. flags=0o4010002.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_014', 0, async function () {
        let fpath = await nextFileName('fileio_create_randomaccessfile_sync_014');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile = fileio.createRandomAccessFileSync(fpath, 0, 0o4010002);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_014 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1500
     * @tc.name fileio_create_randomaccessfile_sync_015
     * @tc.desc Test createRandomAccessFileSync() interface. flags=0o200002. Invalid filepath.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_015', 0, async function () {
       let dpath = await nextFileName('fileio_create_randomaccessfile_sync_015') + 'd';
       fileio.mkdirSync(dpath);

       try {
           fileio.createRandomAccessFileSync(dpath, 0, 0o200002);
           expect(false).assertTrue();
       } catch(err) {
           console.info('fileio_create_randomaccessfile_sync_015 has failed for ' + err);
           expect(err.message == "Invalid filepath").assertTrue();
           fileio.rmdirSync(dpath);
       }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1600
     * @tc.name fileio_create_randomaccessfile_sync_016
     * @tc.desc Test createRandomAccessFileSync() interface. flags=0o400002. Symbolic link loop.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_sync_016', 0, async function () {
        let fpath = await nextFileName('fileio_create_randomaccessfile_sync_016');
        let ffpath = fpath + 'aaaa';
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fileio.symlinkSync(fpath, ffpath);
            fileio.createRandomAccessFileSync(ffpath, 0, 0o400002);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileio_create_randomaccessfile_sync_016 has failed for ' + err);
            expect(err.message == 'Symbolic link loop' || 
                err.message == 'Too many symbolic links encountered').assertTrue();
            fileio.unlinkSync(fpath);
            fileio.unlinkSync(ffpath);
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0000
     * @tc.name fileio_create_randomaccessfile_async_000
     * @tc.desc Test createRandomAccessFile() interface. return in promise mode.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_000', 0, async function (done) {
        let fpath = await nextFileName('fileio_create_randomaccessfile_async_000');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile = await fileio.createRandomAccessFile(fpath, 0, 0o2);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_000 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0100
     * @tc.name fileio_create_randomaccessfile_async_001
     * @tc.desc Test createRandomAccessFile() interface. fpointer = 10. return in callback mode.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_001', 0, async function (done) {
        let fpath = await nextFileName('fileio_create_randomaccessfile_async_001');

        try {
            fileio.createRandomAccessFile(fpath, 10, 0o102, function(err, randomaccessfile) {
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                expect(randomaccessfile.fpointer == 10).assertTrue();
                randomaccessfile.closeSync();
                fileio.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_001 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0200
     * @tc.name fileio_create_randomaccessfile_async_002
     * @tc.desc Test createRandomAccessFile() interface.
     * Create RandomAccessFile object based on file descriptor to access file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_002', 0, async function (done) {
        let fpath = await nextFileName('fileio_create_randomaccessfile_async_002');

        try {
            let fd = fileio.openSync(fpath, 0o102, 0o666);
            fileio.createRandomAccessFile(fd, 0, function(err, randomaccessfile) {
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                randomaccessfile.closeSync();
                fileio.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_002 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0300
     * @tc.name fileio_create_randomaccessfile_async_003
     * @tc.desc Test createRandomAccessFile() interface. fpointer = 1.
     * Create RandomAccessFile object based on file descriptor to access file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_003', 0, async function (done) {
        let fpath = await nextFileName('fileio_create_randomaccessfile_async_003');

        try {
            let fd = fileio.openSync(fpath, 0o102, 0o666);
            let randomaccessfile = await fileio.createRandomAccessFile(fd, 1);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.fpointer == 1).assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_003 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0400
     * @tc.name fileio_create_randomaccessfile_async_004
     * @tc.desc Test createRandomAccessFile() interface. No such file or directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_004', 0, async function (done) {
        let fpath = await nextFileName('fileio_create_randomaccessfile_async_004');

        try {
            await fileio.createRandomAccessFile(fpath, 0, 0o2);
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_004 has failed for ' + err);
            expect(err.message == "No such file or directory").assertTrue();
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0500
     * @tc.name fileio_create_randomaccessfile_async_005
     * @tc.desc Test createRandomAccessFile() interface. Invalid fd.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_005', 0, async function (done) {
        try {
            fileio.createRandomAccessFile(-1, 0, function(err) {
            });
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_005 has failed for ' + err);
            expect(err.message == "Invalid fd").assertTrue();
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0600
     * @tc.name fileio_create_randomaccessfile_async_006
     * @tc.desc Test createRandomAccessFile() interface. Invalid fp.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_006', 0, async function (done) {
        let fpath = await nextFileName('fileio_create_randomaccessfile_async_006');
        let fd = fileio.openSync(fpath, 0o102, 0o666);

        try {
            await fileio.createRandomAccessFile(fd, '1');
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_006 has failed for ' + err);
            expect(err.message == "Invalid fp").assertTrue();
            fileio.closeSync(fd);
            fileio.unlinkSync(fpath);
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0700
     * @tc.name fileio_create_randomaccessfile_async_007
     * @tc.desc Test createRandomAccessFile() interface. Missing Parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_007', 0, async function (done) {
        let fpath = await nextFileName('fileio_create_randomaccessfile_async_007');
        let fd = fileio.openSync(fpath, 0o102, 0o666);

        try {
            await fileio.createRandomAccessFile(fd);
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_007 has failed for ' + err);
            expect(err.message == "Number of arguments unmatched").assertTrue();
            fileio.closeSync(fd);
            fileio.unlinkSync(fpath);
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0800
     * @tc.name fileio_create_randomaccessfile_async_008
     * @tc.desc Test createRandomAccessFile() interface. flags=0o202.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_008', 0, async function (done) {
        let fpath = await nextFileName('fileio_create_randomaccessfile_async_008');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            fileio.createRandomAccessFile(fpath, 0, 0o202, function(err, randomaccessfile) {
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                randomaccessfile.closeSync();
                fileio.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_008 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0900
     * @tc.name fileio_create_randomaccessfile_sync_009
     * @tc.desc Test createRandomAccessFile() interface. flags=0o302. File exists.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_009', 0, async function (done) {
        let fpath = await nextFileName('fileio_create_randomaccessfile_async_009');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            await fileio.createRandomAccessFile(fpath, 0, 0o302);
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_009 has failed for ' + err);
            expect(err.message == "File exists").assertTrue();
            fileio.unlinkSync(fpath);
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1000
     * @tc.name fileio_create_randomaccessfile_async_010
     * @tc.desc Test createRandomAccessFile() interface. flags=0o1002.
     * If the file exists and the file is opened for write-only or read-write, trim its length to zero.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_010', 0, async function (done) {
        let fpath = await nextFileName('fileio_create_randomaccessfile_async_010');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fileio.createRandomAccessFile(fpath, 0, 0o1002);
            let number = randomaccessfile.readSync(new ArrayBuffer(4096));
            expect(number == 0).assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_010 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1100
     * @tc.name fileio_create_randomaccessfile_async_011
     * @tc.desc Test createRandomAccessFile() interface. flags=0o2002.
     * Open as append, subsequent writes will append to the end of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_011', 0, async function (done) {
        let fpath = await nextFileName('fileio_create_randomaccessfile_async_011');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fileio.createRandomAccessFile(fpath, 0, 0o2002);
            let length = 100;
            let num = randomaccessfile.writeSync(new ArrayBuffer(length));
            expect(num == length).assertTrue();
            randomaccessfile.setFilePointerSync(0);
            let number = randomaccessfile.readSync(new ArrayBuffer(4096), { position: 0 });
            expect(number == length + FILE_CONTENT.length).assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_011 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1200
     * @tc.name fileio_create_randomaccessfile_async_012
     * @tc.desc Test createRandomAccessFile() interface. flags=0o200002. Not a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_012', 0, async function (done) {
        let fpath = await nextFileName('fileio_create_randomaccessfile_async_012');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            await fileio.createRandomAccessFile(fpath, 0, 0o200002);
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_012 has failed for ' + err);
            expect(err.message == "Not a directory").assertTrue();
            fileio.unlinkSync(fpath);
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1300
     * @tc.name fileio_create_randomaccessfile_async_013
     * @tc.desc Test createRandomAccessFile() interface. flags=0o400002.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_013', 0, async function (done) {
        let fpath = await nextFileName('fileio_create_randomaccessfile_async_013');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile = await fileio.createRandomAccessFile(fpath, 0, 0o400002);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_013 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1400
     * @tc.name fileio_create_randomaccessfile_async_014
     * @tc.desc Test createRandomAccessFile() interface. flags=0o4010002.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_014', 0, async function (done) {
        let fpath = await nextFileName('fileio_create_randomaccessfile_async_014');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile = await fileio.createRandomAccessFile(fpath, 0, 0o4010002);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_014 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1500
     * @tc.name fileio_create_randomaccessfile_async_015
     * @tc.desc Test createRandomAccessFile() interface. flags=0o200002. Invalid filepath.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_015', 0, async function (done) {
       let dpath = await nextFileName('fileio_create_randomaccessfile_async_015') + 'd';
       fileio.mkdirSync(dpath);

       try {
           await fileio.createRandomAccessFile(dpath, 0, 0o200002);
       } catch(err) {
           console.info('fileio_create_randomaccessfile_async_015 has failed for ' + err);
           expect(err.message == "Invalid filepath").assertTrue();
           fileio.rmdirSync(dpath);
           done();
       }
   });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1600
     * @tc.name fileio_create_randomaccessfile_async_016
     * @tc.desc Test createRandomAccessFile() interface. flags=0o400002. Symbolic link loop.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_create_randomaccessfile_async_016', 0, async function (done) {
        let fpath = await nextFileName('fileio_create_randomaccessfile_async_016');
        let ffpath = fpath + 'aaaa';
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fileio.symlinkSync(fpath, ffpath);
            await fileio.createRandomAccessFile(ffpath, 0, 0o400002);
        } catch(err) {
            console.info('fileio_create_randomaccessfile_async_016 has failed for ' + err);
            expect(err.message == 'Symbolic link loop' || 
                err.message == 'Too many symbolic links encountered').assertTrue();
            fileio.unlinkSync(fpath);
            fileio.unlinkSync(ffpath);
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_MULTITHREADED_REPLICATION_0000
     * @tc.name fileio_randomaccessfile_multithreaded_replication_000
     * @tc.desc Test createRandomAccessFileSync() interface. Test multi-threaded replication.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_randomaccessfile_multithreaded_replication_000', 0, async function (done) {
        let srcpath = await nextFileName('fileio_randomaccessfile_multithreaded_replication_000');
        let dstpath = await nextFileName('fileio_randomaccessfile_multithreaded_replication_000_1');
        let length = 4096;
        let buffer = new ArrayBuffer(length);
        expect(prepareFile(srcpath, buffer)).assertTrue();

        try {
            let fileSize = fileio.statSync(srcpath).size;
            // init randomaccessfiles
            let threadNums = 4;
            let srcfiles = new Array();
            let dstfiles = new Array();
            for (let i = 0; i < threadNums; i++) {
                srcfiles[i] = fileio.createRandomAccessFileSync(srcpath, fileSize / threadNums * i, 0o2);
                dstfiles[i] = fileio.createRandomAccessFileSync(dstpath, fileSize / threadNums * i, 0o102);
            }
            // copy in every thread i from multi-thread
            let bufs = new Array(threadNums);
            let len = length / threadNums;
            for(let i = 0; i < threadNums; i++) {
                bufs[i] = new ArrayBuffer(len);
                srcfiles[i].read(bufs[i]).then(async function(readOut) {
                    let writeLen = await dstfiles[i].write(readOut.buffer);
                    expect(writeLen == len).assertTrue();
                    dstfiles[i].closeSync();
                    srcfiles[i].closeSync();
                    if (i == threadNums - 1) {
                        let size = fileio.statSync(dstpath).size;
                        expect(size == fileSize).assertTrue();
                        fileio.unlinkSync(srcpath);
                        fileio.unlinkSync(dstpath);
                        done();
                    }
                });
            }
        } catch (err) {
            console.info('fileio_randomaccessfile_multithreaded_replication_000 has failed for ' + err);
            expect(null).assertFail();
        }
    });
})
}
