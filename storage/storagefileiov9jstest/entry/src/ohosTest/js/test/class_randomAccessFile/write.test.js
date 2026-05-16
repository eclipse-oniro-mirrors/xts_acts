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
     * @tc.name   fileIO_randomaccessfile_write_sync_000
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0000
     * @tc.desc   Test writeSync() interface. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   fileIO_randomaccessfile_write_sync_001
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0100
     * @tc.desc   Test writeSync() interface. When the offset is 1. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   fileIO_randomaccessfile_write_sync_002
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0200
     * @tc.desc   Test writeSync() interface. When the offset is 1. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   fileIO_randomaccessfile_write_sync_003
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0300
     * @tc.desc   Test writeSync() interface. When the offset is 1 and length is 10. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   fileIO_randomaccessfile_write_sync_004
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0400
     * @tc.desc   Test writeSync() interface. When the offset is 5. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   fileIO_randomaccessfile_write_sync_005
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0500
     * @tc.desc   Test writeSync() interface. When offset equals buffer length. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   fileIO_randomaccessfile_write_sync_006
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0600
     * @tc.desc   Test writeSync() interface. When offset+length>buffer.size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_sync_006', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_006');
        let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(4096), { offset: 5, length: 4095 });
            console.info('fileIO_randomaccessfile_write_sync_006 bytesWritten ' + bytesWritten);
            expect(bytesWritten == 4095).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_006 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_007
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0700
     * @tc.desc   Test writeSync() interface. When the offset is greater than the buffer length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_sync_007', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_007');
        let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            let length = 4096;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length), { offset: length + 1 });
            console.info('fileIO_randomaccessfile_write_sync_007 bytesWritten ' + bytesWritten);
            expect(bytesWritten == 4096).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_007 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_008
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0800
     * @tc.desc   Test writeSync() interface. When there are no parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   fileIO_randomaccessfile_write_sync_009
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_0900
     * @tc.desc   Test writeSync() interface. When the offset is negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   fileio_randomaccessfile_write_sync_010
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_1000
     * @tc.desc   Test writeSync() interface. The "length" of option must > 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   fileIO_randomaccessfile_write_sync_011
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_1100
     * @tc.desc   Test writeSync() interface. When the buffer parameter type is wrong.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   fileIO_randomaccessfile_write_sync_012
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_1200
     * @tc.desc   Test writeSync() interface. When the length is greater than the buffer length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   fileIO_randomaccessfile_write_sync_013
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_1300
     * @tc.desc   Test writeSync() interface. When offset equals buffer length. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_sync_013', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_013');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 4096;
            let bytesWritten = randomaccessfile.writeSync(null, { offset: length });
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_013 has failed for ' + err);
            fileIO.unlinkSync(fpath);
            expect(err.code === 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_014
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_1400
     * @tc.desc   Test writeSync() interface. When offset equals buffer length. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_sync_014', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_014');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 4096;
            let bytesWritten = randomaccessfile.writeSync(undefined, { offset: length });
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_014 has failed for ' + err);
            fileIO.unlinkSync(fpath);
            expect(err.code === 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_015
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_1500
     * @tc.desc   Test writeSync() interface. When offset equals buffer length. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_sync_015', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_015');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 4096;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length), null);
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_015 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_016
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_1600
     * @tc.desc   Test writeSync() interface. When offset equals buffer length. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_sync_016', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_016');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 4096;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length), undefined);
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_016 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_017
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_SYNC_1700
     * @tc.desc   Test writeSync() interface. When offset equals buffer length. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_sync_017', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_sync_017');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 4096;
            let bytesWritten = randomaccessfile.writeSync("", { offset: length });
            expect(bytesWritten == 0).assertTrue();
            console.info('fileIO_randomaccessfile_write_sync_017 bytesWritten: ' + bytesWritten);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_sync_017 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_000
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0000
     * @tc.desc   Test write() interface. return in promise mode. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   fileIO_randomaccessfile_write_async_001
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0100
     * @tc.desc   Test write() interface. return in callback mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   fileIO_randomaccessfile_write_async_002
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0200
     * @tc.desc   Test write() interface. return in promise mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   fileIO_randomaccessfile_write_async_003
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0300
     * @tc.desc   Test write() interface. return in promise mode. When the offset is 1 and length is 10. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   fileIO_randomaccessfile_write_async_004
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0400
     * @tc.desc   Test write() interface. return in promise mode. When the offset is 5. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   fileIO_randomaccessfile_write_async_005
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0500
     * @tc.desc   Test write() interface. return in promise mode. When offset equals buffer length. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   fileIO_randomaccessfile_write_async_006
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0600
     * @tc.desc   Test write() interface. return in promise mode. When offset+length>buffer.size. Write correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_006', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_006');
        let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            let length = 4096;
            await randomaccessfile.write(new ArrayBuffer(length), { offset: 5, length: 4095 });
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
     * @tc.name   fileIO_randomaccessfile_write_async_007
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0700
     * @tc.desc   Test write() interface. return in callback mode. When the offset is greater than the buffer length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   fileIO_randomaccessfile_write_async_008
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0800
     * @tc.desc   Test write() interface. return in promise mode. When there are no parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   fileIO_randomaccessfile_write_async_009
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_0900
     * @tc.desc   Test write() interface. return in promise mode. When the offset is negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   fileio_randomaccessfile_write_async_010
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_1000
     * @tc.desc   Test write() interface. return in promise mode. The "length" of option must > 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   fileIO_randomaccessfile_write_async_012
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_1200
     * @tc.desc   Test write() interface. return in promise mode. When the length is greater than the buffer length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   fileIO_randomaccessfile_write_async_013
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_1300
     * @tc.desc   Test write() interface. return in callback mode. When the offset is 1. Test write data asynchronously and checkout filePointer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_014
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_1400
     * @tc.desc   Test write() interface. return in promise mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_014', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_014');

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let bytesWritten = await randomaccessfile.write(null, { offset: 1 });
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_014 has failed for ' + err);
            expect(err.code === 13900020 && err.message == "Invalid argument").assertTrue();
            done()
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_015
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_1500
     * @tc.desc   Test write() interface. return in promise mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_015', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_015');

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let bytesWritten = await randomaccessfile.write(undefined, { offset: 1 });
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_015 has failed for ' + err);
            expect(err.code === 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_016
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_1600
     * @tc.desc   Test write() interface. return in promise mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_016', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_016');

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 20;
            let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length), null);
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_016 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_017
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_1700
     * @tc.desc   Test write() interface. return in promise mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_017', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_017');

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 20;
            let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length), undefined);
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_017 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_018
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_1800
     * @tc.desc   Test write() interface. return in promise mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_018', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_018');

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let length = 20;
            let bytesWritten = await randomaccessfile.write("", { offset: 1 });
            expect(bytesWritten == 0).assertTrue();
            console.info('fileIO_randomaccessfile_write_async_018 bytesWritten: ' + bytesWritten);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_018 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });


    /**
     * @tc.name   fileIO_randomaccessfile_write_async_019
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_1900
     * @tc.desc   Test write() interface. return in callback mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_019', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_019');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.WRITE_ONLY);
            let randomaccessfile = await fileIO.createRandomAccessFile(file);
            let length = 20;
            randomaccessfile.write(null, function(err, bytesWritten) {
                console.error("fileIO_randomaccessfile_write_async_019 write failed with error message: " + err.message + ", error code: " + err.code);
                expect(false).assertTrue();
            });
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_019 has failed for ' + err);
            fileIO.unlinkSync(fpath);
            expect(err.code === 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_020
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_2000
     * @tc.desc   Test write() interface. return in callback mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_020', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_020');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.WRITE_ONLY);
            let randomaccessfile = await fileIO.createRandomAccessFile(file);
            let length = 20;
            randomaccessfile.write(undefined, function(err, bytesWritten) {
                console.error("fileIO_randomaccessfile_write_async_020 write failed with error message: " + err.message + ", error code: " + err.code);
                expect(false).assertTrue();
            });
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_020 has failed for ' + err);
            fileIO.unlinkSync(fpath);
            expect(err.code === 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_021
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_2100
     * @tc.desc   Test write() interface. return in callback mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_021', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_021');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.WRITE_ONLY);
            let randomaccessfile = await fileIO.createRandomAccessFile(file);
            let length = 20;
            randomaccessfile.write("", function(err, bytesWritten) {
                console.error("fileIO_randomaccessfile_write_async_021 write failed with error message: " + err);
                console.info('fileIO_randomaccessfile_write_async_021 bytesWritten: ' + bytesWritten);
                expect(bytesWritten == 0).assertTrue();;
            });
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_021 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_022
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_2200
     * @tc.desc   Test write() interface. return in callback mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_022', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_022');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.WRITE_ONLY);
            let randomaccessfile = await fileIO.createRandomAccessFile(file);
            randomaccessfile.write(null, { offset: 1 }, function(err, bytesWritten) {
                console.error("fileIO_randomaccessfile_write_async_022 write failed with error message: " + err.message + ", error code: " + err.code);
                expect(false).assertTrue();
            });
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_022 has failed for ' + err);
            fileIO.unlinkSync(fpath);
            expect(err.code === 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_023
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_2300
     * @tc.desc   Test write() interface. return in callback mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_023', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_023');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.WRITE_ONLY);
            let randomaccessfile = await fileIO.createRandomAccessFile(file);
            randomaccessfile.write(undefined, { offset: 1 }, function(err, bytesWritten) {
                console.error("fileIO_randomaccessfile_write_async_023 write failed with error message: " + err.message + ", error code: " + err.code);
                expect(false).assertTrue();
            });
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_023 has failed for ' + err);
            fileIO.unlinkSync(fpath);
            expect(err.code === 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_024
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_2400
     * @tc.desc   Test write() interface. return in callback mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_024', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_024');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.WRITE_ONLY);
            let randomaccessfile = await fileIO.createRandomAccessFile(file);
            let length = 20;
            randomaccessfile.write(new ArrayBuffer(length), null, function(err, bytesWritten) {
                expect(bytesWritten == length).assertTrue();
                randomaccessfile.close();
                fileIO.closeSync(file.fd);
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_024 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_025
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_2500
     * @tc.desc   Test write() interface. return in callback mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_025', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_025');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.WRITE_ONLY);
            let randomaccessfile = await fileIO.createRandomAccessFile(file);
            let length = 20;
            randomaccessfile.write(new ArrayBuffer(length), undefined, function(err, bytesWritten) {
                expect(bytesWritten == length).assertTrue();
                randomaccessfile.close();
                fileIO.closeSync(file.fd);
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_025 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_026
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_2600
     * @tc.desc   Test write() interface. return in callback mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_026', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_026');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.WRITE_ONLY);
            let randomaccessfile = await fileIO.createRandomAccessFile(file);
            let length = 20;
            randomaccessfile.write("new ArrayBuffer(length)", { offset: 1 }, function(err, bytesWritten) {
                console.error("fileIO_randomaccessfile_write_async_026 write failed with error message: " + err);
                console.info('fileIO_randomaccessfile_write_async_026 bytesWritten: ' + bytesWritten);
                expect(bytesWritten == 23).assertTrue();
                randomaccessfile.close();
                fileIO.closeSync(file.fd);
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_026 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_027
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_ASYNC_2700
     * @tc.desc   Test write() interface. return in callback mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_027', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_async_027');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.WRITE_ONLY);
            let randomaccessfile = await fileIO.createRandomAccessFile(file);
            let length = 20;
            randomaccessfile.write("", { offset: 1 }, function(err, bytesWritten) {
                console.error("fileIO_randomaccessfile_write_async_027 write failed with error message: " + err);
                console.info('fileIO_randomaccessfile_write_async_027 bytesWritten: ' + bytesWritten);
                expect(bytesWritten == 0).assertTrue();
                randomaccessfile.close();
                fileIO.closeSync(file.fd);
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_async_027 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });
})
}