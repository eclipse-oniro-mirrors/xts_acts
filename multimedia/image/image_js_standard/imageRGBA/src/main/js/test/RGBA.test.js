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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index";

describe("Image", function () {
    const { RGBA_F16, BGRA_8888, ALPHA_8, RGB_565, ARGB_8888, UNKNOWN, RGB_888 } = image.PixelMapFormat;

    beforeAll(function () {
        console.info("beforeAll case");
    });

    beforeEach(function () {
        console.info("beforeEach case");
    });

    afterEach(function () {
        console.info("afterEach case");
    });

    afterAll(function () {
        console.info("afterAll case");
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0100
     * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_F16,
     *                                          size: { height: 4, width: 6 }, bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0100", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: RGBA_F16, size: { height: 4, width: 6 } };
        image
            .createPixelMap(Color, opts)
            .then((pixelmap) => {
                expect(pixelmap != undefined).assertTrue();
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                done();
            })
            .catch((error) => {
                console.log("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0100 err" + error);
                expect(false).assertTrue();
                done();
            });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0100
     * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGBA_F16,
     *                                           size: { height: 4, width: 6 },bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0100", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: RGBA_F16, size: { height: 4, width: 6 } };
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err != undefined) {
                console.info("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0100 err: " + err);
                expect(false).assertTrue();
                done();
                return;
            }
            expect(pixelmap != undefined).assertTrue();
            expect(pixelmap.isEditable == opts.editable).assertTrue();
            done();
        });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0200
     * @tc.name      : create pixelmap-promise (editable: false, pixelFormat: RGBA_F16,
     *                                          size: { height: 4, width: 6 }, bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0200", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: false, pixelFormat: RGBA_F16, size: { height: 4, width: 6 } };
        image
            .createPixelMap(Color, opts)
            .then((pixelmap) => {
                expect(pixelmap != undefined).assertTrue();
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                done();
            })
            .catch((error) => {
                console.log("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0200 err" + error);
                expect(false).assertTrue();
                done();
            });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0200
     * @tc.name      : create pixelmap-callback (editable: false, pixelFormat: RGBA_F16,
     *                                           size: { height: 4, width: 6 },bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0200", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: false, pixelFormat: RGBA_F16, size: { height: 4, width: 6 } };
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err != undefined) {
                console.info("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0200 err: " + err);
                expect(false).assertTrue();
                done();
                return;
            }
            expect(pixelmap != undefined).assertTrue();
            expect(pixelmap.isEditable == opts.editable).assertTrue();
            done();
        });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0300
     * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: ALPHA_8,
     *                                          size: { height: 4, width: 6 }, bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0300", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: ALPHA_8, size: { height: 4, width: 6 } };
        image
            .createPixelMap(Color, opts)
            .then((pixelmap) => {
                expect(pixelmap != undefined).assertTrue();
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                done();
            })
            .catch((error) => {
                console.log("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0300 err" + error);
                expect(false).assertTrue();
                done();
            });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0400
     * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGB_565,
     *                                          size: { height: 4, width: 6 }, bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0400", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: RGB_565, size: { height: 4, width: 6 } };
        image
            .createPixelMap(Color, opts)
            .then((pixelmap) => {
                expect(pixelmap != undefined).assertTrue();
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                done();
            })
            .catch((error) => {
                console.log("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0400 err" + error);
                expect(false).assertTrue();
                done();
            });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0500
     * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: ARGB_8888,
     *                                          size: { height: 4, width: 6 }, bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0500", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: ARGB_8888, size: { height: 4, width: 6 } };
        image
            .createPixelMap(Color, opts)
            .then((pixelmap) => {
                expect(pixelmap != undefined).assertTrue();
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                done();
            })
            .catch((error) => {
                console.log("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0500 err" + error);
                expect(false).assertTrue();
                done();
            });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0300
     * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: ALPHA_8,
     *                                           size: { height: 4, width: 6 },bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0300", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: ALPHA_8, size: { height: 4, width: 6 } };
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err != undefined) {
                console.info("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0300 err: " + err);
                expect(false).assertTrue();
                done();
                return;
            }
            expect(pixelmap != undefined).assertTrue();
            expect(pixelmap.isEditable == opts.editable).assertTrue();
            done();
        });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0400
     * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGB_565,
     *                                           size: { height: 4, width: 6 },bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0400", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: RGB_565, size: { height: 4, width: 6 } };
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err != undefined) {
                console.info("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0400 err: " + err);
                expect(false).assertTrue();
                done();
                return;
            }
            expect(pixelmap != undefined).assertTrue();
            expect(pixelmap.isEditable == opts.editable).assertTrue();
            done();
        });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0500
     * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: ARGB_8888,
     *                                           size: { height: 4, width: 6 },bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0500", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: ARGB_8888, size: { height: 4, width: 6 } };
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err != undefined) {
                console.info("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0500 err: " + err);
                expect(false).assertTrue();
                done();
                return;
            }
            expect(pixelmap != undefined).assertTrue();
            expect(pixelmap.isEditable == opts.editable).assertTrue();
            done();
        });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0600
     * @tc.name      : create pixelmap-callback(editable: true, pixelFormat: unkonwn, size: { height: -1, width: 8 })
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0600", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: UNKNOWN, size: { height: -1, width: 8 } };
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err) {
                console.info("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0600 err: " + err);
                expect(pixelmap == undefined).assertTrue();
                console.info("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0600 pass");
                done();
            } else {
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0700
     * @tc.name      : create pixelmap-callback(editable: true, pixelFormat: ARGB_8888, size: { height: 6, width: -1 })
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0700", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: ARGB_8888, size: { height: 6, width: -1 } };
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err) {
                console.info("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0700 err: " + err);
                expect(pixelmap == undefined).assertTrue();
                console.info("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0700 pass");
                done();
            } else {
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0600
     * @tc.name      : create pixelmap-promise(editable: true, pixelFormat: unkonwn, size: { height: -1, width: 8 })
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0600", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: UNKNOWN, size: { height: -1, width: 8 } };
        image
            .createPixelMap(Color, opts)
            .then((pixelmap) => {
                expect(false).assertTrue();
                console.info("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0600 failed");
                done();
            })
            .catch((error) => {
                console.log("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0600 err: " + error);
                expect(true).assertTrue();
                done();
            });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0700
     * @tc.name      : create pixelmap-promise(editable: true, pixelFormat: unkonwn, size: { height: 6, width: -1 })
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0700", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: UNKNOWN, size: { height: 6, width: -1 } };
        image
            .createPixelMap(Color, opts)
            .then((pixelmap) => {
                expect(false).assertTrue();
                console.info("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0700 failed");
                done();
            })
            .catch((error) => {
                console.log("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0700 error: " + error);
                expect(true).assertTrue();
                done();
            });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0800
     * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: BGRA_8888,
     *                                          size: { height: 4, width: 6 }, bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0800", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: BGRA_8888, size: { height: 4, width: 6 } };
        image
            .createPixelMap(Color, opts)
            .then((pixelmap) => {
                console.log("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0800 pixelFormat: BGRA_8888  ");
                expect(pixelmap != undefined).assertTrue();
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                done();
            })
            .catch((error) => {
                console.log("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0800 err: " + error);
                expect(false).assertTrue();
                done();
            });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0900
     * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGB_888 ,
     *                                          size: { height: 4, width: 6 }, bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0900", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: RGB_888, size: { height: 4, width: 6 } };
        image
            .createPixelMap(Color, opts)
            .then((pixelmap) => {
                expect(pixelmap != undefined).assertTrue();
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                done();
            })
            .catch((error) => {
                console.log("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_PROMISE_0900 err: " + error);
                expect(false).assertTrue();
                done();
            });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0800
     * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: BGRA_8888,
     *                                           size: { height: 4, width: 6 },bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0800", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: BGRA_8888, size: { height: 4, width: 6 } };
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err != undefined) {
                console.log("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0800 err: " + err);
                expect(false).assertTrue();
                done();
                return;
            }
            expect(pixelmap != undefined).assertTrue();
            expect(pixelmap.isEditable == opts.editable).assertTrue();
            done();
        });
    });

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0900
     * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGB_888,
     *                                           size: { height: 4, width: 6 },bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_GRAPHIC_IMAGE_RGBA_CREATE_PIXELMAP_CALLBACK_0900", 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: RGB_888, size: { height: 4, width: 6 } };
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err != undefined) {
                expect(false).assertTrue();
                done();
                return;
            }
            expect(pixelmap != undefined).assertTrue();
            expect(pixelmap.isEditable == opts.editable).assertTrue();
            done();
        });
    });
});
