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
import base from '@ohos.base'
import fileio from '@ohos.fileio'
import { describe, it, expect, beforeAll, afterEach, beforeEach } from '@ohos/hypium'

let filePath: string = "/my/test.gz";
let allfilePath: string = "";

export default function ActsGzipDecompressionTest() {
    describe('ActsGzipDecompressionTest', () => {

        beforeAll(async (done: Function) => {
            let context = AppStorage.get("context") as Context;
            let pathDir = context.cacheDir;
            let path = pathDir + filePath;
            fileio.mkdirSync(pathDir + "/my");
            let gzip = zlib.createGZipSync();
            allfilePath = path;
            await gzip.gzopen(path, "wb");
            await gzip.gzclose();
            done();
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0100
         * @tc.name       : GzipDecompressionAbilityTest_0100
         * @tc.desc       : test gzputc correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0100', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0100 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzputc(0).then((num) => {
                    expect(num).assertEqual(0);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0100 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0200
         * @tc.name       : GzipDecompressionAbilityTest_0200
         * @tc.desc       : test gzputc error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0200', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0200 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzputc(-1).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0200 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0300
         * @tc.name       : GzipDecompressionAbilityTest_0300
         * @tc.desc       : test gzputc error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0300', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0300 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzputc(256).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0300 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0400
         * @tc.name       : GzipDecompressionAbilityTest_0400
         * @tc.desc       : test gzputc error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0400', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0400 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzputc(null).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0400 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0500
         * @tc.name       : GzipDecompressionAbilityTest_0500
         * @tc.desc       : test gzputc error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0500', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0500 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzputc(undefined).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0500 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0600
         * @tc.name       : GzipDecompressionAbilityTest_0600
         * @tc.desc       : test gzputc error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0600', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0600 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzputc(0).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0600 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0700
         * @tc.name       : GzipDecompressionAbilityTest_0700
         * @tc.desc       : test gzputs correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0700', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0700 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzputs("hello").then((num) => {
                    expect(num).assertEqual(5);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0700 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0800
         * @tc.name       : GzipDecompressionAbilityTest_0800
         * @tc.desc       : test gzputs error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0800', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0800 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzputs("").then((num) => {
                    expect(num).assertEqual(0);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0800 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0900
         * @tc.name       : GzipDecompressionAbilityTest_0900
         * @tc.desc       : test gzputs error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0900', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0900 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzputs(null).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_0900 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1000
         * @tc.name       : GzipDecompressionAbilityTest_1000
         * @tc.desc       : test gzputs error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1000', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1000 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzputs(undefined).then(() => {
                    expect().assertFail();
                })
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1000 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1100
         * @tc.name       : GzipDecompressionAbilityTest_1100
         * @tc.desc       : test gzputs error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1100', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1100 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzputs("hello").then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1100 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1200
         * @tc.name       : GzipDecompressionAbilityTest_1200
         * @tc.desc       : test gzwrite correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1200', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1200 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                let bufferWithData = new ArrayBuffer(16);
                let uint8View = new Uint8Array(bufferWithData);
                for (let i = 0; i < uint8View.length; i++) {
                    uint8View[i] = i;
                }
                await gzip.gzwrite(bufferWithData, 16).then((num) => {
                    expect(num).assertEqual(16);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1200 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1300
         * @tc.name       : GzipDecompressionAbilityTest_1300
         * @tc.desc       : test gzwrite error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1300', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1300 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                let bufferWithData = new ArrayBuffer(0);
                await gzip.gzwrite(bufferWithData, 1).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1300 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1400
         * @tc.name       : GzipDecompressionAbilityTest_1400
         * @tc.desc       : test gzwrite error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1400', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1400 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                let bufferWithData = new ArrayBuffer(16);
                await gzip.gzwrite(bufferWithData, -1).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1400 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1500
         * @tc.name       : GzipDecompressionAbilityTest_1500
         * @tc.desc       : test gzwrite error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1500', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1500 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            let bufferWithData = new ArrayBuffer(16);
            let uint8View = new Uint8Array(bufferWithData);
            for (let i = 0; i < uint8View.length; i++) {
                uint8View[i] = i;
            }
            try {
                await gzip.gzwrite(bufferWithData, null).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzwrite(null, 16).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1500 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1600
         * @tc.name       : GzipDecompressionAbilityTest_1600
         * @tc.desc       : test gzwrite error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1600', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1600 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            let bufferWithData = new ArrayBuffer(16);
            let uint8View = new Uint8Array(bufferWithData);
            for (let i = 0; i < uint8View.length; i++) {
                uint8View[i] = i;
            }
            try {
                await gzip.gzwrite(bufferWithData, undefined).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzwrite(undefined, 16).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1600 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1700
         * @tc.name       : GzipDecompressionAbilityTest_1700
         * @tc.desc       : test gzwrite error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1700', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1700 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                let bufferWithData = new ArrayBuffer(16);
                let uint8View = new Uint8Array(bufferWithData);
                for (let i = 0; i < uint8View.length; i++) {
                    uint8View[i] = i;
                }
                await gzip.gzwrite(bufferWithData, 0).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1700 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1800
         * @tc.name       : GzipDecompressionAbilityTest_1800
         * @tc.desc       : test gzwrite error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1800', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1800 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                let bufferWithData = new ArrayBuffer(16);
                let uint8View = new Uint8Array(bufferWithData);
                for (let i = 0; i < uint8View.length; i++) {
                    uint8View[i] = i;
                }
                await gzip.gzwrite(bufferWithData, 16).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1800 End=====");
        })


        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1900
         * @tc.name       : GzipDecompressionAbilityTest_1900
         * @tc.desc       : test gzfwrite correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1900', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1900 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                let bufferWithData = new ArrayBuffer(16);
                let uint8View = new Uint8Array(bufferWithData);
                for (let i = 0; i < uint8View.length; i++) {
                    uint8View[i] = i;
                }
                await gzip.gzfwrite(bufferWithData, 8, 2).then((num) => {
                    expect(num).assertEqual(2);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_1900 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2000
         * @tc.name       : GzipDecompressionAbilityTest_2000
         * @tc.desc       : test gzfwrite error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2000', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2000 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                let bufferWithData = new ArrayBuffer(0);
                await gzip.gzfwrite(bufferWithData, 8, 2).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2000 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2100
         * @tc.name       : GzipDecompressionAbilityTest_2100
         * @tc.desc       : test gzfwrite error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2100', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2100 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            let bufferWithData = new ArrayBuffer(16);
            let uint8View = new Uint8Array(bufferWithData);
            for (let i = 0; i < uint8View.length; i++) {
                uint8View[i] = i;
            }
            try {
                await gzip.gzfwrite(bufferWithData, -1, 8).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzfwrite(bufferWithData, 2, -1).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2100 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2200
         * @tc.name       : GzipDecompressionAbilityTest_2200
         * @tc.desc       : test gzfwrite error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2200', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2200 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            let bufferWithData = new ArrayBuffer(16);
            let uint8View = new Uint8Array(bufferWithData);
            for (let i = 0; i < uint8View.length; i++) {
                uint8View[i] = i;
            }
            try {
                await gzip.gzfwrite(null, 2, 8).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzfwrite(bufferWithData, null, 8).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzfwrite(bufferWithData, 2, null).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2200 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2300
         * @tc.name       : GzipDecompressionAbilityTest_2300
         * @tc.desc       : test gzfwrite error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2300', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2300 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            let bufferWithData = new ArrayBuffer(16);
            let uint8View = new Uint8Array(bufferWithData);
            for (let i = 0; i < uint8View.length; i++) {
                uint8View[i] = i;
            }
            try {
                await gzip.gzfwrite(undefined, 2, 8).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzfwrite(bufferWithData, undefined, 8).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzfwrite(bufferWithData, 2, undefined).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2300 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2400
         * @tc.name       : GzipDecompressionAbilityTest_2400
         * @tc.desc       : test gzfwrite error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2400', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2400 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            let bufferWithData = new ArrayBuffer(16);
            let uint8View = new Uint8Array(bufferWithData);
            for (let i = 0; i < uint8View.length; i++) {
                uint8View[i] = i;
            }
            try {
                await gzip.gzfwrite(bufferWithData, 0, 2).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }

            try {
                await gzip.gzfwrite(bufferWithData, 2, 0).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2400 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2500
         * @tc.name       : GzipDecompressionAbilityTest_2500
         * @tc.desc       : test gzfwrite error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2500', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2500 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                let bufferWithData = new ArrayBuffer(16);
                let uint8View = new Uint8Array(bufferWithData);
                for (let i = 0; i < uint8View.length; i++) {
                    uint8View[i] = i;
                }
                await gzip.gzfwrite(bufferWithData, 8, 2).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2500 End=====");
        })


        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2600
         * @tc.name       : GzipDecompressionAbilityTest_2600
         * @tc.desc       : test gzread correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2600', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2600 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            let bufferWithData = new ArrayBuffer(16);
            let uint8View = new Uint8Array(bufferWithData);
            for (let i = 0; i < uint8View.length; i++) {
                uint8View[i] = i;
            }
            await gzip.gzwrite(bufferWithData, 16);
            await gzip.gzclose();
            await gzip.gzopen(allfilePath, "rb");
            try {
                let bufferWithData = new ArrayBuffer(16);
                await gzip.gzread(bufferWithData).then((num) => {
                    expect(num).assertEqual(16);
                });
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2600 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2700
         * @tc.name       : GzipDecompressionAbilityTest_2700
         * @tc.desc       : test gzread error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2700', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2700 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                let bufferWithData = new ArrayBuffer(0);
                await gzip.gzread(bufferWithData).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2700 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2800
         * @tc.name       : GzipDecompressionAbilityTest_2800
         * @tc.desc       : test gzread error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2800', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2800 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzread(null).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2800 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2900
         * @tc.name       : GzipDecompressionAbilityTest_2900
         * @tc.desc       : test gzread error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2900', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2900 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzread(undefined).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_2900 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3000
         * @tc.name       : GzipDecompressionAbilityTest_3000
         * @tc.desc       : test gzread error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3000', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3000 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                let bufferWithData = new ArrayBuffer(16);
                await gzip.gzread(bufferWithData).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3000 End=====");
        })


        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3100
         * @tc.name       : GzipDecompressionAbilityTest_3100
         * @tc.desc       : test gzfread correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3100', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3100 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            let bufferWithData = new ArrayBuffer(16);
            let uint8View = new Uint8Array(bufferWithData);
            for (let i = 0; i < uint8View.length; i++) {
                uint8View[i] = i;
            }
            await gzip.gzfwrite(bufferWithData, 8, 2);
            await gzip.gzclose();
            await gzip.gzopen(allfilePath, "rb");
            try {
                let bufferWithData = new ArrayBuffer(16);
                await gzip.gzfread(bufferWithData, 8, 2).then((num) => {
                    expect(num).assertEqual(2);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3100 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3200
         * @tc.name       : GzipDecompressionAbilityTest_3200
         * @tc.desc       : test gzfread error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3200', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3200 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                let bufferWithData = new ArrayBuffer(0);
                await gzip.gzfread(bufferWithData, 8, 2).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3200 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3300
         * @tc.name       : GzipDecompressionAbilityTest_3300
         * @tc.desc       : test gzfread error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3300', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3300 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            let bufferWithData = new ArrayBuffer(16);
            try {
                await gzip.gzfread(bufferWithData, -1, 8).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzfread(bufferWithData, 2, -1).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3300 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3400
         * @tc.name       : GzipDecompressionAbilityTest_3400
         * @tc.desc       : test gzfread error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3400', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3400 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            let bufferWithData = new ArrayBuffer(16);
            try {
                await gzip.gzfread(null, 8, 2).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzfread(bufferWithData, null, 2).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzfread(bufferWithData, 8, null).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3400 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3500
         * @tc.name       : GzipDecompressionAbilityTest_3500
         * @tc.desc       : test gzfread error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3500', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3500 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            let bufferWithData = new ArrayBuffer(16);
            try {
                await gzip.gzfread(undefined, 8, 2).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzfread(bufferWithData, undefined, 2).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzfread(bufferWithData, 8, undefined).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3500 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3600
         * @tc.name       : GzipDecompressionAbilityTest_3600
         * @tc.desc       : test gzfread error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3600', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3600 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            let bufferWithData = new ArrayBuffer(16);
            try {
                await gzip.gzfread(bufferWithData, 0, 8).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }

            try {
                await gzip.gzfread(bufferWithData, 2, 0).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3600 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3700
         * @tc.name       : GzipDecompressionAbilityTest_3700
         * @tc.desc       : test gzfread error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3700', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3700 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                let bufferWithData = new ArrayBuffer(16);
                await gzip.gzfread(bufferWithData, 8, 2).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3700 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3800
         * @tc.name       : GzipDecompressionAbilityTest_3800
         * @tc.desc       : test gztell correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3800', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3800 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gztell().then((num) => {
                    expect(num).assertEqual(0);
                });
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3800 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3900
         * @tc.name       : GzipDecompressionAbilityTest_3900
         * @tc.desc       : test gztell error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3900', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3900 Start=====");
            let gzip = zlib.createGZipSync();
            try {
                await gzip.gztell().then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_3900 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4000
         * @tc.name       : GzipDecompressionAbilityTest_4000
         * @tc.desc       : test gzsetparams correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4000', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4000 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzsetparams(zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then((errcode) => {
                        expect(errcode).assertEqual(zlib.ReturnStatus.OK);
                    })
                await gzip.gzsetparams(zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED).then((errcode) => {
                        expect(errcode).assertEqual(zlib.ReturnStatus.OK);
                    })
                await gzip.gzsetparams(zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_HUFFMAN_ONLY).then((errcode) => {
                        expect(errcode).assertEqual(zlib.ReturnStatus.OK);
                    })
                await gzip.gzsetparams(zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_RLE).then((errcode) => {
                        expect(errcode).assertEqual(zlib.ReturnStatus.OK);
                    })
                await gzip.gzsetparams(zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED).then((errcode) => {
                        expect(errcode).assertEqual(zlib.ReturnStatus.OK);
                    })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4000 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4100
         * @tc.name       : GzipDecompressionAbilityTest_4100
         * @tc.desc       : test gzsetparams error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4100', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4100 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzsetparams(null, zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzsetparams(zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION, null).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4100 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4200
         * @tc.name       : GzipDecompressionAbilityTest_4200
         * @tc.desc       : test gzsetparams error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4200', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4200 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzsetparams(undefined, zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzsetparams(zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION, undefined).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4200 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4300
         * @tc.name       : GzipDecompressionAbilityTest_4300
         * @tc.desc       : test gzsetparams error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4300', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4300 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzsetparams(zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
                    zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(() => {
                        expect().assertFail();
                    });
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4300 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4400
         * @tc.name       : GzipDecompressionAbilityTest_4400
         * @tc.desc       : test gzprintf correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4400', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4400 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzprintf("name is %s, age is %d", "Tom", 23).then((len) => {
                    expect(len).assertEqual(22);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4400 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4500
         * @tc.name       : GzipDecompressionAbilityTest_4500
         * @tc.desc       : test gzprintf error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4500', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4500 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzprintf("name is %s, age is %d").then((result) => {
                    expect(result).assertEqual(21);
                });
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await gzip.gzprintf("name is %s, age is %d", null).then((result) => {
                    expect(result).assertEqual(23);
                });
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await gzip.gzprintf("name is %s, age is %d", null, null).then((result) => {
                    expect(result).assertEqual(21);
                });
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await gzip.gzprintf("name is %s, age is %d", null, null, null).then((result) => {
                    expect(result).assertEqual(21);
                });
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await gzip.gzprintf(null, 23).then((result) => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4500 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4600
         * @tc.name       : GzipDecompressionAbilityTest_4600
         * @tc.desc       : test gzprintf error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4600', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4600 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzprintf("name is %s, age is %d", undefined).then((result) => {
                    expect(result).assertEqual(28);
                });
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await gzip.gzprintf("name is %s, age is %d", undefined, undefined).then((result) => {
                    expect(result).assertEqual(26);
                });
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await gzip.gzprintf("name is %s, age is %d", undefined, undefined, undefined).then((result) => {
                    expect(result).assertEqual(26);
                });
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await gzip.gzprintf(undefined, 23).then((result) => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4600 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4700
         * @tc.name       : GzipDecompressionAbilityTest_4700
         * @tc.desc       : test gzprintf error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4700', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4700 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzprintf("", "Tom").then((result) => {
                    expect(result).assertEqual(0);
                });
            } catch (errData) {
                expect().assertFail();
            }

            try {
                await gzip.gzprintf("name is %s", "").then((result) => {
                    expect(result).assertEqual(8);
                });
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4700 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4800
         * @tc.name       : GzipDecompressionAbilityTest_4800
         * @tc.desc       : test gzprintf error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4800', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4800 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzprintf("name is %s, age is %d", "Tom", 23).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4800 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4900
         * @tc.name       : GzipDecompressionAbilityTest_4900
         * @tc.desc       : test gzopen correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4900', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4900 Start=====");
            let gzip = zlib.createGZipSync();
            try {
                await gzip.gzopen(allfilePath, "wb");
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_4900 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5000
         * @tc.name       : GzipDecompressionAbilityTest_5000
         * @tc.desc       : test gzopen error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5000', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5000 Start=====");
            let gzip = zlib.createGZipSync();
            try {
                await gzip.gzopen(allfilePath, null).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzopen(null, "wb").then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5000 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5100
         * @tc.name       : GzipDecompressionAbilityTest_5100
         * @tc.desc       : test gzopen error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5100', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5100 Start=====");
            let gzip = zlib.createGZipSync();
            try {
                await gzip.gzopen(allfilePath, undefined).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzopen(undefined, "wb").then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5100 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5200
         * @tc.name       : GzipDecompressionAbilityTest_5200
         * @tc.desc       : test gzopen error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5200', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5200 Start=====");
            let gzip = zlib.createGZipSync();
            try {
                await gzip.gzopen("", "wb").then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800002);
            }

            try {
                await gzip.gzopen(allfilePath, "").then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800002);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5200 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5300
         * @tc.name       : GzipDecompressionAbilityTest_5300
         * @tc.desc       : test gzopen error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5300', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5300 Start=====");
            let gzip = zlib.createGZipSync();
            try {
                await gzip.gzopen("123.gz", "wb").then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800002);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5300 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5400
         * @tc.name       : GzipDecompressionAbilityTest_5400
         * @tc.desc       : test gzopen error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5400', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5400 Start=====");
            let gzip = zlib.createGZipSync();
            try {
                await gzip.gzopen(allfilePath, "cz").then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800002);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5400 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5500
         * @tc.name       : GzipDecompressionAbilityTest_5500
         * @tc.desc       : test gzclose correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5500', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5500 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzclose().then((num) => {
                    expect(num).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5500 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5600
         * @tc.name       : GzipDecompressionAbilityTest_5600
         * @tc.desc       : test gzcloser correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5600', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5600 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzcloser().then((num) => {
                    expect(num).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5600 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5700
         * @tc.name       : GzipDecompressionAbilityTest_5700
         * @tc.desc       : test gzcloser error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5700', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5700 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzcloser().then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5700 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5800
         * @tc.name       : GzipDecompressionAbilityTest_5800
         * @tc.desc       : test gzgets correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5800', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5800 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            await gzip.gzputs("hello");
            await gzip.gzclose();
            await gzip.gzopen(allfilePath, "rb");
            try {
                let bufferWithData = new ArrayBuffer(16);
                await gzip.gzgets(bufferWithData).then((resulit) => {
                    expect(resulit).assertEqual("hello");
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5800 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5900
         * @tc.name       : GzipDecompressionAbilityTest_5900
         * @tc.desc       : test gzgets error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5900', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5900 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzgets(null).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_5900 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6000
         * @tc.name       : GzipDecompressionAbilityTest_6000
         * @tc.desc       : test gzgets error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6000', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6000 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzgets(undefined).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6000 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6100
         * @tc.name       : GzipDecompressionAbilityTest_6100
         * @tc.desc       : test gzgets error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6100', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6100 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                let bufferWithData = new ArrayBuffer(16);
                await gzip.gzgets(bufferWithData).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6100 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6200
         * @tc.name       : GzipDecompressionAbilityTest_6200
         * @tc.desc       : test gzgets error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6200', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6200 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                let bufferWithData = new ArrayBuffer(0);
                await gzip.gzgets(bufferWithData).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6200 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6300
         * @tc.name       : GzipDecompressionAbilityTest_6300
         * @tc.desc       : test gzgetc correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6300', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6300 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            await gzip.gzputc(1);
            await gzip.gzclose();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzgetc().then((resulit) => {
                    expect(resulit).assertEqual(1);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6300 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6400
         * @tc.name       : GzipDecompressionAbilityTest_6400
         * @tc.desc       : test gzgetc error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6400', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6400 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            await gzip.gzclose();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzgetc().then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6400 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6500
         * @tc.name       : GzipDecompressionAbilityTest_6500
         * @tc.desc       : test gzgetc error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6500', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6500 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzgetc().then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6500 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6600
         * @tc.name       : GzipDecompressionAbilityTest_6600
         * @tc.desc       : test gzrewind correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6600', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6600 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzrewind().then((resulit) => {
                    expect(resulit).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6600 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6700
         * @tc.name       : GzipDecompressionAbilityTest_6700
         * @tc.desc       : test gzrewind error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6700', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6700 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzrewind().then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6700 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6800
         * @tc.name       : GzipDecompressionAbilityTest_6800
         * @tc.desc       : test gzseek correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6800', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6800 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzseek(2, zlib.OffsetReferencePoint.SEEK_SET).then((resulit) => {
                    expect(resulit).assertEqual(2);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6800 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6900
         * @tc.name       : GzipDecompressionAbilityTest_6900
         * @tc.desc       : test gzseek correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6900', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6900 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzseek(2, zlib.OffsetReferencePoint.SEEK_CUR).then((resulit) => {
                    expect(resulit).assertEqual(2);
                })
                await gzip.gzseek(-2, zlib.OffsetReferencePoint.SEEK_CUR).then((resulit) => {
                    expect(resulit).assertEqual(0);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_6900 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7000
         * @tc.name       : GzipDecompressionAbilityTest_7000
         * @tc.desc       : test gzseek error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7000', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7000 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzseek(2, null).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzseek(null, zlib.OffsetReferencePoint.SEEK_CUR).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7000 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7100
         * @tc.name       : GzipDecompressionAbilityTest_7100
         * @tc.desc       : test gzseek error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7100', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7100 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzseek(2, undefined).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzseek(undefined, zlib.OffsetReferencePoint.SEEK_CUR).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7100 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7200
         * @tc.name       : GzipDecompressionAbilityTest_7200
         * @tc.desc       : test gzseek error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7200', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7200 Start=====");
            let gzip = zlib.createGZipSync();
            try {
                await gzip.gzseek(2, zlib.OffsetReferencePoint.SEEK_CUR).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7200 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7300
         * @tc.name       : GzipDecompressionAbilityTest_7300
         * @tc.desc       : test gzoffset correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7300', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7300 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzoffset().then((resulit) => {
                    expect(resulit).assertEqual(0);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7300 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7400
         * @tc.name       : GzipDecompressionAbilityTest_7400
         * @tc.desc       : test gzoffset error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7400', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7400 Start=====");
            let gzip = zlib.createGZipSync();
            try {
                await gzip.gzoffset().then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7400 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7500
         * @tc.name       : GzipDecompressionAbilityTest_7500
         * @tc.desc       : test gzungetc correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7500', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7500 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzread(new ArrayBuffer(1));
                await gzip.gzungetc(1).then((resulit) => {
                    expect(resulit).assertEqual(1);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7500 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7600
         * @tc.name       : GzipDecompressionAbilityTest_7600
         * @tc.desc       : test gzungetc error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7600', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7600 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzungetc(-1).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7600 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7700
         * @tc.name       : GzipDecompressionAbilityTest_7700
         * @tc.desc       : test gzungetc error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7700', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7700 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzungetc(256).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7700 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7800
         * @tc.name       : GzipDecompressionAbilityTest_7800
         * @tc.desc       : test gzungetc error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7800', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7800 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzungetc(null).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7800 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7900
         * @tc.name       : GzipDecompressionAbilityTest_7900
         * @tc.desc       : test gzungetc error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7900', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7900 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzungetc(undefined).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_7900 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8000
         * @tc.name       : GzipDecompressionAbilityTest_8000
         * @tc.desc       : test gzungetc error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8000', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8000 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzungetc(1).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8000 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8100
         * @tc.name       : GzipDecompressionAbilityTest_8100
         * @tc.desc       : test gzeof correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8100', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8100 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzeof().then((num) => {
                    expect(num).assertEqual(0);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8100 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8200
         * @tc.name       : GzipDecompressionAbilityTest_8200
         * @tc.desc       : test gzeof correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8200', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8200 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            let writeBufferWithData = new ArrayBuffer(16);
            let uint8View = new Uint8Array(writeBufferWithData);
            for (let i = 0; i < uint8View.length; i++) {
                uint8View[i] = i;
            }
            let writeNum = await gzip.gzwrite(writeBufferWithData, 16)
            expect(writeNum).assertEqual(16);
            await gzip.gzclose();
            await gzip.gzopen(allfilePath, "rb");
            let readBufferWithData = new ArrayBuffer(20);
            let readNum = await gzip.gzread(readBufferWithData);
            expect(readNum).assertEqual(16);
            let eofNum = await gzip.gzeof();
            expect(eofNum).assertEqual(1);
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8200 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8300
         * @tc.name       : GzipDecompressionAbilityTest_8300
         * @tc.desc       : test gzeof correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8300', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8300 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            let writeBufferWithData = new ArrayBuffer(16);
            let uint8View = new Uint8Array(writeBufferWithData);
            for (let i = 0; i < uint8View.length; i++) {
                uint8View[i] = i;
            }
            let writeNum = await gzip.gzwrite(writeBufferWithData, 16)
            expect(writeNum).assertEqual(16);
            await gzip.gzclose();
            await gzip.gzopen(allfilePath, "rb");
            let readBufferWithData = new ArrayBuffer(16);
            let readNum = await gzip.gzread(readBufferWithData);
            expect(readNum).assertEqual(16);
            let eofNum = await gzip.gzeof();
            expect(eofNum).assertEqual(0);
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8300 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8400
         * @tc.name       : GzipDecompressionAbilityTest_8400
         * @tc.desc       : test gzeof correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8400', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8400 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            let writeBufferWithData = new ArrayBuffer(16);
            let uint8View = new Uint8Array(writeBufferWithData);
            for (let i = 0; i < uint8View.length; i++) {
                uint8View[i] = i;
            }
            let writeNum = await gzip.gzwrite(writeBufferWithData, 16)
            expect(writeNum).assertEqual(16);
            await gzip.gzclose();
            await gzip.gzopen(allfilePath, "rb");
            let readBufferWithData = new ArrayBuffer(15);
            let readNum = await gzip.gzread(readBufferWithData);
            expect(readNum).assertEqual(15);
            let eofNum = await gzip.gzeof();
            expect(eofNum).assertEqual(0);
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8400 End=====");
        })


        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8500
         * @tc.name       : GzipDecompressionAbilityTest_8500
         * @tc.desc       : test gzclearerr correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8500', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8500 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            let writeBufferWithData = new ArrayBuffer(16);
            let uint8View = new Uint8Array(writeBufferWithData);
            for (let i = 0; i < uint8View.length; i++) {
                uint8View[i] = i;
            }
            let writeNum = await gzip.gzwrite(writeBufferWithData, 16)
            expect(writeNum).assertEqual(16);
            await gzip.gzclose();
            await gzip.gzopen(allfilePath, "rb");
            let readBufferWithData = new ArrayBuffer(20);
            let readNum = await gzip.gzread(readBufferWithData);
            expect(readNum).assertEqual(16);
            let eofNum = await gzip.gzeof();
            expect(eofNum).assertEqual(1);
            let readNum2 = await gzip.gzread(readBufferWithData);
            expect(readNum2).assertEqual(0);
            await gzip.gzclearerr();
            let eofNumClear = await gzip.gzeof();
            expect(eofNumClear).assertEqual(0);
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8500 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8600
         * @tc.name       : GzipDecompressionAbilityTest_8600
         * @tc.desc       : test gzdirect correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8600', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8600 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzdirect().then((num) => {
                    expect(num).assertEqual(0);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8600 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8700
         * @tc.name       : GzipDecompressionAbilityTest_8700
         * @tc.desc       : test gzdirect correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8700', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8700 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wT");
            try {
                await gzip.gzdirect().then((num) => {
                    expect(num).assertEqual(1);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8700 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8800
         * @tc.name       : GzipDecompressionAbilityTest_8800
         * @tc.desc       : test gzerror correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8800', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8800 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            let writeBufferWithData = new ArrayBuffer(16);
            let uint8View = new Uint8Array(writeBufferWithData);
            for (let i = 0; i < uint8View.length; i++) {
                uint8View[i] = i;
            }
            try {
                await gzip.gzwrite(writeBufferWithData, -1);
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            try {
                await gzip.gzerror().then((GzErrorOutputInfo) => {
                    expect(GzErrorOutputInfo.status).assertEqual(-3);
                    expect(GzErrorOutputInfo.statusMsg).assertContain('requested length does not fit in int');
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8800 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8900
         * @tc.name       : GzipDecompressionAbilityTest_8900
         * @tc.desc       : test gzflush correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8900', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8900 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzflush(zlib.CompressFlushMode.NO_FLUSH).then((num) => {
                    expect(num).assertEqual(zlib.ReturnStatus.OK);
                })
                await gzip.gzflush(zlib.CompressFlushMode.PARTIAL_FLUSH).then((num) => {
                    expect(num).assertEqual(zlib.ReturnStatus.OK);
                })
                await gzip.gzflush(zlib.CompressFlushMode.SYNC_FLUSH).then((num) => {
                    expect(num).assertEqual(zlib.ReturnStatus.OK);
                })
                await gzip.gzflush(zlib.CompressFlushMode.FULL_FLUSH).then((num) => {
                    expect(num).assertEqual(zlib.ReturnStatus.OK);
                })
                await gzip.gzflush(zlib.CompressFlushMode.FINISH).then((num) => {
                    expect(num).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_8900 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9000
         * @tc.name       : GzipDecompressionAbilityTest_9000
         * @tc.desc       : test gzflush error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9000', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9000 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzflush(zlib.CompressFlushMode.BLOCK).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9000 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9100
         * @tc.name       : GzipDecompressionAbilityTest_9100
         * @tc.desc       : test gzflush error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9100', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9100 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzflush(zlib.CompressFlushMode.TREES).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9100 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9200
         * @tc.name       : GzipDecompressionAbilityTest_9200
         * @tc.desc       : test gzflush error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9200', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9200 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzflush(-1).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9200 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9300
         * @tc.name       : GzipDecompressionAbilityTest_9300
         * @tc.desc       : test gzflush error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9300', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9300 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzflush(null).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9300 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9400
         * @tc.name       : GzipDecompressionAbilityTest_9400
         * @tc.desc       : test gzflush error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9400', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9400 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzflush(undefined).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9400 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9500
         * @tc.name       : GzipDecompressionAbilityTest_9500
         * @tc.desc       : test gzbuffer correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9500', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9500 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzbuffer(10000).then((num) => {
                    expect(num).assertEqual(0);
                })
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9500 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9600
         * @tc.name       : GzipDecompressionAbilityTest_9600
         * @tc.desc       : test gzbuffer error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9600', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9600 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzbuffer(null).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9600 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9700
         * @tc.name       : GzipDecompressionAbilityTest_9700
         * @tc.desc       : test gzbuffer error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9700', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9700 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzbuffer(undefined).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9700 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9800
         * @tc.name       : GzipDecompressionAbilityTest_9800
         * @tc.desc       : test gzdopen error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9800', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9800 Start=====");
            let gzip = zlib.createGZipSync();
            try {
                await gzip.gzdopen(-1, 'wb').then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800002);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9800 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9900
         * @tc.name       : GzipDecompressionAbilityTest_9900
         * @tc.desc       : test gzdopen correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9900', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9900 Start=====");
            let gzip = zlib.createGZipSync();
            try {
                await gzip.gzdopen(1, 'wb');
            } catch (errData) {
                expect().assertFail();
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_9900 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10000
         * @tc.name       : GzipDecompressionAbilityTest_10000
         * @tc.desc       : test gzerror error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10000', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10000 Start=====");
            let gzip = zlib.createGZipSync();
            try {
                await gzip.gzerror().then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10000 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10100
         * @tc.name       : GzipDecompressionAbilityTest_10100
         * @tc.desc       : test gzclosew correct return value
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10100', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10100 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzclosew().then((num) => {
                    expect(num).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10100 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10200
         * @tc.name       : GzipDecompressionAbilityTest_10200
         * @tc.desc       : test gzclosew error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10200', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10200 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzclosew().then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10200 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10300
         * @tc.name       : GzipDecompressionAbilityTest_10300
         * @tc.desc       : test gzclose error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10300', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10300 Start=====");
            let gzip = zlib.createGZipSync();
            try {
                await gzip.gzclose().then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800004);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10300 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10400
         * @tc.name       : GzipDecompressionAbilityTest_10400
         * @tc.desc       : test gzdopen error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10400', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10400 Start=====");
            let gzip = zlib.createGZipSync();
            try {
                await gzip.gzdopen(null, 'wb').then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await gzip.gzdopen(1, null).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10400 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10500
         * @tc.name       : GzipDecompressionAbilityTest_10500
         * @tc.desc       : test gzdopen error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10500', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10500 Start=====");
            try {
                await zlib.createGZip().then((gzip) => {
                    gzip.gzdopen(undefined, 'wb').then(() => {
                        expect().assertFail();
                    });
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }

            try {
                await zlib.createGZip().then((gzip) => {
                    gzip.gzdopen(1, undefined).then(() => {
                        expect().assertFail();
                    });
                });
            } catch (errData) {
                expect(errData.code).assertEqual(401);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10500 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10600
         * @tc.name       : GzipDecompressionAbilityTest_10600
         * @tc.desc       : test gzdopen error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10600', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10600 Start=====");
            try {
                await zlib.createGZip().then((gzip) => {
                    gzip.gzdopen(1, '').then(() => {
                        expect().assertFail();
                    });
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800002);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10600 End=====");
        })

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10700
         * @tc.name       : GzipDecompressionAbilityTest_10700
         * @tc.desc       : test gzbuffer error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10700', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10700 Start=====");
            let gzip = zlib.createGZipSync();
            try {
                await gzip.gzbuffer(1000).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzopen(allfilePath, "rb");
            try {
                await gzip.gzbuffer(-1).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10700 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10800
         * @tc.name       : GzipDecompressionAbilityTest_10800
         * @tc.desc       : test gzsetparams error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10800', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10800 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzsetparams(-2, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then((result) => {
                    expect(result).assertEqual(zlib.ReturnStatus.OK);
                })
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await gzip.gzclose().then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800006);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10800 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10900
         * @tc.name       : GzipDecompressionAbilityTest_10900
         * @tc.desc       : test gzsetparams error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10900', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10900 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzsetparams(zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, -2).then((result) => {
                    expect(result).assertEqual(zlib.ReturnStatus.OK);
                });
            } catch (errData) {
                expect().assertFail();
            }
            try {
                await gzip.gzclosew().then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800006);
            }
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_10900 End=====");
        });

        /**
         * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_11000
         * @tc.name       : GzipDecompressionAbilityTest_11000
         * @tc.desc       : test gzseek error code
         * @tc.size       : MEDIUM
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_11000', 0, async (done: Function) => {
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_11000 Start=====");
            let gzip = zlib.createGZipSync();
            await gzip.gzopen(allfilePath, "wb");
            try {
                await gzip.gzseek(2, -1).then(() => {
                    expect().assertFail();
                });
            } catch (errData) {
                expect(errData.code).assertEqual(17800009);
            }
            await gzip.gzclose();
            done();
            console.log("=====SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_11000 End=====");
        });
    })
}
