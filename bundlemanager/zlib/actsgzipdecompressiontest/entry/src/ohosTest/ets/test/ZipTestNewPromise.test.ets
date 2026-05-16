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
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

let infos = "";
let SRC_FILE_INVALID = 900001;
let OUTPUT_FILE_INVALID = 900002;
let INPUT_FILE_NOT_ZIP = 900003;
let PARAM_ERROR = 401;
const context = AppStorage.get("context") as Context;
let dir = context.cacheDir
export default function ZiptestnewPromiseTest() {
  describe('ZiptestnewPromiseTest',  ()=> {
    beforeEach(async (done:Function) => {
      let objectone = "com.example.amsZipfileUnzipfileST.MainAbility/com.example.amsZipfileUnzipfileST/";
      let objecttwo = "com.example.amsZipfileUnzipfileST.MainAbility/com.example.amsZipfileUnzipfileST/zipunzip";
      let objectthree = "com.example.amsZipfileUnzipfileST.MainAbility/ActsZlibTest/example.amsZipfileUnzipfileST";
      infos = dir + objectone + objecttwo + objectthree;
      done();

    });

    /**
     * @tc.name   compressFilePromise_0100
     * @tc.number compressFilePromise_0100
     * @tc.desc   compressFile Promise first parameter empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0100 start==================");
      let inFile = "";
      let outFile = dir + "/compressFilePromise_0100.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;

      try {
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0100 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(SRC_FILE_INVALID);
        done();
      }
      console.info("==================compressFilePromise_0100 end==================");
    })

    /**
     * @tc.name   compressFilePromiseEmpty_0100
     * @tc.number compressFilePromiseEmpty_0100
     * @tc.desc   compressFile Promise two parameter empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromiseEmpty_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromiseEmpty_0100 start==================");
      let inFile = dir + "/ompressFilePromiseEmpty_0100.txt";
      let outFile = ""
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      try {
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromiseEmpty_0100 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(OUTPUT_FILE_INVALID);
        done();
      }
      console.info("==================compressFilePromiseEmpty_0100 end==================");
    })

    /**
     * @tc.name   compressFilePromise_0200
     * @tc.number compressFilePromise_0200
     * @tc.desc   compressFile Promise first parameter null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0200 start==================");
      let inFile = null;
      let outFile = dir + "/compressFilePromise_0200.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;

      try {
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0200 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR);
        done();
      }
      console.info("==================compressFilePromise_0200 end==================");
    })

    /**
     * @tc.name   compressFilePromise_0300
     * @tc.number compressFilePromise_0300
     * @tc.desc   compressFile Promise first parameter undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0300 start==================");
      let inFile = undefined;
      let outFile = dir + "/compressFilePromise_0300.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;

      try {
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0300 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR);
        done();
      }
      console.info("==================compressFilePromise_0300 end==================");
    })

    /**
     * @tc.name   compressFilePromise_0310
     * @tc.number compressFilePromise_0310
     * @tc.desc   compressFile Promise first parameter empty string with level BEST_SPEED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0310', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0310 start==================");
      let inFile = "";
      let outFile = dir + "/compressFilePromise_0310.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED;

      try {
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0310 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(SRC_FILE_INVALID);
        done();
      }
      console.info("==================compressFilePromise_0310 end==================");
    })

    /**
     * @tc.name   compressFilePromise_0320
     * @tc.number compressFilePromise_0320
     * @tc.desc   compressFile Promise first parameter empty string with level BEST_COMPRESSION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0320', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0320 start==================");
      let inFile = "";
      let outFile = dir + "/compressFilePromise_0320.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION;

      try {
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0320 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(SRC_FILE_INVALID);
        done();
      }
      console.info("==================compressFilePromise_0320 end==================");
    })

    /**
     * @tc.name   compressFilePromise_0330
     * @tc.number compressFilePromise_0330
     * @tc.desc   compressFile Promise first parameter empty string with memLevel MEM_LEVEL_MIN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0330', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0330 start==================");
      let inFile = "";
      let outFile = dir + "/compressFilePromise_0330.zip";
      let options:zlib.Options = {};
      options.memLevel = zlib.MemLevel.MEM_LEVEL_MIN;

      try {
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0330 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(SRC_FILE_INVALID);
        done();
      }
      console.info("==================compressFilePromise_0330 end==================");
    })

    /**
     * @tc.name   compressFilePromise_0340
     * @tc.number compressFilePromise_0340
     * @tc.desc   compressFile Promise first parameter empty string with memLevel MEM_LEVEL_MAX.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0340', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0340 start==================");
      let inFile = "";
      let outFile = dir + "/compressFilePromise_0340.zip";
      let options:zlib.Options = {};
      options.memLevel = zlib.MemLevel.MEM_LEVEL_MAX;

      try {
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0340 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(SRC_FILE_INVALID);
        done();
      }
      console.info("==================compressFilePromise_0340 end==================");
    })

    /**
     * @tc.name   compressFilePromise_0350
     * @tc.number compressFilePromise_0350
     * @tc.desc   compressFile Promise first parameter empty string with strategy FILTERED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0350', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0350 start==================");
      let inFile = "";
      let outFile = dir + "/compressFilePromise_0350.zip";
      let options:zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;

      try {
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0350 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(SRC_FILE_INVALID);
        done();
      }
      console.info("==================compressFilePromise_0350 end==================");
    })

    /**
     * @tc.name   compressFilePromise_0360
     * @tc.number compressFilePromise_0360
     * @tc.desc   compressFile Promise first parameter empty string with strategy HUFFMAN_ONLY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0360', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0360 start==================");
      let inFile = "";
      let outFile = dir + "/compressFilePromise_0360.zip";
      let options:zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_HUFFMAN_ONLY;

      try {
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0360 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(SRC_FILE_INVALID);
        done();
      }
      console.info("==================compressFilePromise_0360 end==================");
    })

    /**
     * @tc.name   compressFilePromise_0370
     * @tc.number compressFilePromise_0370
     * @tc.desc   compressFile Promise first parameter empty string with strategy RLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0370', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0370 start==================");
      let inFile = "";
      let outFile = dir + "/compressFilePromise_0370.zip";
      let options:zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_RLE;

      try {
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0370 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(SRC_FILE_INVALID);
        done();
      }
      console.info("==================compressFilePromise_0370 end==================");
    })

    /**
     * @tc.name   compressFilePromise_0380
     * @tc.number compressFilePromise_0380
     * @tc.desc   compressFile Promise first parameter empty string with strategy FIXED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0380', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0380 start==================");
      let inFile = "";
      let outFile = dir + "/compressFilePromise_0380.zip";
      let options:zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED;

      try {
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0380 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(SRC_FILE_INVALID);
        done();
      }
      console.info("==================compressFilePromise_0380 end==================");
    })

    /**
     * @tc.name   compressFilePromise_0390
     * @tc.number compressFilePromise_0390
     * @tc.desc   compressFile Promise first parameter empty string with parallel SEQUENTIAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0390', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0390 start==================");
      let inFile = "";
      let outFile = dir + "/compressFilePromise_0390.zip";
      let options:zlib.Options = {};
      options.parallel = zlib.ParallelStrategy.PARALLEL_STRATEGY_SEQUENTIAL;

      try {
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0390 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(SRC_FILE_INVALID);
        done();
      }
      console.info("==================compressFilePromise_0390 end==================");
    })

    /**
     * @tc.name   compressFilePromise_0400
     * @tc.number compressFilePromise_0400
     * @tc.desc   compressFile Promise second parameter empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0400 start==================");
      let inFile = dir + "/compressFilePromise_0500x.txt";
      let outFile = "";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;

      // Create source file
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(file.fd, infos);
        console.info("compressFilePromise_0400 write data to file successfully");
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0400 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(OUTPUT_FILE_INVALID);
        done();
      }
      console.info("==================compressFilePromise_0400 end==================");
    })

    /**
     * @tc.name   compressFilePromise_0500
     * @tc.number compressFilePromise_0500
     * @tc.desc   compressFile Promise second parameter null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0500 start==================");
      let inFile = dir + "/compressFilePromise_0500.txt";
      let outFile = null;
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;

      // Create source file
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(file.fd, infos);
        console.info("compressFilePromise_0500 write data to file successfully");
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0500 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR);
        done();
      }
      console.info("==================compressFilePromise_0500 end==================");
    })

    /**
     * @tc.name   compressFilePromise_0600
     * @tc.number compressFilePromise_0600
     * @tc.desc   compressFile Promise second parameter undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0600 start==================");
      let inFile = dir + "/compressFilePromise_0600.txt";
      let outFile = undefined;
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;

      // Create source file
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(file.fd, infos);
        console.info("compressFilePromise_0600 write data to file successfully");
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0600 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR);
        done();
      }
      console.info("==================compressFilePromise_0600 end==================");
    })


    /**
     * @tc.name   compressFilePromise_0700
     * @tc.number compressFilePromise_0700
     * @tc.desc   compressFile Promise third parameter null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0700 start==================");
      let inFile = dir + "/compressFilePromise_0700.txt";
      let outFile = dir + "/compressFilePromise_0700.zip";
      let options = null;

      // Create source file
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(file.fd, infos);
        console.info("compressFilePromise_0700 write data to file successfully");
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0700 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR);
        done();
      }
      console.info("==================compressFilePromise_0700 end==================");
    })

    /**
     * @tc.name   compressFilePromise_0800
     * @tc.number compressFilePromise_0800
     * @tc.desc   compressFile Promise third parameter undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('compressFilePromise_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done:Function) => {
      console.info("==================compressFilePromise_0800 start==================");
      let inFile = dir + "/compressFilePromise_0800.txt";
      let outFile = dir + "/compressFilePromise_0800.zip";
      let options = undefined;

      // Create source file
      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(file.fd, infos);
        console.info("compressFilePromise_0800 write data to file successfully");
        await zlib.compressFile(inFile, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFilePromise_0800 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR);
        done();
      }
      console.info("==================compressFilePromise_0800 end==================");
    })


    /**
     * @tc.name   compressFilePromise_0900
     * @tc.number compressFilePromise_0900
     * @tc.desc   compressFile Promise memLevel MEM_LEVEL_MIN test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFilePromise_0900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      console.info("==================compressFilePromise_0900 start==================");
      let inFile = dir + "/compressFilePromise_0900.txt";
      let outFile = dir + "/compressFilePromise_0900.zip";
      let options:zlib.Options = {};
      options.memLevel = zlib.MemLevel.MEM_LEVEL_MIN;

      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        const number = await fs.write(file.fd, infos);
        console.info("compressFilePromise_0900 write data to file successfully:" + number);
        await zlib.compressFile(inFile, outFile, options);
        console.info("compressFilePromise_0900 compressFile success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFilePromise_0900 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFilePromise_0900 end==================");
    })

    /**
     * @tc.name   compressFilePromise_1000
     * @tc.number compressFilePromise_1000
     * @tc.desc   compressFile Promise memLevel MEM_LEVEL_MAX test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFilePromise_1000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      console.info("==================compressFilePromise_1000 start==================");
      let inFile = dir + "/compressFilePromise_1000.txt";
      let outFile = dir + "/compressFilePromise_1000.zip";
      let options:zlib.Options = {};
      options.memLevel = zlib.MemLevel.MEM_LEVEL_MAX;

      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        const number = await fs.write(file.fd, infos);
        console.info("compressFilePromise_1000 write data to file successfully:" + number);
        await zlib.compressFile(inFile, outFile, options);
        console.info("compressFilePromise_1000 compressFile success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFilePromise_1000 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFilePromise_1000 end==================");
    })


    /**
     * @tc.name   compressFilePromise_1100
     * @tc.number compressFilePromise_1100
     * @tc.desc   compressFile Promise strategy COMPRESS_STRATEGY_FILTERED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFilePromise_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      console.info("==================compressFilePromise_1100 start==================");
      let inFile = dir + "/compressFilePromise_1100.txt";
      let outFile = dir + "/compressFilePromise_1100.zip";
      let options:zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;

      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(file.fd, infos);
        const number = await fs.write(file.fd, infos);
        console.info("compressFilePromise_1100 write data to file successfully:" + number);
        await zlib.compressFile(inFile, outFile, options);
        console.info("compressFilePromise_1100 compressFile success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFilePromise_1100 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFilePromise_1100 end==================");
    })

    /**
     * @tc.name   compressFilePromise_1200
     * @tc.number compressFilePromise_1200
     * @tc.desc   compressFile Promise strategy COMPRESS_STRATEGY_HUFFMAN_ONLY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFilePromise_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      console.info("==================compressFilePromise_1200 start==================");
      let inFile = dir + "/compressFilePromise_1200.txt";
      let outFile = dir + "/compressFilePromise_1200.zip";
      let options:zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_HUFFMAN_ONLY;

      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(file.fd, infos);
        const number = await fs.write(file.fd, infos);
        console.info("compressFilePromise_1200 write data to file successfully:" + number);
        await zlib.compressFile(inFile, outFile, options);
        console.info("compressFilePromise_1200 compressFile success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFilePromise_1200 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFilePromise_1200 end==================");
    })

    /**
     * @tc.name   compressFilePromise_1300
     * @tc.number compressFilePromise_1300
     * @tc.desc   compressFile Promise strategy COMPRESS_STRATEGY_RLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFilePromise_1300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      console.info("==================compressFilePromise_1300 start==================");
      let inFile = dir + "/compressFilePromise_1300.txt";
      let outFile = dir + "/compressFilePromise_1300.zip";
      let options:zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_RLE;

      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(file.fd, infos);
        const number = await fs.write(file.fd, infos);
        console.info("compressFilePromise_1300 write data to file successfully:" + number);
        await zlib.compressFile(inFile, outFile, options);
        console.info("compressFilePromise_1300 compressFile success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFilePromise_1300 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFilePromise_1300 end==================");
    })

    /**
     * @tc.name   compressFilePromise_1400
     * @tc.number compressFilePromise_1400
     * @tc.desc   compressFile Promise strategy COMPRESS_STRATEGY_FIXED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFilePromise_1400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      console.info("==================compressFilePromise_1400 start==================");
      let inFile = dir + "/compressFilePromise_1400.txt";
      let outFile = dir + "/compressFilePromise_1400.zip";
      let options:zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED;

      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(file.fd, infos);
        const number = await fs.write(file.fd, infos);
        console.info("compressFilePromise_1400 write data to file successfully:" + number);
        await zlib.compressFile(inFile, outFile, options);
        console.info("compressFilePromise_1400 compressFile success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFilePromise_1400 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFilePromise_1400 end==================");
    })


    /**
     * @tc.name   compressFilePromise_1500
     * @tc.number compressFilePromise_1500
     * @tc.desc   compressFile Promise parallel PARALLEL_STRATEGY_SEQUENTIAL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFilePromise_1500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      console.info("==================compressFilePromise_1500 start==================");
      let inFile = dir + "/compressFilePromise_1500.txt";
      let outFile = dir + "/compressFilePromise_1500.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      options.parallel = zlib.ParallelStrategy.PARALLEL_STRATEGY_SEQUENTIAL;

      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(file.fd, infos);
        const number = await fs.write(file.fd, infos);
        console.info("compressFilePromise_1500 write data to file successfully:" + number);
        await zlib.compressFile(inFile, outFile, options);
        console.info("compressFilePromise_1500 compressFile success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFilePromise_1500 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFilePromise_1500 end==================");
    })

    /**
     * @tc.name   compressFilePromise_1600
     * @tc.number compressFilePromise_1600
     * @tc.desc   compressFile Promise parallel PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFilePromise_1600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      console.info("==================compressFilePromise_1600 start==================");
      let inFile = dir + "/compressFilePromise_1600.txt";
      let outFile = dir + "/compressFilePromise_1600.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      options.parallel = zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION;

      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(file.fd, infos);
        const number = await fs.write(file.fd, infos);
        console.info("compressFilePromise_1600 write data to file successfully:" + number);
        await zlib.compressFile(inFile, outFile, options);
        console.info("compressFilePromise_1600 compressFile success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFilePromise_1600 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFilePromise_1600 end==================");
    })


    /**
     * @tc.name   compressFilePromise_1700
     * @tc.number compressFilePromise_1700
     * @tc.desc   compressFile Promise pathSeparatorStrategy PATH_SEPARATOR_STRATEGY_DEFAULT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFilePromise_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      console.info("==================compressFilePromise_1700 start==================");
      let inFile = dir + "/compressFilePromise_1700.txt";
      let outFile = dir + "/compressFilePromise_1700.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      options.pathSeparatorStrategy = zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_DEFAULT;

      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(file.fd, infos);
        const number = await fs.write(file.fd, infos);
        console.info("compressFilePromise_1700 write data to file successfully:" + number);
        await zlib.compressFile(inFile, outFile, options);
        console.info("compressFilePromise_1700 compressFile success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFilePromise_1700 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFilePromise_1700 end==================");
    })

    /**
     * @tc.name   compressFilePromise_1800
     * @tc.number compressFilePromise_1800
     * @tc.desc   compressFile Promise pathSeparatorStrategy PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFilePromise_1800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      console.info("==================compressFilePromise_1800 start==================");
      let inFile = dir + "/compressFilePromise_1800.txt";
      let outFile = dir + "/compressFilePromise_1800.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      options.pathSeparatorStrategy = zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH;

      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(file.fd, infos);
        const number = await fs.write(file.fd, infos);
        console.info("compressFilePromise_1800 write data to file successfully:" + number);
        await zlib.compressFile(inFile, outFile, options);
        console.info("compressFilePromise_1800 compressFile success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFilePromise_1800 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFilePromise_1800 end==================");
    })


    /**
     * @tc.name   compressFilePromise_1900
     * @tc.number compressFilePromise_1900
     * @tc.desc   compressFile Promise normal test with valid parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compressFilePromise_1900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      console.info("==================compressFilePromise_1900 start==================");
      let inFile = dir + "/compressFilePromise_1900.txt";
      let outFile = dir + "/compressFilePromise_1900.zip";
      let options:zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;

      let  file = fs.openSync(inFile, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(file.fd, infos);
        const number = await fs.write(file.fd, infos);
        console.info("compressFilePromise_1900 write data to file successfully:" + number);
        await zlib.compressFile(inFile, outFile, options);
        console.info("compressFilePromise_1900 compressFile success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFilePromise_1900 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFilePromise_1900 end==================");
    })
  })
}