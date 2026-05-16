/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import fs from '@ohos.file.fs';
import { BusinessError } from '@kit.BasicServicesKit';
let dir = "";
let infos = "";
let SRC_FILE_INVALID = 900001;
let OUTPUT_FILE_INVALID = 900002;
let INPUT_FILE_NOT_ZIP = 900003;
let PARAM_ERROR = 401;

export default function ZipdecompressFileTest() {
  describe('ZipdecompressFileTest', ()=> {
    beforeEach(async (done:Function) => {

      let context = AppStorage.get("context") as Context;
      let dir =  context.cacheDir
      let objectone = "com.example.amsZipfileUnzipfileST.MainAbility/com.example.amsZipfileUnzipfileST/";
      let  objecttwo = "com.example.amsZipfileUnzipfileST.MainAbility/com.example.amsZipfileUnzipfileST/zipunzip";
      let  objectthree = "com.example.amsZipfileUnzipfileST.MainAbility/ActsZlibTest/example.amsZipfileUnzipfileST";
      infos = dir + objectone + objecttwo + objectthree;
      done();

      })
    });

    /**
     * @tc.name   decompressFile_0100
     * @tc.number decompressFile_0100
     * @tc.desc   decompressFile level COMPRESS_LEVEL_NO_COMPRESSION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFile_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      console.info("==================decompressFile_0100 start==================");
      let  inFile = dir + "/decompressFile_0100.zip";
      let  outFile = dir + "/decompressFile_0100.txt";
      let  options :zlib.Options= {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number=> {
        console.info("decompressFile_0100 write data to file successfully:" + number);
        // Create compressed version first
        let tempCompressedFile = dir + "/temp_decompressFile_0100.zip";
        zlib.compressFile(inFile, tempCompressedFile, options, (err, data) => {
          if (err) {
            console.info("decompressFile_0100 compress err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.info("decompressFile_0100 compress data: " + data);
            // Now decompress with COMPRESS_LEVEL_NO_COMPRESSION
            zlib.decompressFile(tempCompressedFile, outFile, options, (err, data) => {
              if (err) {
                console.info("decompressFile_0100 err: " + JSON.stringify(err));
                expect().assertFail();
                done();
              } else {
                console.info("decompressFile_0100 data: " + data);
                fs.stat(outFile).then((stat) => {
                  expect(stat.isFile()).assertTrue();
                  expect(stat.size > 0).assertTrue();
                  done();
                }).catch((err:BusinessError) => {
                  console.info("decompressFile_0100 stat err: " + JSON.stringify(err));
                  expect().assertFail();
                  done();
                });
              }
            });
          }
        });
      }).catch((err:BusinessError)=> {
        console.info("decompressFile_0100 write err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFile_0100 end==================");
    })

    /**
     * @tc.name   decompressFile_0200
     * @tc.number decompressFile_0200
     * @tc.desc   decompressFile level COMPRESS_LEVEL_BEST_COMPRESSION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFile_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      console.info("==================decompressFile_0200 start==================");
      let  inFile = dir + "/decompressFile_0200.zip";
      let  outFile = dir + "/decompressFile_0200.txt";
      let  options :zlib.Options= {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number=> {
        console.info("decompressFile_0200 write data to file successfully:" + number);
        let tempCompressedFile = dir + "/temp_decompressFile_0200.zip";
        zlib.compressFile(inFile, tempCompressedFile, options, (err, data) => {
          if (err) {
            console.info("decompressFile_0200 compress err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.info("decompressFile_0200 compress data: " + data);
            zlib.decompressFile(tempCompressedFile, outFile, options, (err, data) => {
              if (err) {
                console.info("decompressFile_0200 err: " + JSON.stringify(err));
                expect().assertFail();
                done();
              } else {
                console.info("decompressFile_0200 data: " + data);
                fs.stat(outFile).then((stat) => {
                  expect(stat.isFile()).assertTrue();
                  expect(stat.size > 0).assertTrue();
                  done();
                }).catch((err:BusinessError) => {
                  console.info("decompressFile_0200 stat err: " + JSON.stringify(err));
                  expect().assertFail();
                  done();
                });
              }
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("decompressFile_0200 write err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFile_0200 end==================");
    })

    /**
     * @tc.name   decompressFile_0300
     * @tc.number decompressFile_0300
     * @tc.desc   decompressFile memLevel MEM_LEVEL_MIN test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFile_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      console.info("==================decompressFile_0300 start==================");
      let inFile = dir + "/decompressFile_0300.zip";
      let outFile = dir + "/decompressFile_0300.txt";
      let  options :zlib.Options= {};
      options.memLevel = zlib.MemLevel.MEM_LEVEL_MIN;
      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then((number)=> {
        console.info("decompressFile_0300 write data to file successfully:" + number);
        let tempCompressedFile = dir + "/temp_decompressFile_0300.zip";
        zlib.compressFile(inFile, tempCompressedFile, options, (err, data) => {
          if (err) {
            console.info("decompressFile_0300 compress err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.info("decompressFile_0300 compress data: " + data);
            zlib.decompressFile(tempCompressedFile, outFile, options, (err, data) => {
              if (err) {
                console.info("decompressFile_0300 err: " + JSON.stringify(err));
                expect().assertFail();
                done();
              } else {
                console.info("decompressFile_0300 data: " + data);
                fs.stat(outFile).then((stat) => {
                  expect(stat.isFile()).assertTrue();
                  expect(stat.size > 0).assertTrue();
                  done();
                }).catch((err:BusinessError) => {
                  console.info("decompressFile_0300 stat err: " + JSON.stringify(err));
                  expect().assertFail();
                  done();
                });
              }
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("decompressFile_0300 write err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFile_0300 end==================");
    })

    /**
     * @tc.name   decompressFile_0400
     * @tc.number decompressFile_0400
     * @tc.desc   decompressFile memLevel MEM_LEVEL_MAX test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFile_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      console.info("==================decompressFile_0400 start==================");
      let inFile = dir + "/decompressFile_0400.zip";
      let outFile = dir + "/decompressFile_0400.txt";
      let  options :zlib.Options= {};
      options.memLevel = zlib.MemLevel.MEM_LEVEL_MAX;
      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then((number)=> {
        console.info("decompressFile_0400 write data to file successfully:" + number);
        let tempCompressedFile = dir + "/temp_decompressFile_0400.zip";
        zlib.compressFile(inFile, tempCompressedFile, options, (err, data) => {
          if (err) {
            console.info("decompressFile_0400 compress err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.info("decompressFile_0400 compress data: " + data);
            zlib.decompressFile(tempCompressedFile, outFile, options, (err, data) => {
              if (err) {
                console.info("decompressFile_0400 err: " + JSON.stringify(err));
                expect().assertFail();
                done();
              } else {
                console.info("decompressFile_0400 data: " + data);
                fs.stat(outFile).then((stat) => {
                  expect(stat.isFile()).assertTrue();
                  expect(stat.size > 0).assertTrue();
                  done();
                }).catch((err:BusinessError) => {
                  console.info("decompressFile_0400 stat err: " + JSON.stringify(err));
                  expect().assertFail();
                  done();
                });
              }
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("decompressFile_0400 write err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFile_0400 end==================");
    })

    /**
     * @tc.name   decompressFile_0500
     * @tc.number decompressFile_0500
     * @tc.desc   decompressFile memLevel MEM_LEVEL_DEFAULT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFile_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) =>  {
      console.info("==================decompressFile_0500 start==================");
      let inFile = dir + "/decompressFile_0500.zip";
      let outFile = dir + "/decompressFile_0500.txt";
      let  options :zlib.Options= {};
      options.memLevel = zlib.MemLevel.MEM_LEVEL_DEFAULT;

      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("decompressFile_0500 write data to file successfully:" + number);

        let tempCompressedFile = dir + "/temp_decompressFile_0500.zip";
        zlib.compressFile(inFile, tempCompressedFile, options, (err, data) => {
          if (err) {
            console.info("decompressFile_0500 compress err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.info("decompressFile_0500 compress data: " + data);
            

            zlib.decompressFile(tempCompressedFile, outFile, options, (err, data) => {
              if (err) {
                console.info("decompressFile_0500 err: " + JSON.stringify(err));
                expect().assertFail();
                done();
              } else {
                console.info("decompressFile_0500 data: " + data);
                

                fs.stat(outFile).then((stat) => {
                  expect(stat.isFile()).assertTrue();
                  expect(stat.size > 0).assertTrue();
                  done();
                }).catch((err:BusinessError) => {
                  console.info("decompressFile_0500 stat err: " + JSON.stringify(err));
                  expect().assertFail();
                  done();
                });
              }
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("decompressFile_0500 write err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFile_0500 end==================");
    })

    /**
     * @tc.name   decompressFile_0600
     * @tc.number decompressFile_0600
     * @tc.desc   decompressFile strategy COMPRESS_STRATEGY_DEFAULT_STRATEGY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFile_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) =>  {
      console.info("==================decompressFile_0600 start==================");
      let inFile = dir + "/decompressFile_0600.zip";
      let outFile = dir + "/decompressFile_0600.txt";
      let  options :zlib.Options= {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY;

      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("decompressFile_0600 write data to file successfully:" + number);

        let tempCompressedFile = dir + "/temp_decompressFile_0600.zip";
        zlib.compressFile(inFile, tempCompressedFile, options, (err, data) => {
          if (err) {
            console.info("decompressFile_0600 compress err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.info("decompressFile_0600 compress data: " + data);
            

            zlib.decompressFile(tempCompressedFile, outFile, options, (err, data) => {
              if (err) {
                console.info("decompressFile_0600 err: " + JSON.stringify(err));
                expect().assertFail();
                done();
              } else {
                console.info("decompressFile_0600 data: " + data);
                

                fs.stat(outFile).then((stat) => {
                  expect(stat.isFile()).assertTrue();
                  expect(stat.size > 0).assertTrue();
                  done();
                }).catch((err:BusinessError) => {
                  console.info("decompressFile_0600 stat err: " + JSON.stringify(err));
                  expect().assertFail();
                  done();
                });
              }
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("decompressFile_0600 write err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFile_0600 end==================");
    })

    /**
     * @tc.name   decompressFile_0700
     * @tc.number decompressFile_0700
     * @tc.desc   decompressFile strategy COMPRESS_STRATEGY_FILTERED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFile_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) =>  {
      console.info("==================decompressFile_0700 start==================");
      let inFile = dir + "/decompressFile_0700.zip";
      let outFile = dir + "/decompressFile_0700.txt";
      let  options :zlib.Options= {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;

      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("decompressFile_0700 write data to file successfully:" + number);

        let tempCompressedFile = dir + "/temp_decompressFile_0700.zip";
        zlib.compressFile(inFile, tempCompressedFile, options, (err, data) => {
          if (err) {
            console.info("decompressFile_0700 compress err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.info("decompressFile_0700 compress data: " + data);
            

            zlib.decompressFile(tempCompressedFile, outFile, options, (err, data) => {
              if (err) {
                console.info("decompressFile_0700 err: " + JSON.stringify(err));
                expect().assertFail();
                done();
              } else {
                console.info("decompressFile_0700 data: " + data);
                

                fs.stat(outFile).then((stat) => {
                  expect(stat.isFile()).assertTrue();
                  expect(stat.size > 0).assertTrue();
                  done();
                }).catch((err:BusinessError) => {
                  console.info("decompressFile_0700 stat err: " + JSON.stringify(err));
                  expect().assertFail();
                  done();
                });
              }
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("decompressFile_0700 write err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFile_0700 end==================");
    })

    /**
     * @tc.name   decompressFile_0800
     * @tc.number decompressFile_0800
     * @tc.desc   decompressFile strategy COMPRESS_STRATEGY_HUFFMAN_ONLY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFile_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) =>  {
      console.info("==================decompressFile_0800 start==================");
      let inFile = dir + "/decompressFile_0800.zip";
      let outFile = dir + "/decompressFile_0800.txt";
      let  options :zlib.Options= {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_HUFFMAN_ONLY;

      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("decompressFile_0800 write data to file successfully:" + number);

        let tempCompressedFile = dir + "/temp_decompressFile_0800.zip";
        zlib.compressFile(inFile, tempCompressedFile, options, (err, data) => {
          if (err) {
            console.info("decompressFile_0800 compress err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.info("decompressFile_0800 compress data: " + data);
            

            zlib.decompressFile(tempCompressedFile, outFile, options, (err, data) => {
              if (err) {
                console.info("decompressFile_0800 err: " + JSON.stringify(err));
                expect().assertFail();
                done();
              } else {
                console.info("decompressFile_0800 data: " + data);
                

                fs.stat(outFile).then((stat) => {
                  expect(stat.isFile()).assertTrue();
                  expect(stat.size > 0).assertTrue();
                  done();
                }).catch((err:BusinessError) => {
                  console.info("decompressFile_0800 stat err: " + JSON.stringify(err));
                  expect().assertFail();
                  done();
                });
              }
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("decompressFile_0800 write err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFile_0800 end==================");
    })

    /**
     * @tc.name   decompressFile_0900
     * @tc.number decompressFile_0900
     * @tc.desc   decompressFile strategy COMPRESS_STRATEGY_RLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFile_0900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) =>  {
      console.info("==================decompressFile_0900 start==================");
      let inFile = dir + "/decompressFile_0900.zip";
      let outFile = dir + "/decompressFile_0900.txt";
      let  options :zlib.Options= {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_RLE;

      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("decompressFile_0900 write data to file successfully:" + number);

        let tempCompressedFile = dir + "/temp_decompressFile_0900.zip";
        zlib.compressFile(inFile, tempCompressedFile, options, (err, data) => {
          if (err) {
            console.info("decompressFile_0900 compress err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.info("decompressFile_0900 compress data: " + data);
            

            zlib.decompressFile(tempCompressedFile, outFile, options, (err, data) => {
              if (err) {
                console.info("decompressFile_0900 err: " + JSON.stringify(err));
                expect().assertFail();
                done();
              } else {
                console.info("decompressFile_0900 data: " + data);
                

                fs.stat(outFile).then((stat) => {
                  expect(stat.isFile()).assertTrue();
                  expect(stat.size > 0).assertTrue();
                  done();
                }).catch((err:BusinessError) => {
                  console.info("decompressFile_0900 stat err: " + JSON.stringify(err));
                  expect().assertFail();
                  done();
                });
              }
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("decompressFile_0900 write err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFile_0900 end==================");
    })

    /**
     * @tc.name   decompressFile_1000
     * @tc.number decompressFile_1000
     * @tc.desc   decompressFile parallel PARALLEL_STRATEGY_SEQUENTIAL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFile_1000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) =>  {
      console.info("==================decompressFile_1000 start==================");
      let inFile = dir + "/decompressFile_1000.zip";
      let outFile = dir + "/decompressFile_1000.txt";
      let  options :zlib.Options= {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      options.parallel = zlib.ParallelStrategy.PARALLEL_STRATEGY_SEQUENTIAL;

      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("decompressFile_1000 write data to file successfully:" + number);

        let tempCompressedFile = dir + "/temp_decompressFile_1000.zip";
        zlib.compressFile(inFile, tempCompressedFile, options, (err, data) => {
          if (err) {
            console.info("decompressFile_1000 compress err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.info("decompressFile_1000 compress data: " + data);
            

            zlib.decompressFile(tempCompressedFile, outFile, options, (err, data) => {
              if (err) {
                console.info("decompressFile_1000 err: " + JSON.stringify(err));
                expect().assertFail();
                done();
              } else {
                console.info("decompressFile_1000 data: " + data);
                

                fs.stat(outFile).then((stat) => {
                  expect(stat.isFile()).assertTrue();
                  expect(stat.size > 0).assertTrue();
                  done();
                }).catch((err:BusinessError) => {
                  console.info("decompressFile_1000 stat err: " + JSON.stringify(err));
                  expect().assertFail();
                  done();
                });
              }
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("decompressFile_1000 write err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFile_1000 end==================");
    })

    /**
     * @tc.name   decompressFile_1100
     * @tc.number decompressFile_1100
     * @tc.desc   decompressFile pathSeparatorStrategy PATH_SEPARATOR_STRATEGY_DEFAULT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFile_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) =>  {
      console.info("==================decompressFile_1100 start==================");
      let inFile = dir + "/decompressFile_1100.zip";
      let outFile = dir + "/decompressFile_1100.txt";
      let  options :zlib.Options= {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      options.pathSeparatorStrategy = zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_DEFAULT;
      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("decompressFile_1100 write data to file successfully:" + number);

        let tempCompressedFile = dir + "/temp_decompressFile_1100.zip";
        zlib.compressFile(inFile, tempCompressedFile, options, (err, data) => {
          if (err) {
            console.info("decompressFile_1100 compress err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.info("decompressFile_1100 compress data: " + data);
            zlib.decompressFile(tempCompressedFile, outFile, options, (err, data) => {
              if (err) {
                console.info("decompressFile_1100 err: " + JSON.stringify(err));
                expect().assertFail();
                done();
              } else {
                console.info("decompressFile_1100 data: " + data);
                fs.stat(outFile).then((stat) => {
                  expect(stat.isFile()).assertTrue();
                  expect(stat.size > 0).assertTrue();
                  done();
                }).catch((err:BusinessError) => {
                  console.info("decompressFile_1100 stat err: " + JSON.stringify(err));
                  expect().assertFail();
                  done();
                });
              }
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("decompressFile_1100 write err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFile_1100 end==================");
    })

    /**
     * @tc.name   decompressFilePromise_1200
     * @tc.number decompressFilePromise_1200
     * @tc.desc   decompressFile Promise level COMPRESS_LEVEL_BEST_SPEED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFilePromise_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) =>  {
      console.info("==================decompressFilePromise_1200 start==================");
      let inFile = dir + "/decompressFilePromise_1200.zip";
      let outFile = dir + "/decompressFilePromise_1200.txt";
      let  options :zlib.Options= {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED;
      let tempCompressedFile = dir + "/temp_decompressFilePromise_1200.zip";
      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("decompressFilePromise_1200 write data to file successfully:" + number);
        return zlib.compressFile(inFile, tempCompressedFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1200 compress success");
        return zlib.decompressFile(tempCompressedFile, outFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1200 decompress successx");
        return fs.stat(outFile);
      }).then((stat) => {
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      }).catch((err:BusinessError) => {
        console.info("decompressFilePromise_1200 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFilePromise_1200 end==================");
    })

    /**
     * @tc.name   decompressFilePromise_1300
     * @tc.number decompressFilePromise_1300
     * @tc.desc   decompressFile Promise memLevel MEM_LEVEL_MIN test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFilePromise_1300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) =>  {
      console.info("==================decompressFilePromise_1300 start==================");
      let inFile = dir + "/decompressFilePromise_1300.zip";
      let outFile = dir + "/decompressFilePromise_1300.txt";
      let  options :zlib.Options= {};
      options.memLevel = zlib.MemLevel.MEM_LEVEL_MIN;
      let tempCompressedFile = dir + "/temp_decompressFilePromise_1300.zip";
      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("decompressFilePromise_1300 write data to file successfully:" + number);
        return zlib.compressFile(inFile, tempCompressedFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1300 compress success");
        return zlib.decompressFile(tempCompressedFile, outFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1300 decompress success");
        return fs.stat(outFile);
      }).then((stat) => {
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      }).catch((err:BusinessError) => {
        console.info("decompressFilePromise_1300 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFilePromise_1300 end==================");
    })

    /**
     * @tc.name   decompressFilePromise_1400
     * @tc.number decompressFilePromise_1400
     * @tc.desc   decompressFile Promise memLevel MEM_LEVEL_MAX test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFilePromise_1400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) =>  {
      console.info("==================decompressFilePromise_1400 start==================");
      let inFile = dir + "/decompressFilePromise_1400.zip";
      let outFile = dir + "/decompressFilePromise_1400.txt";
      let  options :zlib.Options= {};
      options.memLevel = zlib.MemLevel.MEM_LEVEL_MAX;
      let tempCompressedFile = dir + "/temp_decompressFilePromise_1400.zip";
      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("decompressFilePromise_1400 write data to file successfully:" + number);
        return zlib.compressFile(inFile, tempCompressedFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1400 compress success");
        return zlib.decompressFile(tempCompressedFile, outFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1400 decompress success");
        return fs.stat(outFile);
      }).then((stat) => {
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      }).catch((err:BusinessError) => {
        console.info("decompressFilePromise_1400 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFilePromise_1400 end==================");
    })

    /**
     * @tc.name   decompressFilePromise_1500
     * @tc.number decompressFilePromise_1500
     * @tc.desc   decompressFile Promise memLevel MEM_LEVEL_DEFAULT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFilePromise_1500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) =>  {
      console.info("==================decompressFilePromise_1500 start==================");
      let inFile = dir + "/decompressFilePromise_1500.zip";
      let outFile = dir + "/decompressFilePromise_1500.txt";
      let  options :zlib.Options= {};
      options.memLevel = zlib.MemLevel.MEM_LEVEL_DEFAULT;
      let tempCompressedFile = dir + "/temp_decompressFilePromise_1500.zip";
      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("decompressFilePromise_1500 write data to file successfully:" + number);
        return zlib.compressFile(inFile, tempCompressedFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1500 compress success");
        return zlib.decompressFile(tempCompressedFile, outFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1500 decompress success");
        return fs.stat(outFile);
      }).then((stat) => {
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      }).catch((err:BusinessError) => {
        console.info("decompressFilePromise_1500 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFilePromise_1500 end==================");
    })

    /**
     * @tc.name   decompressFilePromise_1600
     * @tc.number decompressFilePromise_1600
     * @tc.desc   decompressFile Promise strategy COMPRESS_STRATEGY_DEFAULT_STRATEGY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFilePromise_1600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) =>  {
      console.info("==================decompressFilePromise_1600 start==================");
      let inFile = dir + "/decompressFilePromise_1600.zip";
      let outFile = dir + "/decompressFilePromise_1600.txt";
      let  options :zlib.Options= {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY;
      let tempCompressedFile = dir + "/temp_decompressFilePromise_1600.zip";
      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("decompressFilePromise_1600 write data to file successfully:" + number);
        return zlib.compressFile(inFile, tempCompressedFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1600 compress success");
        return zlib.decompressFile(tempCompressedFile, outFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1600 decompress success");
        return fs.stat(outFile);
      }).then((stat) => {
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      }).catch((err:BusinessError) => {
        console.info("decompressFilePromise_1600 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFilePromise_1600 end==================");
    })

    /**
     * @tc.name   decompressFilePromise_1700
     * @tc.number decompressFilePromise_1700
     * @tc.desc   decompressFile Promise strategy COMPRESS_STRATEGY_FILTERED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFilePromise_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) =>  {
      console.info("==================decompressFilePromise_1700 start==================");
      let inFile = dir + "/decompressFilePromise_1700.zip";
      let outFile = dir + "/decompressFilePromise_1700.txt";
      let  options :zlib.Options= {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;
      let tempCompressedFile = dir + "/temp_decompressFilePromise_1700.zip";
      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("decompressFilePromise_1700 write data to file successfully:" + number);
        return zlib.compressFile(inFile, tempCompressedFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1700 compress success");
        return zlib.decompressFile(tempCompressedFile, outFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1700 decompress success");
        return fs.stat(outFile);
      }).then((stat) => {
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      }).catch((err:BusinessError) => {
        console.info("decompressFilePromise_1700 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFilePromise_1700 end==================");
    })

    /**
     * @tc.name   decompressFilePromise_1800
     * @tc.number decompressFilePromise_1800
     * @tc.desc   decompressFile Promise strategy COMPRESS_STRATEGY_HUFFMAN_ONLY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFilePromise_1800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) =>  {
      console.info("==================decompressFilePromise_1800 start==================");
      let inFile = dir + "/decompressFilePromise_1800.zip";
      let outFile = dir + "/decompressFilePromise_1800.txt";
      let  options :zlib.Options= {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_HUFFMAN_ONLY;
      let tempCompressedFile = dir + "/temp_decompressFilePromise_1800.zip";
      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("decompressFilePromise_1800 write data to file successfully:" + number);
        return zlib.compressFile(inFile, tempCompressedFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1800 compress success");
        return zlib.decompressFile(tempCompressedFile, outFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1800 decompress success");
        return fs.stat(outFile);
      }).then((stat) => {
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      }).catch((err:BusinessError) => {
        console.info("decompressFilePromise_1800 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFilePromise_1800 end==================");
    })

    /**
     * @tc.name   decompressFilePromise_1900
     * @tc.number decompressFilePromise_1900
     * @tc.desc   decompressFile Promise strategy COMPRESS_STRATEGY_RLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decompressFilePromise_1900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) =>  {
      console.info("==================decompressFilePromise_1900 start==================");
      let inFile = dir + "/decompressFilePromise_1900.zip";
      let outFile = dir + "/decompressFilePromise_1900.txt";
      let  options :zlib.Options= {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_RLE;
      let tempCompressedFile = dir + "/temp_decompressFilePromise_1900.zip";
      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("decompressFilePromise_1900 write data to file successfully:" + number);
        return zlib.compressFile(inFile, tempCompressedFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1900 compress success");
        return zlib.decompressFile(tempCompressedFile, outFile, options);
      }).then(() => {
        console.info("decompressFilePromise_1900 decompress success");
        return fs.stat(outFile);
      }).then((stat) => {
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      }).catch((err:BusinessError) => {
        console.info("decompressFilePromise_1900 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================decompressFilePromise_1900 end==================");
    })

    /**
     * @tc.name   decompressFile_2000
     * @tc.number decompressFile_2000
     * @tc.desc   decompressFile first parameter empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('decompressFile_2000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) =>  {
      console.info("==================decompressFile_2000 start==================");
      let inFile = "";
      let outFile = dir + "/decompressFile_2000.txt";
      zlib.decompressFile(inFile, outFile, (err, data) => {
        if (err) {
          console.info("decompressFile_2000 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(SRC_FILE_INVALID);
          done();
        } else {
          console.info("decompressFile_2000 data: " + data);
          expect().assertFail();
          done();
        }
      });
      console.info("==================decompressFile_2000 end==================");
    })

    /**
     * @tc.name   decompressFile_2100
     * @tc.number decompressFile_2100
     * @tc.desc   decompressFile first parameter null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('decompressFile_2100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) =>  {
      console.info("==================decompressFile_2100 start==================");
      let inFile = null;
      let outFile = dir + "/decompressFile_2100.txt";

      zlib.decompressFile(inFile, outFile, (err, data) => {
        if (err) {
          console.info("decompressFile_2100 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(PARAM_ERROR);
          done();
        } else {
          console.info("decompressFile_2100 data: " + data);
          expect().assertFail();
          done();
        }
      });
      console.info("==================decompressFile_2100 end==================");
    })

    /**
     * @tc.name   decompressFile_2200
     * @tc.number decompressFile_2200
     * @tc.desc   decompressFile first parameter undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('decompressFile_2200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) =>  {
      console.info("==================decompressFile_2200 start==================");
      let inFile = undefined;
      let outFile = dir + "/decompressFile_2200.txt";

      zlib.decompressFile(inFile, outFile, (err, data) => {
        if (err) {
          console.info("decompressFile_2200 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(PARAM_ERROR);
          done();
        } else {
          console.info("decompressFile_2200 data: " + data);
          expect().assertFail();
          done();
        }
      });
      console.info("==================decompressFile_2200 end==================");
    })
  }
