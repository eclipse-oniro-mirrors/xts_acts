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
const  context = AppStorage.get("context") as Context;
let dir = context.cacheDir
export default function ZiptestnewCompressFilesTest() {
  describe('ZiptestnewCompressFilesTest', ()=> {

    beforeEach(async (done: Function) => {
      let objectone = "com.example.amsZipfileUnzipfileST.MainAbility/com.example.amsZipfileUnzipfileST/";
      let objecttwo = "com.example.amsZipfileUnzipfileST.MainAbility/com.example.amsZipfileUnzipfileST/zipunzip";
      let objectthree = "com.example.amsZipfileUnzipfileST.MainAbility/ActsZlibTest/example.amsZipfileUnzipfileST";
      infos = dir + objectone + objecttwo + objectthree;
      done();

    });

    /**
     * @tc.name compressFiles_null_0100
     * @tc.number compressFiles_null_0100
     * @tc.desc compressFiles first parameter null test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('compressFiles_null_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("==================compressFiles_null_0100 start==================");
      let inFiles = null;
      let outFile = dir + "/compressFiles_null_0100.zip";
      let options: zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;

      try {
        await zlib.compressFiles(inFiles, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFiles_null_0100 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR);
        done();
      }
      console.info("==================compressFiles_null_0100 end==================");
    })

    /**
     * @tc.name compressFiles_null_0200
     * @tc.number compressFiles_null_0200
     * @tc.desc compressFiles first parameter undefined test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('compressFiles_null_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("==================compressFiles_null_0200 start==================");
      let inFiles = undefined;
      let outFile = dir + "/compressFiles_null_0200.zip";
      let options: zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;

      try {
        await zlib.compressFiles(inFiles, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFiles_null_0200 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR);
        done();
      }
      console.info("==================compressFiles_null_0200 end==================");
    })

    /**
     * @tc.name compressFiles_null_0300
     * @tc.number compressFiles_null_0300
     * @tc.desc compressFiles first parameter empty array test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('compressFiles_null_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("==================compressFiles_null_0300 start==================");
      let inFiles = [];
      let outFile = dir + "/compressFiles_null_0300.zip";
      let options: zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      try {
        await zlib.compressFiles(inFiles, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFiles_null_0300 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR);
        done();
      }
      console.info("==================compressFiles_null_0300 end==================");
    })

    /**
     * @tc.name compressFiles_null_0400
     * @tc.number compressFiles_null_0400
     * @tc.desc compressFiles first parameter array with empty string test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('compressFiles_null_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("==================compressFiles_null_0400 start==================");
      let inFiles = [""];
      let outFile = dir + "/compressFiles_null_0400.zip";
      let options: zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;

      try {
        await zlib.compressFiles(inFiles, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFiles_null_0400 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(SRC_FILE_INVALID);
        done();
      }
      console.info("==================compressFiles_null_0400 end==================");
    })

    /**
     * @tc.name compressFiles_null_0500
     * @tc.number compressFiles_null_0500
     * @tc.desc compressFiles second parameter empty string test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('compressFiles_null_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("==================compressFiles_null_0500 start==================");
      let inFiles = [
        dir + "/compressFiles_null_0500_1.txt",
        dir + "/compressFiles_null_0500_2.txt"
      ];
      let outFile = "";
      let options: zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos);
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_null_0500 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFiles_null_0500 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(OUTPUT_FILE_INVALID);
        done();
      }
      console.info("==================compressFiles_null_0500 end==================");
    })

    /**
     * @tc.name compressFiles_null_0600
     * @tc.number compressFiles_null_0600
     * @tc.desc compressFiles second parameter null test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('compressFiles_null_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("==================compressFiles_null_0600 start==================");
      let inFiles = [
        dir + "/compressFiles_null_0600_1.txt",
        dir + "/compressFiles_null_0600_2.txt"
      ];
      let outFile = null;
      let options: zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_null_0600 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFiles_null_0600 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR);
        done();
      }
      console.info("==================compressFiles_null_0600 end==================");
    })

    /**
     * @tc.name compressFiles_null_0700
     * @tc.number compressFiles_null_0700
     * @tc.desc compressFiles second parameter undefined test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('compressFiles_null_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("==================compressFiles_null_0700 start==================");
      let inFiles = [
        dir + "/compressFiles_null_0700_1.txt",
        dir + "/compressFiles_null_0700_2.txt"
      ];
      let outFile = undefined;
      let options: zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;

      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_null_0700 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFiles_null_0700 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR);
        done();
      }
      console.info("==================compressFiles_null_0700 end==================");
    })

    /**
     * @tc.name compressFiles_null_0800
     * @tc.number compressFiles_null_0800
     * @tc.desc compressFiles third parameter null test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('compressFiles_null_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("==================compressFiles_null_0800 start==================");
      let inFiles = [
        dir + "/compressFiles_null_0800_1.txt",
        dir + "/compressFiles_null_0800_2.txt"
      ];
      let outFile = dir + "/compressFiles_null_0800.zip";
      let options = null;

      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_null_0800 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFiles_null_0800 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR);
        done();
      }
      console.info("==================compressFiles_null_0800 end==================");
    })

    /**
     * @tc.name compressFiles_null_0900
     * @tc.number compressFiles_null_0900
     * @tc.desc compressFiles third parameter undefined test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('compressFiles_null_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("==================compressFiles_null_0900 start==================");
      let inFiles = [
        dir + "/compressFiles_null_0900_1.txt",
        dir + "/compressFiles_null_0900_2.txt"
      ];
      let outFile = dir + "/compressFiles_null_0900.zip";
      let options = undefined;

      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_null_0900 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("compressFiles_null_0900 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(PARAM_ERROR);
        done();
      }
      console.info("==================compressFiles_null_0900 end==================");
    })

    // 测试 level 属性的未覆盖枚举值
    /**
     * @tc.name compressFiles_0100
     * @tc.number compressFiles_0100
     * @tc.desc compressFiles level COMPRESS_LEVEL_BEST_SPEED test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('compressFiles_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("==================compressFiles_0100 start==================");
      let inFiles = [
        dir + "/compressFiles_0100_1.txt",
        dir + "/compressFiles_0100_2.txt"
      ];
      let outFile = dir + "/compressFiles_0100.zip";
      let options: zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED;

      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_0100 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        console.info("compressFiles_0100 compressFiles success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFiles_0100 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFiles_0100 end==================");
    })

    /**
     * @tc.name compressFiles_0200
     * @tc.number compressFiles_0200
     * @tc.desc compressFiles level COMPRESS_LEVEL_BEST_COMPRESSION test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('compressFiles_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("==================compressFiles_0200 start==================");
      let inFiles = [
        dir + "/compressFiles_0200_1.txt",
        dir + "/compressFiles_0200_2.txt"
      ];
      let outFile = dir + "/compressFiles_0200.zip";
      let options: zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION;

      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_0200 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        console.info("compressFiles_0200 compressFiles success");
        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFiles_0200 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFiles_0200 end==================");
    })

    // 测试 memLevel 属性的未覆盖枚举值
    /**
     * @tc.name compressFiles_0300
     * @tc.number compressFiles_0300
     * @tc.desc compressFiles memLevel MEM_LEVEL_MIN test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('compressFiles_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("==================compressFiles_0300 start==================");
      let inFiles = [
        dir + "/compressFiles_0300_1.txt",
        dir + "/compressFiles_0300_2.txt"
      ];
      let outFile = dir + "/compressFiles_0300.zip";
      let options: zlib.Options = {};
      options.memLevel = zlib.MemLevel.MEM_LEVEL_MIN;
      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_0300 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        console.info("compressFiles_0300 compressFiles success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFiles_0300 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFiles_0300 end==================");
    })

    /**
     * @tc.name compressFiles_0400
     * @tc.number compressFiles_0400
     * @tc.desc compressFiles memLevel MEM_LEVEL_MAX test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('compressFiles_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("==================compressFiles_0400 start==================");
      let inFiles = [
        dir + "/compressFiles_0400_1.txt",
        dir + "/compressFiles_0400_2.txt"
      ];
      let outFile = dir + "/compressFiles_0400.zip";
      let options: zlib.Options = {};
      options.memLevel = zlib.MemLevel.MEM_LEVEL_MAX;
      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_0400 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        console.info("compressFiles_0400 compressFiles success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFiles_0400 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFiles_0400 end==================");
    })

    /**
     * @tc.name compressFiles_0500
     * @tc.number compressFiles_0500
     * @tc.desc compressFiles strategy COMPRESS_STRATEGY_FILTERED test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('compressFiles_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("==================compressFiles_0500 start==================");
      let inFiles = [
        dir + "/compressFiles_0500_1.txt",
        dir + "/compressFiles_0500_2.txt"
      ];
      let outFile = dir + "/compressFiles_0500.zip";
      let options: zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;
      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_0500 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        console.info("compressFiles_0500 compressFiles success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFiles_0500 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFiles_0500 end==================");
    })

    /**
     * @tc.name compressFiles_0600
     * @tc.number compressFiles_0600
     * @tc.desc compressFiles strategy COMPRESS_STRATEGY_HUFFMAN_ONLY test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('compressFiles_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("==================compressFiles_0600 start==================");
      let inFiles = [
        dir + "/compressFiles_0600_1.txt",
        dir + "/compressFiles_0600_2.txt"
      ];
      let outFile = dir + "/compressFiles_0600.zip";
      let options: zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_HUFFMAN_ONLY;
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_0600 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        console.info("compressFiles_0600 compressFiles success");
        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFiles_0600 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFiles_0600 end==================");
    })

    /**
     * @tc.name compressFiles_0700
     * @tc.number compressFiles_0700
     * @tc.desc compressFiles strategy COMPRESS_STRATEGY_RLE test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('compressFiles_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("==================compressFiles_0700 start==================");
      let inFiles = [
        dir + "/compressFiles_0700_1.txt",
        dir + "/compressFiles_0700_2.txt"
      ];
      let outFile = dir + "/compressFiles_0700.zip";
      let options: zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_RLE;

      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_0700 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        console.info("compressFiles_0700 compressFiles success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFiles_0700 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFiles_0700 end==================");
    })

    /**
     * @tc.name compressFiles_0800
     * @tc.number compressFiles_0800
     * @tc.desc compressFiles strategy COMPRESS_STRATEGY_FIXED test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('compressFiles_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("==================compressFiles_0800 start==================");
      let inFiles = [
        dir + "/compressFiles_0800_1.txt",
        dir + "/compressFiles_0800_2.txt"
      ];
      let outFile = dir + "/compressFiles_0800.zip";
      let options: zlib.Options = {};
      options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED;

      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_0800 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        console.info("compressFiles_0800 compressFiles success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFiles_0800 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFiles_0800 end==================");
    })

    /**
     * @tc.name compressFiles_0900
     * @tc.number compressFiles_0900
     * @tc.desc compressFiles parallel PARALLEL_STRATEGY_SEQUENTIAL test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('compressFiles_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("==================compressFiles_0900 start==================");
      let inFiles = [
        dir + "/compressFiles_0900_1.txt",
        dir + "/compressFiles_0900_2.txt"
      ];
      let outFile = dir + "/compressFiles_0900.zip";
      let options: zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      options.parallel = zlib.ParallelStrategy.PARALLEL_STRATEGY_SEQUENTIAL;

      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_0900 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        console.info("compressFiles_0900 compressFiles success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFiles_0900 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFiles_0900 end==================");
    })

    /**
     * @tc.name compressFiles_1000
     * @tc.number compressFiles_1000
     * @tc.desc compressFiles parallel PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('compressFiles_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("==================compressFiles_1000 start==================");
      let inFiles = [
        dir + "/compressFiles_1000_1.txt",
        dir + "/compressFiles_1000_2.txt"
      ];
      let outFile = dir + "/compressFiles_1000.zip";
      let options: zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      options.parallel = zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION;

      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_1000 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        console.info("compressFiles_1000 compressFiles success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFiles_1000 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFiles_1000 end==================");
    })

    // 测试 pathSeparatorStrategy 属性的枚举值
    /**
     * @tc.name compressFiles_1100
     * @tc.number compressFiles_1100
     * @tc.desc compressFiles pathSeparatorStrategy PATH_SEPARATOR_STRATEGY_DEFAULT test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('compressFiles_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("==================compressFiles_1100 start==================");
      let inFiles = [
        dir + "/compressFiles_1100_1.txt",
        dir + "/compressFiles_1100_2.txt"
      ];
      let outFile = dir + "/compressFiles_1100.zip";
      let options: zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      options.pathSeparatorStrategy = zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_DEFAULT;

      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_1100 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        console.info("compressFiles_1100 compressFiles success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFiles_1100 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFiles_1100 end==================");
    })

    /**
     * @tc.name compressFiles_1200
     * @tc.number compressFiles_1200
     * @tc.desc compressFiles pathSeparatorStrategy PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('compressFiles_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("==================compressFiles_1200 start==================");
      let inFiles = [
        dir + "/compressFiles_1200_1.txt",
        dir + "/compressFiles_1200_2.txt"
      ];
      let outFile = dir + "/compressFiles_1200.zip";
      let options: zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      options.pathSeparatorStrategy = zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH;

      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_1200 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        console.info("compressFiles_1200 compressFiles success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFiles_1200 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFiles_1200 end==================");
    })

    /**
     * @tc.name compressFiles_1300
     * @tc.number compressFiles_1300
     * @tc.desc compressFiles normal test with valid parameters.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('compressFiles_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("==================compressFiles_1300 start==================");
      let inFiles = [
        dir + "/compressFiles_1300_1.txt",
        dir + "/compressFiles_1300_2.txt"
      ];
      let outFile = dir + "/compressFiles_1300.zip";
      let options: zlib.Options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;

      // Create source files
      let fd1 = fs.openSync(inFiles[0], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let fd2 = fs.openSync(inFiles[1], fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await fs.write(fd1.fd, infos)
        await fs.write(fd2.fd, infos);
        console.info("compressFiles_1300 write data to files successfully");
        await zlib.compressFiles(inFiles, outFile, options);
        console.info("compressFiles_1300 compressFiles success");

        const stat = await fs.stat(outFile);
        expect(stat.isFile()).assertTrue();
        expect(stat.size > 0).assertTrue();
        done();
      } catch (err) {
        console.info("compressFiles_1300 err: " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
      console.info("==================compressFiles_1300 end==================");
    })
  })

}
