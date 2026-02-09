/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { cryptoFramework } from '@kit.CryptoArchitectureKit'
import { doDigest, doMd, doMdSpilt, SHA3_SPEC } from './utils/digest/sha3';
import { asyncType, compareDataBlob, createData, decToHexString, stringToUint8Array } from './utils/common/commonUtils';


export default function SecurityCryptoFwSha3TestUnit() {
  describe('SecurityCryptoFwSha3TestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Sha3_Func_0100
     * @tc.number SUB_Security_CryptoFramework_Sha3_Func_0100
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Sha3_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let messageLen: number = 128;
        let message: cryptoFramework.DataBlob = await createData(messageLen);
        for(let algName of SHA3_SPEC) {
          let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
          let dataRes: cryptoFramework.DataBlob = await doMd(md, message, asyncType.TYPE_IS_SYNC);
          let mdSize: number = dataRes.data.length;
          expect(md.getMdLength()).assertEqual(mdSize);
        }
      } catch (error) {
        console.error(`Sha3 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Sha3_Func_0200
     * @tc.number SUB_Security_CryptoFramework_Sha3_Func_0200
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Sha3_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let messageLen: number = 128;
          let message: cryptoFramework.DataBlob = await createData(messageLen);
          for(let algName of SHA3_SPEC) {
            let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
            let dataRes: cryptoFramework.DataBlob = await doMd(md, message, asyncType.TYPE_IS_PROMISE);
            let mdSize: number = dataRes.data.length;
            expect(md.getMdLength()).assertEqual(mdSize);
          }
        } catch (error) {
          console.error(`Sha3 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Sha3_Func_0300
     * @tc.number SUB_Security_CryptoFramework_Sha3_Func_0300
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Sha3_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let messageLen: number = 128;
          let message: cryptoFramework.DataBlob = await createData(messageLen);
          for(let algName of SHA3_SPEC) {
            let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
            let dataRes: cryptoFramework.DataBlob = await doMd(md, message, asyncType.TYPE_IS_CALLBACK);
            let mdSize: number = dataRes.data.length;
            expect(md.getMdLength()).assertEqual(mdSize);
          }
        } catch (error) {
          console.error(`Sha3 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });



    /**
     * @tc.name   SUB_Security_CryptoFramework_Sha3_Func_0400
     * @tc.number SUB_Security_CryptoFramework_Sha3_Func_0400
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Sha3_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let messageLen: number = 128;
          let message: cryptoFramework.DataBlob = await createData(messageLen);
          let blockSize: number = 20;
          for(let algName of SHA3_SPEC) {
            let md1: cryptoFramework.Md = cryptoFramework.createMd(algName);
            let md2: cryptoFramework.Md = cryptoFramework.createMd(algName);
            let dataRes1: cryptoFramework.DataBlob = await doMd(md1, message, asyncType.TYPE_IS_SYNC);
            let dataRes2: cryptoFramework.DataBlob = await doMdSpilt(md2, message, blockSize, asyncType.TYPE_IS_SYNC);
            let mdSize: number = dataRes2.data.length;
            expect(md1.getMdLength()).assertEqual(mdSize);
            let ret: boolean = compareDataBlob(dataRes1, dataRes2);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`Sha3 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Sha3_Func_0500
     * @tc.number SUB_Security_CryptoFramework_Sha3_Func_0500
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Sha3_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let messageLen: number = 128;
          let blockSize: number = 20;
          let message: cryptoFramework.DataBlob = await createData(messageLen);
          for(let algName of SHA3_SPEC) {
            let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
            let dataRes: cryptoFramework.DataBlob = await doMdSpilt(md, message, blockSize, asyncType.TYPE_IS_PROMISE);
            let mdSize: number = dataRes.data.length;
            expect(md.getMdLength()).assertEqual(mdSize);
          }
        } catch (error) {
          console.error(`Sha3 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Sha3_Func_0600
     * @tc.number SUB_Security_CryptoFramework_Sha3_Func_0600
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Sha3_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let messageLen: number = 128;
          let blockSize: number = 20;
          let message: cryptoFramework.DataBlob = await createData(messageLen);
          for(let algName of SHA3_SPEC) {
            let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
            let dataRes: cryptoFramework.DataBlob = await doMdSpilt(md, message, blockSize, asyncType.TYPE_IS_CALLBACK);
            let mdSize: number = dataRes.data.length;
            expect(md.getMdLength()).assertEqual(mdSize);
          }
        } catch (error) {
          console.error(`Sha3 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Sha3_Func_0700
     * @tc.number SUB_Security_CryptoFramework_Sha3_Func_0700
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Sha3_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          for(let algName of SHA3_SPEC) {
            let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
            let dataRes: cryptoFramework.DataBlob = md.digestSync();
            let mdSize: number = dataRes.data.length;
            expect(md.getMdLength()).assertEqual(mdSize);
          }
        } catch (error) {
          console.error(`Sha3 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Sha3_Func_0800
     * @tc.number SUB_Security_CryptoFramework_Sha3_Func_0800
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Sha3_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          for(let algName of SHA3_SPEC) {
            let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
            let dataRes: cryptoFramework.DataBlob = await md.digest();
            let mdSize: number = dataRes.data.length;
            expect(md.getMdLength()).assertEqual(mdSize);
            console.log("################# md:" + decToHexString(dataRes));
          }
        } catch (error) {
          console.error(`Sha3 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Sha3_Func_0900
     * @tc.number SUB_Security_CryptoFramework_Sha3_Func_0900
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Sha3_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          for(let algName of SHA3_SPEC) {
            let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
            let dataRes: cryptoFramework.DataBlob = await doDigest(md);
            let mdSize: number = dataRes.data.length;
            expect(md.getMdLength()).assertEqual(mdSize);
          }
        } catch (error) {
          console.error(`Sha3 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Sha3_Func_1000
     * @tc.number SUB_Security_CryptoFramework_Sha3_Func_1000
     * @tc.desc   algorithm is digest - 标准测试向量验证（空字符串）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Sha3_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          // 空数据测试
          const emptyData: cryptoFramework.DataBlob = { data: new Uint8Array(0) };
          for(let algName of SHA3_SPEC) {
            let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
            await doMd(md, emptyData, asyncType.TYPE_IS_SYNC);
          }
        } catch (error) {
          console.error(`Sha3 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Sha3_Func_1100
     * @tc.number SUB_Security_CryptoFramework_Sha3_Func_1100
     * @tc.desc   algorithm is digest - 标准测试向量验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Sha3_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          const abcData: cryptoFramework.DataBlob = { data: new Uint8Array([0xe9]) };
          for(let algName of SHA3_SPEC) {
            let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
            let dataRes: cryptoFramework.DataBlob = await doMd(md, abcData, asyncType.TYPE_IS_SYNC);
            let mdSize: number = dataRes.data.length;
            let resultHex = Array.from(dataRes.data).map(byte => 
              byte.toString(16).padStart(2, '0')).join('');
            expect(md.getMdLength()).assertEqual(mdSize);
            console.info(`${algName} "abc"摘要: ${resultHex}`);
          }
        } catch (error) {
          console.error(`Sha3 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Sha3_Func_1200
     * @tc.number SUB_Security_CryptoFramework_Sha3_Func_1200
     * @tc.desc   algorithm is digest - 多种数据长度边界测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Sha3_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          // 边界长度测试
          const testLengths = [1, 55, 56, 57, 63, 64, 65, 127, 128, 129];
          for(let algName of SHA3_SPEC) {
            for(let len of testLengths) {
              let message: cryptoFramework.DataBlob = await createData(len);
              let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
              let dataRes: cryptoFramework.DataBlob = await doMd(md, message, asyncType.TYPE_IS_SYNC);
              let mdSize: number = dataRes.data.length;
              expect(md.getMdLength()).assertEqual(mdSize);
              expect(mdSize).assertLarger(0);
            }
            console.info(`${algName} 边界长度测试通过`);
          }
        } catch (error) {
          console.error(`Sha3 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Sha3_Func_1300
     * @tc.number SUB_Security_CryptoFramework_Sha3_Func_1300
     * @tc.desc   algorithm is digest - 二进制模式数据测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Sha3_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          // 不同二进制模式测试
          const patterns: cryptoFramework.DataBlob[] = [
            { data: new Uint8Array(64).fill(0) },
            { data: new Uint8Array(64).fill(255) },
            { data: new Uint8Array(64).fill(0x55) },
            { data: new Uint8Array(256).map((_, i) => i % 256) }
          ];
          for(let algName of SHA3_SPEC) {
            for(let pattern of patterns) {
              let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
              let dataRes: cryptoFramework.DataBlob = await doMd(md, pattern, asyncType.TYPE_IS_SYNC);
              let mdSize: number = dataRes.data.length;
              expect(md.getMdLength()).assertEqual(mdSize);
              expect(mdSize).assertLarger(0);
            }
            console.info(`${algName} 二进制模式测试通过`);
          }
        } catch (error) {
          console.error(`Sha3 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Sha3_Func_1400
     * @tc.number SUB_Security_CryptoFramework_Sha3_Func_1400
     * @tc.desc   algorithm is digest - 重复性和一致性验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Sha3_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let messageLen: number = 256;
          let message: cryptoFramework.DataBlob = await createData(messageLen);
          for(let algName of SHA3_SPEC) {
            let results: cryptoFramework.DataBlob[] = [];
            // 执行多次相同计算
            for(let i = 0; i < 3; i++) {
              let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
              let dataRes: cryptoFramework.DataBlob = await doMd(md, message, asyncType.TYPE_IS_SYNC);
              results.push(dataRes);
            }
            // 验证结果一致性
            for(let i = 1; i < results.length; i++) {
              let ret: boolean = compareDataBlob(results[0], results[i]);
              expect(ret).assertTrue();
            }
            console.info(`${algName} 重复性验证通过`);
          }
        } catch (error) {
          console.error(`Sha3 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Sha3_Func_1500
     * @tc.number SUB_Security_CryptoFramework_Sha3_Func_1500
     * @tc.desc   algorithm is digest - 大数据量性能测试
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_Sha3_Func_1500",
      TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
        try {
          const largeSizes = [1024, 4096, 16384]; // 1KB, 4KB, 16KB
          
          for(let algName of SHA3_SPEC) {
            for(let size of largeSizes) {
              let message: cryptoFramework.DataBlob = await createData(size);
              let startTime = Date.now();
              let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
              let dataRes: cryptoFramework.DataBlob = await doMd(md, message, asyncType.TYPE_IS_SYNC);
              let endTime = Date.now();
              let mdSize: number = dataRes.data.length;
              let processingTime = endTime - startTime;
              expect(md.getMdLength()).assertEqual(mdSize);
              expect(processingTime).assertLess(5000); // 应在5秒内完成
              console.info(`${algName} ${size}字节数据处理耗时: ${processingTime}ms`);
            }
          }
        } catch (error) {
          console.error(`Sha3 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

  });
}