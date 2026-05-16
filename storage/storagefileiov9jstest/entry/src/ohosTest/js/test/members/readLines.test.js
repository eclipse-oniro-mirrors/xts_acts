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
    fileIO,prepareFile, nextFileName, describe, it, expect,
  } from '../Common';
  import { Level } from '@ohos/hypium';

const FILE_CONTENTS = 'hello world\nhello js\nhello world1';
  
export default function fileIOReadLines() {
describe('fileIO_fs_readLines', function () {
  
    /**
     * @tc.name   fileIO_test_readLines_sync_001
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_0100
     * @tc.desc   Test readLinesSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_readLines_sync_001', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_test_readLines_sync_001');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
    
        try {
            let readerIterator = fileIO.readLinesSync(fpath);
            for (let i = 0; i < arr.length; i++) {
                let it = readerIterator.next();
                expect(it.value.trim() == arr[i]).assertTrue();
            }
            fileIO.unlinkSync(fpath);
        } catch (e) {
            console.log('fileIO_test_readLines_sync_001 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });
      
    /**
     * @tc.name   fileIO_test_readLines_sync_002
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_0200
     * @tc.desc   Test readLinesSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_readLines_sync_002', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_test_readLines_sync_002');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");

        try {
            let readerIterator = fileIO.readLinesSync(fpath, {
              encoding: 'utf-8'
            });
            for (let i = 0; i < arr.length; i++) {
                let it = readerIterator.next();
                console.info(" fileIO_test_readLines_sync_002 content: " + it.value + "arr :" + arr[i]);
                expect(it.value.trim() == arr[i]).assertTrue();
            }
            fileIO.unlinkSync(fpath);
        } catch (e) {
            console.log('fileIO_test_readLines_sync_002 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_sync_003
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_0300
     * @tc.desc   Test readLinesSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_sync_003', Level.LEVEL3, async function () {

        try {
            fileIO.readLinesSync();
            expect(false).assertTrue();
        } catch (e) {
            console.log('fileIO_test_readLines_sync_003 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_sync_004
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_0400
     * @tc.desc   Test readLinesSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_sync_004', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_test_readLines_sync_004');

        try {
            fileIO.readLinesSync(fpath);
            expect(false).assertTrue();
        } catch (e) {
            console.log('fileIO_test_readLines_sync_004 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_sync_005
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_0500
     * @tc.desc   Test readLinesSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_sync_005', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_test_readLines_sync_005');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");

        try {
            let readerIterator = fileIO.readLinesSync(fpath, undefined);
            for (let i = 0; i < arr.length; i++) {
                let it = readerIterator.next();
                expect(it.value.trim() == arr[i]).assertTrue();
            }
            fileIO.unlinkSync(fpath);
        } catch (e) {
            console.log('fileIO_test_readLines_sync_005 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_sync_006
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_0600
     * @tc.desc   Test readLinesSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_sync_006', Level.LEVEL3, async function () {
        let fpath = await nextFileName('fileIO_test_readLines_sync_006');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");

        try {
            let readerIterator = fileIO.readLinesSync(fpath, {
              encoding: undefined
            });
            for (let i = 0; i < arr.length; i++) {
                let it = readerIterator.next();
                expect(it.value.trim() == arr[i]).assertTrue();
            }
            fileIO.unlinkSync(fpath);
        } catch (e) {
            console.log('fileIO_test_readLines_sync_006 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_sync_007
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_0700
     * @tc.desc   Test readLinesSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_readLines_sync_007', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_test_readLines_sync_007');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();

        try {
            let readerIterator = fileIO.readLinesSync(fpath, {
                encoding: 'utf-16'
            });
            expect(false).assertTrue
        } catch (e) {
            fileIO.unlinkSync(fpath);
            console.log('fileIO_test_readLines_sync_007 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_sync_008
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_0800
     * @tc.desc   Test readLinesSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_readLines_sync_008', Level.LEVEL0, async function () {
        let fpath = await nextFileName('fileIO_test_readLines_sync_008');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
    
        try {
            let readerIterator = fileIO.readLinesSync(fpath);
            for (let i = 0; i < arr.length; i++) {
                let it = readerIterator.next();
                expect(it.value.trim() == arr[i]).assertTrue();
                expect(it.done == false).assertTrue();
            }
            fileIO.unlinkSync(fpath);
        } catch (e) {
            console.log('fileIO_test_readLines_sync_008 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_async_001
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_0100
     * @tc.desc   Test readLines() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_readLines_async_001', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_test_readLines_async_001');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
        
        try {
            let readerIterator = await fileIO.readLines(fpath);
            for (let i = 0; i < arr.length; i++) {
                let it = readerIterator.next();
                expect(it.value.trim() == arr[i]).assertTrue();
            }
            fileIO.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_readLines_async_001 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_async_002
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_0200
     * @tc.desc   Test readLines() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_readLines_async_002', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_test_readLines_async_002');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
        
        try {
            fileIO.readLines(fpath, (err, readerIterator) => {
                if (err) {
                    console.log('fileIO_test_readLines_async_002 error package: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                }
                for (let i = 0; i < arr.length; i++) {
                    let it = readerIterator.next();
                    expect(it.value.trim() == arr[i]).assertTrue();
                }
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch (e) {
            console.log('fileIO_test_readLines_async_002 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_async_003
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_0300
     * @tc.desc   Test readLines() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_async_003', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_test_readLines_async_003');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");

        try {
            let readerIterator = await fileIO.readLines(fpath, {
              encoding : 'utf-8'
            });
            for (let i = 0; i < arr.length; i++) {
                let it = readerIterator.next();
                expect(it.value.trim() == arr[i]).assertTrue();
            }
            fileIO.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_readLines_async_003 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_async_004
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_0400
     * @tc.desc   Test readLines() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_async_004', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_test_readLines_async_004');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");

        try {
            fileIO.readLines(fpath, {
              encoding : 'utf-8'
            }, (err, readerIterator) => {
                if (err) {
                    console.log('fileIO_test_readLines_async_004 error package: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                }
                for (let i = 0; i < arr.length; i++) {
                    let it = readerIterator.next();
                    expect(it.value.trim() == arr[i]).assertTrue();
                }
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch (e) {
            console.log('fileIO_test_readLines_async_004 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_async_005
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_0500
     * @tc.desc   Test readLines() interfaces. Promise.then().catch()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_async_005', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_test_readLines_async_005');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");

        try {
            fileIO.readLines(fpath, {
              encoding: 'utf-8'
            }).then((readerIterator) => {
                for (let i = 0; i < arr.length; i++) {
                    let it = readerIterator.next();
                    expect(it.value.trim() == arr[i]).assertTrue();
                }
                fileIO.unlinkSync(fpath);
                done();
            }).catch((err) => {
                console.log('fileIO_test_readLines_async_005 error package: ' + JSON.stringify(err));
                expect(false).assertTrue();
            });
        } catch (e) {
            console.log('fileIO_test_readLines_async_005 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_async_006
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_0600
     * @tc.desc   Test readLines() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_async_006', Level.LEVEL3, async function (done) {

        try {
            await fileIO.readLines();
            expect(false).assertTrue();
        } catch (e) {
            console.log('fileIO_test_readLines_async_006 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
            done();   
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_async_007
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_0700
     * @tc.desc   Test readLines() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_async_007', Level.LEVEL3, async function (done) {

        try {
            fileIO.readLines((err, readerIterator)  => {
                expect(false).assertTrue();
            });
        } catch (e) {
            console.log('fileIO_copy_file_async_007 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_async_008
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_0800
     * @tc.desc   Test readLines() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_async_008', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_test_readLines_async_008');

        try {
            await fileIO.readLines(fpath);
            expect(false).assertTrue();
        } catch (e) {
            console.log('fileIO_test_readLines_async_008 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_async_009
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_0900
     * @tc.desc   Test readLines() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_async_009', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_test_readLines_async_009');

        try {
            fileIO.readLines(fpath, (err) => {
                if (err) {
                    console.log('fileIO_test_readLines_async_009 error: {message:' + err.message + ', code: ' + err.code + '}');
                    expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
                    done();
                }
            });
        } catch (e) {
            console.log('fileIO_test_readLines_async_009 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_async_010
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_1000
     * @tc.desc   Test readLines() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_async_010', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_test_readLines_async_010');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");

        try {
            let readerIterator = await fileIO.readLines(fpath, undefined);
            for (let i = 0; i < arr.length; i++) {
                let it = readerIterator.next();
                expect(it.value.trim() == arr[i]).assertTrue();
            }
            fileIO.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_readLines_async_010 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_async_011
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_1100
     * @tc.desc   Test readLines() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_async_011', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_test_readLines_async_011');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");

        try {
            fileIO.readLines(fpath, undefined, (err, readerIterator) => {
                if (err) {
                    console.log('fileIO_test_readLines_async_011 error package: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                }
                for (let i = 0; i < arr.length; i++) {
                    let it = readerIterator.next();
                    expect(it.value.trim() == arr[i]).assertTrue();
                }
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch (e) {
            console.log('fileIO_test_readLines_async_011 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_async_012
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_1200
     * @tc.desc   Test readLines() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_async_012', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_test_readLines_async_012');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");

        try {
            let readerIterator = await fileIO.readLines(fpath, {
              encoding: undefined
            });
            for (let i = 0; i < arr.length; i++) {
                let it = readerIterator.next();
                expect(it.value.trim() == arr[i]).assertTrue();
            }
            fileIO.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_readLines_async_012 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_async_013
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_1300
     * @tc.desc   Test readLines() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_async_013', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_test_readLines_async_013');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");

        try {
            fileIO.readLines(fpath, {
              encoding: undefined
            }, (err, readerIterator) => {
                if (err) {
                    console.log('fileIO_test_readLines_async_013 error package: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                }
                for (let i = 0; i < arr.length; i++) {
                    let it = readerIterator.next();
                    expect(it.value.trim() == arr[i]).assertTrue();
                }
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch (e) {
            console.log('fileIO_test_readLines_async_013 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });
    
    /**
     * @tc.name   fileIO_test_readLines_async_014
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_1400
     * @tc.desc   Test readLines() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_async_014', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_test_readLines_async_014');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();

        try {
            let readerIterator = await fileIO.readLines(fpath, {
              encoding : 'utf-16'
            });
            expect(false).assertTrue();
        } catch (e) {
            fileIO.unlinkSync(fpath);
            console.log('fileIO_test_readLines_sync_014 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
            done();
        }
    });
    
    /**
     * @tc.name   fileIO_test_readLines_async_015
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_1500
     * @tc.desc   Test readLines() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_readLines_async_015', Level.LEVEL3, async function (done) {
        let fpath = await nextFileName('fileIO_test_readLines_async_015');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();

        try {
            fileIO.readLines(fpath, {
              encoding : 'utf-16'
            }, (err,readerIterator) => {
                expect(false).assertTrue();
            });
        } catch (e) {
            fileIO.unlinkSync(fpath);
            console.log('fileIO_test_readLines_sync_015 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
            done();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_async_016
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_1600
     * @tc.desc   Test readLines() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_readLines_async_016', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_test_readLines_async_016');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
        
        try {
            let readerIterator = await fileIO.readLines(fpath);
            for (let i = 0; i < arr.length; i++) {
                let it = readerIterator.next();
                expect(it.value.trim() == arr[i]).assertTrue();
                expect(it.done == false).assertTrue();
            }
            fileIO.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_readLines_async_016 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_readLines_async_017
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_READLINES_ASYNC_1700
     * @tc.desc   Test readLines() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_readLines_async_017', Level.LEVEL0, async function (done) {
        let fpath = await nextFileName('fileIO_test_readLines_async_017');
        expect(prepareFile(fpath, FILE_CONTENTS)).assertTrue();
        let arr = FILE_CONTENTS.split("\n");
        
        try {
            fileIO.readLines(fpath, (err, readerIterator) => {
                if (err) {
                    console.log('fileIO_test_readLines_async_017 error package: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                }
                for (let i = 0; i < arr.length; i++) {
                    let it = readerIterator.next();
                    expect(it.value.trim() == arr[i]).assertTrue();
                    expect(it.done == false).assertTrue();
                }
                fileIO.unlinkSync(fpath);
                done();
            });
        } catch (e) {
            console.log('fileIO_test_readLines_async_017 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
        }
    });
})
}