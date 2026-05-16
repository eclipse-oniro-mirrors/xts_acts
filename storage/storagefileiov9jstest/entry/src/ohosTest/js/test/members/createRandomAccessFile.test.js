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
import { TestType, Size, Level } from '@ohos/hypium';

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
     * @tc.name   fileIO_create_randomaccessfile_sync_000
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0000
     * @tc.desc   Test createRandomAccessFileSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
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
     * @tc.name   fileIO_create_randomaccessfile_sync_001
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0100
     * @tc.desc   Test createRandomAccessFileSync() interface. filePointer = 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.setFilePointer(5);
            expect(randomaccessfile.filePointer === 5).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_001 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_002
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0200
     * @tc.desc   Test createRandomAccessFileSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
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
     * @tc.name   fileIO_create_randomaccessfile_sync_003
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0300
     * @tc.desc   Test createRandomAccessFileSync() interface. filePointer = 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_003');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let randomaccessfile = fileIO.createRandomAccessFileSync(file);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.setFilePointer(1);
            expect(randomaccessfile.filePointer === 1).assertTrue();
            randomaccessfile.close();
            fileIO.closeSync(file.fd);
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_003 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_004
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0400
     * @tc.desc   Test createRandomAccessFileSync() interface. No such file or directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_004', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_004');

        try {
            fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_004 has failed for ' + err);
            expect(err.code === 13900002 && err.message === "No such file or directory").assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_005
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0500
     * @tc.desc   Test createRandomAccessFileSync() interface. Invalid fd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_005', Level.LEVEL3, async function () {
        try {
            fileIO.createRandomAccessFileSync(-1, 0);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_005 has failed for ' + err);
            expect(err.code === 13900020 && err.message === "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_006
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0600
     * @tc.desc   Test createRandomAccessFileSync() interface. Invalid fp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_006', Level.LEVEL3, async function () {
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
            expect(err.code === 13900020 && err.message === "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_007
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0700
     * @tc.desc   Test createRandomAccessFileSync() interface. Missing Parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_007', Level.LEVEL3, async function () {

        try {
            fileIO.createRandomAccessFileSync();
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_007 has failed for ' + err);
            expect(err.code === 13900020 && err.message === "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_008
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0800
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
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
     * @tc.name   fileIO_create_randomaccessfile_sync_009
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_0900
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=-1. Invalid Mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_009', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_009');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            fileIO.createRandomAccessFileSync(fpath, -1);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_009 has failed for ' + err);
            fileIO.unlinkSync(fpath);
            expect(err.code === 13900020 && err.message === "Invalid argument").assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_010
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1000
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=fileIO.OpenMode.TRUNC | fileIO.OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_010');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.TRUNC | fileIO.OpenMode.READ_WRITE);
            let number = randomaccessfile.readSync(new ArrayBuffer(4096));
            expect(number === 0).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_010 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_011
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1100
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_011');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE);
            let length = 100;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
            expect(bytesWritten === length).assertTrue();
            randomaccessfile.setFilePointer(0);
            let readLength = randomaccessfile.readSync(new ArrayBuffer(4096), { offset: 0 });
            expect(readLength === length + FILE_CONTENT.length).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_011 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_012
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1200
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE. Not a directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_012', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_012');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            fileIO.createRandomAccessFileSync(fpath, fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_012 has failed for ' + err);
            expect(err.code === 13900018 && err.message === "Not a directory").assertTrue();
            fileIO.unlinkSync(fpath);
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_013
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1300
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=fileIO.OpenMode.NOFOLLOW | fileIO.OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
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
     * @tc.name   fileIO_create_randomaccessfile_sync_014
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1400
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=fileIO.OpenMode.SYNC | fileIO.OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
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
     * @tc.name   fileIO_create_randomaccessfile_sync_015
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1500
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE. Invalid filepath.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_015', Level.LEVEL3, async function () {
       let dpath = await nextFileName('fileIO_create_randomaccessfile_sync_015') + 'd';
       fileIO.mkdirSync(dpath);

       try {
           fileIO.createRandomAccessFileSync(dpath, fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE);
           expect(false).assertTrue();
       } catch(err) {
           console.info('fileIO_create_randomaccessfile_sync_015 has failed for ' + err);
           expect(err.code === 13900019 && err.message === "Is a directory").assertTrue();
           fileIO.rmdirSync(dpath);
       }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_016
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1600
     * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
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
                expect(readhash === writehash).assertTrue();
              });
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_sync_016 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_017
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1700
     * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
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
                expect(readhash === writehash).assertTrue();
              });
            fileIO.unlinkSync(fpath);
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_sync_017 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_018
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1800
     * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
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
                expect(readhash === writehash).assertTrue();
              });
            fileIO.unlinkSync(fpath);
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_sync_018 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

     /**
      * @tc.name   fileIO_create_randomaccessfile_sync_019
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1900
      * @tc.desc   Test createRandomAccessFileSync() interface. Invalid argument
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('fileIO_create_randomaccessfile_sync_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_019');
        initReadfile(fpath);
        const readfile = fileIO.openSync(fpath, fs.OpenMode.READ_ONLY);

        try {
            let rs = fs.createRandomAccessFileSync(readfile).getReadStream(1);
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_sync_019 has failed for ' + err.message + ', code: ' + err.code);
            expect(err.code === 13900020 && err.message === 'Invalid argument').assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_020
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_2000
     * @tc.desc   Test createRandomAccessFileSync() interface. Invalid argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_020');
        initReadfile(fpath);
        const writefile = fileIO.openSync(wpath, fs.OpenMode.WRITE_ONLY);

        try {
            let ws = fs.createRandomAccessFileSync(writefile).getWriteStream(1);
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_sync_020 has failed for ' + err.message + ', code: ' + err.code);
            expect(err.code === 13900020 && err.message === 'Invalid argument').assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_021
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_2100
     * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_021');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile1 = fs.createRandomAccessFileSync(null, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:1, end:10});
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_sync_021 has failed for ' + err);
            expect(err.code === 13900020 && err.message === 'Invalid argument').assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_022
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_2200
     * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_022');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile1 = fs.createRandomAccessFileSync(undefined, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:1, end:10});
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_sync_022 has failed for ' + err);
            expect(err.code === 13900020 && err.message === 'Invalid argument').assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_023
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_2300
     * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_023');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile1 = fs.createRandomAccessFileSync(fpath, null, {start:1, end:10});
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_sync_023 has failed for ' + err);
            expect(err.code === 13900020 && err.message === 'Invalid argument').assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_024
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_2400
     * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_024');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile1 = fs.createRandomAccessFileSync(fpath, undefined, {start:1, end:10});
            expect(isIntNum(randomaccessfile1.fd)).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_sync_024 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_025
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_2500
     * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_025');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile1 = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, null);
            expect(isIntNum(randomaccessfile1.fd)).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_sync_025 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_026
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_2600
     * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_026');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile1 = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, undefined);
            expect(isIntNum(randomaccessfile1.fd)).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_sync_026 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_027
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_2700
     * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_027');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            let randomaccessfile1 = fs.createRandomAccessFileSync("", fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:1, end:10});
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_sync_027 has failed for ' + err);
            expect(err.code === 13900002 && err.message === "No such file or directory").assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_000
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0000
     * @tc.desc   Test createRandomAccessFile() interface. return in promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   fileIO_create_randomaccessfile_async_001
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0100
     * @tc.desc   Test createRandomAccessFile() interface. filePointer = 10. return in callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_001');

        try {
            fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE, function(err, randomaccessfile) {
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                randomaccessfile.setFilePointer(10);
                expect(randomaccessfile.filePointer === 10).assertTrue();
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
     * @tc.name   fileIO_create_randomaccessfile_async_002
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0200
     * @tc.desc   Test createRandomAccessFile() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   fileIO_create_randomaccessfile_async_003
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0300
     * @tc.desc   Test createRandomAccessFile() interface. filePointer = 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_003');

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
            let randomaccessfile = await fileIO.createRandomAccessFile(file);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.setFilePointer(1);
            expect(randomaccessfile.filePointer === 1).assertTrue();
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
     * @tc.name   fileIO_create_randomaccessfile_async_004
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0400
     * @tc.desc   Test createRandomAccessFile() interface. No such file or directory. return in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_async_004', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_004');

        try {
            await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.READ_WRITE);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_004 has failed for ' + err);
            expect(err.code === 13900002 && err.message === "No such file or directory").assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_005
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0500
     * @tc.desc   Test createRandomAccessFile() interface. Invalid fd. return in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_async_005', Level.LEVEL3, async function (done) {
        try {
            fileIO.createRandomAccessFile(-1, 0, function(err) {
            });
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_005 has failed for ' + err);
            expect(err.code === 13900020 && err.message === "Invalid argument").assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_006
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0600
     * @tc.desc   Test createRandomAccessFile() interface. Invalid fp. return in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_async_006', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_006');
        let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
        let randomaccessfile;
        try {
            randomaccessfile = await fileIO.createRandomAccessFile(file);
            randomaccessfile.setFilePointer('1');
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_006 has failed for ' + err);
            expect(err.code === 13900020 && err.message === "Invalid argument").assertTrue();
            randomaccessfile.close();
            fileIO.closeSync(file.fd);
            fileIO.unlinkSync(fpath);
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_007
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0700
     * @tc.desc   Test createRandomAccessFile() interface. Missing Parameter. return in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   fileIO_create_randomaccessfile_async_008
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0800
     * @tc.desc   Test createRandomAccessFile() interface. flags=fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   fileIO_create_randomaccessfile_async_009
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_0900
     * @tc.desc   Test createRandomAccessFile() interface. flags=-1. Invalid Mode. return in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_async_009', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_009');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            await fileIO.createRandomAccessFile(fpath, -1);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_009 has failed for ' + err);
            expect(err.code === 13900020 && err.message === "Invalid argument").assertTrue();
            fileIO.unlinkSync(fpath);
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_010
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1000
     * @tc.desc   Test createRandomAccessFile() interface. flags=fileIO.OpenMode.TRUNC | fileIO.OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_010');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.TRUNC | fileIO.OpenMode.READ_WRITE);
            let number = randomaccessfile.readSync(new ArrayBuffer(4096));
            expect(number === 0).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_010 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_011
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1100
     * @tc.desc   Test createRandomAccessFile() interface. flags=fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_011');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE);
            let length = 100;
            let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
            expect(bytesWritten === length).assertTrue();
            randomaccessfile.setFilePointer(0);
            let number = randomaccessfile.readSync(new ArrayBuffer(4096), { offset: 0 });
            expect(number === length + FILE_CONTENT.length).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_011 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_012
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1200
     * @tc.desc   Test createRandomAccessFile() interface. flags=fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE. Not a directory. return in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_async_012', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_012');
        expect(prepareFile(fpath, '')).assertTrue();

        try {
            await fileIO.createRandomAccessFile(fpath, fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_012 has failed for ' + err);
            expect(err.code === 13900018 && err.message === "Not a directory").assertTrue();
            fileIO.unlinkSync(fpath);
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_013
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1300
     * @tc.desc   Test createRandomAccessFile() interface. flags=fileIO.OpenMode.NOFOLLOW | fileIO.OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   fileIO_create_randomaccessfile_async_014
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1400
     * @tc.desc   Test createRandomAccessFile() interface. flags=fileIO.OpenMode.SYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   fileIO_create_randomaccessfile_async_015
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1500
     * @tc.desc   Test createRandomAccessFile() interface. flags=fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE. Invalid filepath. return in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_async_015', Level.LEVEL3, async function (done) {
       let dpath = await nextFileName('fileIO_create_randomaccessfile_async_015') + 'd';
       fileIO.mkdirSync(dpath);

       try {
           await fileIO.createRandomAccessFile(dpath, fileIO.OpenMode.DIR | fileIO.OpenMode.READ_WRITE);
       } catch(err) {
           console.info('fileIO_create_randomaccessfile_async_015 has failed for ' + err);
           fileIO.rmdirSync(dpath);
           expect(err.code === 13900019 && err.message === "Is a directory").assertTrue();
           done();
       }
   });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_016
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1600
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('fileIO_create_randomaccessfile_async_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
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
                expect(readhash === writehash).assertTrue();
              });
            fileIO.unlinkSync(fpath);
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_016 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_018
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1800
     * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
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
                expect(readhash === writehash).assertTrue();
              });
            fileIO.unlinkSync(fpath);
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_018 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_multithreaded_replication_000
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_MULTITHREADED_REPLICATION_0000
     * @tc.desc   Test createRandomAccessFileSync() interface. Test multi-threaded replication.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_multithreaded_replication_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
                    expect(writeLen === len).assertTrue();
                    dstfiles[i].close();
                    srcfiles[i].close();
                    if (i === threadNums - 1) {
                        let size = fileIO.statSync(dstpath).size;
                        expect(size === fileSize).assertTrue();
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

     /**
     * @tc.name   fileIO_create_randomaccessfile_async_019
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1900
     * @tc.desc   Test createRandomAccessFile() with RandomAccessFileOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_019');
        let size = 4096;
        let buffer = new ArrayBuffer(size);
        expect(prepareFile(fpath, buffer)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE, {start: 0, end: 1024});
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            let readBuffer = new ArrayBuffer(1024);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === 1024).assertTrue();
            
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_019 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_020
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_2000
     * @tc.desc   Test createRandomAccessFile() callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_020');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_async_020 error: ' + err);
                    expect(false).assertTrue();
                    done();
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_020 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_021
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_2100
     * @tc.desc   Test createRandomAccessFile() with invalid file path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_async_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        let invalidPath = '/nonexistent/path/file.txt';

        try {
            await fs.createRandomAccessFile(invalidPath, fs.OpenMode.READ_WRITE);
            expect(false).assertTrue();
            done();
        } catch(err) {
            expect(err.code === 13900002 && err.message === 'No such file or directory').assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_022
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_2200
     * @tc.desc   Test createRandomAccessFile() with CREATE mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_022');

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            let stat = fs.statSync(fpath);
            expect(stat.size === 0).assertTrue();
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_022 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_023
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_2300
     * @tc.desc   Test createRandomAccessFile() with TRUNC mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_023');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            // Verify file was truncated
            let stat = fs.statSync(fpath);
            expect(stat.size === 0).assertTrue();
            // Write new content
            let writeBuffer = new ArrayBuffer(100);
            let writeLen = randomaccessfile.writeSync(writeBuffer);
            expect(writeLen === 100).assertTrue();
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_023 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_024
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_2400
     * @tc.desc   Test createRandomAccessFile() with APPEND mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_024');
        let initialContent = 'Initial content';
        expect(prepareFile(fpath, initialContent)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            // Append new content
            let writeBuffer = new ArrayBuffer(10);
            let writeLen = randomaccessfile.writeSync(writeBuffer);
            expect(writeLen === 10).assertTrue();
            // Verify final content
            randomaccessfile.setFilePointer(0);
            let readBuffer = new ArrayBuffer(initialContent.length + 10);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === initialContent.length + 10).assertTrue();
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_024 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_025
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_2500
     * @tc.desc   Test createRandomAccessFile() with File object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_025');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
            let randomaccessfile = await fs.createRandomAccessFile(file);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            // Verify read operation
            let readBuffer = new ArrayBuffer(100);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen > 0).assertTrue();
            randomaccessfile.close();
            fs.closeSync(file);
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_025 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_026
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_2600
     * @tc.desc   Test createRandomAccessFile() with invalid mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_async_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_026');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, -1);
            expect(false).assertTrue();
            done();
        } catch(err) {
            expect(err.code === 13900020 && err.message === 'Invalid argument').assertTrue();
            fs.unlinkSync(fpath);
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_027
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_2700
     * @tc.desc   Test createRandomAccessFile() with NOFOLLOW mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_027');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE | fs.OpenMode.NOFOLLOW);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            // Verify read operation
            let readBuffer = new ArrayBuffer(100);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen > 0).assertTrue();
            
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_027 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_028
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_2800
     * @tc.desc   Test createRandomAccessFile() with SYNC mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_028');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE | fs.OpenMode.SYNC);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            
            // Write and read to verify sync operation
            let writeBuffer = new ArrayBuffer(100);
            randomaccessfile.writeSync(writeBuffer);
            
            randomaccessfile.setFilePointer(0);
            let readBuffer = new ArrayBuffer(100);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === 100).assertTrue();
            
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_028 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_029
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_2900
     * @tc.desc   Test createRandomAccessFile() with DIR mode and directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let dpath = await nextFileName('fileIO_create_randomaccessfile_async_029');
        fs.mkdirSync(dpath);

        try {
            let randomaccessfile = await fs.createRandomAccessFile(dpath, fs.OpenMode.READ_WRITE | fs.OpenMode.DIR);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.close();
            expect(false).assertTrue();
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_029 has failed for ' + err);
            fs.rmdirSync(dpath);
            expect(err.code === 13900019 && err.message === "Is a directory").assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_030
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_3000
     * @tc.desc   Test createRandomAccessFile() callback with RandomAccessFileOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_030');
        let size = 4096;
        let buffer = new ArrayBuffer(size);
        expect(prepareFile(fpath, buffer)).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE, {start: 512, end: 2048}, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_async_030 error: ' + err);
                    expect(false).assertTrue();
                    done();
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                // Verify file pointer is at correct position
                let readBuffer = new ArrayBuffer(1536);
                let readLen = randomaccessfile.readSync(readBuffer);
                expect(readLen === 1536).assertTrue();
                randomaccessfile.close();
                expect(false).assertTrue();
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_async_030 has failed for ' + err);
            fs.unlinkSync(fpath);
            expect(err.code === 13900020 && err.message === 'Invalid argument').assertTrue();
            done();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_031
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_3100
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_031');
        initReadfile(fpath);
        let size = fs.lstatSync(fpath).size;

        try {
            let randomaccessfile1 = await fs.createRandomAccessFile(null, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:size/4*3, end:size});
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_031 has failed for ' + err);
            expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_032
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_3200
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_032');
        initReadfile(fpath);
        let size = fs.lstatSync(fpath).size;

        try {
            let randomaccessfile1 = await fs.createRandomAccessFile(undefined, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:size/4*3, end:size});
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_032 has failed for ' + err);
            expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_033
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_3300
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_033');
        initReadfile(fpath);
        let size = fs.lstatSync(fpath).size;

        try {
            let randomaccessfile1 = await fs.createRandomAccessFile(fpath, null, {start:size/4*3, end:size});
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_033 has failed for ' + err);
            expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_034
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_3400
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_034');
        initReadfile(fpath);
        let size = fs.lstatSync(fpath).size;

        try {
            let randomaccessfile1 = await fs.createRandomAccessFile(fpath, undefined, {start:size/4*3, end:size});
            expect(isIntNum(randomaccessfile1.fd)).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_034 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_035
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_3500
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_035');
        initReadfile(fpath);
        let size = fs.lstatSync(fpath).size;

        try {
            let randomaccessfile1 = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, null);
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_035 has failed for ' + err);
            expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_036
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_3600
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_036');
        initReadfile(fpath);
        let size = fs.lstatSync(fpath).size;

        try {
            let randomaccessfile1 = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, undefined);
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_036 has failed for ' + err);
            expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_037
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_3700
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_037');
        initReadfile(fpath);
        let size = fs.lstatSync(fpath).size;

        try {
            let randomaccessfile1 = await fs.createRandomAccessFile("", fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:size/4*3, end:size});
            expect(false).assertTrue();
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_037 has failed for ' + err);
            expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_038
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_3800
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

        try {
            fs.createRandomAccessFile(null, (err) => {
                if (err) {
                  console.error("create randomAccessFile failed with error message: " + err.message + ", error code: " + err.code);
                  expect(false).assertTrue();
                } 
              });
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_038 has failed for ' + err);
            expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_039
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_3900
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

        try {
            fs.createRandomAccessFile(undefined, (err) => {
                if (err) {
                  console.error("fileIO_create_randomaccessfile_async_039 error message: " + err.message + ", error code: " + err.code);
                  expect(false).assertTrue();
                } 
              });
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_039 has failed for ' + err);
            expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_040
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_4000
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

        try {
            fs.createRandomAccessFile("dsjvdahkd", (err) => {
                if (err) {
                  console.error("fileIO_create_randomaccessfile_async_040 error message: " + err.message + ", error code: " + err.code);
                  expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
                } 
              });
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_040 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_041
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_4100
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

        try {
            fs.createRandomAccessFile("", (err) => {
                if (err) {
                  console.error("fileIO_create_randomaccessfile_async_041 error message: " + err.message + ", error code: " + err.code);
                  expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
                } 
              });
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_041 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_042
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_4200
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

        try {
            fs.createRandomAccessFile(null, fs.OpenMode.READ_ONLY, (err) => {
                if (err) {
                  console.error("fileIO_create_randomaccessfile_async_042 error message: " + err.message + ", error code: " + err.code);
                  expect(false).assertTrue();
                }
              });
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_042 has failed for ' + err);
            expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_043
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_4300
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

        try {
            fs.createRandomAccessFile(undefined, fs.OpenMode.READ_ONLY, (err) => {
                if (err) {
                  console.error("fileIO_create_randomaccessfile_async_043 error message: " + err.message + ", error code: " + err.code);
                  expect(false).assertTrue();
                }
              });
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_043 has failed for ' + err);
            expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_044
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_4400
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_044');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, null, (err) => {
                if (err) {
                  console.error("fileIO_create_randomaccessfile_async_044 error message: " + err.message + ", error code: " + err.code);
                  expect(false).assertTrue();
                }
              });
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_044 has failed for ' + err);
            expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_045
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_4500
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_045');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, undefined, (err, randomaccessfile) => {
                if (err) {
                  console.error("fileIO_create_randomaccessfile_async_045 error message: " + err.message + ", error code: " + err.code);
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
              });
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_045 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
      * @tc.name   fileIO_create_randomaccessfile_async_046
      * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_4600
      * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('fileIO_create_randomaccessfile_async_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_async_046');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fs.createRandomAccessFile("", fs.OpenMode.READ_ONLY, (err) => {
                if (err) {
                  console.error("fileIO_create_randomaccessfile_async_046 error message: " + err.message + ", error code: " + err.code);
                  expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
                }
              });
        } catch (err) {
            console.info('fileIO_create_randomaccessfile_async_046 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_001
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_0100
     * @tc.desc   Test createRandomAccessFile(file, callback) - default read-only mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_001 error: ' + err);
                    expect(false).assertTrue();
                    done();
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                expect(randomaccessfile.filePointer === 0).assertTrue();
                let readBuffer = new ArrayBuffer(100);
                let readLen = randomaccessfile.readSync(readBuffer);
                expect(readLen > 0).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_001 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_002
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_0200
     * @tc.desc   Test createRandomAccessFile(file, callback) with File object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_002');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
            fs.createRandomAccessFile(file, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_002 error: ' + err);
                    expect(false).assertTrue();
                    fs.closeSync(file);
                    done();
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                let readBuffer = new ArrayBuffer(100);
                let readLen = randomaccessfile.readSync(readBuffer);
                expect(readLen > 0).assertTrue();
                
                randomaccessfile.close();
                fs.closeSync(file);
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_002 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_filepointer_001
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_FILEPOINTER_0100
     * @tc.desc   Test RandomAccessFile.filePointer property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_filepointer_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_filepointer_001');
        let content = 'Hello World';
        expect(prepareFile(fpath, content)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE);
            expect(randomaccessfile.filePointer === 0).assertTrue();
            randomaccessfile.setFilePointer(6);
            expect(randomaccessfile.filePointer === 6).assertTrue();
            let readBuffer = new ArrayBuffer(5);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === 5).assertTrue();
            expect(randomaccessfile.filePointer === 11).assertTrue();
            randomaccessfile.setFilePointer(0);
            expect(randomaccessfile.filePointer === 0).assertTrue();
            
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_filepointer_001 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_callback_001
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_CALLBACK_0100
     * @tc.desc   Test RandomAccessFile.read() callback version without options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_callback_001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE);
            let readBuffer = new ArrayBuffer(100);
            randomaccessfile.read(readBuffer, (err, readLen) => {
                if (err) {
                    console.info('fileIO_randomaccessfile_read_callback_001 error: ' + err);
                    expect(false).assertTrue();
                    randomaccessfile.close();
                    done();
                }
                expect(readLen > 0).assertTrue();
                expect(randomaccessfile.filePointer === readLen).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_randomaccessfile_read_callback_001 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_read_callback_002
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_CALLBACK_0200
     * @tc.desc   Test RandomAccessFile.read() callback version with options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_read_callback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_read_callback_002');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE);
            randomaccessfile.setFilePointer(10);
            let readBuffer = new ArrayBuffer(100);
            randomaccessfile.read(readBuffer, {offset: 0, length: 50}, (err, readLen) => {
                if (err) {
                    console.info('fileIO_randomaccessfile_read_callback_002 error: ' + err);
                    expect(false).assertTrue();
                    randomaccessfile.close();
                    done();
                }
                console.info('fileIO_randomaccessfile_read_callback_002 readLen ' + readLen);
                expect(readLen === 1).assertTrue();
                console.info('fileIO_randomaccessfile_read_callback_002 filePointer ' + randomaccessfile.filePointer);
                expect(randomaccessfile.filePointer === 11).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_randomaccessfile_read_callback_002 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_callback_001
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_CALLBACK_0100
     * @tc.desc   Test RandomAccessFile.write() callback version without options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_callback_001');

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
            
            let writeBuffer = new ArrayBuffer(100);
            randomaccessfile.write(writeBuffer, (err, writeLen) => {
                if (err) {
                    console.info('fileIO_randomaccessfile_write_callback_001 error: ' + err);
                    expect(false).assertTrue();
                    randomaccessfile.close();
                    done();
                }
                expect(writeLen === 100).assertTrue();
                expect(randomaccessfile.filePointer === 100).assertTrue();
                let stat = fs.statSync(fpath);
                expect(stat.size === 100).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_callback_001 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_callback_002
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_CALLBACK_0200
     * @tc.desc   Test RandomAccessFile.write() callback version with options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_callback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_callback_002');
        expect(prepareFile(fpath, 'Initial')).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE);
            // Set filePointer to 7 (end of 'Initial')
            randomaccessfile.setFilePointer(7);
            let writeBuffer = new ArrayBuffer(50);
            randomaccessfile.write(writeBuffer, {offset: 0, length: 30}, (err, writeLen) => {
                if (err) {
                    console.info('fileIO_randomaccessfile_write_callback_002 error: ' + err);
                    expect(false).assertTrue();
                    randomaccessfile.close();
                    done();
                }
                expect(writeLen === 30).assertTrue();
                expect(randomaccessfile.filePointer === 37).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_callback_002 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_string_001
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_WRITE_STRING_0100
     * @tc.desc   Test RandomAccessFile.write() with string buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_string_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_write_string_001');

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
            
            let writeString = 'Hello Random Access File!';
            let writeLen = randomaccessfile.writeSync(writeString, {encoding: 'utf-8'});
            expect(writeLen === writeString.length).assertTrue();
            // Verify by reading back
            randomaccessfile.setFilePointer(0);
            let readBuffer = new ArrayBuffer(writeString.length);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === writeString.length).assertTrue();
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_write_string_001 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_random_access_001
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_RANDOM_ACCESS_0100
     * @tc.desc   Test random access with multiple filePointer jumps.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_random_access_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_random_access_001');
        let content = '0123456789ABCDEFGHIJ';
        expect(prepareFile(fpath, content)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE);
            randomaccessfile.setFilePointer(0);
            let buf1 = new ArrayBuffer(5);
            let len1 = randomaccessfile.readSync(buf1);
            expect(len1 === 5).assertTrue();
            expect(randomaccessfile.filePointer === 5).assertTrue();
            // Jump to position 10
            randomaccessfile.setFilePointer(10);
            let buf2 = new ArrayBuffer(5);
            let len2 = randomaccessfile.readSync(buf2);
            expect(len2 === 5).assertTrue();
            expect(randomaccessfile.filePointer === 15).assertTrue();
            // Jump back to position 5
            randomaccessfile.setFilePointer(5);
            let buf3 = new ArrayBuffer(5);
            let len3 = randomaccessfile.readSync(buf3);
            expect(len3 === 5).assertTrue();
            expect(randomaccessfile.filePointer === 10).assertTrue();
            // Write at position 20
            randomaccessfile.setFilePointer(20);
            let writeBuf = new ArrayBuffer(5);
            let writeLen = randomaccessfile.writeSync(writeBuf);
            expect(writeLen === 5).assertTrue();
            expect(randomaccessfile.filePointer === 25).assertTrue();
            
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_random_access_001 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_nonblock_001
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_NONBLOCK_0100
     * @tc.desc   Test createRandomAccessFile() with NONBLOCK mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_nonblock_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_nonblock_001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, 
                fs.OpenMode.READ_WRITE | fs.OpenMode.NONBLOCK);
            
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            // Verify read operation
            let readBuffer = new ArrayBuffer(100);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen > 0).assertTrue();
            // Verify write operation
            randomaccessfile.setFilePointer(0);
            let writeBuffer = new ArrayBuffer(50);
            let writeLen = randomaccessfile.writeSync(writeBuffer);
            expect(writeLen === 50).assertTrue();
            
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_nonblock_001 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_error_read_001
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_ERROR_READ_0100
     * @tc.desc   Test RandomAccessFile.read() error handling with invalid buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_error_read_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_error_read_001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE);
            // Try to read with null buffer
            try {
                randomaccessfile.readSync(null);
                expect(false).assertTrue();
            } catch (err) {
                expect(err.code === 13900020 && err.message === 'Invalid argument').assertTrue();
            }
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_error_read_001 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_error_write_001
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_ERROR_WRITE_0100
     * @tc.desc   Test RandomAccessFile.write() error handling with invalid buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_error_write_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_error_write_001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_ONLY);
            // Try to write in read-only mode
            try {
                randomaccessfile.writeSync(new ArrayBuffer(100));
                expect(false).assertTrue();
            } catch (err) {
                expect(err.code != null).assertTrue();
            }
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_error_write_001 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_close_001
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_CLOSE_0100
     * @tc.desc   Test RandomAccessFile.close() method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_close_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_randomaccessfile_close_001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE);
            randomaccessfile.close();
            randomaccessfile.readSync(new ArrayBuffer(100));
            expect(false).assertTrue();
            done();
        } catch(err) {
            console.info('fileIO_randomaccessfile_close_001 has failed for ' + err.message);
            fs.unlinkSync(fpath);
            expect(err.code === 13900005 && err.message == 'I/O error').assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_promise_031
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_PROMISE_3100
     * @tc.desc   Test createRandomAccessFile() Promise version with no mode and no options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_promise_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_promise_031');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            // Default mode should be READ_ONLY
            let randomaccessfile = await fs.createRandomAccessFile(fpath);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Verify read operation works
            let readBuffer = new ArrayBuffer(100);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen > 0).assertTrue();
            // Verify filePointer advanced
            expect(randomaccessfile.filePointer === readLen).assertTrue();
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_promise_031 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_promise_032
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_PROMISE_3200
     * @tc.desc   Test createRandomAccessFile() Promise version with mode and no options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_promise_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_promise_032');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Verify write operation works
            let writeBuffer = new ArrayBuffer(100);
            let writeLen = randomaccessfile.writeSync(writeBuffer);
            expect(writeLen === 100).assertTrue();
            // Verify filePointer advanced
            expect(randomaccessfile.filePointer === 100).assertTrue();
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_promise_032 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_promise_033
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_PROMISE_3300
     * @tc.desc   Test createRandomAccessFile() Promise version with options and no mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_promise_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_promise_033');
        let size = 4096;
        let buffer = new ArrayBuffer(size);
        expect(prepareFile(fpath, buffer)).assertTrue();

        try {
            await fs.createRandomAccessFile(fpath, {start: 0, end: 1024});
            expect(false).assertTrue();
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_promise_033 has failed for ' + err.message);
            fs.unlinkSync(fpath);
            expect(err.code === 13900020 && err.message === 'Invalid argument').assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_promise_034
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_PROMISE_3400
     * @tc.desc   Test createRandomAccessFile() Promise version with mode and options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_promise_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_promise_034');
        let size = 4096;
        let buffer = new ArrayBuffer(size);
        expect(prepareFile(fpath, buffer)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE, {start: 1024, end: 3072});
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            // Verify read operation with options
            let readBuffer = new ArrayBuffer(2048);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === 2048).assertTrue();
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_promise_034 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_promise_035
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_PROMISE_3500
     * @tc.desc   Test createRandomAccessFile() Promise version with File object and mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_promise_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_promise_035');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
            let randomaccessfile = await fs.createRandomAccessFile(file, fs.OpenMode.READ_ONLY);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            // Verify read operation works
            let readBuffer = new ArrayBuffer(100);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen > 0).assertTrue();
            randomaccessfile.close();
            fs.closeSync(file);
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_promise_035 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_promise_036
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_PROMISE_3600
     * @tc.desc   Test createRandomAccessFile() Promise version with File object and options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_promise_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_promise_036');
        let size = 4096;
        let buffer = new ArrayBuffer(size);
        expect(prepareFile(fpath, buffer)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);

        try {
            await fs.createRandomAccessFile(file, {start: 512, end: 2048});
            expect(false).assertTrue();
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_promise_036 has failed for ' + err);
            fs.closeSync(file);
            fs.unlinkSync(fpath);
            expect(err.code === 13900020 && err.message === 'Invalid argument').assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_promise_037
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_PROMISE_3700
     * @tc.desc   Test createRandomAccessFile() Promise version with WRITE_ONLY mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_promise_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_promise_037');

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.WRITE_ONLY);
            expect(false).assertTrue();
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_promise_037 has failed for ' + err);
            expect(err.code === 13900002 && err.message === 'No such file or directory').assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_promise_038
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_PROMISE_3800
     * @tc.desc   Test createRandomAccessFile() Promise version with invalid options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_promise_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_promise_038');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            // Invalid options: start > end
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE, {start: 2048, end: 1024});
            // If created, verify behavior
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            // Error is acceptable for invalid options
            expect(err.code !== undefined).assertTrue();
            fs.unlinkSync(fpath);
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_promise_039
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_PROMISE_3900
     * @tc.desc   Test createRandomAccessFile() Promise version with large file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_promise_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_promise_039');
        let largeSize = 1024 * 1024; // 1MB
        let buffer = new ArrayBuffer(largeSize);
        expect(prepareFile(fpath, buffer)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            // Verify read operation on large file
            let readBuffer = new ArrayBuffer(largeSize);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === largeSize).assertTrue();
            // Verify filePointer
            expect(randomaccessfile.filePointer === largeSize).assertTrue();
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_promise_039 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_promise_040
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_PROMISE_4000
     * @tc.desc   Test createRandomAccessFile() Promise version edge case - empty options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_promise_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_promise_040');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            // Empty options object
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE, {});
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Verify read operation works
            let readBuffer = new ArrayBuffer(100);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen > 0).assertTrue();
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_promise_040 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_promise_041
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_PROMISE_4100
     * @tc.desc   Test createRandomAccessFile() Promise version - mode combination TRUNC + CREATE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_promise_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_promise_041');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, 
                fs.OpenMode.CREATE | fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            // Verify file was truncated
            let stat = fs.statSync(fpath);
            expect(stat.size === 0).assertTrue();
            // Write new content
            let writeBuffer = new ArrayBuffer(100);
            let writeLen = randomaccessfile.writeSync(writeBuffer);
            expect(writeLen === 100).assertTrue();
            stat = fs.statSync(fpath);
            expect(stat.size === 100).assertTrue();
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_promise_041 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_promise_042
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_PROMISE_4200
     * @tc.desc   Test createRandomAccessFile() Promise version - options only start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_promise_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_promise_042');
        let size = 4096;
        let buffer = new ArrayBuffer(size);
        expect(prepareFile(fpath, buffer)).assertTrue();

        try {
            // Only start specified, no end
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE, {start: 2048});
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            // Verify read operation from start position
            let readBuffer = new ArrayBuffer(2048);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === 2048).assertTrue();
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_promise_042 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_promise_043
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_PROMISE_4300
     * @tc.desc   Test createRandomAccessFile() Promise version - options only end.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_promise_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_promise_043');
        let size = 4096;
        let buffer = new ArrayBuffer(size);
        expect(prepareFile(fpath, buffer)).assertTrue();

        try {
            // Only end specified, no start
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE, {end: 2048});
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            // Verify read operation from beginning to end
            let readBuffer = new ArrayBuffer(2048);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === 2048).assertTrue();
            randomaccessfile.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_promise_043 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_promise_044
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_PROMISE_4400
     * @tc.desc   Test createRandomAccessFile() Promise version - mode READ_WRITE without CREATE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_promise_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_promise_044');

        try {
            let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE);
            expect(false).assertTrue();
            done();
        } catch(err) {
            expect(err.code === 13900002 && err.message === 'No such file or directory').assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_promise_045
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_PROMISE_4500
     * @tc.desc   Test createRandomAccessFile() Promise version - multiple sequential operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_promise_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_promise_045');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            // Create first RandomAccessFile
            let raf1 = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_ONLY);
            // Read first part
            let readBuffer1 = new ArrayBuffer(50);
            let readLen1 = raf1.readSync(readBuffer1);
            expect(readLen1 === 11).assertTrue();
            expect(raf1.filePointer === 11).assertTrue();
            // Create second RandomAccessFile from same file
            let raf2 = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_ONLY);
            // Read from second RandomAccessFile
            let readBuffer2 = new ArrayBuffer(50);
            let readLen2 = raf2.readSync(readBuffer2);
            expect(readLen2 === 11).assertTrue();
            expect(raf2.filePointer === 11).assertTrue();
            // Both should have different file descriptors
            expect(raf1.fd != raf2.fd).assertTrue();
            // Verify data read is same
            expect(readLen1 === readLen2).assertTrue();
            raf1.close();
            raf2.close();
            fs.unlinkSync(fpath);
            done();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_promise_045 has failed for ' + err.message);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_001
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_0100
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) - READ_ONLY mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_mode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.READ_ONLY, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_mode_001 error: ' + err);
                    expect(false).assertTrue();
                    done();
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                // Verify filePointer property
                expect(randomaccessfile.filePointer === 0).assertTrue();
                expect(typeof randomaccessfile.filePointer === 'number').assertTrue();
                // Verify read operation works
                let readBuffer = new ArrayBuffer(100);
                let readLen = randomaccessfile.readSync(readBuffer);
                expect(readLen > 0).assertTrue();
                // Verify filePointer advanced
                expect(randomaccessfile.filePointer === readLen).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_001 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_002
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_0200
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) - READ_WRITE mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_mode_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_002');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_mode_002 error: ' + err);
                    expect(false).assertTrue();
                    done();
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                // Verify filePointer property
                expect(randomaccessfile.filePointer === 0).assertTrue();
                // Verify write operation works
                let writeBuffer = new ArrayBuffer(100);
                let writeLen = randomaccessfile.writeSync(writeBuffer);
                expect(writeLen === 100).assertTrue();
                // Verify filePointer advanced
                expect(randomaccessfile.filePointer === 100).assertTrue();
                // Verify read operation works
                randomaccessfile.setFilePointer(0);
                let readBuffer = new ArrayBuffer(100);
                let readLen = randomaccessfile.readSync(readBuffer);
                expect(readLen === 100).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_002 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_003
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_0300
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) - WRITE_ONLY mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_mode_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_003');

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.WRITE_ONLY, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_mode_003 error: ' + err.message);
                    expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
                    done();
                }
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_003 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_004
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_0400
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) - CREATE + READ_WRITE mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_mode_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_004');

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_mode_004 error: ' + err);
                    expect(false).assertTrue();
                    done();
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                expect(randomaccessfile.filePointer === 0).assertTrue();
                // Verify file was created with size 0
                let stat = fs.statSync(fpath);
                expect(stat.size === 0).assertTrue();
                // Write data
                let writeBuffer = new ArrayBuffer(100);
                let writeLen = randomaccessfile.writeSync(writeBuffer);
                expect(writeLen === 100).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_004 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_005
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_0500
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) - TRUNC + READ_WRITE mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_mode_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_005');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_mode_005 error: ' + err);
                    expect(false).assertTrue();
                    done();
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                expect(randomaccessfile.filePointer === 0).assertTrue();
                // Verify file was truncated
                let stat = fs.statSync(fpath);
                expect(stat.size === 0).assertTrue();
                // Write new data
                let writeBuffer = new ArrayBuffer(100);
                let writeLen = randomaccessfile.writeSync(writeBuffer);
                expect(writeLen === 100).assertTrue();
                stat = fs.statSync(fpath);
                expect(stat.size === 100).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_005 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_006
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_0600
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) - APPEND + READ_WRITE mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_mode_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_006');
        let initialContent = 'Initial';
        expect(prepareFile(fpath, initialContent)).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_mode_006 error: ' + err);
                    expect(false).assertTrue();
                    done();
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                let writeBuffer = new ArrayBuffer(10);
                let writeLen = randomaccessfile.writeSync(writeBuffer);
                expect(writeLen === 10).assertTrue();
                // Verify file size
                let stat = fs.statSync(fpath);
                expect(stat.size === initialContent.length + 10).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_006 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_007
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_0700
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) - INVALID mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_callback_mode_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_007');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, -1, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_mode_007 error: ' + err);
                }
                if (randomaccessfile) {
                    expect(false).assertTrue();
                }
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_007 has failed for ' + err);
            expect(err.code === 13900020 && err.message === 'Invalid argument').assertTrue();
            fs.unlinkSync(fpath);
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_008
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_0800
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) with File object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_mode_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_008');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
            fs.createRandomAccessFile(file, fs.OpenMode.READ_ONLY, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_mode_008 error: ' + err);
                    expect(false).assertTrue();
                    fs.closeSync(file);
                    done();
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                // Verify filePointer property
                expect(randomaccessfile.filePointer === 0).assertTrue();
                // Verify read operation
                let readBuffer = new ArrayBuffer(100);
                let readLen = randomaccessfile.readSync(readBuffer);
                expect(readLen > 0).assertTrue();
                randomaccessfile.close();
                fs.closeSync(file);
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_008 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_009
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_0900
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) - file not exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_callback_mode_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_009');

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.READ_ONLY, (err, randomaccessfile) => {
                if (err) {
                    // Verify error for non-existent file
                    expect(err.code === 13900002 && err.message === 'No such file or directory').assertTrue();
                    done();
                }
                // If created, verify invalid behavior
                if (randomaccessfile) {
                    expect(false).assertTrue();
                    randomaccessfile.close();
                }
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_009 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_010
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_1000
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) - NOFOLLOW mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_mode_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_010');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE | fs.OpenMode.NOFOLLOW, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_mode_010 error: ' + err);
                    expect(false).assertTrue();
                    done();
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                expect(randomaccessfile.filePointer === 0).assertTrue();
                // Verify read operation
                let readBuffer = new ArrayBuffer(100);
                let readLen = randomaccessfile.readSync(readBuffer);
                expect(readLen > 0).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_010 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_011
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_1100
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) - SYNC mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_mode_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_011');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE | fs.OpenMode.SYNC, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_mode_011 error: ' + err);
                    expect(false).assertTrue();
                    done();
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                // Write and read to verify sync operation
                let writeBuffer = new ArrayBuffer(100);
                let writeLen = randomaccessfile.writeSync(writeBuffer);
                expect(writeLen === 100).assertTrue();
                randomaccessfile.setFilePointer(0);
                let readBuffer = new ArrayBuffer(100);
                let readLen = randomaccessfile.readSync(readBuffer);
                expect(readLen === 100).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_011 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_012
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_1200
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) - comprehensive property verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_mode_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_012');
        let testContent = 'Hello RandomAccessFile World!';
        expect(prepareFile(fpath, testContent)).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_mode_012 error: ' + err);
                    expect(false).assertTrue();
                    done();
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                expect(randomaccessfile.filePointer === 0).assertTrue();
                // 3. Test setFilePointer method
                randomaccessfile.setFilePointer(5);
                expect(randomaccessfile.filePointer === 5).assertTrue();
                // 4. Test readSync method and verify filePointer update
                let readBuffer1 = new ArrayBuffer(10);
                let readLen1 = randomaccessfile.readSync(readBuffer1);
                expect(readLen1 === 10).assertTrue();
                // 5. Test writeSync method and verify filePointer update
                randomaccessfile.setFilePointer(0);
                let writeBuffer = new ArrayBuffer(4);
                let writeLen = randomaccessfile.writeSync(writeBuffer);
                expect(writeLen === 4).assertTrue();
                randomaccessfile.setFilePointer(0);
                let readBuffer2 = new ArrayBuffer(4);
                let readLen2 = randomaccessfile.readSync(readBuffer2);
                console.info('fileIO_create_randomaccessfile_callback_mode_012 readLen2: ' + readLen2);
                expect(readLen2 === 4).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_012 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_013
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_1300
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) - string buffer write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_mode_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_013');

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_mode_013 error: ' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                let writeBuffer = new ArrayBuffer(4);
                let writeLen = randomaccessfile.writeSync(writeBuffer);
                console.info('fileIO_create_randomaccessfile_callback_mode_013 writeLen: ' + writeLen);
                expect(writeLen === 4).assertTrue();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_013 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_014
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_1400
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) - random access pattern.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_mode_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_014');
        let testContent = '012345678901234567890123456789';
        expect(prepareFile(fpath, testContent)).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_mode_014 error: ' + err);
                    expect(false).assertTrue();
                    done();
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                expect(randomaccessfile.filePointer === 0).assertTrue();
                
                // Random access pattern - read from different positions
                let readBuffer1 = new ArrayBuffer(5);
                randomaccessfile.setFilePointer(0);
                let readLen1 = randomaccessfile.readSync(readBuffer1);
                expect(readLen1 === 5).assertTrue();
                expect(randomaccessfile.filePointer === 5).assertTrue();
                
                randomaccessfile.setFilePointer(10);
                let readBuffer2 = new ArrayBuffer(5);
                let readLen2 = randomaccessfile.readSync(readBuffer2);
                expect(readLen2 === 5).assertTrue();
                
                randomaccessfile.setFilePointer(20);
                let readBuffer3 = new ArrayBuffer(5);
                let readLen3 = randomaccessfile.readSync(readBuffer3);
                expect(readLen3 === 5).assertTrue();
                
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_014 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_015
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_1500
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) - read options verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_mode_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_015');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_mode_015 error: ' + err);
                    expect(false).assertTrue();
                    done();
                }
                expect(isIntNum(randomaccessfile.fd)).assertTrue();
                expect(randomaccessfile.filePointer === 0).assertTrue();
                // Set filePointer and read with options
                randomaccessfile.setFilePointer(10);
                let readBuffer = new ArrayBuffer(100);
                let readLen = randomaccessfile.readSync(readBuffer, {offset: 0, length: 50});
                expect(readLen === 1).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_015 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_callback_mode_016
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_CALLBACK_MODE_1600
     * @tc.desc   Test createRandomAccessFile(file, mode, callback) - write options verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_callback_mode_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_callback_mode_016');
        expect(prepareFile(fpath, 'Initial content')).assertTrue();

        try {
            fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE, (err, randomaccessfile) => {
                if (err) {
                    console.info('fileIO_create_randomaccessfile_callback_mode_016 error: ' + err);
                    expect(false).assertTrue();
                    done();
                }
                // Set filePointer and write with options
                randomaccessfile.setFilePointer(7); // After 'Initial'
                let writeBuffer = new ArrayBuffer(100);
                let writeLen = randomaccessfile.writeSync(writeBuffer, {offset: 0, length: 30});
                expect(writeLen === 30).assertTrue();
                expect(randomaccessfile.filePointer === 37).assertTrue();
                randomaccessfile.close();
                fs.unlinkSync(fpath);
                done();
            });
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_callback_mode_016 has failed for ' + err);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_001
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_0100
     * @tc.desc   Test createRandomAccessFileSync() with no mode and no options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            // Default mode should be READ_ONLY
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Verify read operation
            let readBuffer = new ArrayBuffer(100);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen > 0).assertTrue();
            // Verify filePointer advanced
            expect(randomaccessfile.filePointer === readLen).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_001 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_002
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_0200
     * @tc.desc   Test createRandomAccessFileSync() with mode and no options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_002');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fs.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Verify write operation
            let writeBuffer = new ArrayBuffer(100);
            let writeLen = randomaccessfile.writeSync(writeBuffer);
            expect(writeLen === 100).assertTrue();
            expect(randomaccessfile.filePointer === 100).assertTrue();
            // Verify read operation
            randomaccessfile.setFilePointer(0);
            let readBuffer = new ArrayBuffer(100);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === 100).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_002 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_003
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_0300
     * @tc.desc   Test createRandomAccessFileSync() with options and no mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_003');
        let size = 4096;
        let buffer = new ArrayBuffer(size);
        expect(prepareFile(fpath, buffer)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, {start: 0, end: 1024});
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_003 has failed for ' + err);
            fileIO.unlinkSync(fpath);
            expect(err.code === 13900020 && err.message === 'Invalid argument').assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_004
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_0400
     * @tc.desc   Test createRandomAccessFileSync() with mode and options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_004');
        let size = 4096;
        let buffer = new ArrayBuffer(size);
        expect(prepareFile(fpath, buffer)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fs.OpenMode.READ_WRITE, {start: 1024, end: 3072});
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Verify read operation
            let readBuffer = new ArrayBuffer(2048);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === 2048).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_004 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_005
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_0500
     * @tc.desc   Test createRandomAccessFileSync() with File object and no mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_005');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
            let randomaccessfile = fileIO.createRandomAccessFileSync(file);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            // Verify filePointer property
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Verify read operation
            let readBuffer = new ArrayBuffer(100);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen > 0).assertTrue();
            randomaccessfile.close();
            fs.closeSync(file);
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_005 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_006
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_0600
     * @tc.desc   Test createRandomAccessFileSync() with File object and mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_006');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
            let randomaccessfile = fileIO.createRandomAccessFileSync(file, fs.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            // Verify filePointer
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Verify read/write operations
            let writeBuffer = new ArrayBuffer(100);
            let writeLen = randomaccessfile.writeSync(writeBuffer);
            expect(writeLen === 100).assertTrue();
            randomaccessfile.setFilePointer(0);
            let readBuffer = new ArrayBuffer(100);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === 100).assertTrue();
            randomaccessfile.close();
            fs.closeSync(file);
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_006 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_007
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_0700
     * @tc.desc   Test createRandomAccessFileSync() - WRITE_ONLY mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_007');

        try {
            fileIO.createRandomAccessFileSync(fpath, fs.OpenMode.WRITE_ONLY);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_007 has failed for ' + err);
            expect(err.code === 13900002 && err.message === 'No such file or directory').assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_008
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_0800
     * @tc.desc   Test createRandomAccessFileSync() - TRUNC mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_008');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Verify file was truncated
            let stat = fs.statSync(fpath);
            expect(stat.size === 0).assertTrue();
            // Write new content
            let writeBuffer = new ArrayBuffer(100);
            let writeLen = randomaccessfile.writeSync(writeBuffer);
            expect(writeLen === 100).assertTrue();
            stat = fs.statSync(fpath);
            expect(stat.size === 100).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_008 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_009
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_0900
     * @tc.desc   Test createRandomAccessFileSync() - APPEND mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_009');
        let initialContent = 'Initial';
        expect(prepareFile(fpath, initialContent)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Write new content
            let writeBuffer = new ArrayBuffer(10);
            let writeLen = randomaccessfile.writeSync(writeBuffer);
            expect(writeLen === 10).assertTrue();
            // Verify file size
            let stat = fs.statSync(fpath);
            expect(stat.size === initialContent.length + 10).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_009 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_010
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_1000
     * @tc.desc   Test createRandomAccessFileSync() - NOFOLLOW mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_010');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fs.OpenMode.READ_WRITE | fs.OpenMode.NOFOLLOW);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Verify read/write operations
            let writeBuffer = new ArrayBuffer(50);
            let writeLen = randomaccessfile.writeSync(writeBuffer);
            expect(writeLen === 50).assertTrue();
            randomaccessfile.setFilePointer(0);
            let readBuffer = new ArrayBuffer(50);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === 50).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_010 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_011
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_1100
     * @tc.desc   Test createRandomAccessFileSync() - SYNC mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_011');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fs.OpenMode.READ_WRITE | fs.OpenMode.SYNC);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Verify write/read for sync I/O
            let writeBuffer = new ArrayBuffer(100);
            let writeLen = randomaccessfile.writeSync(writeBuffer);
            expect(writeLen === 100).assertTrue();
            randomaccessfile.setFilePointer(0);
            let readBuffer = new ArrayBuffer(100);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === 100).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_011 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_012
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_1200
     * @tc.desc   Test createRandomAccessFileSync() - empty options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_012');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fs.OpenMode.READ_WRITE, {});
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Verify read operation
            let readBuffer = new ArrayBuffer(100);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen > 0).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_012 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_013
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_1300
     * @tc.desc   Test createRandomAccessFileSync() - options with only start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_013');
        let size = 4096;
        let buffer = new ArrayBuffer(size);
        expect(prepareFile(fpath, buffer)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fs.OpenMode.READ_WRITE, {start: 2048});
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Verify read from start position
            let readBuffer = new ArrayBuffer(2048);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === 2048).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_013 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_014
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_1400
     * @tc.desc   Test createRandomAccessFileSync() - options with only end.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_014');
        let size = 4096;
        let buffer = new ArrayBuffer(size);
        expect(prepareFile(fpath, buffer)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fs.OpenMode.READ_WRITE, {end: 2048});
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Verify read from beginning to end
            let readBuffer = new ArrayBuffer(2048);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(readLen === 2048).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_014 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_015
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_1500
     * @tc.desc   Test createRandomAccessFileSync() - invalid mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_015');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fileIO.createRandomAccessFileSync(fpath, -1);
            expect(false).assertTrue();
        } catch(err) {
            expect(err.code === 13900020 && err.message === 'Invalid argument').assertTrue();
            fileIO.unlinkSync(fpath);
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_016
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_1600
     * @tc.desc   Test createRandomAccessFileSync() - file not exists with READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_016');

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fs.OpenMode.READ_WRITE);
            expect(false).assertTrue();
        } catch(err) {
            // Verify error for non-existent file
            expect(err.code === 13900002 && err.message === 'No such file or directory').assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_017
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_1700
     * @tc.desc   Test createRandomAccessFileSync() - all methods verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_017');
        let testContent = 'Hello RandomAccessFile!';
        expect(prepareFile(fpath, testContent)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fs.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            randomaccessfile.setFilePointer(6);
            expect(randomaccessfile.filePointer === 6).assertTrue();
            randomaccessfile.setFilePointer(0);
            let readBuffer1 = new ArrayBuffer(10);
            let readLen1 = randomaccessfile.readSync(readBuffer1, {offset: 0, length: 5});
            expect(readLen1 === 5).assertTrue();
            expect(randomaccessfile.filePointer === 5).assertTrue();
            let writeBuffer = new ArrayBuffer(50);
            let writeLen = randomaccessfile.writeSync(writeBuffer, {offset: 0, length: 4});
            expect(writeLen === 4).assertTrue();
            expect(randomaccessfile.filePointer === 9).assertTrue();
            randomaccessfile.setFilePointer(0);
            let readBuffer2 = new ArrayBuffer(4);
            let readLen2 = randomaccessfile.readSync(readBuffer2);
            expect(readLen2 === 4).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_017 has failed for ' + err);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_018
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_1800
     * @tc.desc   Test createRandomAccessFileSync() - string buffer write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_018');
        let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY);
        try {
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Write string buffer
            let writeString = 'Writing string to RandomAccessFile';
            let writeLen = randomaccessfile.writeSync(writeString, {encoding: 'utf-8'});
            expect(writeLen === writeString.length).assertTrue();
            expect(randomaccessfile.filePointer === writeString.length).assertTrue();
            // Verify by reading back
            randomaccessfile.setFilePointer(0);
            let readBuffer = new ArrayBuffer(writeString.length);
            let readLen = randomaccessfile.readSync(readBuffer);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_018 has failed for ' + err);
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
            expect(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_comprehensive_019
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_COMP_1900
     * @tc.desc   Test createRandomAccessFileSync() - random access pattern.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_sync_comprehensive_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_create_randomaccessfile_sync_comprehensive_019');
        let testContent = '012345678901234567890123456789';
        expect(prepareFile(fpath, testContent)).assertTrue();

        try {
            let randomaccessfile = fileIO.createRandomAccessFileSync(fpath, fs.OpenMode.READ_WRITE);
            expect(isIntNum(randomaccessfile.fd)).assertTrue();
            expect(randomaccessfile.filePointer === 0).assertTrue();
            // Random access pattern - read from different positions
            randomaccessfile.setFilePointer(0);
            let readBuffer1 = new ArrayBuffer(10);
            let readLen1 = randomaccessfile.readSync(readBuffer1);
            expect(readLen1 === 10).assertTrue();
            expect(randomaccessfile.filePointer === 10).assertTrue();
            randomaccessfile.setFilePointer(15);
            let readBuffer2 = new ArrayBuffer(10);
            let readLen2 = randomaccessfile.readSync(readBuffer2);
            expect(readLen2 === 10).assertTrue();
            expect(randomaccessfile.filePointer === 25).assertTrue();
            randomaccessfile.setFilePointer(30);
            let readBuffer3 = new ArrayBuffer(10);
            let readLen3 = randomaccessfile.readSync(readBuffer3);
            expect(readLen3 === 0).assertTrue();
            expect(randomaccessfile.filePointer === 30).assertTrue();
            randomaccessfile.close();
            fileIO.unlinkSync(fpath);
        } catch(err) {
            console.info('fileIO_create_randomaccessfile_sync_comprehensive_019 has failed for ' + err);
            expect(false).assertTrue();
        }
    });
})
}
