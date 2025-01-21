/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index";
import { testPng } from "./testImg";

export default function addImage() {
    describe("addImage", function () {
        const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
        beforeAll(async function () {
            console.info("beforeAll case");
        });

        beforeEach(function () {
            console.info("beforeEach case");
        });

        afterEach(async function () {
            console.info("afterEach case");
        });

        afterAll(async function () {
            console.info("afterAll case");
        });

        function createPixMapPromise(done, testNum, opts) {
            const Color = new ArrayBuffer(96);
            image
                .createPixelMap(Color, opts)
                .then((pixelmap) => {
                    expect(pixelmap != undefined).assertTrue();
                    console.info(`${testNum} success`);
                    done();
                })
                .catch((error) => {
                    console.log(`${testNum} error: ` + error);
                    expect(false).assertTrue();
                    done();
                });
        }

        function createPixMapCb(done, testNum, opts) {
            const Color = new ArrayBuffer(96);
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                expect(pixelmap != undefined).assertTrue();
                console.info(`${testNum} success`);
                done();
            });
        }

        async function createIncrementalSourcePromise(done, testNum, type, opts) {
            let testimagebuffer = testPng;
            let incSouce;
            console.info(`${testNum} 0001 ` + testimagebuffer.length);
            let bufferSize = 5000;
            let offset = 0;
            if (type == "sourceOpts") {
                console.info(`${testNum} have sourceopts`);
                incSouce = image.CreateIncrementalSource(new ArrayBuffer(1), opts);
            } else {
                console.info(`${testNum} no sourceopts`);
                incSouce = image.CreateIncrementalSource(new ArrayBuffer(1));
            }
            let ret;
            let isFinished = false;
            while (offset < testimagebuffer.length) {
                var oneStep = testimagebuffer.slice(offset, offset + bufferSize);
                console.info(`${testNum} 0002 ` + oneStep.length);
                if (oneStep.length < bufferSize) {
                    isFinished = true;
                }
                ret = await incSouce.updateData(oneStep, isFinished, 0, oneStep.length);
                if (!ret) {
                    console.info(`${testNum} updateData failed`);
                    expect(ret).assertTrue();
                    break;
                }
                offset = offset + oneStep.length;
                console.info(`${testNum} 0003 ` + offset);
            }
            if (ret) {
                console.info(`${testNum} updateData success `);
                let decodingOptions = {
                    sampleSize: 1,
                };
                incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(`${testNum} createPixelMap err: ` + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum} 0004` + pixelmap);
                    expect(pixelmap != undefined).assertTrue();
                    done();
                });
            } else {
                expect(false).assertTrue();
                done();
            }
        }

        async function createIncrementalSourceCb(done, testNum, type, opts) {
            let testimagebuffer = testPng;
            let incSouce;
            console.info(`${testNum} 0001 ` + testimagebuffer.length);
            let bufferSize = 5000;
            let offset = 0;
            if (type == "sourceOpts") {
                incSouce = image.CreateIncrementalSource(new ArrayBuffer(1), opts);
            } else {
                incSouce = image.CreateIncrementalSource(new ArrayBuffer(1));
            }
            let ret;
            let isFinished = false;
            while (offset < testimagebuffer.length) {
                var oneStep = testimagebuffer.slice(offset, offset + bufferSize);
                console.info(`${testNum} 0002 ` + oneStep.length);
                if (oneStep.length < bufferSize) {
                    isFinished = true;
                }
                ret = await new Promise((res) => {
                    incSouce.updateData(oneStep, isFinished, 0, oneStep.length, (err, ret) => {
                        res(ret);
                    });
                });

                if (!ret) {
                    console.info(`${testNum} updateData failed`);
                    expect(ret).assertTrue();
                    break;
                }
                offset = offset + oneStep.length;
                console.info(`${testNum} 0003 ` + offset);
            }
            if (ret) {
                console.info(`${testNum} updateData success `);
                let decodingOptions = {
                    sampleSize: 1,
                };
                incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(`${testNum} createPixelMap err: ` + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum} 0004` + pixelmap);
                    expect(pixelmap != undefined).assertTrue();
                    done();
                });
            } else {
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_PROMISE_0100
         * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 1, alphaType: 0)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_PROMISE_0100", 0, async function (done) {
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 1, alphaType: 0 };
            createPixMapPromise(done, "SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_PROMISE_0100", opts);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_PROMISE_0200
         * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 1, alphaType: 1)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_PROMISE_0200", 0, async function (done) {
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 1, alphaType: 1 };
            createPixMapPromise(done, "SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_PROMISE_0200", opts);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_PROMISE_0300
         * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 0, alphaType: 2)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_PROMISE_0300", 0, async function (done) {
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 0, alphaType: 2 };
            createPixMapPromise(done, "SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_PROMISE_0300", opts);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_PROMISE_0400
         * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 0, alphaType: 3)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_PROMISE_0400", 0, async function (done) {
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 0, alphaType: 3 };
            createPixMapPromise(done, "SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_PROMISE_0400", opts);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_CALLBACK_0100
         * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 0, alphaType: 0)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_CALLBACK_0100", 0, async function (done) {
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 0, alphaType: 0 };
            createPixMapCb(done, "SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_CALLBACK_0100", opts);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_CALLBACK_0200
         * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 0, alphaType: 1)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_CALLBACK_0200", 0, async function (done) {
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 0, alphaType: 1 };
            createPixMapCb(done, "SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_CALLBACK_0200", opts);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_CALLBACK_0300
         * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 1, alphaType: 2)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_CALLBACK_0300", 0, async function (done) {
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 1, alphaType: 2 };
            createPixMapCb(done, "SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_CALLBACK_0300", opts);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_CALLBACK_0400
         * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 1, alphaType: 3)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_CALLBACK_0400", 0, async function (done) {
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 1, alphaType: 3 };
            createPixMapCb(done, "SUB_GRAPHIC_IMAGE_CREATEPIXELMAP_CALLBACK_0400", opts);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_0100
         * @tc.name      : createIncrementalSource-updateData-png-promise
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_0100", 0, async function (done) {
            createIncrementalSourcePromise(
                done,
                "SUB_GRAPHIC_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_0100",
                "noSourceOpts"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_0200
         * @tc.name      : createIncrementalSource-updateData-png-promise
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_0200", 0, async function (done) {
            let opts = { sourceDensity: 240, pixelFormat: RGBA_8888, size: { height: 4, width: 6 } };
            createIncrementalSourcePromise(
                done,
                "SUB_GRAPHIC_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_0200",
                "sourceOpts",
                opts
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_0100
         * @tc.name      : createIncrementalSource-updateData-png-callback
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_0100", 0, async function (done) {
            createIncrementalSourceCb(
                done,
                "SUB_GRAPHIC_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_0100",
                "noSourceOpts"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_0200
         * @tc.name      : createIncrementalSource-updateData-png-callback
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_0200", 0, async function (done) {
            let opts = { sourceDensity: 240, pixelFormat: RGBA_8888, size: { height: 4, width: 6 } };
            createIncrementalSourceCb(
                done,
                "SUB_GRAPHIC_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_0200",
                "sourceOpts",
                opts
            );
        });
    });
}
