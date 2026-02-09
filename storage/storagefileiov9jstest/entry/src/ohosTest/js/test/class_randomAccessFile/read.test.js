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
    fileIO, FILE_CONTENT, prepareFile, nextFileName,
    describe, it, expect,
} from '../Common';
import { Level } from '@ohos/hypium';

export default function fileIORandomAccessFileRead() {
describe('fileIO_randomAccessFile_read', function () {

    /**
     * @tc.name   fileIO_randomaccessfile_read_sync_000
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_0000
     * @tc.desc   Test readSync() interface. Test to read data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_sync_000', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_sync_000');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let randomaccessfile = fileIO.createRandomAccessFileSync(file);
            let length = 4096;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.setFilePointer(0);
            let readLength = randomaccessfile.readSync(new ArrayBuffer(length));
            expect(readLength == length).assertTrue();
            randomaccessfile.close();
            fileIO.closeSync(file.fd);
            fileIO.unlinkSync(fpath);
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_sync_000 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_sync_001
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_0100
     * @tc.desc   Test readSync() interface. When the offset is 1. Test to read data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_sync_001', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_sync_001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 20;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.setFilePointer(0);
            let readLength = randomaccessfile.readSync(new ArrayBuffer(length), { offset: 1 });
            expect(readLength == length - 1).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_sync_001 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_sync_003
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_0300
     * @tc.desc   Test readSync() interface. When the offset is 1 and the length is 5. Test to read data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_sync_003', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_sync_003');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 20;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.setFilePointer(0);
            let readLength = randomaccessfile.readSync(new ArrayBuffer(length), { offset: 1, length: 5 });
            expect(readLength == 5).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_sync_003 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_sync_004
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_0400
     * @tc.desc   Test readSync() interface. When offset equals buffer length. Test to read data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_sync_004', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_sync_004');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 4096;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.setFilePointer(0);
            let readLength = randomaccessfile.readSync(new ArrayBuffer(length), { offset: length });
            expect(readLength == 0).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_sync_004 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_sync_006
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_0600
     * @tc.desc   Test readSync() interface. When the offset is negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_read_sync_006', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_sync_006');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
        let randomaccessfile = fileIO.createRandomAccessFileSync(file);

        try {
            randomaccessfile.readSync(new ArrayBuffer(4096), { offset: -1 });
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_sync_006 has failed for ' + err);
            randomaccessfile.close();
            fileIO.closeSync(file.fd);
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_sync_007
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_0700
     * @tc.desc   Test readSync() interface. When offset+length>buffer.size, read file_content.length - offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_sync_007', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_sync_007');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
        let randomaccessfile = fileIO.createRandomAccessFileSync(file);

        try {
            let readLength = randomaccessfile.readSync(new ArrayBuffer(4096), { offset: 1, length: 4096 });
            expect(readLength == FILE_CONTENT.length - 1).assertTrue();
            randomaccessfile.close();
            fileIO.closeSync(file.fd);
            fileIO.unlinkSync(fpath);
            expect(true).assertTrue();
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_sync_007 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_sync_008
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_0800
     * @tc.desc   Test readSync() interface. When the offset is greater than the buffer length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_sync_008', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_sync_008');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            let length = 4096;
            let readLength = randomaccessfile.readSync(new ArrayBuffer(length), { offset: length + 1 });
            expect(readLength == 0).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(true).assertTrue();
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_sync_008 has failed for ' + err);
            expect(false).assertTrue();

        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_sync_009
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_0900
     * @tc.desc   Test readSync() interface. When the length is greater than the buffer length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_read_sync_009', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_sync_009');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            let length = 4096;
            randomaccessfile.readSync(new ArrayBuffer(length), { length: length + 1 });
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_sync_009 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.name   fileio_randomaccessfile_read_sync_010
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_1000
     * @tc.desc   Test readSync() interface. The "length" of option must > 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileio_randomaccessfile_read_sync_010', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileio_randomaccessfile_read_sync_010');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let randomaccessfile;

        try {
            randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 4096;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.setFilePointer(0);
            randomaccessfile.readSync(new ArrayBuffer(16), { offset: 13, length: -1 });
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileio_randomaccessfile_read_sync_010 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_sync_011
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_1100
     * @tc.desc   Test readSync() interface. When there are no parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_read_sync_011', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_sync_011');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            randomaccessfile.readSync();
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_sync_011 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_sync_012
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_1200
     * @tc.desc   Test readSync() interface. When the offset is negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_read_sync_012', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_sync_012');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            randomaccessfile.readSync(new ArrayBuffer(4096), { offset: -1 });
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_sync_012 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_sync_013
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_1300
     * @tc.desc   Test readSync() interface. When the parameter type is wrong.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_read_sync_013', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_sync_013');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            randomaccessfile.readSync('');
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_sync_013 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

        /**
         * @tc.name   fileIO_randomaccessfile_read_sync_014
         * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_1400
         * @tc.desc   Test readSync() interface. When the offset is 1 and the length is 5. Test to read data synchronously and filePointer after reading.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('fileIO_randomaccessfile_read_sync_014', Level.LEVEL0, async function () {
            let fpath = await nextFileName('fileIO_randomaccessfile_read_sync_014');
            expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

            try {
                let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
                let length = 20;
                let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
                expect(bytesWritten == length).assertTrue();
                expect(randomaccessfile.filePointer == bytesWritten);
                randomaccessfile.setFilePointer(0);
                let initOffset = 1;
                let readLength = randomaccessfile.readSync(new ArrayBuffer(length), { offset: initOffset, length: 5 });
                expect(readLength == 5).assertTrue();
                expect(randomaccessfile.filePointer == initOffset + readLength);
                randomaccessfile.close();
                fileIO.unlinkSync(fpath);
            } catch (err) {
                console.info('fileIO_randomaccessfile_read_sync_014 has failed for ' + err);
                expect(false).assertTrue();
            }
        });

    /**
     * @tc.name   fileIO_randomaccessfile_read_async_000
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_0000
     * @tc.desc   Test read() interface. return in callback mode. Test to read data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_async_000', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_async_000');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 4096;
            let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length));
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.setFilePointer(0);
            randomaccessfile.read(new ArrayBuffer(length), function (err, readLength) {
                expect(readLength == length).assertTrue();
                randomaccessfile.close();
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_async_000 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_async_001
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_0100
     * @tc.desc   Test read() interface. return in promise mode. When the offset is 1. Test to read data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_async_001', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_async_001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE, async function (err, randomaccessfile) {
                let length = 20;
                let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length));
                expect(bytesWritten == length).assertTrue();
                randomaccessfile.setFilePointer(0);
                let readLength = await randomaccessfile.read(new ArrayBuffer(length), { offset: 1 });
                expect(readLength == length - 1).assertTrue();
                randomaccessfile.close();
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_async_001 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_async_002
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_0200
     * @tc.desc   Test read() interface. return in promise mode. When the offset is 1. Test to read data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_async_002', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_async_002');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let randomaccessfile = await fileIO.createRandomAccessFile(file);
            let length = 20;
            let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length));
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.setFilePointer(0);
            let readLength = await randomaccessfile.read(new ArrayBuffer(length), { offset: 1 });
            expect(readLength == length - 1).assertTrue();
            randomaccessfile.close();
            fileIO.closeSync(file.fd);
            fileIO.unlinkSync(fpath);
            done();
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_async_002 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_async_003
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_0300
     * @tc.desc   Test read() interface. return in callback mode. When the offset is 1 and the length is 5. Test to read data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_async_003', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_async_003');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 20;
            let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length));
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.setFilePointer(0);
            randomaccessfile.read(new ArrayBuffer(length), { offset: 1, length: 5 }, function (err, readLength) {
                expect(readLength == 5).assertTrue();
                randomaccessfile.close();
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_async_003 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_async_004
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_0400
     * @tc.desc   Test read() interface. return in promise mode. When offset equals buffer length. Test to read data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_async_004', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_async_004');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 4096;
            let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length));
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.setFilePointer(0);
            let readLength = await randomaccessfile.read(new ArrayBuffer(length), { offset: length });
            expect(readLength == 0).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_async_004 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_async_005
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_0500
     * @tc.desc   Test read() interface. return in callback mode. When the offset is negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_read_async_005', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_async_005');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            randomaccessfile.read(new ArrayBuffer(4096), { offset: -1 }, function (err, readLength) {
                expect(false).assertTrue();
            });
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_async_005 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_async_006
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_0600
     * @tc.desc   Test read() interface. return in promise mode. When the offset is negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_read_async_006', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_async_006');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            await randomaccessfile.read(new ArrayBuffer(4096), { offset: -1 });
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_async_006 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_async_007
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_0700
     * @tc.desc   Test read() interface. return in promise mode. When offset+length>buffer.size, read file_content.length - offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_async_007', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_async_007');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            let readLength = await randomaccessfile.read(new ArrayBuffer(4096), { offset: 1, length: 4096 });
            expect(readLength== FILE_CONTENT.length - 1).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(true).assertTrue();
            done();
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_async_007 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_async_008
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_0800
     * @tc.desc   Test read() interface. return in callback mode. When the offset is greater than the buffer length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_async_008', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_async_008');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_ONLY);
        let randomaccessfile = await fileIO.createRandomAccessFile(file);

        try {
            let length = 4096;
            randomaccessfile.read(new ArrayBuffer(length), { offset: length + 1 }, function (err, readLength) {
                expect(readLength == 0).assertTrue();
                randomaccessfile.close();
                fileIO.closeSync(file.fd);
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_async_008 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_async_009
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_0900
     * @tc.desc   Test read() interface. return in promise mode. When the length is greater than the buffer length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_read_async_009', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_async_009');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            let length = 4096;
            await randomaccessfile.read(new ArrayBuffer(length), { length: length + 1 });
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_async_009 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileio_randomaccessfile_read_async_010
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_1000
     * @tc.desc   Test read() interface. return in promise mode. The "length" of option must > 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileio_randomaccessfile_read_async_010', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileio_randomaccessfile_read_async_010');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let randomaccessfile;

        try {
            randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 4096;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.setFilePointer(0);
            await randomaccessfile.read(new ArrayBuffer(16), { offset: 13, length: -1 });
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileio_randomaccessfile_read_async_010 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_async_011
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_1100
     * @tc.desc   Test read() interface. return in promise mode. When there are no parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_read_async_011', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_async_011');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
        try {
            await randomaccessfile.read();
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_async_011 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_async_012
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_1200
     * @tc.desc   Test read() interface. return in promise mode. When the offset is negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_read_async_012', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_async_012');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
        try {
            await randomaccessfile.read(new ArrayBuffer(4096), { offset: -1 });
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_async_012 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_async_013
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_1300
     * @tc.desc   Test read() interface. return in promise mode. When the parameter type is wrong.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_read_async_013', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_async_013');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
        try {
            await randomaccessfile.read('');
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_async_013 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            done()
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_async_014
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_1400
     * @tc.desc   Test read() interface. return in callback mode. Test to read data asynchronously and checkout filePointer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_async_014', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_async_014');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 4096;
            let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length));
            expect(bytesWritten == length).assertTrue();
            expect(randomaccessfile.filePointer == bytesWritten).assertTrue();
            randomaccessfile.setFilePointer(0);
            randomaccessfile.read(new ArrayBuffer(length), function (err, readLength) {
                expect(readLength == length).assertTrue();
                expect(randomaccessfile.filePointer == readLength).assertTrue();
                randomaccessfile.close();
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_async_014 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_async_015
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_1500
     * @tc.desc   Test read() interface. return in promise mode. When the offset is 1. Test to read data asynchronously and checkout filePointer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_async_015', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_async_015');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE, async function (err, randomaccessfile) {
                let length = 20;
                let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length));
                expect(bytesWritten == length).assertTrue();
                randomaccessfile.setFilePointer(0);
                let initOffset = 1;
                let readLength = await randomaccessfile.read(new ArrayBuffer(length), { offset: initOffset });
                expect(readLength == length - 1).assertTrue();
                expect(randomaccessfile.filePointer == readLength + initOffset).assertTrue();
                randomaccessfile.close();
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch (err) {
            console.info('fileIO_randomaccessfile_read_async_015 has failed for ' + err);
            expect(false).assertTrue();
        }
    });
})
}