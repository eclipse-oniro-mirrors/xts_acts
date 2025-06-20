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
import fs, { ReadOptions } from '@ohos.file.fs';
import { describe, it, expect, beforeAll } from '@ohos/hypium'
import { BusinessError } from '@ohos.base'

export default function ActsZlibInterfaceTest() { 
 describe('ActsZlibInterfaceTest', () => {

    let filesDir = "/data/storage/el2/base/files";

    beforeAll(() => {
        // 创建一个文件
        let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let writeLen = fs.writeSync(file.fd, "test: Try to write str.");
        console.info(`test.txt: wirteLen ${writeLen}`);
        fs.closeSync(file);
        // 创建一个文件
        let file2 = fs.openSync(filesDir + '/test2.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        writeLen = fs.writeSync(file2.fd, "test2: Try to write str.");
        console.info(`test2.txt: wirteLen ${writeLen}`);
        fs.closeSync(file2);
        //创建一个文件夹
        let dirPath = filesDir + "/testDir";
        fs.mkdir(dirPath).then(() => {
            console.info("mkdir succeed");
            let file3 = fs.openSync(filesDir + '/test3.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            writeLen = fs.writeSync(file3.fd, "test3: Try to write str.");
            console.info(`test3.txt: wirteLen ${writeLen}`);
            fs.closeSync(file3);
        }).catch((err: BusinessError) => {
            console.error("mkdir failed with error message: " + err.message + ", error code: " + err.code);
        });
    })

    /**
     * @tc.number     : ACTS_ZlibInterfaceTest_01
     * @tc.name       : ActsZlibInterfaceTest01
     * @tc.desc       : test getOriginalSize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('ActsZlibInterfaceTest01', 0, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_01 start==================");
        let inFile = filesDir + '/test.txt';
        let outFile = filesDir + '/test.zip';
        let options: zlib.Options = {
            level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
            memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
            strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
        };
        try {
            zlib.compressFile(inFile, outFile, options).then((data: void) => {
                console.info('getOriginalSize prepare test.zip success. data: ' + JSON.stringify(data));
                try {
                    zlib.getOriginalSize(outFile).then((data: number) => {
                        console.info(`getOriginalSize success. getOriginalSize: ${data}`);
                        expect(data).assertLarger(0);
                        done();
                    }).catch((errData: BusinessError) => {
                        console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                        expect(errData).assertFail();
                        done();
                    })
                } catch(errData) {
                    console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                    expect(errData).assertFail();
                    done();
                }
            }).catch((errData: BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
                done();
            })
        } catch(errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        }
        console.info("==================ACTS_ZlibInterfaceTest_01 end==================");
    })

    /**
     * @tc.number     : ACTS_ZlibInterfaceTest_02
     * @tc.name       : ActsZlibInterfaceTest02
     * @tc.desc       : test getOriginalSize 401
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
     it('ActsZlibInterfaceTest02', 0, async (done: Function) => {
         console.info("==================ACTS_ZlibInterfaceTest_02 start==================");
         try {
             zlib.getOriginalSize(null).then((data: number) => {
                 console.info(`getOriginalSize success. getOriginalSize: ${data}`);
                 expect().assertFail();
             }).catch((errData: BusinessError) => {
                 console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                 expect().assertFail();
             })
         } catch(errData) {
             console.error(`ActsZlibInterfaceTest02 is errCode:${errData.code}  message:${errData.message}`);
             expect(errData.code).assertEqual(401);
         }
        try {
             zlib.getOriginalSize(undefined).then((data: number) => {
                 console.info(`getOriginalSize success. getOriginalSize: ${data}`);
                 expect().assertFail();
                 done();
             }).catch((errData: BusinessError) => {
                 console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                 expect().assertFail();
                 done();
             })
         } catch(errData) {
             console.error(`ActsZlibInterfaceTest02 is errCode:${errData.code}  message:${errData.message}`);
             expect(errData.code).assertEqual(401);
             done();
         }
         console.info("==================ACTS_ZlibInterfaceTest_02 end==================");
     })

    /**
     * @tc.number     : ACTS_ZlibInterfaceTest_03
     * @tc.name       : ActsZlibInterfaceTest03
     * @tc.desc       : test getOriginalSize 900001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('ActsZlibInterfaceTest03', 0, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_03 start==================");
        let compressedFile = filesDir + '/not_found.zip';
        try {
            zlib.getOriginalSize(compressedFile).then((data: number) => {
                console.info(`getOriginalSize success. getOriginalSize: ${data}`);
                expect(data).assertLarger(0);
                done();
            }).catch((errData: BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(900001);
                done();
            })
        } catch(errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        }
        console.info("==================ACTS_ZlibInterfaceTest_03 end==================");
    })

    /**
     * @tc.number     : ACTS_ZlibInterfaceTest_04
     * @tc.name       : ActsZlibInterfaceTest04
     * @tc.desc       : test getOriginalSize 900003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('ActsZlibInterfaceTest04', 0, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_04 start==================");
        let compressedFile = filesDir + '/test.txt';
        try {
            zlib.getOriginalSize(compressedFile).then((data: number) => {
                console.info(`getOriginalSize success. getOriginalSize: ${data}`);
                expect(data).assertLarger(0);
                done();
            }).catch((errData: BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(900003);
                done();
            })
        } catch(errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        }
        console.info("==================ACTS_ZlibInterfaceTest_04 end==================");
    })

    /**
     * @tc.number     : ACTS_ZlibInterfaceTest_05
     * @tc.name       : ActsZlibInterfaceTest05
     * @tc.desc       : test compressFiles
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('ActsZlibInterfaceTest05', 0, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_05 start==================");
        let inFile = filesDir + '/test.txt';
        let inFile2 = filesDir + '/test2.txt';
        let inFile3 = filesDir + '/testDir';
        let outFile = filesDir + '/test05.zip';
        let options: zlib.Options = {
            level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
            memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
            strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
        };
        try {
            zlib.compressFiles([inFile, inFile2, inFile3], outFile, options).then((data: void) => {
                console.info('compressFiles success. data: ' + JSON.stringify(data));
                expect(data).assertEqual(null);
                done();
            }).catch((errData: BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
                done();
            })
        } catch(errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        }
        console.info("==================ACTS_ZlibInterfaceTest_05 end==================");
    })

    /**
     * @tc.number     : ACTS_ZlibInterfaceTest_06
     * @tc.name       : ActsZlibInterfaceTest06
     * @tc.desc       : test compressFiles 401
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('ActsZlibInterfaceTest06', 0, async (done: Function) => {
    //     console.info("==================ACTS_ZlibInterfaceTest_06 start==================");
    //     let options: zlib.Options = {
    //         level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
    //         memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
    //         strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
    //     };
    //     try {
    //         zlib.compressFiles(1, 2, options).then((data: void) => {
    //             console.info('compressFiles success. data: ' + JSON.stringify(data));
    //             expect(data).assertEqual(null);
    //             done();
    //         }).catch((errData: BusinessError) => {
    //             console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
    //             expect(errData.code).assertFail();
    //             done();
    //         })
    //     } catch(errData) {
    //         console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
    //         expect(errData.code).assertEqual(401);
    //         done();
    //     }
    //     console.info("==================ACTS_ZlibInterfaceTest_06 end==================");
    // })

    /**
     * @tc.number     : ACTS_ZlibInterfaceTest_07
     * @tc.name       : ActsZlibInterfaceTest07
     * @tc.desc       : test compressFiles 900001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('ActsZlibInterfaceTest07', 0, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_07 start==================");
        let inFile = filesDir + '/not_found.txt';
        let inFile2 = filesDir + '/not_found2.txt';
        let inFile3 = filesDir + '/not_found';
        let outFile = filesDir + '/test07.zip';
        let options: zlib.Options = {
            level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
            memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
            strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
        };
        try {
            zlib.compressFiles([inFile, inFile2, inFile3], outFile, options).then((data: void) => {
                console.info('compressFiles success. data: ' + JSON.stringify(data));
                expect(data).assertEqual(null);
                done();
            }).catch((errData: BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(900001);
                done();
            })
        } catch(errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        }
        console.info("==================ACTS_ZlibInterfaceTest_07 end==================");
    })

    /**
     * @tc.number     : ACTS_ZlibInterfaceTest_08
     * @tc.name       : ActsZlibInterfaceTest08
     * @tc.desc       : test compressFiles 900002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('ActsZlibInterfaceTest08', 0, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_08 start==================");
        let inFile = filesDir + '/test.txt';
        let inFile2 = filesDir + '/test2.txt';
        let inFile3 = filesDir + '/testDir';
        let outFile = filesDir + '/notfound/test05.zip';
        let options: zlib.Options = {
            level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
            memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
            strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
        };
        console.info(`outFile: ${outFile}`);
        try {
            zlib.compressFiles([inFile, inFile2, inFile3], outFile, options).then((data: void) => {
                console.info('compressFiles success. data: ' + JSON.stringify(data));
                expect(data).assertFail();
                done();
            }).catch((errData: BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(900002);
                done();
            })
        } catch(errData) {
            let code = (errData as BusinessError).code;
            let message = (errData as BusinessError).message;
            console.error(`errData is errCode:${code}  message:${message}`);
            expect(errData).assertFail();
            done();
        }
        console.info("==================ACTS_ZlibInterfaceTest_08 end==================");
    })

 })
}