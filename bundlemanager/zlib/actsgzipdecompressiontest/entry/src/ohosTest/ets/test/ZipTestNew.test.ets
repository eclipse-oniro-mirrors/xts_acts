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
import fs from '@ohos.file.fs';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { BusinessError } from '@kit.BasicServicesKit';


let infos = "";
let SRC_FILE_INVALID = 900001;
let OUTPUT_FILE_INVALID = 900002;
let INPUT_FILE_NOT_ZIP = 900003;
let PARAM_ERROR = 401;
const context = AppStorage.get("context") as Context;
let dir =  context.cacheDir
export default function ZiptestnewTest() {
  describe('ZiptestnewTest', ()=> {
    beforeEach(async (done:Function) => {
      let objectone = "com.example.amsZipfileUnzipfileST.MainAbility/com.example.amsZipfileUnzipfileST/";
      let objecttwo = "com.example.amsZipfileUnzipfileST.MainAbility/com.example.amsZipfileUnzipfileST/zipunzip";
      let  objectthree = "com.example.amsZipfileUnzipfileST.MainAbility/ActsZlibTest/example.amsZipfileUnzipfileST";
      infos = dir + objectone + objecttwo + objectthree;
      done();
    });

    /**
     * @tc.name   compressFile_0100
     * @tc.number compressFile_0100
     * @tc.desc   compressFile first parameter empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFile_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) =>{
      console.info("==================compressFile_0100 start==================");
      let  inFile = "";
      let  outFile = dir + "/compressFile_0100.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;

      zlib.compressFile(inFile, outFile, options, (err, data) => {
        if (err) {
          console.info("compressFile_0100 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(SRC_FILE_INVALID);
          done();
        } else {
          console.info("compressFile_0100 data: " + data);
          expect().assertFail();
          done();
        }
      });
      console.info("==================compressFile_0100 end==================");
    })

    /**
     * @tc.name   compressFile_0200
     * @tc.number compressFile_0200
     * @tc.desc   compressFile first parameter null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFile_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFile_0200 start==================");
      let inFile = null;
      let outFile = dir + "/compressFile_0200.zip";
      let  options :zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      try {
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_0200 err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.info("compressFile_0200 data: " + data);
            expect().assertFail();
            done();
          }
        });

      }  catch (e) {
        console.info("compressFile_0200 errx: " + JSON.stringify(e));
        expect(e.code).assertEqual(PARAM_ERROR);
        done();
      }

    })

    /**
     * @tc.name   compressFile_0300
     * @tc.number compressFile_0300
     * @tc.desc   compressFile first parameter undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFile_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFile_0300 start==================");
      let inFile = undefined;
      let outFile = dir + "/compressFile_0300.zip";
      let  options :zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      try {
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_0300 err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.info("compressFile_0300 data: " + data);
            expect().assertFail();
            done();
          }
        });
      } catch (e) {
        console.info("compressFile_0300 errx: " + JSON.stringify(e));
        expect(e.code).assertEqual(PARAM_ERROR);
        done();
      }

      console.info("==================compressFile_0300 end==================");
    })

    /**
     * @tc.name   compressFile_0400
     * @tc.number compressFile_0400
     * @tc.desc   compressFile second parameter empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFile_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFile_0400 start==================");
      let inFile = dir + "/compressFile_0400.txt";
      let  outFile = "";
      let  options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      console.info("==================compressFile_0400 start==================" + inFile);
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then((number)=> {
        console.info("compressFile_0400 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_0400 err: " + JSON.stringify(err));
            expect(err.code).assertEqual(OUTPUT_FILE_INVALID);
            done();
          } else {
            console.info("compressFile_0400 data: " + data);
            expect().assertFail();
            done();
          }
        });
      }).catch((err:BusinessError)=> {
        console.info("compressFile_0400 write data to file failed with error:" +  JSON.stringify(err));
        expect().assertFail();
        done();
      })
      console.info("==================compressFile_0400 end==================");
    })

    /**
     * @tc.name   compressFile_0500
     * @tc.number compressFile_0500
     * @tc.desc   compressFile second parameter null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFile_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFile_0500 startxx==================");
      let  inFile = dir + "/compressFile_0500.txt";
      let  outFile = null;
      let  options :zlib.Options= {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;


      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then((number)=> {
        console.info("compressFile_0500 write datax to file successfully:" + number);
        try {
          zlib.compressFile(inFile, outFile, options, (err, data) => {
            if (err) {
              console.info("compressFile_0500 err: " + JSON.stringify(err));
              expect().assertFail()
              done();
            } else {
              console.info("compressFile_0500 data: " + data);
              expect().assertFail();
              done();
            }
          });
        }catch (e) {
          console.info("compressFile_0500 err: " + JSON.stringify(e));
          expect(e.code).assertEqual(PARAM_ERROR);
          done();
        }

      }).catch((err:BusinessError)=> {
        console.info("compressFile_0500 write data to file failed with error:" + err);
        expect().assertFail();
        done();
      });




      console.info("==================compressFile_0500 end==================");
    })

    /**
     * @tc.name   compressFile_0600
     * @tc.number compressFile_0600
     * @tc.desc   compressFile second parameter undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFile_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFile_0600 start==================");

      let  inFile = dir + "/compressFile_0600.txt";
      let  outFile = null;
      let  options :zlib.Options= {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        fs.write(file.fd, infos).then((number)=> {
          console.info("compressFile_0600 write data to file successfully:" + number);
          try {
            zlib.compressFile(inFile, outFile, options, (err, data) => {
              if (err) {
                console.info("compressFile_0600 err: " + JSON.stringify(err));
                expect().assertFail();
                done();
              } else {
                console.info("compressFile_0600 data: " + data);
                expect().assertFail();
                done();
              }
            });
          } catch (e) {
            console.info("compressFile_0600 errx: " + JSON.stringify(e));
            expect(e.code).assertEqual(PARAM_ERROR);
            done();
          }

        }).catch((err:BusinessError)=> {
          console.info("compressFile_0600 write data to file failed with error:" + err);
          expect(err).assertFail();
          done();
        });


      console.info("==================compressFile_0600 end==================");
    })

    /**
     * @tc.name   compressFile_0700
     * @tc.number compressFile_0700
     * @tc.desc   compressFile third parameter null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFile_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function)=>{
      console.info("==================compressFile_0700 start==================");
      let inFile = dir + "/compressFile_0700.txt";
      let  outFile = dir + "/compressFile_0700.zip";

      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

        fs.write(file.fd, infos).then((number)=> {
          console.info("compressFile_0700 write data to file successfully:" + number);
          try {
            zlib.compressFile(inFile, outFile, null, (err, data) => {
              if (err) {
                console.info("compressFile_0700 err: " + JSON.stringify(err));
                expect().assertFail()
                done();
              } else {
                console.info("compressFile_0700 data: " + data);
                expect().assertFail();
                done();
              }
            });

          } catch (e) {
            console.info("compressFile_0700 errx: " + JSON.stringify(e));
            expect(e.code).assertEqual(PARAM_ERROR);
            done();
          }

        }).catch((err:BusinessError)=>  {
          console.info("compressFile_0700 write data to file failed with error:" + err);
          expect().assertFail();
          done();
        });



      console.info("==================compressFile_0700 end==================");
    })

    /**
     * @tc.name   compressFile_0800
     * @tc.number compressFile_0800
     * @tc.desc   compressFile third parameter undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFile_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function)=> {
      console.info("==================compressFile_0800 start==================");
      let inFile = dir + "/compressFile_0800.txt";
      let outFile = dir + "/compressFile_0800.zip";
      let file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        fs.write(file.fd, infos).then((number) => {
          console.info("compressFile_0800 write data to file successfully:" + number);
          try {
            zlib.compressFile(inFile, outFile, undefined, (err, data) => {
              if (err) {
                console.info("compressFile_0800 err: " + JSON.stringify(err));
                expect().assertFail();
                done();
              } else {
                console.info("compressFile_0800 data: " + data);
                expect().assertFail();
                done();
              }
            });
          } catch (e) {
            console.info("compressFile_0800 errx: " + JSON.stringify(e));
            expect(e.code).assertEqual(PARAM_ERROR);
            done();
          }

        }).catch((err: BusinessError) => {
          console.info("compressFile_0800 write data to file failed with error:" + err);
          expect(err).assertFail();
          done();
        });

      console.info("==================compressFile_0800 end==================");
    })


    /**
     * @tc.name   compressFile_1100
     * @tc.number compressFile_1100
     * @tc.desc   compressFile normal test with valid parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFile_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function)=> {
      console.info("==================compressFile_1100 start==================");
      let inFile = dir + "/compressFile_1100.txt";
      let  outFile = dir + "/compressFile_1100.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then((number) =>{
        console.info("compressFile_1100 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_1100 err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.info("compressFile_1100  success data: ");
            fs.stat(outFile).then((stat) => {
              expect(stat.isFile()).assertTrue();
              expect(stat.size > 0).assertTrue();
              done();
            }).catch((err:BusinessError) => {
              console.info("compressFile_1100 stat err: " + JSON.stringify(err));
              expect().assertFail();
              done();
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("compressFile_1100 write data to file failed with error:" +  JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================compressFile_1100 end==================");
    })

    /**
     * @tc.name   compressFile_1200
     * @tc.number compressFile_1200
     * @tc.desc   compressFile level COMPRESS_LEVEL_BEST_SPEED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFile_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function)=>  {
      console.info("==================compressFile_1200 start==================");
      let inFile = dir + "/compressFile_1200.txt";
      let outFile = dir + "/compressFile_1200.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then((number)=> {
        console.info("compressFile_1200 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_1200 err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.info("compressFile_1200 data: success");
            fs.stat(outFile).then((stat) => {
              expect(stat.isFile()).assertTrue();
              expect(stat.size > 0).assertTrue();
              done();
            }).catch((err:BusinessError) => {
              console.info("compressFile_1200 stat err: " + err);
              expect().assertFail();
              done();
            });
          }
        });
      }).catch((err:BusinessError) =>{
        console.info("compressFile_1200 write data to file failed with error:" + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================compressFile_1200 end==================");
    })

    /**
     * @tc.name   compressFile_1300
     * @tc.number compressFile_1300
     * @tc.desc   compressFile level COMPRESS_LEVEL_BEST_COMPRESSION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFile_1300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function)=>  {
      console.info("==================compressFile_1300 start==================");
      let inFile = dir + "/compressFile_1300.txt";
      let outFile = dir + "/compressFile_1300.zip";
      let  options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then((number)=> {
        console.info("compressFile_1300 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_1300 err: " + JSON.stringify(err));
            expect(err).assertFail();
            done();
          } else {
            console.info("compressFile_1300 data: success " );
            fs.stat(outFile).then((stat) => {
              expect(stat.isFile()).assertTrue();
              expect(stat.size > 0).assertTrue();
              done();
            }).catch((err:BusinessError) => {
              console.info("compressFile_1300 stat err: " + JSON.stringify(err));
              expect().assertFail();
              done();
            });
          }
        });
      }).catch((err:BusinessError) =>  {
        console.info("compressFile_1300 write data to file failed with error:" + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================compressFile_1300 end==================");
    })

    /**
     * @tc.name   compressFile_1400
     * @tc.number compressFile_1400
     * @tc.desc   compressFile memLevel MEM_LEVEL_MIN test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFile_1400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function)=> {
      console.info("==================compressFile_1400 start==================");
      let inFile = dir + "/compressFile_1400.txt";
      let  outFile = dir + "/compressFile_1400.zip";
      let options:zlib.Options = {};
      options.memLevel = zlib.MemLevel.MEM_LEVEL_MIN;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number=> {
        console.info("compressFile_1400 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_1400 err: " + JSON.stringify(err));
            expect(err).assertFail();
            done();
          } else {
            console.info("compressFile_1400 data: " + data);
            fs.stat(outFile).then((stat) => {
              expect(stat.isFile()).assertTrue();
              expect(stat.size > 0).assertTrue();
              done();
            }).catch((err:BusinessError) => {
              console.info("compressFile_1400 stat err: " + JSON.stringify(err));
              expect().assertFail();
              done();
            });
          }
        });
      }).catch((err:BusinessError)=> {
        console.info("compressFile_1400 write data to file failed with error:" + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================compressFile_1400 end==================");
    })

    /**
     * @tc.name   compressFile_1500
     * @tc.number compressFile_1500
     * @tc.desc   compressFile memLevel MEM_LEVEL_MAX test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFile_1500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function)=> {
      console.info("==================compressFile_1500 start==================");
      let inFile = dir + "/compressFile_1500.txt";
      let  outFile = dir + "/compressFile_1500.zip";
      let options:zlib.Options = {};
      options.memLevel = zlib.MemLevel.MEM_LEVEL_MAX;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number=> {
        console.info("compressFile_1500 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_1500 err: " + JSON.stringify(err));
            expect(err).assertFail();
            done();
          } else {
            console.info("compressFile_1500 data: " + data);
            fs.stat(outFile).then((stat) => {
              expect(stat.isFile()).assertTrue();
              expect(stat.size > 0).assertTrue();
              done();
            }).catch((err:BusinessError) =>{
              console.info("compressFile_1500 stat err: " + JSON.stringify(err));
              expect().assertFail();
              done();
            });
          }
        });
      }).catch((err:BusinessError) =>{
        console.info("compressFile_1500 write data to file failed with error:" + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================compressFile_1500 end==================");
    })

    /**
     * @tc.name   compressFile_1600
     * @tc.number compressFile_1600
     * @tc.desc   compressFile memLevel MEM_LEVEL_DEFAULT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFile_1600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function)=>  {
      console.info("==================compressFile_1600 start==================");
      let  inFile = dir + "/compressFile_1600.txt";
      let  outFile = dir + "/compressFile_1600.zip";
      let  options:zlib.Options = {};
      options.memLevel = zlib.MemLevel.MEM_LEVEL_DEFAULT;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then((number)=> {
        console.info("compressFile_1600 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_1600 err: " + JSON.stringify(err));
            expect(err).assertFail();
            done();
          } else {
            console.info("compressFile_1600 data: " + data);
            fs.stat(outFile).then((stat) => {
              expect(stat.isFile()).assertTrue();
              expect(stat.size > 0).assertTrue();
              done();
            }).catch((err:BusinessError) => {
              console.info("compressFile_1600 stat err: " + JSON.stringify(err));
              expect().assertFail();
              done();
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("compressFile_1600 write data to file failed with error:" + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================compressFile_1600 end==================");
    })

    /**
     * @tc.name   compressFile_1700
     * @tc.number compressFile_1700
     * @tc.desc   compressFile strategy COMPRESS_STRATEGY_DEFAULT_STRATEGY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFile_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function)=>  {
      console.info("==================compressFile_1700 start==================");
      let inFile = dir + "/compressFile_1700.txt";
      let outFile = dir + "/compressFile_1700.zip";
      let options:zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then((number)=> {
        console.info("compressFile_1700 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_1700 err: " + JSON.stringify(err));
            expect(err).assertFail();
            done();
          } else {
            console.info("compressFile_1700 data: " + data);
            fs.stat(outFile).then((stat) => {
              expect(stat.isFile()).assertTrue();
              expect(stat.size > 0).assertTrue();
              done();
            }).catch((err:BusinessError) => {
              console.info("compressFile_1700 stat err: " + JSON.stringify(err));
              expect().assertFail();
              done();
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("compressFile_1700 write data to file failed with error:" + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================compressFile_1700 end==================");
    })

    /**
     * @tc.name   compressFile_1800
     * @tc.number compressFile_1800
     * @tc.desc   compressFile strategy COMPRESS_STRATEGY_FILTERED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFile_1800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function)=>  {
      console.info("==================compressFile_1800 start==================");
      let inFile = dir + "/compressFile_1800.txt";
      let outFile = dir + "/compressFile_1800.zip";
      let options:zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then((number)=> {
        console.info("compressFile_1800 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_1800 err: " + JSON.stringify(err));
            expect(err).assertFail();
            done();
          } else {
            console.info("compressFile_1800 data: " + data);
            fs.stat(outFile).then((stat) => {
              expect(stat.isFile()).assertTrue();
              expect(stat.size > 0).assertTrue();
              done();
            }).catch((err:BusinessError) => {
              console.info("compressFile_1800 stat err: " + JSON.stringify(err));
              expect().assertFail();
              done();
            });
          }
        });
      }).catch((err:BusinessError) =>{
        console.info("compressFile_1800 write data to file failed with error:" + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("==================compressFile_1800 end==================");
    })

    /**
     * @tc.name   compressFile_1900
     * @tc.number compressFile_1900
     * @tc.desc   compressFile strategy COMPRESS_STRATEGY_HUFFMAN_ONLY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFile_1900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function)=> {
      console.info("==================compressFile_1900 start==================");
      let inFile = dir + "/compressFile_1900.txt";
      let outFile = dir + "/compressFile_1900.zip";
      let options:zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_HUFFMAN_ONLY;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then((number)=> {
        console.info("compressFile_1900 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_1900 err: " + JSON.stringify(err));
            expect(err).assertFail();
            done();
          } else {
            console.info("compressFile_1900 data: " + data);
            fs.stat(outFile).then((stat) => {
              expect(stat.isFile()).assertTrue();
              expect(stat.size > 0).assertTrue();
              done();
            }).catch((err:BusinessError) => {
              console.info("compressFile_1900 stat err: " + err);
              expect().assertFail();
              done();
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("compressFile_1900 write data to file failed with error:" + err);
        expect().assertFail();
        done();
      });
      console.info("==================compressFile_1900 end==================");
    })

    /**
     * @tc.name   compressFile_2000
     * @tc.number compressFile_2000
     * @tc.desc   compressFile strategy COMPRESS_STRATEGY_RLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFile_2000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function)=> {
      console.info("==================compressFile_2000 start==================");
      let inFile = dir + "/compressFile_2000.txt";
      let  outFile = dir + "/compressFile_2000.zip";
      let options:zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_RLE;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then((number)=> {
        console.info("compressFile_2000 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_2000 err: " + JSON.stringify(err));
            expect(err).assertFail();
            done();
          } else {
            console.info("compressFile_2000 data: " + data);
            fs.stat(outFile).then((stat) => {
              expect(stat.isFile()).assertTrue();
              expect(stat.size > 0).assertTrue();
              done();
            }).catch((err:BusinessError) => {
              console.info("compressFile_2000 stat err: " + err);
              expect().assertFail();
              done();
            });
          }
        });
      }).catch((err:BusinessError) =>{
        console.info("compressFile_2000 write data to file failed with error:" + err);
        expect().assertFail();
        done();
      });
      console.info("==================compressFile_2000 end==================");
    })

    /**
     * @tc.name   compressFile_2100
     * @tc.number compressFile_2100
     * @tc.desc   compressFile strategy COMPRESS_STRATEGY_FIXED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFile_2100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function)=> {
      console.info("==================compressFile_2100 start==================");
      let inFile = dir + "/compressFile_2100.txt";
      let outFile = dir + "/compressFile_2100.zip";
      let options:zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number => {
        console.info("compressFile_2100 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_2100 err: " + JSON.stringify(err));
            expect(err).assertFail();
            done();
          } else {
            console.info("compressFile_2100 data: " + data);
            fs.stat(outFile).then((stat) => {
              expect(stat.isFile()).assertTrue();
              expect(stat.size > 0).assertTrue();
              done();
            }).catch((err:BusinessError) => {
              console.info("compressFile_2100 stat err: " + err);
              expect().assertFail();
              done();
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("compressFile_2100 write data to file failed with error:" + err);
        expect().assertFail();
        done();
      });
      console.info("==================compressFile_2100 end==================");
    })

    /**
     * @tc.name   compressFile_2200
     * @tc.number compressFile_2200
     * @tc.desc   compressFile parallel PARALLEL_STRATEGY_SEQUENTIAL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFile_2200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,  async (done:Function)=> {
      console.info("==================compressFile_2200 start==================");
      let inFile = dir + "/compressFile_2200.txt";
      let outFile = dir + "/compressFile_2200.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      options.parallel = zlib.ParallelStrategy.PARALLEL_STRATEGY_SEQUENTIAL;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number=> {
        console.info("compressFile_2200 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_2200 err: " + JSON.stringify(err));
            expect(err).assertFail();
            done();
          } else {
            console.info("compressFile_2200 data: " + data);
            fs.stat(outFile).then((stat) => {
              expect(stat.isFile()).assertTrue();
              expect(stat.size > 0).assertTrue();
              done();
            }).catch((err:BusinessError) => {
              console.info("compressFile_2200 stat err: " + err);
              expect().assertFail();
              done();
            });
          }
        });
      }).catch((err:BusinessError) =>  {
        console.info("compressFile_2200 write data to file failed with error:" + err);
        expect().assertFail();
        done();
      });
      console.info("==================compressFile_2200 end==================");
    })

    /**
     * @tc.name   compressFile_2300
     * @tc.number compressFile_2300
     * @tc.desc   compressFile parallel PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFile_2300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function)=> {
      console.info("==================compressFile_2300 start==================");
      let inFile = dir + "/compressFile_2300.txt";
      let outFile = dir + "/compressFile_2300.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      options.parallel = zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then(number=> {
        console.info("compressFile_2300 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_2300 err: " + JSON.stringify(err));
            expect(err).assertFail();
            done();
          } else {
            console.info("compressFile_2300 data: " + data);
            fs.stat(outFile).then((stat) => {
              expect(stat.isFile()).assertTrue();
              expect(stat.size > 0).assertTrue();
              done();
            }).catch((err:BusinessError) => {
              console.info("compressFile_2300 stat err: " + err);
              expect().assertFail();
              done();
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("compressFile_2300 write data to file failed with error:" + err);
        expect().assertFail();
        done();
      });
      console.info("==================compressFile_2300 end==================");
    })


    /**
     * @tc.name   compressFile_2400
     * @tc.number compressFile_2400
     * @tc.desc   compressFile pathSeparatorStrategy PATH_SEPARATOR_STRATEGY_DEFAULT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFile_2400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function)=> {
      console.info("==================compressFile_2400 start==================");
      let inFile = dir + "/compressFile_2400.txt";
      let outFile = dir + "/compressFile_2400.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      options.pathSeparatorStrategy = zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_DEFAULT;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then((number)=> {
        console.info("compressFile_2400 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_2400 err: " + JSON.stringify(err));
            expect(err).assertFail();
            done();
          } else {
            console.info("compressFile_2400 data: " + data);
            fs.stat(outFile).then((stat) => {
              expect(stat.isFile()).assertTrue();
              expect(stat.size > 0).assertTrue();
              done();
            }).catch((err:BusinessError) => {
              console.info("compressFile_2400 stat err: " + err);
              expect().assertFail();
              done();
            });
          }
        });
      }).catch((err:BusinessError) =>{
        console.info("compressFile_2400 write data to file failed with error:" + err);
        expect().assertFail();
        done();
      });
      console.info("==================compressFile_2400 end==================");
    })

    /**
     * @tc.name   compressFile_2500
     * @tc.number compressFile_2500
     * @tc.desc   compressFile pathSeparatorStrategy PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFile_2500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function)=> {
      console.info("==================compressFile_2500 start==================");
      let inFile = dir + "/compressFile_2500.txt";
      let outFile = dir + "/compressFile_2500.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      options.pathSeparatorStrategy = zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH;
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.write(file.fd, infos).then((number)=> {
        console.info("compressFile_2500 write data to file successfully:" + number);
        zlib.compressFile(inFile, outFile, options, (err, data) => {
          if (err) {
            console.info("compressFile_2500 err: " + JSON.stringify(err));
            expect(err).assertFail();
            done();
          } else {
            console.info("compressFile_2500 data: " + data);
            fs.stat(outFile).then((stat) => {
              expect(stat.isFile()).assertTrue();
              expect(stat.size > 0).assertTrue();
              done();
            }).catch((err:BusinessError) => {
              console.info("compressFile_2500 stat err: " + err);
              expect().assertFail();
              done();
            });
          }
        });
      }).catch((err:BusinessError) => {
        console.info("compressFile_2500 write data to file failed with error:" + err);
        expect().assertFail();
        done();
      });
      console.info("==================compressFile_2500 end==================");
    })
  })
}