/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import {
    fileIO, FILE_CONTENT, prepareFile, prepare200MFile, nextFileName, isIntNum, describe, it, expect,
} from '../Common';
import { Level } from '@ohos/hypium';

const RAND_READ_BASELINE = 3.5;
const RAND_WRITE_BASELINE = 0.5;
const SEQUENCE_READ_BASELINE = 15;
const SEQUENCE_WRITE_BASELINE = 5;

export default function FileIOFilerw_test() {
    describe('FileIO_fs_filerw_test', function () {

        async function IOfunc(file, bf, total, rand, read, promise) {
            let startTime = 0;
            try {
                let array = new ArrayBuffer(bf);
                let count = total / bf;
                startTime = new Date().getTime();
                for (let i = 0; i < count; i++) {
                    let offset = i * bf;
                    if (rand) {
                        offset = Math.floor(Math.random() * (total - bf));
                    }
                    if (promise) {
                        if (read) {
                            fileIO.read(file.fd, array, { length: bf, offset: offset }).then((readLen) => {
                            }).catch((e) => {
                                console.log('fileIO_test_read_promise has failed for ' + e.message + ', code: ' + e.code);
                                return -1;
                            });
                        } else {
                            fileIO.write(file.fd, array, { length: bf, offset: offset, encoding: 'utf-8' }).then((writeLen) => {
                            }).catch((e) => {
                                console.log('fileIO_test_write_promise has failed for ' + e.message + ', code: ' + e.code);
                                return -1;
                            });
                        }
                    } else {
                        if (read) {
                            fileIO.read(file.fd, array, { length: bf, offset: offset }, (err, readLen) => {
                                if (err) {
                                    console.log('fileIO_test_read_callback has failed for ' + err.message + ', code: ' + err.code);
                                    return -1;
                                }
                            });
                        } else {
                            fileIO.write(file.fd, array, { length: bf, offset: offset, encoding: 'utf-8' }, (err, writeLen) => {
                                if (err) {
                                    console.log('fileIO_test_write_callback has failed for ' + err.message + ', code: ' + err.code);
                                    return -1;
                                }
                            });
                        }
                    }
                }
                fileIO.fsyncSync(file.fd);
            } catch (e) {
                console.log('FileIO_fs_filerw_test has failed for ' + e.message + ', code: ' + e.code);
            } finally {
                let endTime = new Date().getTime();
                console.log("FileIO_fs_filerw_test finally" + JSON.stringify(endTime))
                var interval = endTime - startTime;
                var average = total * 1000 / interval;
                var averagerate = average / 0x100000;
                return averagerate;
            }
        }

        /**
         * @tc.number SUB_DF_FILEIO_FILERW_READ_RANDOM_PROMISE_0000
         * @tc.name fileIO_test_read_random_promise_000
         * @tc.desc Test the read() interface. promise.
         * Open the file, file read() in the random way.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 3
         * @tc.require
         */
        it('fileIO_test_read_random_promise_000', Level.LEVEL0, async function (done) {
            let fpath = await nextFileName('fileIO_test_read_random_promise_000');
            expect(prepare200MFile(fpath)).assertTrue;

            try {
                let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
                expect(isIntNum(file.fd)).assertTrue();
                let averagerate = await IOfunc(file, 0x1400, 0x1400000, true, true, true);
                console.log("RAND_READ Rate is" + averagerate + "M/s");
                expect(averagerate > RAND_READ_BASELINE).assertTrue();
                fileIO.closeSync(file);
                fileIO.unlinkSync(fpath);
                done();
            } catch (e) {
                console.log('fileIO_test_read_random_promise_000 has failed for ' + e.message + ', code: ' + e.code);
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.number SUB_DF_FILEIO_FILERW_WRITE_RANDOM_PROMISE_0000
         * @tc.name fileIO_test_write_random_promise_000
         * @tc.desc Test the write() interface. promise.
         * Open the file, file write() in the random way.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 3
         * @tc.require
         */
        it('fileIO_test_write_random_promise_000', Level.LEVEL0, async function (done) {
            let fpath = await nextFileName('fileIO_test_write_random_promise_000');
            expect(prepare200MFile(fpath)).assertTrue;

            try {
                let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
                expect(isIntNum(file.fd)).assertTrue();
                let averagerate = await IOfunc(file, 0x1400, 0x1400000, true, false, true);
                console.log("RAND_WRITE Rate is" + averagerate + "M/s");
                expect(averagerate > RAND_WRITE_BASELINE).assertTrue();
                fileIO.closeSync(file);
                fileIO.unlinkSync(fpath);
                done();
            } catch (e) {
                console.log('fileIO_test_write_random_promise_000 has failed for ' + e.message + ', code: ' + e.code);
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.number SUB_DF_FILEIO_FILERW_READ_SEQUENCE_PROMISE_0000
         * @tc.name fileIO_test_read_sequence_promise_000
         * @tc.desc Test the read() interface. promise.
         * Open the file, file read() in the sequence way.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 3
         * @tc.require
         */
        it('fileIO_test_read_sequence_promise_000', Level.LEVEL0, async function (done) {
            let fpath = await nextFileName('fileIO_test_read_sequence_promise_000');
            expect(prepare200MFile(fpath)).assertTrue;

            try {
                let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
                expect(isIntNum(file.fd)).assertTrue();
                let averagerate = await IOfunc(file, 0x1400, 0x1400000, false, true, true);
                console.log("SEQUENCE_READ Rate is" + averagerate + "M/s");
                expect(averagerate > SEQUENCE_READ_BASELINE).assertTrue();
                fileIO.closeSync(file);
                fileIO.unlinkSync(fpath);
                done();
            } catch (e) {
                console.log('fileIO_test_read_sequence_promise_000 has failed for ' + e.message + ', code: ' + e.code);
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.number SUB_DF_FILEIO_FILERW_WRITE_SEQUENCE_PROMISE_0000
         * @tc.name fileIO_test_write_sequence_promise_000
         * @tc.desc Test the write() interface. promise.
         * Open the file, file write() in the sequence way.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 3
         * @tc.require
         */
        it('fileIO_test_write_sequence_promise_000', Level.LEVEL0, async function (done) {
            let fpath = await nextFileName('fileIO_test_write_sequence_promise_000');
            expect(prepare200MFile(fpath)).assertTrue;

            try {
                let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
                expect(isIntNum(file.fd)).assertTrue();
                let averagerate = await IOfunc(file, 0x1400, 0x1400000, false, false, true);
                console.log("SEQUENCE_WRITE Rate is" + averagerate + "M/s");
                expect(averagerate > SEQUENCE_WRITE_BASELINE).assertTrue();
                fileIO.closeSync(file);
                fileIO.unlinkSync(fpath);
                done();
            } catch (e) {
                console.log('fileIO_test_write_sequence_promise_000 has failed for ' + e.message + ', code: ' + e.code);
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.number SUB_DF_FILEIO_FILERW_READ_RANDOM_CALLBACK_0000
         * @tc.name fileIO_test_read_random_callback_000
         * @tc.desc Test the read() interface. callback.
         * Open the file, file read() in the random way.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 3
         * @tc.require
         */
        it('fileIO_test_read_random_callback_000', Level.LEVEL0, async function (done) {
            let fpath = await nextFileName('fileIO_test_read_random_callback_000');
            expect(prepare200MFile(fpath)).assertTrue;

            try {
                let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
                expect(isIntNum(file.fd)).assertTrue();
                let averagerate = await IOfunc(file, 0x1400, 0x1400000, true, true, false);
                console.log("RAND_READ Rate is" + averagerate + "M/s");
                expect(averagerate > RAND_READ_BASELINE).assertTrue();
                fileIO.closeSync(file);
                fileIO.unlinkSync(fpath);
                done();
            } catch (e) {
                console.log('fileIO_test_read_random_callback_000 has failed for ' + e.message + ', code: ' + e.code);
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.number SUB_DF_FILEIO_FILERW_WRITE_RANDOM_CALLBACK_0000
         * @tc.name fileIO_test_write_random_callback_000
         * @tc.desc Test the write() interface. callback.
         * Open the file, file write() in the random way.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 3
         * @tc.require
         */
        it('fileIO_test_write_random_callback_000', Level.LEVEL0, async function (done) {
            let fpath = await nextFileName('fileIO_test_write_random_callback_000');
            expect(prepare200MFile(fpath)).assertTrue;

            try {
                let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
                expect(isIntNum(file.fd)).assertTrue();
                let averagerate = await IOfunc(file, 0x1400, 0x1400000, true, false, false);
                console.log("RAND_WRITE Rate is" + averagerate + "M/s");
                expect(averagerate > RAND_WRITE_BASELINE).assertTrue();
                fileIO.closeSync(file);
                fileIO.unlinkSync(fpath);
                done();
            } catch (e) {
                console.log('fileIO_test_write_random_callback_000 has failed for ' + e.message + ', code: ' + e.code);
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.number SUB_DF_FILEIO_FILERW_READ_SEQUENCE_CALLBACK_0000
         * @tc.name fileIO_test_read_sequence_callback_000
         * @tc.desc Test the read() interface. callback.
         * Open the file, file read() in the sequence way.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 3
         * @tc.require
         */
        it('fileIO_test_read_sequence_callback_000', Level.LEVEL0, async function (done) {
            let fpath = await nextFileName('fileIO_test_read_sequence_callback_000');
            expect(prepare200MFile(fpath)).assertTrue;

            try {
                let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
                expect(isIntNum(file.fd)).assertTrue();
                let averagerate = await IOfunc(file, 0x1400, 0x1400000, false, true, false);
                console.log("SEQUENCE_READ Rate is" + averagerate + "M/s");
                expect(averagerate > SEQUENCE_READ_BASELINE).assertTrue();
                fileIO.closeSync(file);
                fileIO.unlinkSync(fpath);
                done();
            } catch (e) {
                console.log('fileIO_test_read_sequence_callback_000 has failed for ' + e.message + ', code: ' + e.code);
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.number SUB_DF_FILEIO_FILERW_WRITE_SEQUENCE_CALLBACK_0000
         * @tc.name fileIO_test_write_sequence_callback_000
         * @tc.desc Test the write() interface. callback.
         * Open the file, file write() in the sequence way.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 3
         * @tc.require
         */
        it('fileIO_test_write_sequence_callback_000', Level.LEVEL0, async function (done) {
            let fpath = await nextFileName('fileIO_test_write_sequence_callback_000');
            expect(prepare200MFile(fpath)).assertTrue;

            try {
                let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
                expect(isIntNum(file.fd)).assertTrue();
                let averagerate = await IOfunc(file, 0x1400, 0x1400000, false, false, false);
                console.log("SEQUENCE_WRITE Rate is" + averagerate + "M/s");
                expect(averagerate > SEQUENCE_WRITE_BASELINE).assertTrue();
                fileIO.closeSync(file);
                fileIO.unlinkSync(fpath);
                done();
            } catch (e) {
                console.log('fileIO_test_write_sequence_callback_000 has failed for ' + e.message + ', code: ' + e.code);
                expect(false).assertTrue();
            }
        });
    });
}