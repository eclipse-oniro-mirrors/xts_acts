/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
    fileIO, prepareFile, FILE_CONTENT, nextFileName,
    describe, it, expect
} from '../Common';
import { Level } from '@ohos/hypium';

export default function fileIORandomAccessFileWrite() {
describe('fileIO_randomAccessFile_write', function () {

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0000
     * @tc.name fileIO_randomaccessfile_write_sync_000
     * @tc.desc Test writeSync() interface. Test write data synchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_sync_000', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_000');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 4096;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_000 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0100
     * @tc.name fileIO_randomaccessfile_write_sync_001
     * @tc.desc Test writeSync() interface. When the offset is 1. Test write data synchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_sync_001', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 20;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length), { offset: 1 });
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_001 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0200
     * @tc.name fileIO_randomaccessfile_write_sync_002
     * @tc.desc Test writeSync() interface. When the offset is 1. Test write data synchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_sync_002', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_002');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let randomaccessfile = fileIO.createRandomAccessFileSync(file);
            let length = 20;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length), { offset: 1 });
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.close();
            fileIO.closeSync(file.fd);
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_002 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0300
     * @tc.name fileIO_randomaccessfile_write_sync_003
     * @tc.desc Test writeSync() interface. When the offset is 1 and length is 10. Test write data synchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_sync_003', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_003');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 20;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length), { offset: 1, length: 10 });
            expect(bytesWritten == 10).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_003 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0400
     * @tc.name fileIO_randomaccessfile_write_sync_004
     * @tc.desc Test writeSync() interface. When the offset is 5. Test write data synchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_sync_004', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_004');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 20;
            let options = {
                offset: 5
            }
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length), options);
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.setFilePointer(0);
            let readLength = randomaccessfile.readSync(new ArrayBuffer(4096));
            expect(readLength == (length + options.offset)).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_004 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0500
     * @tc.name fileIO_randomaccessfile_write_sync_005
     * @tc.desc Test writeSync() interface. When offset equals buffer length. Test write data synchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_sync_005', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_005');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 4096;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length), { offset: length });
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_005 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0600
     * @tc.name fileIO_randomaccessfile_write_sync_006
     * @tc.desc Test writeSync() interface. When offset+length>buffer.size.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_sync_006', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_006');
        let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            randomaccessfile.writeSync(new ArrayBuffer(4096), { offset: 5, length: 4095 });
            expect(true).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_006 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0700
     * @tc.name fileIO_randomaccessfile_write_sync_007
     * @tc.desc Test writeSync() interface. When the offset is greater than the buffer length.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_sync_007', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_007');
        let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            let length = 4096;
            randomaccessfile.writeSync(new ArrayBuffer(length), { offset: length + 1 });
            expect(true).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_007 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0800
     * @tc.name fileIO_randomaccessfile_write_sync_008
     * @tc.desc Test writeSync() interface. When there are no parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_sync_008', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_008');
        let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            randomaccessfile.writeSync();
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_008 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0900
     * @tc.name fileIO_randomaccessfile_write_sync_009
     * @tc.desc Test writeSync() interface. When the offset is negative.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_sync_009', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_009');
        let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.WRITE_ONLY);
        let randomaccessfile = fileIO.createRandomAccessFileSync(file);

        try {
            randomaccessfile.writeSync(new ArrayBuffer(4096), { offset: -1 });
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_009 has failed for ' + err);
            randomaccessfile.close();
            fileIO.closeSync(file.fd);
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_1000
     * @tc.name fileio_randomaccessfile_write_sync_010
     * @tc.desc Test writeSync() interface. The "length" of option must > 0.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileio_randomaccessfile_write_sync_010', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileio_randomaccessfile_write_sync_010');
        let randomaccessfile;

        try {
            randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 100;
            randomaccessfile.writeSync(new ArrayBuffer(length), { offset: 1, length: -1 });
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileio_randomaccessfile_write_sync_010 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_1100
     * @tc.name fileIO_randomaccessfile_write_sync_011
     * @tc.desc Test writeSync() interface. When the buffer parameter type is wrong.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_sync_011', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_011');
        let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            randomaccessfile.writeSync(10, { length: -1 });
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_011 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_1200
     * @tc.name fileIO_randomaccessfile_write_sync_012
     * @tc.desc Test writeSync() interface. When the length is greater than the buffer length.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_sync_012', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_012');
        let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            let length = 4096;
            randomaccessfile.writeSync(new ArrayBuffer(length), { length: length + 1 });
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_012 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0000
     * @tc.name fileIO_randomaccessfile_write_async_000
     * @tc.desc Test write() interface. return in promise mode. Test write data asynchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_async_000', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_000');

        try {
            fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE, async function(err, randomaccessfile) {
                let length = 4096;
                let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length));
                expect(bytesWritten == length).assertTrue();
                randomaccessfile.close();
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_000 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0100
     * @tc.name fileIO_randomaccessfile_write_async_001
     * @tc.desc Test write() interface. return in callback mode. When the offset is 1. Test write data asynchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_async_001', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_001');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.WRITE_ONLY);
            let randomaccessfile = await fileIO.createRandomAccessFile(file);
            let length = 20;
            randomaccessfile.write(new ArrayBuffer(length), { offset: 1 }, function(err, bytesWritten) {
                expect(bytesWritten == length).assertTrue();
                randomaccessfile.close();
                fileIO.closeSync(file.fd);
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_001 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0200
     * @tc.name fileIO_randomaccessfile_write_async_002
     * @tc.desc Test write() interface. return in promise mode. When the offset is 1. Test write data asynchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_async_002', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_002');

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 20;
            let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length), { offset: 1 });
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_002 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0300
     * @tc.name fileIO_randomaccessfile_write_async_003
     * @tc.desc Test write() interface. return in promise mode. When the offset is 1 and length is 10. Test write data asynchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_async_003', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_003');

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 20;
            let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length), { offset: 1, length: 10 });
            expect(bytesWritten == 10).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_003 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0400
     * @tc.name fileIO_randomaccessfile_write_async_004
     * @tc.desc Test write() interface. return in promise mode. When the offset is 5. Test write data asynchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_async_004', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_004');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 20;
            let options = {
                offset: 5
            }
            let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length), options);
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.setFilePointer(0);
            let readLength = await randomaccessfile.read(new ArrayBuffer(4096));
            expect(readLength == (length + options.offset)).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_004 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0500
     * @tc.name fileIO_randomaccessfile_write_async_005
     * @tc.desc Test write() interface. return in promise mode. When offset equals buffer length. Test write data asynchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_async_005', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_005');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 4096;
            let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length), { offset: length });
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_005 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0600
     * @tc.name fileIO_randomaccessfile_write_async_006
     * @tc.desc Test write() interface. return in promise mode. When offset+length>buffer.size. Write correctly.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_async_006', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_006');
        let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            let length = 4096;
            await randomaccessfile.write(new ArrayBuffer(length), { offset: 5, length: 4095 });
            expect(true).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_006 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == 'Invalide argument').assertTrue();
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0700
     * @tc.name fileIO_randomaccessfile_write_async_007
     * @tc.desc Test write() interface. return in callback mode. When the offset is greater than the buffer length.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_async_007', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_007');
        let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            let length = 4096;
            randomaccessfile.write(new ArrayBuffer(length), { offset: length + 1 }, function(err, bytesWritten) {
                expect(bytesWritten == length).assertTrue();
                randomaccessfile.close();
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_007 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0800
     * @tc.name fileIO_randomaccessfile_write_async_008
     * @tc.desc Test write() interface. return in promise mode. When there are no parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_async_008', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_008');
        let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            await randomaccessfile.write();
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_008 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0900
     * @tc.name fileIO_randomaccessfile_write_async_009
     * @tc.desc Test write() interface. return in promise mode. When the offset is negative.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_async_009', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_009');
        let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.WRITE_ONLY);
        let randomaccessfile = await fileIO.createRandomAccessFile(file);

        try {
            await randomaccessfile.write(new ArrayBuffer(4096), { offset: -1 });
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_009 has failed for ' + err);
            randomaccessfile.close();
            fileIO.closeSync(file.fd);
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_1000
     * @tc.name fileio_randomaccessfile_write_async_010
     * @tc.desc Test write() interface. return in promise mode. The "length" of option must > 0.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileio_randomaccessfile_write_async_010', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileio_randomaccessfile_write_async_010');
        let randomaccessfile;

        try {
            randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 100;
            await randomaccessfile.write(new ArrayBuffer(length), { offset: 1, length: -1 });
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileio_randomaccessfile_write_async_010 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_1200
     * @tc.name fileIO_randomaccessfile_write_async_012
     * @tc.desc Test write() interface. return in promise mode. When the length is greater than the buffer length.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_async_012', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_012');
        let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            let length = 4096;
            await randomaccessfile.write(new ArrayBuffer(length), { length: length + 1 });
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_012 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_1300
     * @tc.name fileIO_randomaccessfile_write_async_013
     * @tc.desc Test write() interface. return in callback mode. When the offset is 1. Test write data asynchronously and checkout filePointer.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_write_async_013', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_013');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.WRITE_ONLY);
            let randomaccessfile = await fileIO.createRandomAccessFile(file);
            let length = 20;
            let initOffset = 1;
            randomaccessfile.write(new ArrayBuffer(length), { offset: initOffset }, function(err, bytesWritten) {
                expect(bytesWritten == length).assertTrue();
                console.info('fileIO_randomaccessfile_write_async_013 randomaccessfile.filePointer' + randomaccessfile.filePointer);
                expect(randomaccessfile.filePointer == bytesWritten + initOffset).assertTrue();
                randomaccessfile.close();
                fileIO.closeSync(file.fd);
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_013 has failed for ' + err);
            expect(false).assertTrue();
        }
    });
})
}