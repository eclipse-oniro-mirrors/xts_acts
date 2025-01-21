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
    fileIO, prepareFile, nextFileName, isIntNum, FILE_CONTENT,
    describe, it, expect
} from '../Common';
import fs from '@ohos.file.fs';

const wpath = 'data/storage/el2/base/write.txt';
export function initReadfile(fpath) {
  const file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE | fileIO.OpenMode.TRUNC);
  const buffer = new Array(16 * 1024);
  for (let times = 0; times < 1; times++){
    let charCode = 'a'.charCodeAt(0);
    for(let i = 0; i < 26; i++){
      buffer.fill(String.fromCharCode(charCode));
      fileIO.writeSync(file.fd, buffer.join(''));
      charCode++;
    }
  }
  const writefile = fileIO.openSync(wpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE | fileIO.OpenMode.TRUNC);
  fileIO.closeSync(writefile);
}

export default function fileIOCreateRandomAccessFile() {
describe('fileIO_create_randomAccessFile', function () {

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0000
     * @tc.name fileIO_create_randomaccessfile_sync_000
     * @tc.desc Test createRandomAccessFileSync() interface.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_000', 0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_000');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_000 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0100
     * @tc.name fileIO_create_randomaccessfile_sync_001
     * @tc.desc Test createRandomAccessFileSync() interface. filePointer = 5.
     * Create RandomAccessFile object to access file from filePointer location.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_001', 0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.setFilePointer(5);
            expect(randomaccessfile.filePointer == 5).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_001 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0200
     * @tc.name fileIO_create_randomaccessfile_sync_002
     * @tc.desc Test createRandomAccessFileSync() interface.
     * Create RandomAccessFile object based on file descriptor to access file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_002', 0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_002');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let randomaccessfile = fileIO.createRandomAccessFileSync(file);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.close();
            fileIO.closeSync(file.fd);
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_002 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0300
     * @tc.name fileIO_create_randomaccessfile_sync_003
     * @tc.desc Test createRandomAccessFileSync() interface. filePointer = 1.
     * Create RandomAccessFile object based on file descriptor to access file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_003', 0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_003');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let randomaccessfile = fileIO.createRandomAccessFileSync(file);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.setFilePointer(1);
            expect(randomaccessfile.filePointer == 1).assertTrue();
            randomaccessfile.close();
            fileIO.closeSync(file.fd);
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_003 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0400
     * @tc.name fileIO_create_randomaccessfile_sync_004
     * @tc.desc Test createRandomAccessFileSync() interface. No such file or directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_004', 3, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_004');

        try {
            fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_004 has failed for ' + err);
            expect(err.code == 13900002 && err.message == "No such file or directory").assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0500
     * @tc.name fileIO_create_randomaccessfile_sync_005
     * @tc.desc Test createRandomAccessFileSync() interface. Invalid fd.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_005', 3, async function () {
        try {
            fileIO.createRandomAccessFileSync(-1, 0);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_005 has failed for ' + err);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0600
     * @tc.name fileIO_create_randomaccessfile_sync_006
     * @tc.desc Test createRandomAccessFileSync() interface. Invalid fp.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_006', 3, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_006');
        let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(file);
            randomaccessfile.setFilePointer("1");
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_006 has failed for ' + err);
            fileIO.closeSync(file.fd);
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0700
     * @tc.name fileIO_create_randomaccessfile_sync_007
     * @tc.desc Test createRandomAccessFileSync() interface. Missing Parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_007', 3, async function () {

        try {
            fileIO.createRandomAccessFileSync();
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_007 has failed for ' + err);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0800
     * @tc.name fileIO_create_randomaccessfile_sync_008
     * @tc.desc Test createRandomAccessFileSync() interface. flags=fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_008', 0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_008');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_008 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0900
     * @tc.name fileIO_create_randomaccessfile_sync_009
     * @tc.desc Test createRandomAccessFileSync() interface. flags=-1. Invalid Mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_009', 3, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_009');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            fileIO.createRandomAccessFileSync(fpath, -1);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_009 has failed for ' + err);
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1000
     * @tc.name fileIO_create_randomaccessfile_sync_010
     * @tc.desc Test createRandomAccessFileSync() interface. flags=fileIO.OpenMode.TRUNC | fileIO.OpenMode.READ_WRITE.
     * If the file exists and the file is opened for write-only or read-write, trim its length to zero.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_010', 0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_010');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.TRUNC | fileIO.OpenMode.READ_WRITE);
            let number = randomaccessfile.readSync(new ArrayBuffer(4096));
            expect(number == 0).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_010 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1100
     * @tc.name fileIO_create_randomaccessfile_sync_011
     * @tc.desc Test createRandomAccessFileSync() interface. flags=fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE.
     * Open as append, subsequent writes will append to the end of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_011', 0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_011');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE);
            let length = 100;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.setFilePointer(0);
            let readLength = randomaccessfile.readSync(new ArrayBuffer(4096), { offset: 0 });
            expect(readLength == length + FILE_CONTENT.length).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_011 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1200
     * @tc.name fileIO_create_randomaccessfile_sync_012
     * @tc.desc Test createRandomAccessFileSync() interface. flags=fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE. Not a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_012', 3, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_012');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_012 has failed for ' + err);
            expect(err.code == 13900018 && err.message == "Not a directory").assertTrue();
            fileIO.unlinkSync(fpath);
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1300
     * @tc.name fileIO_create_randomaccessfile_sync_013
     * @tc.desc Test createRandomAccessFileSync() interface. flags=fileIO.OpenMode.NOFOLLOW | fileIO.OpenMode.READ_WRITE.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_013', 0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_013');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.NOFOLLOW | fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_013 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1400
     * @tc.name fileIO_create_randomaccessfile_sync_014
     * @tc.desc Test createRandomAccessFileSync() interface. flags=fileIO.OpenMode.SYNC | fileIO.OpenMode.READ_WRITE.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_014', 0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_014');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.SYNC | fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_014 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1500
     * @tc.name fileIO_create_randomaccessfile_sync_015
     * @tc.desc Test createRandomAccessFileSync() interface. flags=fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE. Invalid filepath.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_015', 3, async function () {
       let dpath = await nextFileName('fileIO_create_randomaccessfile_sync_015') + 'd';
       fileIO.mkdirSync(dpath);

       try {
           fileIO.createRandomAccessFileSync(dpath, fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE);
           expect(false).assertTrue();
       } catch(err) {
           console.info('fileIO_create_randomaccessfile_sync_015 has failed for ' + err);
           expect(err.code == 13900019 && err.message == "Is a directory").assertTrue();
           fileIO.rmdirSync(dpath);
       }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1600
     * @tc.name fileIO_create_randomaccessfile_sync_016
     * @tc.desc Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_016', 0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_016');
        initReadfile(fpath);
        const readfile = fileIO.openSync(fpath, fs.OpenMode.READ_ONLY);
        const writefile = fileIO.openSync(wpath, fs.OpenMode.WRITE_ONLY);

        try {
            let rs = fs.createRandomAccessFileSync(readfile).getReadStream();
            let ws = fs.createRandomAccessFileSync(writefile).getWriteStream();
            rs.on('data', (emitData) => {
                let data = emitData?.data;
                ws.write(data);
                console.log('fileIO_create_randomaccessfile_sync_016 content ' + data.slice(0, 10) + ', data.length: ' + data?.length);
              });
              rs.on('close', async() =>{
                let readhash = await Hash.hash(fpath, 'sha256');
                let writehash = await Hash.hash(wpath, 'sha256');
                console.log('fileIO_create_randomaccessfile_sync_016 readhash ' + readhash + ', writehash: ' + writehash);
                expect(readhash == writehash).assertTrue();
              });
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_sync_016 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1700
     * @tc.name fileIO_create_randomaccessfile_sync_017
     * @tc.desc Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_017', 0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_017');
        initReadfile(fpath);
        let size = fs.lstatSync(fpath).size;

        try {
            let randomaccessfile1 = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:0, end:size/4});
            let rs = randomaccessfile1.getReadStream();
            let randomaccessfile2 = fs.createRandomAccessFileSync(wpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:0});
            let ws = randomaccessfile2.getWriteStream();
            rs.on('data', (emitData) => {
                let data = emitData?.data;
                ws.write(data);
                console.log('fileIO_create_randomaccessfile_sync_017 content ' + data.slice(0, 10) + ', data.length: ' + data?.length);
              });
              rs.on('close', async() =>{
                let readhash = await Hash.hash(fpath, 'sha256');
                let writehash = await Hash.hash(wpath, 'sha256');
                console.log('fileIO_create_randomaccessfile_sync_017 readhash ' + readhash + ', writehash: ' + writehash);
                expect(readhash == writehash).assertTrue();
              });
            fileIO.unlinkSync(fpath);
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_sync_017 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1800
     * @tc.name fileIO_create_randomaccessfile_sync_018
     * @tc.desc Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_018', 0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_018');
        initReadfile(fpath);
        let size = fs.lstatSync(fpath).size;

        try {
            let randomaccessfile1 = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:size/4, end:size/2});
            let rs = randomaccessfile1.getReadStream();
            let randomaccessfile2 = fs.createRandomAccessFileSync(wpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:size/4});
            let ws = randomaccessfile2.getWriteStream();
            rs.on('data', (emitData) => {
                let data = emitData?.data;
                ws.write(data);
                console.log('fileIO_create_randomaccessfile_sync_018 content ' + data.slice(0, 10) + ', data.length: ' + data?.length);
              });
              rs.on('close', async() =>{
                let readhash = await Hash.hash(fpath, 'sha256');
                let writehash = await Hash.hash(wpath, 'sha256');
                console.log('fileIO_create_randomaccessfile_sync_018 readhash ' + readhash + ', writehash: ' + writehash);
                expect(readhash == writehash).assertTrue();
              });
            fileIO.unlinkSync(fpath);
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_sync_018 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0000
     * @tc.name fileIO_create_randomaccessfile_async_000
     * @tc.desc Test createRandomAccessFile() interface. return in promise mode.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_000', 0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_000');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_000 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0100
     * @tc.name fileIO_create_randomaccessfile_async_001
     * @tc.desc Test createRandomAccessFile() interface. filePointer = 10. return in callback mode.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_001', 0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_001');

        try {
            fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE, function(err, randomaccessfile) {
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                randomaccessfile.setFilePointer(10);
                expect(randomaccessfile.filePointer == 10).assertTrue();
                randomaccessfile.close();
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_001 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0200
     * @tc.name fileIO_create_randomaccessfile_async_002
     * @tc.desc Test createRandomAccessFile() interface.
     * Create RandomAccessFile object based on file descriptor to access file. return in callback mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_002', 0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_002');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            fileIO.createRandomAccessFile(file, function(err, randomaccessfile) {
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                randomaccessfile.close();
                fileIO.closeSync(file.fd);
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_002 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0300
     * @tc.name fileIO_create_randomaccessfile_async_003
     * @tc.desc Test createRandomAccessFile() interface. filePointer = 1.
     * Create RandomAccessFile object based on file descriptor to access file. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_003', 0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_003');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let randomaccessfile = await fileIO.createRandomAccessFile(file);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.setFilePointer(1);
            expect(randomaccessfile.filePointer == 1).assertTrue();
            randomaccessfile.close();
            fileIO.closeSync(file.fd);
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_003 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0400
     * @tc.name fileIO_create_randomaccessfile_async_004
     * @tc.desc Test createRandomAccessFile() interface. No such file or directory. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_004', 3, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_004');

        try {
            await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.READ_WRITE);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_004 has failed for ' + err);
            expect(err.code == 13900002 && err.message == "No such file or directory").assertTrue();
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0500
     * @tc.name fileIO_create_randomaccessfile_async_005
     * @tc.desc Test createRandomAccessFile() interface. Invalid fd. return in callback mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_005', 3, async function (done) {
        try {
            fileIO.createRandomAccessFile(-1, 0, function(err) {
            });
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_005 has failed for ' + err);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0600
     * @tc.name fileIO_create_randomaccessfile_async_006
     * @tc.desc Test createRandomAccessFile() interface. Invalid fp. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_006', 3, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_006');
        let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
        let randomaccessfile;
        try {
            randomaccessfile = await fileIO.createRandomAccessFile(file);
            randomaccessfile.setFilePointer('1');
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_006 has failed for ' + err);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            randomaccessfile.close();
            fileIO.closeSync(file.fd);
            fileIO.unlinkSync(fpath);
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0700
     * @tc.name fileIO_create_randomaccessfile_async_007
     * @tc.desc Test createRandomAccessFile() interface. Missing Parameter. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_007', 0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_007');
        let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(file);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.close();
            fileIO.closeSync(file.fd);
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_007 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0800
     * @tc.name fileIO_create_randomaccessfile_async_008
     * @tc.desc Test createRandomAccessFile() interface. flags=fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
     * Create RandomAccessFile object to access file based on file path. return in callback mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_008', 0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_008');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE, function(err, randomaccessfile) {
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                randomaccessfile.close();
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_008 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0900
     * @tc.name fileIO_create_randomaccessfile_async_009
     * @tc.desc Test createRandomAccessFile() interface. flags=-1. Invalid Mode. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_009', 3, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_009');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            await fileIO.createRandomAccessFile(fpath, -1);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_009 has failed for ' + err);
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            fileIO.unlinkSync(fpath);
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1000
     * @tc.name fileIO_create_randomaccessfile_async_010
     * @tc.desc Test createRandomAccessFile() interface. flags=fileIO.OpenMode.TRUNC | fileIO.OpenMode.READ_WRITE.
     * If the file exists and the file is opened for write-only or read-write, trim its length to zero. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_010', 0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_010');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.TRUNC | fileIO.OpenMode.READ_WRITE);
            let number = randomaccessfile.readSync(new ArrayBuffer(4096));
            expect(number == 0).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_010 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1100
     * @tc.name fileIO_create_randomaccessfile_async_011
     * @tc.desc Test createRandomAccessFile() interface. flags=fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE.
     * Open as append, subsequent writes will append to the end of the file. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_011', 0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_011');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE);
            let length = 100;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
            expect(bytesWritten == length).assertTrue();
            randomaccessfile.setFilePointer(0);
            let number = randomaccessfile.readSync(new ArrayBuffer(4096), { offset: 0 });
            expect(number == length + FILE_CONTENT.length).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_011 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1200
     * @tc.name fileIO_create_randomaccessfile_async_012
     * @tc.desc Test createRandomAccessFile() interface. flags=fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE. Not a directory. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_012', 3, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_012');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_012 has failed for ' + err);
            expect(err.code == 13900018 && err.message == "Not a directory").assertTrue();
            fileIO.unlinkSync(fpath);
            done();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1300
     * @tc.name fileIO_create_randomaccessfile_async_013
     * @tc.desc Test createRandomAccessFile() interface. flags=fileIO.OpenMode.NOFOLLOW | fileIO.OpenMode.READ_WRITE.
     * Create RandomAccessFile object to access file based on file path. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_013', 0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_013');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.NOFOLLOW | fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_013 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1400
     * @tc.name fileIO_create_randomaccessfile_async_014
     * @tc.desc Test createRandomAccessFile() interface. flags=fileIO.OpenMode.SYNC.
     * Create RandomAccessFile object to access file based on file path. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_014', 0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_014');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.SYNC | fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_014 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1500
     * @tc.name fileIO_create_randomaccessfile_async_015
     * @tc.desc Test createRandomAccessFile() interface. flags=fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE. Invalid filepath. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_015', 3, async function (done) {
       let dpath = await nextFileName('fileIO_create_randomaccessfile_async_015') + 'd';
       fileIO.mkdirSync(dpath);

       try {
           await fileIO.createRandomAccessFile(dpath, fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE);
       } catch(err) {
           console.info('fileIO_create_randomaccessfile_async_015 has failed for ' + err);
           fileIO.rmdirSync(dpath);
           expect(err.code == 13900019 && err.message == "Is a directory").assertTrue();
           done();
       }
   });

     /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1600
     * @tc.name fileIO_create_randomaccessfile_async_016
     * @tc.desc Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
     it('fileIO_create_randomaccessfile_async_016', 0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_016');
        initReadfile(fpath);
        let size = fs.lstatSync(fpath).size;

        try {
            let randomaccessfile1 = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:size/4*3, end:size});
            let rs = randomaccessfile1.getReadStream();
            let randomaccessfile2 = await fs.createRandomAccessFile(wpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:0});
            let ws = randomaccessfile2.getWriteStream();
            rs.on('data', (emitData) => {
                let data = emitData?.data;
                ws.write(data);
                console.log('fileIO_create_randomaccessfile_async_016 content ' + data.slice(0, 10) + ', data.length: ' + data?.length);
              });
              rs.on('close', async() =>{
                let readhash = await Hash.hash(fpath, 'sha256');
                let writehash = await Hash.hash(wpath, 'sha256');
                console.log('fileIO_create_randomaccessfile_async_016 readhash ' + readhash + ', writehash: ' + writehash);
                expect(readhash == writehash).assertTrue();
              });
            fileIO.unlinkSync(fpath);
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_016 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1800
     * @tc.name fileIO_create_randomaccessfile_async_018
     * @tc.desc Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_018', 0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_018');
        initReadfile(fpath);
        let size = fs.lstatSync(fpath).size;

        try {
            let randomaccessfile1 = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:size/2, end:size});
            let rs = randomaccessfile1.getReadStream();
            let randomaccessfile2 = await fs.createRandomAccessFile(wpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:size/4*3});
            let ws = randomaccessfile2.getWriteStream();
            rs.on('data', (emitData) => {
                let data = emitData?.data;
                ws.write(data);
                console.log('fileIO_create_randomaccessfile_async_018 content ' + data.slice(0, 10) + ', data.length: ' + data?.length);
              });
              rs.on('close', async() =>{
                let readhash = await Hash.hash(fpath, 'sha256');
                let writehash = await Hash.hash(wpath, 'sha256');
                console.log('fileIO_create_randomaccessfile_async_018 readhash ' + readhash + ', writehash: ' + writehash);
                expect(readhash == writehash).assertTrue();
              });
            fileIO.unlinkSync(fpath);
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_018 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_MULTITHREADED_REPLICATION_0000
     * @tc.name fileIO_randomaccessfile_multithreaded_replication_000
     * @tc.desc Test createRandomAccessFileSync() interface. Test multi-threaded replication.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_multithreaded_replication_000', 0, async function (done) {
        let srcpath = await nextFileName('fileIO_randomaccessfile_multithreaded_replication_000');
        let dstpath = await nextFileName('fileIO_randomaccessfile_multithreaded_replication_000_1');
        let length = 4096;
        let buffer = new ArrayBuffer(length);
        expect(prepareFile(srcpath, buffer)).assertTrue();

        try {
            let fileSize = fileIO.statSync(srcpath).size;
            // init randomaccessfiles
            let threadNums = 4;
            let srcfiles = new Array();
            let dstfiles = new Array();
            for (let i = 0; i < threadNums; i++) {
                srcfiles[i] = fileIO.createRandomAccessFileSync(srcpath, fileIO.OpenMode.READ_WRITE);
                dstfiles[i] = fileIO.createRandomAccessFileSync(dstpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
                srcfiles[i].setFilePointer(fileSize / threadNums * i);
                dstfiles[i].setFilePointer(fileSize / threadNums * i);
            }
            // copy in every thread i from multi-thread
            let bufs = new Array(threadNums);
            let len = length / threadNums;
            for(let i = 0; i < threadNums; i++) {
                bufs[i] = new ArrayBuffer(len);
                srcfiles[i].read(bufs[i]).then(async function(readLength) {
                    let writeLen = await dstfiles[i].write(bufs[i]);
                    expect(writeLen == len).assertTrue();
                    dstfiles[i].close();
                    srcfiles[i].close();
                    if (i == threadNums - 1) {
                        let size = fileIO.statSync(dstpath).size;
                        expect(size == fileSize).assertTrue();
                        fileIO.unlinkSync(srcpath);
                        fileIO.unlinkSync(dstpath);
                        done();
                    }
                });
            }
        } catch (err) {
            console.info('fileIO_randomaccessfile_multithreaded_replication_000 has failed for ' + err);
            expect(false).assertTrue();
        }
    });
})
}
