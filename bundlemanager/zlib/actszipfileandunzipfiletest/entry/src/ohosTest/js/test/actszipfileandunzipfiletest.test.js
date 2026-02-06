/*
* Copyright (C) 2021 Huawei Device Co., Ltd.
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
import zlib from '@ohos.zlib'
import fileio from '@ohos.fileio'
import featureAbility from '@ohos.ability.featureAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

let dir = "";
let infos = "";
let SRC_FILE_INVALID = 900001;
let OUTPUT_FILE_INVALID = 900002;
let INPUT_FILE_NOT_ZIP = 900003;
let PARAM_ERROR = 401;

export default function ActsZlibTest() {
    describe('ActsZlibTest', function () {
        beforeEach(async (done) => {
            var context = featureAbility.getContext();
            context.getCacheDir((err, data) => {
                console.info('ActsZlibTest successful. Data:' + JSON.stringify(data));
                dir = data;
                var objectone = "com.example.amsZipfileUnzipfileST.MainAbility/com.example.amsZipfileUnzipfileST/";
                var objecttwo = "com.example.amsZipfileUnzipfileST.MainAbility/com.example.amsZipfileUnzipfileST/zipunzip";
                var objectthree = "com.example.amsZipfileUnzipfileST.MainAbility/ActsZlibTest/example.amsZipfileUnzipfileST";
                infos = dir + objectone + objecttwo + objectthree;
                done();
            })
        });

        /**
         * @tc.name   ACTS_ZipFile_0100
         * @tc.number ACTS_ZipFile_0100
         * @tc.desc   inFile is empty
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ACTS_ZipFile_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================ACTS_ZipFile_0100 start==================");
            var path = "";
            var zipDest = dir + "/ACTS_ZipFile_0100.zip"
            var options = {};
            options.level = zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION;
            zlib.zipFile(path, zipDest, options).then((data) => {
                console.info("ACTS_ZipFile_0100 data: " + data);
                expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
                done();
            }).catch((err) => {
                console.info("ACTS_ZipFile_0100 zipFile fail: " + err);
                expect(err).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
                done();
            })
            console.info("==================ACTS_ZipFile_0100 end==================");
        })

        /**
         * @tc.name   ACTS_ZipFile_0200
         * @tc.number ACTS_ZipFile_0200
         * @tc.desc   inFile doesn't exist
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ACTS_ZipFile_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================ACTS_ZipFile_0200 start==================");
            var path = dir + "/ACTS_ZipFile_9999900.txt";
            var src = dir + "/ACTS_ZipFile_999991100.txt";
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_0200 write data to file successfully:" + number);
                var options = {};
                options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
                zlib.zipFile(src, dir, options).then((data) => {
                    console.info("ACTS_ZipFile_0200 data: " + data);
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
                    done();
                }).catch((err) => {
                    console.info("ACTS_ZipFile_0200 zipFile fail: " + err);
                    expect(err).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_0200 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_0200 end==================");
        })

        /**
         * @tc.name   ACTS_ZipFile_0300
         * @tc.number ACTS_ZipFile_0300
         * @tc.desc   output file not specified
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ACTS_ZipFile_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================ACTS_ZipFile_0300 start==================");
            var path = dir + "/ACTS_ZipFile_0300.txt";
            var zipDest = "";
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_0300 write data to file successfully:" + number);
                var options = {};
                options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
                zlib.zipFile(path, zipDest, options).then((data) => {
                    console.info("ACTS_ZipFile_0300 data: " + data);
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
                    done();
                }).catch((err) => {
                    console.info("ACTS_ZipFile_0300 zipFile fail: " + err);
                    expect(err).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_0300 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_0300 end==================");
        })

        /**
         * @tc.name   ACTS_ZipFile_0400
         * @tc.number ACTS_ZipFile_0400
         * @tc.desc   The output file is a directory that does not exist
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ACTS_ZipFile_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================ACTS_ZipFile_0400 start==================");
            var path = dir + "/ACTS_ZipFile_0400.txt";
            var zipDest = "/ACTS_ZipFile_0400.zip";
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_0400 write data to file successfully:" + number);
                var options = {};
                options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
                zlib.zipFile(path, zipDest, options).then((data) => {
                    console.info("ACTS_ZipFile_0400 data: " + data);
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
                    done();
                }).catch((err) => {
                    console.info("ACTS_ZipFile_0400 zipFile fail: " + err);
                    expect(err).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_0400 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_0400 end==================");
        })

        /**
         * @tc.name   ACTS_ZipFile_2200
         * @tc.number ACTS_ZipFile_2200
         * @tc.desc   COMPRESS_LEVEL_NO_COMPRESSION,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('ACTS_ZipFile_2200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
            console.info("==================ACTS_ZipFile_2200 start==================");
            var path = dir + "/ACTS_ZipFile_2200.txt";
            var zipDest = dir + "/ACTS_ZipFile_2200.zip"
            var unzipdir = dir + "/ACTS_ZipFile_2200";
            var unzipresultfile = unzipdir + "/ACTS_ZipFile_2200.txt";
            var options = {};
            options.level = zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_2200 write data to file secondlly successfully:" + number);
                zlib.zipFile(path, zipDest, options).then((data) => {
                    var zipStat = fileio.statSync(zipDest);
                    var isFile = zipStat.isFile();
                    expect(isFile).assertTrue();
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                    fileio.mkdir(unzipdir).then(function () {
                        console.info("ACTS_ZipFile_2200 mkdir successfully");
                        zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
                            var unzipStat = fileio.statSync(unzipresultfile);
                            var isFile = unzipStat.isFile();
                            expect(isFile).assertTrue();
                            var destSize = unzipStat.size;
                            var originSize = fileio.statSync(path).size;
                            var result = (originSize == destSize);
                            expect(result).assertTrue();
                            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                            console.error('ACTS_ZipFile_2200 unzipFile');
                            done();
                        }).catch((err) => {
                            console.info("ACTS_ZipFile_2200 err: " + err);
                            expect(err).assertFail();
                            done();
                        })
                    }).catch(function (error) {
                        console.info("ACTS_ZipFile_2200 mkdir failed with error:" + error);
                        expect(error).assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.info("zipFile fail: " + err);
                    expect(err).assertFail();
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_2200 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_2200 end==================");
        });

        /**
         * @tc.name   ACTS_ZipFile_2300
         * @tc.number ACTS_ZipFile_2300
         * @tc.desc   COMPRESS_LEVEL_BEST_SPEED,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('ACTS_ZipFile_2300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
            console.info("==================ACTS_ZipFile_2300 start==================");
            var path = dir + "/ACTS_ZipFile_2300.txt";
            var zipDest = dir + "/ACTS_ZipFile_2300.zip"
            var unzipdir = dir + "/ACTS_ZipFile_2300";
            var unzipresultfile = unzipdir + "/ACTS_ZipFile_2300.txt";
            var options = {};
            options.level = zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_2300 write data to file successfully:" + number);
                zlib.zipFile(path, zipDest, options).then((data) => {
                    var zipStat = fileio.statSync(zipDest);
                    var isFile = zipStat.isFile();
                    expect(isFile).assertTrue();
                    var srcSize = fileio.statSync(path).size;
                    var destSize = zipStat.size;
                    expect(srcSize > destSize).assertTrue();
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                    fileio.mkdir(unzipdir).then(function () {
                        console.info("ACTS_ZipFile_2300 mkdir successfully");
                        zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
                            var unzipStat = fileio.statSync(unzipresultfile);
                            var isFile = unzipStat.isFile();
                            expect(isFile).assertTrue();
                            var destSize = unzipStat.size;
                            var originSize = fileio.statSync(path).size;
                            var result = (originSize == destSize);
                            expect(result).assertTrue();
                            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                            console.error('ACTS_ZipFile_2300 unzipFile');
                            done();
                        }).catch((err) => {
                            console.info("ACTS_ZipFile_2300 err: " + err);
                            expect(err).assertFail();
                            done();
                        })
                    }).catch(function (error) {
                        console.info("ACTS_ZipFile_2300 mkdir failed with error:" + error);
                        expect(error).assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.info("zipFile fail: " + err);
                    expect(err).assertFail();
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_2300 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_2300 end==================");
        })

        /**
         * @tc.name   ACTS_ZipFile_2400
         * @tc.number ACTS_ZipFile_2400
         * @tc.desc   COMPRESS_LEVEL_BEST_COMPRESSION,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_ZipFile_2400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            console.info("==================ACTS_ZipFile_2400 start==================");
            var path = dir + "/ACTS_ZipFile_2400.txt";
            var zipDest = dir + "/ACTS_ZipFile_2400.zip"
            var unzipdir = dir + "/ACTS_ZipFile_2400";
            var unzipresultfile = unzipdir + "/ACTS_ZipFile_2400.txt";
            var options = {};
            options.level = zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_2400 write data to file successfully:" + number);
                zlib.zipFile(path, zipDest, options).then((data) => {
                    var zipStat = fileio.statSync(zipDest);
                    var isFile = zipStat.isFile();
                    expect(isFile).assertTrue();
                    var srcSize = fileio.statSync(path).size;
                    var destSize = zipStat.size;
                    expect(srcSize > destSize).assertTrue();
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                    fileio.mkdir(unzipdir).then(function () {
                        console.info("ACTS_ZipFile_2400 mkdir successfully");
                        zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
                            var unzipStat = fileio.statSync(unzipresultfile);
                            var isFile = unzipStat.isFile();
                            expect(isFile).assertTrue();
                            var destSize = unzipStat.size;
                            var originSize = fileio.statSync(path).size;
                            var result = (originSize == destSize);
                            expect(result).assertTrue();
                            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                            console.error('ACTS_ZipFile_2400 unzipFile');
                            done();
                        }).catch((err) => {
                            console.info("ACTS_ZipFile_2400 err: " + err);
                            expect(err).assertFail();
                            done();
                        })
                    }).catch(function (error) {
                        console.info("ACTS_ZipFile_2400 mkdir failed with error:" + error);
                        expect(error).assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.info("zipFile fail: " + err);
                    expect(err).assertFail();
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_2400 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_2400 end==================");
        });

        /**
         * @tc.name   ACTS_ZipFile_2500
         * @tc.number ACTS_ZipFile_2500
         * @tc.desc   COMPRESS_LEVEL_DEFAULT_COMPRESSION,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('ACTS_ZipFile_2500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
            console.info("==================ACTS_ZipFile_2500 start==================");
            var path = dir + "/ACTS_ZipFile_2500.txt";
            var zipDest = dir + "/ACTS_ZipFile_2500.zip"
            var unzipdir = dir + "/ACTS_ZipFile_2500";
            var unzipresultfile = unzipdir + "/ACTS_ZipFile_2500.txt";
            var options = {};
            options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_2500 write data to file successfully:" + number);
                zlib.zipFile(path, zipDest, options).then((data) => {
                    var zipStat = fileio.statSync(zipDest);
                    var isFile = zipStat.isFile();
                    expect(isFile).assertTrue();
                    var srcSize = fileio.statSync(path).size;
                    var destSize = zipStat.size;
                    expect(srcSize > destSize).assertTrue();
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                    fileio.mkdir(unzipdir).then(function () {
                        console.info("ACTS_ZipFile_2500 mkdir successfully");
                        zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
                            var unzipStat = fileio.statSync(unzipresultfile);
                            var isFile = unzipStat.isFile();
                            expect(isFile).assertTrue();
                            var destSize = unzipStat.size;
                            var originSize = fileio.statSync(path).size;
                            var result = (originSize == destSize);
                            expect(result).assertTrue();
                            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                            console.error('ACTS_ZipFile_2500 unzipFile');
                            done();
                        }).catch((err) => {
                            console.info("ACTS_ZipFile_2500 err: " + err);
                            expect(err).assertFail();
                            done()
                        })
                    }).catch(function (error) {
                        console.info("ACTS_ZipFile_2500 mkdir failed with error:" + error);
                        expect(error).assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.info("zipFile fail: " + err);
                    expect(err).assertFail();
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_2500 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_2500 end==================");
        });

        /**
         * @tc.name   ACTS_ZipFile_2600
         * @tc.number ACTS_ZipFile_2600
         * @tc.desc   MEM_LEVEL_MIN_MEMLEVEL,,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('ACTS_ZipFile_2600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
            console.info("==================ACTS_ZipFile_2600 start==================");
            var path = dir + "/ACTS_ZipFile_2600.txt";
            var zipDest = dir + "/ACTS_ZipFile_2600.zip"
            var unzipdir = dir + "/ACTS_ZipFile_2600";
            var unzipresultfile = unzipdir + "/ACTS_ZipFile_2600.txt";
            var options = {};
            options.memLevel = zlib.MemLevel.MEM_LEVEL_MIN;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_2600 write data to file successfully:" + number);
                zlib.zipFile(path, zipDest, options).then((data) => {
                    var zipStat = fileio.statSync(zipDest);
                    var isFile = zipStat.isFile();
                    expect(isFile).assertTrue();
                    var srcSize = fileio.statSync(path).size;
                    var destSize = zipStat.size;
                    expect(srcSize > destSize).assertTrue();
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                    fileio.mkdir(unzipdir).then(function () {
                        console.info("ACTS_ZipFile_2600 mkdir successfully");
                        zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
                            var unzipStat = fileio.statSync(unzipresultfile);
                            var isFile = unzipStat.isFile();
                            expect(isFile).assertTrue();
                            var destSize = unzipStat.size;
                            var originSize = fileio.statSync(path).size;
                            var result = (originSize == destSize);
                            expect(result).assertTrue();
                            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                            console.error('ACTS_ZipFile_2600 unzipFile');
                            done();
                        }).catch((err) => {
                            console.info("ACTS_ZipFile_2600 err: " + err);
                            expect(err).assertFail();
                            done();
                        })
                    }).catch(function (error) {
                        console.info("ACTS_ZipFile_2600 mkdir failed with error:" + error);
                        expect(error).assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.info("zipFile fail: " + err);
                    expect(err).assertFail();
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_2600 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_2600 end==================");
        });

        /**
         * @tc.name   ACTS_ZipFile_2700
         * @tc.number ACTS_ZipFile_2700
         * @tc.desc   MEM_LEVEL_MAX_MEMLEVEL,,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_ZipFile_2700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            console.info("==================ACTS_ZipFile_2700 start==================");
            var path = dir + "/ACTS_ZipFile_2700.txt";
            var zipDest = dir + "/ACTS_ZipFile_2700.zip"
            var unzipdir = dir + "/ACTS_ZipFile_2700";
            var unzipresultfile = unzipdir + "/ACTS_ZipFile_2700.txt";
            var options = {};
            options.memLevel = zlib.MemLevel.MEM_LEVEL_MAX;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_2700 write data to file successfully:" + number);
                zlib.zipFile(path, zipDest, options).then((data) => {
                    var zipStat = fileio.statSync(zipDest);
                    var isFile = zipStat.isFile();
                    expect(isFile).assertTrue();
                    var srcSize = fileio.statSync(path).size;
                    var destSize = zipStat.size;
                    expect(srcSize > destSize).assertTrue();
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                    fileio.mkdir(unzipdir).then(function () {
                        console.info("ACTS_ZipFile_2700 mkdir successfully");
                        zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
                            var unzipStat = fileio.statSync(unzipresultfile);
                            var isFile = unzipStat.isFile();
                            expect(isFile).assertTrue();
                            var destSize = unzipStat.size;
                            var originSize = fileio.statSync(path).size;
                            var result = (originSize == destSize);
                            expect(result).assertTrue();
                            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                            console.error('ACTS_ZipFile_2700 unzipFile');
                            done();
                        }).catch((err) => {
                            console.info("ACTS_ZipFile_2700 err: " + err);
                            expect(err).assertFail();
                            done();
                        })
                    }).catch(function (error) {
                        console.info("ACTS_ZipFile_2700 mkdir failed with error:" + error);
                        expect(error).assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.info("zipFile fail: " + err);
                    expect(err).assertFail();
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_2700 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_2700 end==================");
        });

        /**
         * @tc.name   ACTS_ZipFile_2800
         * @tc.number ACTS_ZipFile_2800
         * @tc.desc   MEM_LEVEL_DEFAULT_MEMLEVEL,,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ACTS_ZipFile_2800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================ACTS_ZipFile_2800 start==================");
            var path = dir + "/ACTS_ZipFile_2800.txt";
            var zipDest = dir + "/ACTS_ZipFile_2800.zip"
            var unzipdir = dir + "/ACTS_ZipFile_2800";
            var unzipresultfile = unzipdir + "/ACTS_ZipFile_2800.txt";
            var options = {};
            options.memLevel = zlib.MemLevel.MEM_LEVEL_DEFAULT;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_2800 write data to file successfully:" + number);
                zlib.zipFile(path, zipDest, options).then((data) => {
                    var zipStat = fileio.statSync(zipDest);
                    var isFile = zipStat.isFile();
                    expect(isFile).assertTrue();
                    var srcSize = fileio.statSync(path).size;
                    var destSize = zipStat.size;
                    expect(srcSize > destSize).assertTrue();
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                    fileio.mkdir(unzipdir).then(function () {
                        console.info("ACTS_ZipFile_2800 mkdir successfully");
                        zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
                            var unzipStat = fileio.statSync(unzipresultfile);
                            var isFile = unzipStat.isFile();
                            expect(isFile).assertTrue();
                            var destSize = unzipStat.size;
                            var originSize = fileio.statSync(path).size;
                            var result = (originSize == destSize);
                            expect(result).assertTrue();
                            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                            console.error('ACTS_ZipFile_2800 unzipFile');
                            done();
                        }).catch((err) => {
                            console.info("ACTS_ZipFile_2800 err: " + err);
                            expect(err).assertFail();
                            done();
                        })
                    }).catch(function (error) {
                        console.info("ACTS_ZipFile_2800 mkdir failed with error:" + error);
                        expect(error).assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.info("zipFile fail: " + err);
                    expect(err).assertFail();
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_2800 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_2800 end==================");
        });

        /**
         * @tc.name   ACTS_ZipFile_2900
         * @tc.number ACTS_ZipFile_2900
         * @tc.desc   COMPRESS_STRATEGY_DEFAULT_STRATEGY,,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ACTS_ZipFile_2900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================ACTS_ZipFile_2900 start==================");
            var path = dir + "/ACTS_ZipFile_2900.txt";
            var zipDest = dir + "/ACTS_ZipFile_2900.zip"
            var unzipdir = dir + "/ACTS_ZipFile_2900";
            var unzipresultfile = unzipdir + "/ACTS_ZipFile_2900.txt";
            var options = {};
            options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_2900 write data to file successfully:" + number);
                zlib.zipFile(path, zipDest, options).then((data) => {
                    var zipStat = fileio.statSync(zipDest);
                    var isFile = zipStat.isFile();
                    expect(isFile).assertTrue();
                    var srcSize = fileio.statSync(path).size;
                    var destSize = zipStat.size;
                    expect(srcSize > destSize).assertTrue();
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                    fileio.mkdir(unzipdir).then(function () {
                        console.info("ACTS_ZipFile_2900 mkdir successfully");
                        zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
                            var unzipStat = fileio.statSync(unzipresultfile);
                            var isFile = unzipStat.isFile();
                            expect(isFile).assertTrue();
                            var destSize = unzipStat.size;
                            var originSize = fileio.statSync(path).size;
                            var result = (originSize == destSize);
                            expect(result).assertTrue();
                            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                            console.error('ACTS_ZipFile_2900 unzipFile');
                            done();
                        }).catch((err) => {
                            console.info("ACTS_ZipFile_2900 err: " + err);
                            expect(err).assertFail();
                            done();
                        })
                    }).catch(function (error) {
                        console.info("ACTS_ZipFile_2900 mkdir failed with error:" + error);
                        expect(error).assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.info("zipFile fail: " + err);
                    expect(err).assertFail();
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_2900 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_2900 end==================");
        });

        /**
         * @tc.name   ACTS_ZipFile_3000
         * @tc.number ACTS_ZipFile_3000
         * @tc.desc   COMPRESS_STRATEGY_FILTERED,,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ACTS_ZipFile_3000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================ACTS_ZipFile_3000 start==================");
            var path = dir + "/ACTS_ZipFile_3000.txt";
            var zipDest = dir + "/ACTS_ZipFile_3000.zip"
            var unzipdir = dir + "/ACTS_ZipFile_3000";
            var unzipresultfile = unzipdir + "/ACTS_ZipFile_3000.txt";
            var options = {};
            options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_3000 write data to file successfully:" + number);
                zlib.zipFile(path, zipDest, options).then((data) => {
                    var zipStat = fileio.statSync(zipDest);
                    var isFile = zipStat.isFile();
                    expect(isFile).assertTrue();
                    var srcSize = fileio.statSync(path).size;
                    var destSize = zipStat.size;
                    expect(srcSize > destSize).assertTrue();
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                    fileio.mkdir(unzipdir).then(function () {
                        console.info("ACTS_ZipFile_3000 mkdir successfully");
                        zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
                            var unzipStat = fileio.statSync(unzipresultfile);
                            var isFile = unzipStat.isFile();
                            expect(isFile).assertTrue();
                            var destSize = unzipStat.size;
                            var originSize = fileio.statSync(path).size;
                            var result = (originSize == destSize);
                            expect(result).assertTrue();
                            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                            console.error('ACTS_ZipFile_3000 unzipFile');
                            done();
                        }).catch((err) => {
                            console.info("ACTS_ZipFile_3000 err: " + err);
                            expect(err).assertFail();
                            done();
                        })
                    }).catch(function (error) {
                        console.info("ACTS_ZipFile_3000 mkdir failed with error:" + error);
                        expect(error).assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.info("zipFile fail: " + err);
                    expect(err).assertFail();
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_3000 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_3000 end==================");
        });

        /**
         * @tc.name   ACTS_ZipFile_3100
         * @tc.number ACTS_ZipFile_3100
         * @tc.desc   COMPRESS_STRATEGY_HUFFMAN_ONLY,,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ACTS_ZipFile_3100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================ACTS_ZipFile_3100 start==================");
            var path = dir + "/ACTS_ZipFile_3100.txt";
            var zipDest = dir + "/ACTS_ZipFile_3100.zip"
            var unzipdir = dir + "/ACTS_ZipFile_3100";
            var unzipresultfile = unzipdir + "/ACTS_ZipFile_3100.txt";
            var options = {};
            options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_HUFFMAN_ONLY;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_3100 write data to file successfully:" + number);
                zlib.zipFile(path, zipDest, options).then((data) => {
                    var zipStat = fileio.statSync(zipDest);
                    var isFile = zipStat.isFile();
                    expect(isFile).assertTrue();
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                    fileio.mkdir(unzipdir).then(function () {
                        console.info("ACTS_ZipFile_3100 mkdir successfully");
                        zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
                            var unzipStat = fileio.statSync(unzipresultfile);
                            var isFile = unzipStat.isFile();
                            expect(isFile).assertTrue();
                            var destSize = unzipStat.size;
                            var originSize = fileio.statSync(path).size;
                            var result = (originSize == destSize);
                            expect(result).assertTrue();
                            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                            console.error('ACTS_ZipFile_3100 unzipFile');
                            done();
                        }).catch((err) => {
                            console.info("ACTS_ZipFile_3100 err: " + err);
                            expect(err).assertFail();
                            done();
                        })
                    }).catch(function (error) {
                        console.info("ACTS_ZipFile_3100 mkdir failed with error:" + error);
                        expect(error).assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.info("zipFile fail: " + err);
                    expect(err).assertFail();
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_3100 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_3100 end==================");
        });

        /**
         * @tc.name   ACTS_ZipFile_3200
         * @tc.number ACTS_ZipFile_3200
         * @tc.desc   COMPRESS_STRATEGY_RLE,,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ACTS_ZipFile_3200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================ACTS_ZipFile_3200 start==================");
            var path = dir + "/ACTS_ZipFile_3200.txt";
            var zipDest = dir + "/ACTS_ZipFile_3200.zip";
            var unzipdir = dir + "/ACTS_ZipFile_3200";
            var unzipresultfile = unzipdir + "/ACTS_ZipFile_3200.txt";
            var options = {};
            options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_RLE;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_3200 write data to file successfully:" + number);
                zlib.zipFile(path, zipDest, options).then((data) => {
                    var zipStat = fileio.statSync(zipDest);
                    var isFile = zipStat.isFile();
                    expect(isFile).assertTrue();
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                    fileio.mkdir(unzipdir).then(function () {
                        console.info("ACTS_ZipFile_3200 mkdir successfully");
                        zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
                            var unzipStat = fileio.statSync(unzipresultfile);
                            var isFile = unzipStat.isFile();
                            expect(isFile).assertTrue();
                            var destSize = unzipStat.size;
                            var originSize = fileio.statSync(path).size;
                            var result = (originSize == destSize);
                            expect(result).assertTrue();
                            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                            console.error('ACTS_ZipFile_3200 unzipFile');
                            done();
                        }).catch((err) => {
                            console.info("ACTS_ZipFile_3200 err: " + err);
                            done();
                            expect(err).assertFail();
                            done();
                        })
                    }).catch(function (error) {
                        console.info("ACTS_ZipFile_3200 mkdir failed with error:" + error);
                        expect(error).assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.info("zipFile fail: " + err);
                    expect(err).assertFail();
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_3200 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_3200 end==================");
        });

        /**
         * @tc.name   ACTS_ZipFile_3300
         * @tc.number ACTS_ZipFile_3300
         * @tc.desc   COMPRESS_STRATEGY_FIXED,,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ACTS_ZipFile_3300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================ACTS_ZipFile_3300 start==================");
            var path = dir + "/ACTS_ZipFile_3300.txt";
            var zipDest = dir + "/ACTS_ZipFile_3300.zip"
            var unzipdir = dir + "/ACTS_ZipFile_3300";
            var unzipresultfile = unzipdir + "/ACTS_ZipFile_3300.txt";
            var options = {};
            options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_3300 write data to file successfully:" + number);
                zlib.zipFile(path, zipDest, options).then((data) => {
                    var zipStat = fileio.statSync(zipDest);
                    var isFile = zipStat.isFile();
                    expect(isFile).assertTrue();
                    var srcSize = fileio.statSync(path).size;
                    var destSize = zipStat.size;
                    expect(srcSize > destSize).assertTrue();
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                    fileio.mkdir(unzipdir).then(function () {
                        console.info("ACTS_ZipFile_3300 mkdir successfully");
                        zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
                            var unzipStat = fileio.statSync(unzipresultfile);
                            var isFile = unzipStat.isFile();
                            expect(isFile).assertTrue();
                            var destSize = unzipStat.size;
                            var originSize = fileio.statSync(path).size;
                            var result = (originSize == destSize);
                            expect(result).assertTrue();
                            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                            console.error('ACTS_ZipFile_3300 unzipFile');
                            done();
                        }).catch((err) => {
                            console.info("ACTS_ZipFile_3300 err: " + err);
                            expect(err).assertFail();
                            done();
                        })
                    }).catch(function (error) {
                        console.info("ACTS_ZipFile_3300 mkdir failed with error:" + error);
                        expect(error).assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.info("zipFile fail: " + err);
                    expect(err).assertFail();
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_3300 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_3300 end==================");
        });

        /**
         * @tc.name   ACTS_ZipFile_3500
         * @tc.number ACTS_ZipFile_3500
         * @tc.desc   INPUT_FILE_NOT_EXIST,,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ACTS_ZipFile_3500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================ACTS_ZipFile_3500 start==================");
            var path = dir + "/ACTS_ZipFile_3500.txt";
            var src = dir + "/ACTS_ZipFile_9900.txt";
            var unzipdir = dir + "/ACTS_ZipFile_3500";
            var options = {};
            options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_3500 write  successfully:" + number);
                zlib.zipFile(src, dir, options).then((data) => {
                    console.info("ACTS_ZipFile_3500 data: " + data);
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
                    done();
                }).catch((err) => {
                    console.info("ACTS_ZipFile_3500 err: " + err);
                    expect(err).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
                    done();
                });
            }).catch(function (err) {
                console.info("ACTS_ZipFile_3500 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_3500 end ==================");
        })

        /**
         * @tc.name   ACTS_ZipFile_3600
         * @tc.number ACTS_ZipFile_3600
         * @tc.desc   INPUT_FILE_NULL,,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ACTS_ZipFile_3600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================ACTS_ZipFile_3600 start==================");
            var path = dir + "/ACTS_ZipFile_3600.txt";
            var zipDest = "";
            var options = {};
            options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_3600 write data to file successfully:" + number);
                zlib.zipFile(path, zipDest, options).then((data) => {
                    console.info("ACTS_ZipFile_3600 data: " + data);
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
                    done();
                }).catch((err) => {
                    console.info("ACTS_ZipFile_3600 err: " + err);
                    expect(err).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
                    done();
                });
            }).catch(function (err) {
                console.info("ACTS_ZipFile_3600 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_3600 end ==================")
        })

        /**
         * @tc.name   ACTS_ZipFile_4500
         * @tc.number ACTS_ZipFile_4500
         * @tc.desc   COMPRESS_STRATEGY_FILTERED_CALLBACK,,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ACTS_ZipFile_4500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================ACTS_ZipFile_4500 start==================");
            var path = dir + "/ACTS_ZipFile_4500.txt";
            var zipDest = dir + "/ACTS_ZipFile_4500.zip"
            var unzipDest = dir + "/ACTS_ZipFile_9900.zip"
            var unzipdir = dir + "/ACTS_ZipFile_4500";
            var zipdir = dir + "/ACTS_ZipFile_9900";
            var options = {};
            options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_4500 write data to file successfully:" + number);
                zlib.zipFile(path, zipDest, options).then((data) => {
                    var zipStat = fileio.statSync(zipDest);
                    var isFile = zipStat.isFile();
                    expect(isFile).assertTrue();
                    var srcSize = fileio.statSync(path).size;
                    var destSize = zipStat.size;
                    expect(srcSize > destSize).assertTrue();
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                    fileio.mkdir(unzipdir).then(function () {
                        console.info("ACTS_ZipFile_4500 mkdir successfully");
                        zlib.unzipFile(unzipDest, zipdir, options).then((data) => {
                            console.info("ACTS_ZipFile_4500 data: " + data);
                            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
                            done();
                        }).catch((err) => {
                            console.info("ACTS_ZipFile_4500 err: " + err);
                            expect(err).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
                            done();
                        })
                    }).catch(function (error) {
                        console.info("ACTS_ZipFile_4500 mkdir failed with error:" + error);
                        expect(error).assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.info("ACTS_ZipFile_4500 zipFile fail: " + err);
                    expect(err).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_4500 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_4500 end==================");
        })

        /**
         * @tc.name   ACTS_ZipFile_4900
         * @tc.number ACTS_ZipFile_4900
         * @tc.desc   COMPRESS_STRATEGY_FILTERED_PROMISE,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ACTS_ZipFile_4900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================ACTS_ZipFile_4900 start==================");
            var path = dir + "/ACTS_ZipFile_4900.txt";
            var zipDest = dir + "/ACTS_ZipFile_4900.zip"
            var unzipDest = dir + "/ACTS_ZipFile_4900.zip"
            var unzipdir = dir + "/ACTS_ZipFile_4900";
            var zipdir = dir + "/ACTS_ZipFile_4900";
            var options = {};
            options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_4900 write data to file successfully:" + number);
                zlib.zipFile(path, zipDest, options).then(data => {
                    var zipStat = fileio.statSync(zipDest);
                    var isFile = zipStat.isFile();
                    expect(isFile).assertTrue();
                    var srcSize = fileio.statSync(path).size;
                    var destSize = zipStat.size;
                    expect(srcSize > destSize).assertTrue();
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                    fileio.mkdir(unzipdir).then(function () {
                        console.info("ACTS_ZipFile_4900 mkdir successfully");
                        zlib.unzipFile(unzipDest, zipdir, options).then(data => {
                            console.info("ACTS_ZipFile_4900 data: " + data);
                            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                            done();
                        }).catch(err => {
                            console.info("ACTS_ZipFile_4900 err: " + err);
                            expect(err).assertFail();
                            done();
                        })
                    }).catch(function (error) {
                        console.info("ACTS_ZipFile_4900 mkdir failed with error:" + error);
                        expect(error).assertFail();
                        done();
                    });
                }).catch(err => {
                    console.info("ACTS_ZipFile_4900 zipFile fail: " + err);
                    expect(err).assertFail();
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_4900 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_4900 end==================");
        })

        /**
         * @tc.name   ACTS_ZipFile_5000
         * @tc.number ACTS_ZipFile_5000
         * @tc.desc   COMPRESS_STRATEGY_FIXED,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ACTS_ZipFile_5000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================ACTS_ZipFile_5000 start==================");
            var path = dir + "/ACTS_ZipFile_5000.txt";
            var zipDest = dir + "/ACTS_ZipFile_5000.zip"
            var unzipdir = dir + "/ACTS_ZipFile_5000";
            var options = {};
            options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED;
            var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            fileio.write(fd, infos).then(function (number) {
                console.info("ACTS_ZipFile_5000 write data to file successfully:" + number);
                zlib.zipFile(path, zipDest, options).then(data => {
                    var zipStat = fileio.statSync(zipDest);
                    var isFile = zipStat.isFile();
                    expect(isFile).assertTrue();
                    var srcSize = fileio.statSync(path).size;
                    var destSize = zipStat.size;
                    expect(srcSize > destSize).assertTrue();
                    expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                    fileio.mkdir(unzipdir).then(function () {
                        console.info("ACTS_ZipFile_5000 mkdir successfully");
                        zlib.unzipFile(zipDest, unzipdir, options).then(data => {
                            console.info("ACTS_ZipFile_5000 data: " + data);
                            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
                            done();
                        }).catch(err => {
                            console.info("unzipFile fail: " + err);
                            expect(err).assertFail();
                            done();
                        })
                    }).catch(function (error) {
                        console.info("ACTS_ZipFile_5000 mkdir failed with error:" + error);
                        expect(error).assertFail();
                        done();
                    });
                }).catch(err => {
                    console.info("zipFile fail: " + err);
                    expect(err).assertFail();
                    done();
                })
            }).catch(function (err) {
                console.info("ACTS_ZipFile_5000 write data to file failed with error:" + err);
                expect(err).assertFail();
                done();
            });
            console.info("==================ACTS_ZipFile_5000 end==================");
        })

        /**
         * @tc.name   compressFileOfFolders
         * @tc.number Sub_Bms_Zlib_Compress_InputParam_6700
         * @tc.desc   test compressFile when input is folders
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('compressFileOfFolders', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            console.info("==================compressFileOfFolders start==================");
            let inputPath1 = dir + "/compressFileOfFolders1";
            let inputPath2 = dir + "/compressFileOfFolders2";
            let path1 = inputPath1 + "/compressFileOfFolders1.txt";
            let zipDest1 = dir + "/compressFileOfFolders1.zip";
            let path2 = inputPath2 + "/compressFileOfFolders2.txt";
            let zipDest2 = dir + "/compressFileOfFolders2.zip";
            fileio.mkdirSync(inputPath1);
            fileio.mkdirSync(inputPath2);
            let fd = fileio.openSync(path1, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("compressFileOfFolders write data to file successfully :" + number);
            }).catch(function (err) {
                console.info("compressFileOfFolders write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            console.info("compressFileOfFolders start compressFile");
            await zlib.compressFile(inputPath1, zipDest1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then((data) => {
                console.info("compressFileOfFolders data: " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path1).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch((err) => {
                console.info("compressFileOfFolders data: " + JSON.stringify(err));
                expect(err).assertFail();
            })
            let fd2 = fileio.openSync(path2, 0o100 | 0o2, 0o666);
            await fileio.write(fd2, infos).then(function (number) {
                console.info("compressFileOfFolders write data to file successfully :" + number);
            }).catch(function (err) {
                console.info("compressFileOfFolders write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            zlib.compressFile(inputPath2, zipDest2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }, (err, data) => {
                console.info("compressFileOfFolders data2: " + JSON.stringify(data));
                console.info("compressFileOfFolders err2: " + JSON.stringify(err));
                let zipStat = fileio.statSync(zipDest2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path2).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(undefined);
                expect(err).assertEqual(null);
                done();
            })
        })

        /**
         * @tc.name   compressFileTest
         * @tc.number Sub_Bms_Zlib_Compress_InputParam_6800
         * @tc.desc   test compressFile when inFile and out file is valid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('compressFileTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            console.info("==================compressFileTest start==================");
            let path1 = dir + "/compressFileTest1.txt";
            let zipDest1 = dir + "/compressFileTest1.zip";
            let path2 = dir + "/compressFileTest2.txt";
            let zipDest2 = dir + "/compressFileTest2.zip";
            let fd = fileio.openSync(path1, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("compressFileTest write data to file successfully :" + number);
            }).catch(function (err) {
                console.info("compressFileTest write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            console.info("compressFileTest start compressFile");
            await zlib.compressFile(path1, zipDest1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then((data) => {
                console.info("compressFileTest data: " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path1).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch((err) => {
                console.info("compressFileTest data: " + JSON.stringify(err));
                expect(err).assertFail();
            })
            let fd2 = fileio.openSync(path2, 0o100 | 0o2, 0o666);
            await fileio.write(fd2, infos).then(function (number) {
                console.info("compressFileTest write data to file successfully :" + number);
            }).catch(function (err) {
                console.info("compressFileTest write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            zlib.compressFile(path2, zipDest2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }, (err, data) => {
                console.info("compressFileTest data2: " + JSON.stringify(data));
                console.info("compressFileTest err2: " + JSON.stringify(err));
                let zipStat = fileio.statSync(zipDest2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path2).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(undefined);
                expect(err).assertEqual(null);
                done();
            })
        })

        /**
         * @tc.name   compressFileInFileNotExist
         * @tc.number Sub_Bms_Zlib_Compress_Unusual_0700
         * @tc.desc   test compressFile when inFile is not exist
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('compressFileInFileNotExist', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================compressFileInFileNotExist start==================");
            let path = "nonexist.txt";
            let zipDest = dir + "/compressFileInFileNotExist.zip";
            await zlib.compressFile(path, zipDest, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION
            }).then((data) => {
                console.info("compressFileInFileNotExist invalid src file success!");
                expect(data).assertFail();
                done();
            }).catch((err) => {
                console.info("compressFileInFileNotExist zipFile fail: " + JSON.stringify(err));
                expect(err.code).assertEqual(SRC_FILE_INVALID);
                done();
            })
            zlib.compressFile(path, zipDest, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION
            }, (err, data) => {
                expect(err.code).assertEqual(SRC_FILE_INVALID);
                expect(data).assertEqual(undefined);
                done();
            })
            console.info("==================compressFileInFileNotExist end==================");
        })

        /**
         * @tc.name   compressFileInFileNull
         * @tc.number Sub_Bms_Zlib_Compress_Unusual_0800
         * @tc.desc   test compressFile when inFile is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('compressFileInFileNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================compressFileInFileNull start==================");
            let zipDest = dir + "/compressFileInFileNull.zip";
            try {
                await zlib.compressFile(null, zipDest, {
                    level: zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION
                }).then((data) => {
                    console.info("compressFileInFileNull invalid src file success!");
                    expect().assertFail();
                }).catch((err) => {
                    console.info("compressFileInFileNull zipFile fail: " + JSON.stringify(err));
                    expect().assertFail();
                })
            } catch (err) {
                expect(err.code).assertEqual(PARAM_ERROR);
            }
            try {
                zlib.compressFile(null, zipDest, {
                    level: zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION
                }, (err, data) => {
                    console.info("compressFile result");
                    expect().assertFail();
                    done();
                })
            } catch (err) {
                expect(err.code).assertEqual(PARAM_ERROR);
                done();
            }
            console.info("==================compressFileInFileNull end==================");
        })

        /**
         * @tc.name   compressFileOutFileNotExist
         * @tc.number Sub_Bms_Zlib_Compress_Unusual_0900
         * @tc.desc   test compressFile when outFile is not existed.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('compressFileOutFileNotExist', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================compressFileOutFileNotExist start==================");
            let path1 = dir + "/compressFileOutFileNotExist.txt";
            let outFile = "/11111/22222.zip";
            let fd = fileio.openSync(path1, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("fileio write data to file successfully :" + number);
            }).catch(function (err) {
                console.info("fileio write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            await zlib.compressFile(path1, outFile, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION
            }).then((data) => {
                console.info("compressFileOutFileNotExist invalid src file success!");
                expect().assertFail();
            }).catch((err) => {
                console.info("compressFileOutFileNotExist zipFile fail: " + JSON.stringify(err));
                expect(err.code).assertEqual(OUTPUT_FILE_INVALID);

            })
            zlib.compressFile(path1, outFile, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION
            }, (err, data) => {
                console.info("compressFile result");
                expect(err.code).assertEqual(OUTPUT_FILE_INVALID);
                done();
            })
            console.info("==================compressFileOutFileNotExist end==================");
        })


        /**
         * @tc.name   compressFileOutFileNull
         * @tc.number Sub_Bms_Zlib_Compress_Unusual_1000
         * @tc.desc   test compressFile when outFile is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('compressFileOutFileNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================compressFileOutFileNull start==================");
            let path1 = dir + "/compressFileOutFileNull.txt";
            let fd = fileio.openSync(path1, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("fileio write data to file successfully :" + number);
            }).catch(function (err) {
                console.info("fileio write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            try {
                await zlib.compressFile(path1, null, {
                    level: zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION
                }).then((data) => {
                    console.info("compressFileOutFileNull invalid src file success!");
                    expect().assertFail();
                }).catch((err) => {
                    console.info("compressFileOutFileNull zipFile fail: " + JSON.stringify(err));
                    expect().assertFail();
                })
            } catch (err) {
                expect(err.code).assertEqual(PARAM_ERROR);
            }
            try {
                zlib.compressFile(path1, null, {
                    level: zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION
                }, (err, data) => {
                    console.info("compressFile result");
                    expect().assertFail();
                    done();
                })
            } catch (err) {
                expect(err.code).assertEqual(PARAM_ERROR);
                done();
            }
            console.info("==================compressFileOutFileNull end==================");
        })

        /**
         * @tc.name   compressFileOptionNull
         * @tc.number Sub_Bms_Zlib_Compress_Unusual_1100
         * @tc.desc   test compressFile when option is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('compressFileOptionNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================compressFileOptionNull start==================");
            let path1 = dir + "/compressFileOptionNull.txt";
            let zipDest1 = dir + "/compressFileOptionNull.zip";
            let fd = fileio.openSync(path1, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("fileio write data to file successfully :" + number);
            }).catch(function (err) {
                console.info("fileio write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            try {
                await zlib.compressFile(path1, zipDest1, null).then((data) => {
                    console.info("compressFileOptionNull invalid src file success!");
                    expect().assertFail();
                }).catch((err) => {
                    console.info("compressFileOptionNull zipFile fail: " + JSON.stringify(err));
                    expect().assertFail();
                })
            } catch (err) {
                expect(err.code).assertEqual(PARAM_ERROR);
            }
            try {
                zlib.compressFile(path1, zipDest1, null, (err, data) => {
                    console.info("compressFile result");
                    expect().assertFail();
                    done();
                })
            } catch (err) {
                expect(err.code).assertEqual(PARAM_ERROR);
                done();
            }
            console.info("==================compressFileOptionNull end==================");
        })

        /**
         * @tc.name   compressFileInvalidOption
         * @tc.number Sub_Bms_Zlib_Compress_Unusual_1200
         * @tc.desc   test compressFile when option is invalid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('compressFileInvalidOption', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================compressFileInvalidOption start==================");
            let path1 = dir + "/compressFileInvalidOption.txt";
            let zipDest1 = dir + "/compressFileInvalidOption.zip";
            let fd = fileio.openSync(path1, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("fileio write data to file successfully :" + number);
            }).catch(function (err) {
                console.info("fileio write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            await zlib.compressFile(path1, zipDest1, {
                memLevel: -1
            }).then((data) => {
                console.info("compressFileInvalidOption invalid src file success!");
                expect(data).assertNull();
            }).catch((err) => {
                console.info("compressFileInvalidOption zipFile fail: " + JSON.stringify(err));
                expect().assertFail();
            })
            zlib.compressFile(path1, zipDest1, {
                memLevel: -1
            }, (err, data) => {
                console.info("compressFile result");
                expect(data).assertUndefined();
                expect(err).assertNull();
                done();
            })
            console.info("==================compressFileInvalidOption end==================");
        })

        /**
         * @tc.name   compressFileStrategyNull
         * @tc.number Sub_Bms_Zlib_Compress_Unusual_1300
         * @tc.desc   test compressFile when strategy is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('compressFileStrategyNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================compressFileStrategyNull start==================");
            let path1 = dir + "/compressFileStrategyNull.txt";
            let zipDest1 = dir + "/compressFileStrategyNull.zip";
            let fd = fileio.openSync(path1, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("fileio write data to file successfully :" + number);
            }).catch(function (err) {
                console.info("fileio write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            try {
                await zlib.compressFile(path1, zipDest1, {
                    strategy: null
                }).then((data) => {
                    console.info("compressFileStrategyNull invalid src file success!");
                }).catch((err) => {
                    console.info("compressFileStrategyNull zipFile fail: " + JSON.stringify(err));
                    expect().assertFail();
                })
            } catch (err) {
                expect().assertFail();
            }
            try {
                zlib.compressFile(path1, zipDest1, {
                    strategy: null
                }, (err, data) => {
                    console.info("compressFile result");
                    done();
                })
            } catch (err) {
                expect().assertFail();
                done();
            }
            console.info("==================compressFileOutFileNull end==================");
        })

        /**
         * @tc.name   decompressFileTest
         * @tc.number Sub_Bms_Zlib_Uncompress_InputParam_0300
         * @tc.desc   test decompressFile when inFile and out file is valid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('decompressFileTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            console.info("==================decompressFileTestOutDir start==================");
            let path = dir + "/decompressFileTest.txt";
            let zipDest1 = dir + "/decompressFileTest1.zip";
            let zipDest2 = dir + "/decompressFileTest2.zip";
            let unzipdir1 = dir + "/decompressFileTest1";
            let unzipdir2 = dir + "/decompressFileTest2";
            let finalFile1 = unzipdir1 + "/decompressFileTest.txt";
            let finalFile2 = unzipdir2 + "/decompressFileTest.txt";
            let fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("decompressFileTest write data to file success " + JSON.stringify(number));
            }).catch(function (err) {
                console.info("decompressFileTest write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            await zlib.compressFile(path, zipDest1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("compressFile success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("compressFile fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await zlib.compressFile(path, zipDest2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("compressFile success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("compressFile fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir1).then(function () {
                console.info("decompressFileTest mkdir successfully");
            }).catch(function (error) {
                console.info("decompressFileTest mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            await zlib.decompressFile(zipDest1, unzipdir1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFile success1 " + JSON.stringify(data));
                let zipStat = fileio.statSync(finalFile1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFile fail1 " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir2).then(function () {
                console.info("decompressFileTest mkdir successfully");
            }).catch(function (error) {
                console.info("decompressFileTest mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            zlib.decompressFile(zipDest2, unzipdir2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }, (err, data) => {
                console.info("decompressFile success2 " + JSON.stringify(data));
                console.info("decompressFile success2 " + JSON.stringify(err));
                let zipStat = fileio.statSync(finalFile2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(undefined);
                expect(err).assertEqual(null);
                done();
            })
        })

        /**
         * @tc.name   decompressDifferentLevel
         * @tc.number Sub_Bms_Zlib_Uncompress_InputParam_0400
         * @tc.desc   test decompressFile when inFile and out file is valid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('decompressDifferentLevel', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            console.info("==================decompressDifferentLevel start==================");
            let path = dir + "/decompressFileTest.txt";
            let zipDest1 = dir + "/decompressFileTest1.zip";
            let zipDest2 = dir + "/decompressFileTest2.zip";
            let unzipdir1 = dir + "/Sub_Bms_Zlib_Uncompress_InputParam_0400a";
            let unzipdir2 = dir + "/Sub_Bms_Zlib_Uncompress_InputParam_0400b";
            let finalFile1 = unzipdir1 + "/decompressFileTest.txt";
            let finalFile2 = unzipdir2 + "/decompressFileTest.txt";
            let fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("decompressDifferentLevel write data to file success " + JSON.stringify(number));
            }).catch(function (err) {
                console.info("decompressDifferentLevel write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            await zlib.compressFile(path, zipDest1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION
            }).then(data => {
                console.info("decompressDifferentLevel success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressDifferentLevel fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await zlib.compressFile(path, zipDest2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED
            }).then(data => {
                console.info("decompressDifferentLevel success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressDifferentLevel  fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir1).then(function () {
                console.info("decompressDifferentLevel mkdir successfully");
            }).catch(function (error) {
                console.info("decompressDifferentLevel mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            await zlib.decompressFile(zipDest1, unzipdir1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION
            }).then(data => {
                console.info("decompressDifferentLevel success1 " + JSON.stringify(data));
                let zipStat = fileio.statSync(finalFile1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressDifferentLevel fail1 " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir2).then(function () {
                console.info("decompressDifferentLevel mkdir successfully");
            }).catch(function (error) {
                console.info("decompressDifferentLevel mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            zlib.decompressFile(zipDest2, unzipdir2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED
            }, (err, data) => {
                console.info("decompressDifferentLevel success2 " + JSON.stringify(data));
                console.info("decompressDifferentLevel success2 " + JSON.stringify(err));
                let zipStat = fileio.statSync(finalFile2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(undefined);
                expect(err).assertEqual(null);
                done();
            })
        })

        /**
         * @tc.name   decompressFileInFileNotExist
         * @tc.number Sub_Bms_Zlib_Uncompress_Unusual_0200
         * @tc.desc   test decompressFile when inFile is not exist
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('decompressFileInFileNotExist', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================decompressFileInFileNotExist start==================");
            let zipDest = dir + "/noneexist.zip";
            let unzipdir = dir + "/decompressFileInFileNotExist";
            await fileio.mkdir(unzipdir).then(function () {
                console.info("fileio mkdir successfully");
            }).catch(function (error) {
                console.info("fileio mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            await zlib.decompressFile(zipDest, unzipdir, {
                strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED
            }).then(data => {
                console.info("decompressFile data: " + data);
                expect(data).assertFail(null);
                done();
            }).catch(err => {
                console.info("decompress fail: " + JSON.stringify(err));
                expect(err.code).assertEqual(SRC_FILE_INVALID);
                done();
            })
            zlib.decompressFile(zipDest, unzipdir, {
                strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED
            }, (err, data) => {
                expect(err.code).assertEqual(SRC_FILE_INVALID);
                expect(data).assertEqual(undefined);
                done();
            })
            console.info("==================decompressFileInFileNotExist end==================");
        })

        /**
         * @tc.name   decompressFileInFileNull
         * @tc.number Sub_Bms_Zlib_Uncompress_Unusual_0300
         * @tc.desc   test decompressFile when inFile is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('decompressFileInFileNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================decompressFileInFileNull start==================");
            let unzipdir = dir + "/decompressFileInFileNull";
            await fileio.mkdir(unzipdir).then(function () {
                console.info("fileio mkdir successfully");
            }).catch(function (error) {
                console.info("fileio mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            try {
                await zlib.decompressFile(null, unzipdir, {
                    strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED
                }).then(data => {
                    console.info("decompressFile data: " + data);
                    expect().assertFail();
                }).catch(err => {
                    console.info("decompress fail: " + JSON.stringify(err));
                    expect().assertFail();
                })
            } catch (err) {
                console.info("decompress fail: " + JSON.stringify(err));
                expect(err.code).assertEqual(PARAM_ERROR);
            }
            try {
                zlib.decompressFile(null, unzipdir, {
                    strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED
                }, (err, data) => {
                    expect().assertFail();
                    done();
                })
            } catch (err) {
                console.info("decompress fail: " + JSON.stringify(err));
                expect(err.code).assertEqual(PARAM_ERROR);
                done();
            }
            console.info("==================decompressFileInFileNull end==================");
        })

        /**
         * @tc.name   decompressFileOutFileNotExist
         * @tc.number Sub_Bms_Zlib_Uncompress_Unusual_0400
         * @tc.desc   test decompressFile when outFile is not existed.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('decompressFileOutFileNotExist', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================decompressFileOutFileNotExist start==================");
            let path = dir + "/decompressFileOutFileNotExist.txt";
            let zipDest1 = dir + "/decompressFileOutFileNotExist.zip";
            let outFile = "/111111/22222/test";
            let fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("decompressFileOutFileNotExist write data to file success " + JSON.stringify(number));
            }).catch(function (err) {
                console.info("decompressFileOutFileNotExist write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            await zlib.compressFile(path, zipDest1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("compressFile success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("compressFile fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await zlib.decompressFile(zipDest1, outFile, {
                strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED
            }).then(data => {
                console.info("decompressFile data: " + data);
                expect().assertFail();
            }).catch(err => {
                console.info("decompress fail: " + JSON.stringify(err));
                expect(err.code).assertEqual(OUTPUT_FILE_INVALID);
            })
            zlib.decompressFile(zipDest1, outFile, {
                strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED
            }, (err, data) => {
                expect(err.code).assertEqual(OUTPUT_FILE_INVALID);
                done();
            })
            console.info("==================decompressFileOutFileNotExist end==================");
        })

        /**
         * @tc.name   decompressFileOutFileNull
         * @tc.number Sub_Bms_Zlib_Uncompress_Unusual_0500
         * @tc.desc   test decompressFile when outFile is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('decompressFileOutFileNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================decompressFileOutFileNull start==================");
            let path = dir + "/decompressFileOutFileNull.txt";
            let zipDest1 = dir + "/decompressFileOutFileNull.zip";
            let fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("decompressFileOutFileNull write data to file success " + JSON.stringify(number));
            }).catch(function (err) {
                console.info("decompressFileOutFileNull write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            await zlib.compressFile(path, zipDest1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("compressFile success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("compressFile fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            try {
                await zlib.decompressFile(zipDest1, null, {
                    strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED
                }).then(data => {
                    console.info("decompressFile data: " + data);
                    expect().assertFail();
                }).catch(err => {
                    console.info("decompress fail: " + JSON.stringify(err));
                    expect().assertFail();
                })
            } catch (err) {
                console.info("decompress fail: " + JSON.stringify(err));
                expect(err.code).assertEqual(PARAM_ERROR);
            }
            try {
                zlib.decompressFile(zipDest1, null, {
                    strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED
                }, (err, data) => {
                    expect().assertFail();
                    done();
                })
            } catch (err) {
                console.info("decompress fail: " + JSON.stringify(err));
                expect(err.code).assertEqual(PARAM_ERROR);
                done();
            }
            console.info("==================decompressFileOutFileNull end==================");
        })

        /**
         * @tc.name   decompressFileOptionNull
         * @tc.number Sub_Bms_Zlib_Uncompress_Unusual_0600
         * @tc.desc   test decompressFile when option is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('decompressFileOptionNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================decompressFileOptionNull start==================");
            let path = dir + "/decompressFileOptionNull.txt";
            let zipDest1 = dir + "/decompressFileOptionNull.zip";
            let fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("Sub_Bms_Zlib_Uncompress_InputParam_0400 write data to file success " + JSON.stringify(number));
            }).catch(function (err) {
                console.info("Sub_Bms_Zlib_Uncompress_InputParam_0400 write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            await zlib.compressFile(path, zipDest1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("compressFile success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("compressFile fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            let unzipdir = dir + "/decompressFileOptionNull";
            await fileio.mkdir(unzipdir).then(function () {
                console.info("fileio mkdir successfully");
            }).catch(function (error) {
                console.info("fileio mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            try {
                await zlib.decompressFile(zipDest1, unzipdir, null).then(data => {
                    console.info("decompressFile data: " + data);
                    expect().assertFail();
                }).catch(err => {
                    console.info("decompress fail: " + JSON.stringify(err));
                    expect().assertFail();
                })
            } catch (err) {
                console.info("decompress fail: " + JSON.stringify(err));
                expect(err.code).assertEqual(PARAM_ERROR);
            }
            try {
                zlib.decompressFile(zipDest1, unzipdir, null, (err, data) => {
                    expect().assertFail();
                    done();
                })
            } catch (err) {
                console.info("decompress fail: " + JSON.stringify(err));
                expect(err.code).assertEqual(PARAM_ERROR);
                done();
            }
            console.info("==================decompressFileOutFileNull end==================");
        })

        /**
         * @tc.name   decompressFileInputNotZipPro
         * @tc.number Sub_Bms_Zlib_Uncompress_Unusual_0610
         * @tc.desc   test decompressFile when input file is not zip (promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('decompressFileInputNotZipPro', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================decompressFileInputNotZipPro start==================");
            let path = dir + "/decompressFileInputNotZipPro.txt";
            let zipDest1 = dir + "/decompressFileInputNotZipPro.zip";
            let fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("decompressFileInputNotZipPro write data to file success " + JSON.stringify(number));
            }).catch(function (err) {
                console.info("decompressFileInputNotZipPro write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            let unzipdir = dir + "/decompressFileInputNotZipPro";
            await fileio.mkdir(unzipdir).then(function () {
                console.info("fileio mkdir successfully");
            }).catch(function (error) {
                console.info("fileio mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            try {
                await zlib.decompressFile(path, unzipdir, {
                    parallel:zlib.ParallelStrategy.PARALLEL_STRATEGY_SEQUENTIAL
                }).then(data => {
                    console.info("decompressFileInputNotZipPro data1: " + data);
                    expect().assertFail();
                }).catch(err => {
                    console.info("decompressFileInputNotZipPro fail1: " + JSON.stringify(err));
                    expect(err.code).assertEqual(INPUT_FILE_NOT_ZIP);
                })
            } catch (err) {
                console.info("decompressFileInputNotZipPro catch1 : " + JSON.stringify(err));
                expect().assertFail();
            }
            try {
                await zlib.decompressFile(path, unzipdir).then(data => {
                    console.info("decompressFileInputNotZipPro data2: " + data);
                    expect().assertFail();
                    done();
                }).catch(err => {
                    console.info("decompressFileInputNotZipPro fail2: " + JSON.stringify(err));
                    expect(err.code).assertEqual(INPUT_FILE_NOT_ZIP);
                    done();
                })
            } catch (err) {
                console.info("decompressFileInputNotZipPro catch2: " + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("==================decompressFileInputNotZipPro end==================");
        })

        /**
         * @tc.name   decompressFileInputNotZipCal
         * @tc.number Sub_Bms_Zlib_Uncompress_Unusual_0620
         * @tc.desc   test decompressFile when input file is not zip (callback).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('decompressFileInputNotZipCal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================decompressFileInputNotZipCal start==================");
            let path = dir + "/decompressFileInputNotZipCal.txt";
            let zipDest1 = dir + "/decompressFileInputNotZipCal.zip";
            let fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("decompressFileInputNotZipCal write data to file success " + JSON.stringify(number));
            }).catch(function (err) {
                console.info("decompressFileInputNotZipCal write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            let unzipdir = dir + "/decompressFileInputNotZipCal";
            await fileio.mkdir(unzipdir).then(function () {
                console.info("fileio mkdir successfully");
            }).catch(function (error) {
                console.info("fileio mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            try {
                zlib.decompressFile(path, unzipdir, {
                    parallel:zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION
                }, (err, data) => {
                    expect(err.code).assertEqual(INPUT_FILE_NOT_ZIP);
                })
            } catch (err) {
                console.info("decompressFileInputNotZipCal fail: " + JSON.stringify(err));
                expect().assertFail();
            }
            try {
                zlib.decompressFile(path, unzipdir, (err, data) => {
                    expect(err.code).assertEqual(INPUT_FILE_NOT_ZIP);
                    done();
                })
            } catch (err) {
                console.info("decompressFileInputNotZipCal fail: " + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("==================decompressFileInputNotZipCal end==================");
        })

        /**
         * @tc.name   decompressFileInvalidOption
         * @tc.number Sub_Bms_Zlib_Uncompress_Unusual_0700
         * @tc.desc   test decompressFile when option is invalid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('decompressFileInvalidOption', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================decompressFileInvalidOption start==================");
            let path = dir + "/decompressFileInvalidOption.txt";
            let zipDest1 = dir + "/decompressFileInvalidOption.zip";
            let fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("Sub_Bms_Zlib_Uncompress_InputParam_0400 write data to file success " + JSON.stringify(number));
            }).catch(function (err) {
                console.info("Sub_Bms_Zlib_Uncompress_InputParam_0400 write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            await zlib.compressFile(path, zipDest1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("compressFile success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("compressFile fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            let unzipdir = dir + "/decompressFileInvalidOption";
            await fileio.mkdir(unzipdir).then(function () {
                console.info("fileio mkdir successfully");
            }).catch(function (error) {
                console.info("fileio mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            await zlib.decompressFile(zipDest1, unzipdir, {
                memLevel: -1
            }).then(data => {
                console.info("decompressFile data: " + data);
                expect(data).assertNull();
            }).catch(err => {
                console.info("decompress fail: " + JSON.stringify(err));
                expect().assertFail();
            })
            zlib.decompressFile(zipDest1, unzipdir, {
                memLevel: -1
            }, (err, data) => {
                expect(data).assertUndefined();
                expect(err).assertNull();
                done();
            })
            console.info("==================decompressFileOutFileNull end==================");
        })

        /**
         * @tc.name   decompressFileStrategyNull
         * @tc.number Sub_Bms_Zlib_Uncompress_Unusual_0800
         * @tc.desc   test decompressFile when strategy is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('decompressFileStrategyNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            console.info("==================decompressFileStrategyNull start==================");
            let path = dir + "/decompressFileStrategyNull.txt";
            let zipDest1 = dir + "/decompressFileStrategyNull.zip";
            let fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("decompressFileStrategyNull write data to file success " + JSON.stringify(number));
            }).catch(function (err) {
                console.info("decompressFileStrategyNull write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            await zlib.compressFile(path, zipDest1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("compressFile success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("compressFile fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            let unzipdir = dir + "/decompressFileStrategyNull";
            await fileio.mkdir(unzipdir).then(function () {
                console.info("fileio mkdir successfully");
            }).catch(function (error) {
                console.info("fileio mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            try {
                await zlib.decompressFile(zipDest1, unzipdir, {
                    strategy: null
                }).then(data => {
                    console.info("decompressFile data: " + data);
                }).catch(err => {
                    console.info("decompress fail: " + JSON.stringify(err));
                    expect().assertFail();
                })
            } catch (err) {
                console.info("decompress fail: " + JSON.stringify(err));
                expect().assertFail();
            }
            try {
                zlib.decompressFile(zipDest1, unzipdir, {
                    strategy: null
                }, (err, data) => {
                    console.info("decompressFile data: " + data);
                    done();
                })
            } catch (err) {
                console.info("decompress fail: " + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("==================decompressFileStrategyNull end==================");
        })

        /**
         * @tc.name   decompressFileInfileSpecialCharacters
         * @tc.number Sub_Bms_Zlib_Uncompress_InputParam_0500
         * @tc.desc   test decompressFile when outFile is a dir
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('decompressFileInfileSpecialCharacters', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            console.info("==================decompressFileInfileSpecialCharacters start==================");
            let path = dir + "/decompressFileTest.txt";
            let zipDest1 = dir + "/@#@##.zip";
            let zipDest2 = dir + "/@#@#@.zip";
            let unzipdir1 = dir + "/Sub_Bms_Zlib_Uncompress_InputParam_0500a";
            let unzipdir2 = dir + "/Sub_Bms_Zlib_Uncompress_InputParam_0500b";
            let finalFile1 = unzipdir1 + "/decompressFileTest.txt";
            let finalFile2 = unzipdir2 + "/decompressFileTest.txt";
            let fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("decompressFileInfileSpecialCharacters write data to file success " + JSON.stringify(number));
            }).catch(function (err) {
                console.info("decompressFileInfileSpecialCharacters write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            await zlib.compressFile(path, zipDest1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileInfileSpecialCharacters success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileInfileSpecialCharacters fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await zlib.compressFile(path, zipDest2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileInfileSpecialCharacters success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileInfileSpecialCharacters fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir1).then(function () {
                console.info("decompressFileInfileSpecialCharacters mkdir successfully");
            }).catch(function (error) {
                console.info("decompressFileInfileSpecialCharacters mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            await zlib.decompressFile(zipDest1, unzipdir1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileInfileSpecialCharacters success1 " + JSON.stringify(data));
                let zipStat = fileio.statSync(finalFile1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileInfileSpecialCharacters fail1 " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir2).then(function () {
                console.info("decompressFileInfileSpecialCharacters mkdir successfully");
            }).catch(function (error) {
                console.info("decompressFileInfileSpecialCharacters mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            zlib.decompressFile(zipDest2, unzipdir2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }, (err, data) => {
                console.info("decompressFileInfileSpecialCharacters success2 " + JSON.stringify(data));
                console.info("decompressFileInfileSpecialCharacters success2 " + JSON.stringify(err));
                let zipStat = fileio.statSync(finalFile2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(undefined);
                expect(err).assertEqual(null);
                done();
            })
        })

        /**
         * @tc.name   decompressFileOutfileSpecialCharDir
         * @tc.number Sub_Bms_Zlib_Uncompress_InputParam_0600
         * @tc.desc   test decompressFile when outFile is a dir
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('decompressFileOutfileSpecialCharDir', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================decompressFileOutfileSpecialCharDir start==================");
            let path = dir + "/decompressFileTest.txt";
            let zipDest1 = dir + "/@#@##.zip";
            let zipDest2 = dir + "/@#@#@.zip";
            let unzipdir1 = dir + "/@####1";
            let unzipdir2 = dir + "/#@@@@2";
            let finalFile1 = unzipdir1 + "/decompressFileTest.txt";
            let finalFile2 = unzipdir2 + "/decompressFileTest.txt";
            let fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("decompressFileOutfileSpecialCharDir write data to file success " + JSON.stringify(number));
            }).catch(function (err) {
                console.info("decompressFileOutfileSpecialCharDir write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            await zlib.compressFile(path, zipDest1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileOutfileSpecialCharDir success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileOutfileSpecialCharDir fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await zlib.compressFile(path, zipDest2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileOutfileSpecialCharDir success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileOutfileSpecialCharDir fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir1).then(function () {
                console.info("decompressFileOutfileSpecialCharDir mkdir successfully");
            }).catch(function (error) {
                console.info("decompressFileOutfileSpecialCharDir mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            await zlib.decompressFile(zipDest1, unzipdir1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileOutfileSpecialCharDir success1 " + JSON.stringify(data));
                let zipStat = fileio.statSync(finalFile1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileOutfileSpecialCharDir fail1 " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir2).then(function () {
                console.info("decompressFileOutfileSpecialCharDir mkdir successfully");
            }).catch(function (error) {
                console.info("decompressFileOutfileSpecialCharDir mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            zlib.decompressFile(zipDest2, unzipdir2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }, (err, data) => {
                console.info("decompressFileOutfileSpecialCharDir success2 " + JSON.stringify(data));
                console.info("decompressFileOutfileSpecialCharDir success2 " + JSON.stringify(err));
                let zipStat = fileio.statSync(finalFile2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(undefined);
                expect(err).assertEqual(null);
                done();
            })
        })

        /**
         * @tc.name   decompressFileInfileChineseDir
         * @tc.number Sub_Bms_Zlib_Uncompress_InputParam_0700
         * @tc.desc   test decompressFile when outFile is a dir
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('decompressFileInfileChineseDir', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================decompressFileInfileChineseDir start==================");
            let path = dir + "/decompressFileTest.txt";
            let zipDest1 = dir + "/解压1.zip";
            let zipDest2 = dir + "/解压2.zip";
            let unzipdir1 = dir + "/文件夹1";
            let unzipdir2 = dir + "/文件夹2";
            let finalFile1 = unzipdir1 + "/decompressFileTest.txt";
            let finalFile2 = unzipdir2 + "/decompressFileTest.txt";
            let fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("decompressFileInfileChineseDir write data to file success " + JSON.stringify(number));
            }).catch(function (err) {
                console.info("decompressFileInfileChineseDir write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            await zlib.compressFile(path, zipDest1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileInfileChineseDir success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileInfileChineseDir fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await zlib.compressFile(path, zipDest2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileInfileChineseDir success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileInfileChineseDir fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir1).then(function () {
                console.info("decompressFileInfileChineseDir mkdir successfully");
            }).catch(function (error) {
                console.info("decompressFileInfileChineseDir mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            await zlib.decompressFile(zipDest1, unzipdir1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileInfileChineseDir success1 " + JSON.stringify(data));
                let zipStat = fileio.statSync(finalFile1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileInfileChineseDir fail1 " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir2).then(function () {
                console.info("decompressFileInfileChineseDir mkdir successfully");
            }).catch(function (error) {
                console.info("decompressFileInfileChineseDir mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            zlib.decompressFile(zipDest2, unzipdir2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }, (err, data) => {
                console.info("decompressFileInfileChineseDir success2 " + JSON.stringify(data));
                console.info("decompressFileInfileChineseDir success2 " + JSON.stringify(err));
                let zipStat = fileio.statSync(finalFile2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(undefined);
                expect(err).assertEqual(null);
                done();
            })
        })

        /**
         * @tc.name   decompressFileInfileChinesePath
         * @tc.number Sub_Bms_Zlib_Uncompress_InputParam_0800
         * @tc.desc   test decompressFile when outFile is a dir
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('decompressFileInfileChinesePath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================decompressFileInfileChinesePath start==================");
            let path = dir + "/decompressFileTest.txt";
            let zipDest1 = dir + "/解压1.zip";
            let zipDest2 = dir + "/解压2.zip";
            let unzipdir1 = dir + "/Sub_Bms_Zlib_Uncompress_InputParam_0800a";
            let unzipdir2 = dir + "/Sub_Bms_Zlib_Uncompress_InputParam_0800b";
            let finalFile1 = unzipdir1 + "/decompressFileTest.txt";
            let finalFile2 = unzipdir2 + "/decompressFileTest.txt";
            let fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("decompressFileInfileChinesePath write data to file success " + JSON.stringify(number));
            }).catch(function (err) {
                console.info("decompressFileInfileChinesePath write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            await zlib.compressFile(path, zipDest1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileInfileChinesePath success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileInfileChinesePath fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await zlib.compressFile(path, zipDest2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileInfileChinesePath success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileInfileChinesePath fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir1).then(function () {
                console.info("decompressFileInfileChinesePath mkdir successfully");
            }).catch(function (error) {
                console.info("decompressFileInfileChinesePath mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            await zlib.decompressFile(zipDest1, unzipdir1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileInfileChinesePath success1 " + JSON.stringify(data));
                let zipStat = fileio.statSync(finalFile1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileInfileChinesePath fail1 " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir2).then(function () {
                console.info("decompressFileInfileChinesePath mkdir successfully");
            }).catch(function (error) {
                console.info("decompressFileInfileChinesePath mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            zlib.decompressFile(zipDest2, unzipdir2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }, (err, data) => {
                console.info("decompressFileInfileChinesePath success2 " + JSON.stringify(data));
                console.info("decompressFileInfileChinesePath success2 " + JSON.stringify(err));
                let zipStat = fileio.statSync(finalFile2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(undefined);
                expect(err).assertEqual(null);
                done();
            })
        })

        /**
         * @tc.name   decompressFileInfileZipPath
         * @tc.number Sub_Bms_Zlib_Uncompress_InputParam_0900
         * @tc.desc   test decompressFile when outFile is a dir
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('decompressFileInfileZipPath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================decompressFileInfileZipPath start==================");
            let path = dir + "/decompressFileTest.txt";
            let zipDest1 = dir + "/1#@.zip.zip";
            let zipDest2 = dir + "/2##.zip.zip";
            let unzipdir1 = dir + "/Sub_Bms_Zlib_Uncompress_InputParam_0900a";
            let unzipdir2 = dir + "/Sub_Bms_Zlib_Uncompress_InputParam_0900b";
            let finalFile1 = unzipdir1 + "/decompressFileTest.txt";
            let finalFile2 = unzipdir2 + "/decompressFileTest.txt";
            let fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("decompressFileInfileZipPath write data to file success " + JSON.stringify(number));
            }).catch(function (err) {
                console.info("decompressFileInfileZipPath write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            await zlib.compressFile(path, zipDest1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileInfileZipPath success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileInfileZipPath fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await zlib.compressFile(path, zipDest2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileInfileZipPath success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileInfileZipPath fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir1).then(function () {
                console.info("decompressFileInfileZipPath mkdir successfully");
            }).catch(function (error) {
                console.info("decompressFileInfileZipPath mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            await zlib.decompressFile(zipDest1, unzipdir1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileInfileZipPath success1 " + JSON.stringify(data));
                let zipStat = fileio.statSync(finalFile1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileInfileZipPath fail1 " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir2).then(function () {
                console.info("decompressFileInfileZipPath mkdir successfully");
            }).catch(function (error) {
                console.info("decompressFileInfileZipPath mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            zlib.decompressFile(zipDest2, unzipdir2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }, (err, data) => {
                console.info("decompressFileInfileZipPath success2 " + JSON.stringify(data));
                console.info("decompressFileInfileZipPath success2 " + JSON.stringify(err));
                let zipStat = fileio.statSync(finalFile2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(undefined);
                expect(err).assertEqual(null);
                done();
            })
        })

        /**
         * @tc.name   decompressFileInfileBlankPath
         * @tc.number Sub_Bms_Zlib_Uncompress_InputParam_1000
         * @tc.desc   test decompressFile when outFile is a dir
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('decompressFileInfileBlankPath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================decompressFileInfileBlankPath start==================");
            let path = dir + "/decompressFileTest.txt";
            let zipDest1 = dir + "/解压 1#@.zip";
            let zipDest2 = dir + "/解压 2##.zip";
            let unzipdir1 = dir + "/Sub_Bms_Zlib_Uncompress_InputParam_1000a";
            let unzipdir2 = dir + "/Sub_Bms_Zlib_Uncompress_InputParam_1000b";
            let finalFile1 = unzipdir1 + "/decompressFileTest.txt";
            let finalFile2 = unzipdir2 + "/decompressFileTest.txt";
            let fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
            await fileio.write(fd, infos).then(function (number) {
                console.info("decompressFileInfileBlankPath write data to file success " + JSON.stringify(number));
            }).catch(function (err) {
                console.info("decompressFileInfileBlankPath write data to file failed with error:" + err);
                expect(err).assertFail();
            });
            await zlib.compressFile(path, zipDest1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileInfileBlankPath success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileInfileBlankPath fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await zlib.compressFile(path, zipDest2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileInfileBlankPath success " + JSON.stringify(data));
                let zipStat = fileio.statSync(zipDest2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                let srcSize = fileio.statSync(path).size;
                let destSize = zipStat.size;
                expect(srcSize > destSize).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileInfileBlankPath fail " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir1).then(function () {
                console.info("decompressFileInfileBlankPath mkdir successfully");
            }).catch(function (error) {
                console.info("decompressFileInfileBlankPath mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            await zlib.decompressFile(zipDest1, unzipdir1, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }).then(data => {
                console.info("decompressFileInfileBlankPath success1 " + JSON.stringify(data));
                let zipStat = fileio.statSync(finalFile1);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(null);
            }).catch(err => {
                console.info("decompressFileInfileBlankPath fail1 " + JSON.stringify(err));
                expect(err).assertFail();
            })
            await fileio.mkdir(unzipdir2).then(function () {
                console.info("decompressFileInfileBlankPath mkdir successfully");
            }).catch(function (error) {
                console.info("decompressFileInfileBlankPath mkdir failed with error:" + error);
                expect(error).assertFail();
            });
            zlib.decompressFile(zipDest2, unzipdir2, {
                level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
            }, (err, data) => {
                console.info("decompressFileInfileBlankPath success2 " + JSON.stringify(data));
                console.info("decompressFileInfileBlankPath success2 " + JSON.stringify(err));
                let zipStat = fileio.statSync(finalFile2);
                let isFile = zipStat.isFile();
                expect(isFile).assertTrue();
                expect(data).assertEqual(undefined);
                expect(err).assertEqual(null);
                done();
            })
        })

        /**
         * @tc.name   compressFiles
         * @tc.number Sub_CompressFiles_0100
         * @tc.desc   test compressFiles
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('compressFiles', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
            console.info("==================compressFiles  start==================");
            try {
            let pathDir = dir;
            console.info(`beforeAll: getCacheDir data: ${pathDir}`);
            let fpath = pathDir + `/my/test1.txt`;
            fileio.mkdirSync(pathDir + "/my");
            let zippath1 = pathDir + `/test1.zip`;
            let zippath2 = pathDir + `/test2.zip`;
            console.info(`beforeAll: filePath data: ${fpath}`);
            let fd = fileio.openSync(fpath, 0o100 | 0o2, 0o666);
            fileio.closeSync(fd);
            fileio.mkdirSync(pathDir + "/my/my");
            const FILE_CONTENT = 'hello world';
            let sread = fileio.createStreamSync(fpath, 'r+');
            let bytesWritten1 = sread.writeSync(FILE_CONTENT, undefined);
            let readLen = sread.readSync(new ArrayBuffer(4096), { position: 0 });
            console.info('readLen = ' + readLen);
            sread.closeSync();
            sread = fileio.createStreamSync(pathDir + `/my/test1.txt`, 'r+');
            bytesWritten1 = sread.writeSync(FILE_CONTENT, undefined);
            readLen = sread.readSync(new ArrayBuffer(4096), { position: 0 });
            console.info('readLen = ' + readLen);
            sread.closeSync();
            try {
            await zlib.compressFiles([fpath, pathDir, pathDir], zippath1, {}).then(() => {
              console.info('compressFiles end!')
              let swrite = fileio.createStreamSync(zippath1, 'r+');
              let buffer = new ArrayBuffer(4096)
              let len = swrite.readSync(buffer, { position: 0 });
              console.info("compressFiles read length = ", len)
              expect(len).assertEqual(4096);
              let array = new Uint8Array(buffer);
              let dataString = "";
              for (let i = 0; i < len; i++) {
                dataString += String.fromCharCode(array[i]);
                console.info("for len = ", i)
              }
              console.info('compressFiles Call result dest', dataString)
            })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            }

            try {
                await zlib.compressFiles([fpath, pathDir, pathDir], "", {}).then(() => {
                    console.info('compressFiles end!')
                    let swrite = fileio.createStreamSync(zippath1, 'r+');
                    let buffer = new ArrayBuffer(4096)
                    let len = swrite.readSync(buffer, { position: 0 });
                    console.info("compressFiles read length = ", len)
                    expect(len).assertEqual(4096);
                    let array = new Uint8Array(buffer);
                    let dataString = "";
                    for (let i = 0; i < len; i++) {
                    dataString += String.fromCharCode(array[i]);
                    console.info("for len = ", i)
                    }
                    console.info('compressFiles Call result dest', dataString)
                    expect(len).assertFail();
                })
                } catch (errData) {
                    console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                    expect(errData.code).assertEqual(OUTPUT_FILE_INVALID);
                }
    
                try {
                await zlib.compressFiles("", zippath2, {}).then(() => {
                    console.info('compressFiles end!')
                    let swrite = fileio.createStreamSync(zippath1, 'r+');
                    let buffer = new ArrayBuffer(4096)
                    let len = swrite.readSync(buffer, { position: 0 });
                    console.info("compressFiles read length = ", len)
                    expect(len).assertEqual(4096);
                    let array = new Uint8Array(buffer);
                    let dataString = "";
                    for (let i = 0; i < len; i++) {
                    dataString += String.fromCharCode(array[i]);
                    console.info("for len = ", i)
                    }
                    console.info('compressFiles Call result dest', dataString)
                    expect(len).assertFail();
                })
                } catch (errData) {
                    console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                    expect(errData.code).assertEqual(SRC_FILE_INVALID);
                }
          } catch (err) {
            console.info('fileio_test_stream_write_sync_000 has failed for ' + err);
            expect(err).assertFail();
          }
          done()
        })

        /**
         * @tc.name   compressFilesNull
         * @tc.number Sub_CompressFiles_0200
         * @tc.desc   test compressFiles when inFile is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('compressFilesNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            console.info("==================compressFilesNull start==================");
            try {
                await zlib.compressFiles(null, null, {
                    level: zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION
                }).then((data) => {
                    console.info("compressFilesNull invalid src file success!");
                    expect().assertFail();
                }).catch((err) => {
                    console.info("compressFilesNull zipFile fail: " + JSON.stringify(err));
                    expect().assertFail();
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(PARAM_ERROR);
            }
            done()
            console.info("==================compressFileInFileNull end==================");
        })
    })
}

