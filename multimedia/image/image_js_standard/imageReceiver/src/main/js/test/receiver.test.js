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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";

export default function ImageReceiver() {
    describe("ImageReceiver", function () {
        const WIDTH = 8192;
        const HEIGHT = 8;
        const CAPACITY = 8;
        const RGBA = 12;
        const Jpg_Stride = 1;
        const DEVICE_CODE = 801;
        const { JPEG: FORMATJPEG } = image.ImageFormat;
        const { JPEG } = image.ComponentType;
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

        async function sleep(times = 200) {
            await new Promise((res) =>
                setTimeout(() => {
                    res();
                }, times)
            );
        }

        async function createRecriver(done, testNum, wid, hei, fmt, cap) {
            try {
                image.createImageReceiver(wid, hei, fmt, cap);
                expect(false).assertTrue();
                done();
                return;
            } catch (error) {
                expect(error.code == 1).assertTrue();
                console.info(`${testNum} err message` + error);
                done();
                return;
            }
        }

        async function getComponentProErr(done, testNum, format, param) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, format, CAPACITY);
            let once = false;
            if (receiver == undefined) {
                expect(false).assertTrue();
                done();
                return;
            } else {
                var error = receiver.checkDeviceTest;
                if (DEVICE_CODE == error) {
                    expect(error == DEVICE_CODE).assertTrue();
                    done();
                    return;
                }
                receiver.on("imageArrival", () => {
                    if (once) {
                        return;
                    }
                    once = true;
                    receiver.readLatestImage(async (err, img) => {
                        if (img == undefined) {
                            expect(false).assertTrue();
                            done();
                            return;
                        } else {
                            expect(img.size.width == WIDTH).assertTrue();
                            expect(img.size.height == HEIGHT).assertTrue();
                            console.log(`${testNum} img.format: ${img.format}`)
                            expect(img.clipRect.size.width == WIDTH).assertTrue();
                            expect(img.clipRect.size.height == HEIGHT).assertTrue();
                            expect(img.clipRect.x == 0).assertTrue();
                            expect(img.clipRect.y == 0).assertTrue();
                            try {
                                await img.getComponent(param);
                                expect(false).assertTrue();
                                done();
                                return;
                            } catch (error) {
                                expect(error.code == 1).assertTrue();
                                console.log(`${testNum} error msg: ` + error);
                                done();
                                return;
                            }
                        }
                    });
                    expect(true).assertTrue();
                });
                var dummy = receiver.test;
            }
        }

        async function getComponentCbErr(done, testNum, format, param) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, format, CAPACITY);
            let once = false;
            if (receiver == undefined) {
                expect(false).assertTrue();
                done();
                return;
            } else {
                var error = receiver.checkDeviceTest;
                if (DEVICE_CODE == error) {
                    expect(error == DEVICE_CODE).assertTrue();
                    done();
                    return;
                }
                receiver.on("imageArrival", () => {
                    if (once) {
                        return;
                    }
                    once = true;
                    receiver.readLatestImage(async (err, img) => {
                        if (img == undefined) {
                            expect(false).assertTrue();
                            done();
                            return;
                        } else {
                            expect(img.size.width == WIDTH).assertTrue();
                            expect(img.size.height == HEIGHT).assertTrue();
                            console.log(`${testNum} img.format: ${img.format}`)
                            expect(img.clipRect.size.width == WIDTH).assertTrue();
                            expect(img.clipRect.size.height == HEIGHT).assertTrue();
                            expect(img.clipRect.x == 0).assertTrue();
                            expect(img.clipRect.y == 0).assertTrue();
                            try {
                                img.getComponent(param, (err, component) => {
                                    expect(false).assertTrue();
                                    done();
                                    return;
                                });
                            } catch (error) {
                                expect(error.code == 1).assertTrue();
                                console.log(`${testNum} error msg: ` + error);
                                done();
                                return;
                            }
                        }
                    });
                    expect(true).assertTrue();
                });
                var dummy = receiver.test;
            }
        }

        async function getComponentPromise(done, testNum, format, param, checkFormat, checkStride) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, format, CAPACITY);
            let once = false;
            if (receiver == undefined) {
                expect(false).assertTrue();
                return;
            }
            var error = receiver.checkDeviceTest;
            if (DEVICE_CODE == error) {
                expect(error == DEVICE_CODE).assertTrue();
                done();
                return;
            }
            receiver.on("imageArrival", () => {
                if (once) {
                    return;
                }
                once = true;
                receiver.readLatestImage((err, img) => {
                    if (err) {
                        expect(false).assertTrue();
                        done();
                        return;
                    } else {
                        expect(img.size.width == WIDTH).assertTrue();
                        expect(img.size.height == HEIGHT).assertTrue();
                        checkFormat(img.format);
                        expect(img.clipRect.size.width == WIDTH).assertTrue();
                        expect(img.clipRect.size.height == HEIGHT).assertTrue();
                        expect(img.clipRect.x == 0).assertTrue();
                        expect(img.clipRect.y == 0).assertTrue();
                        img.getComponent(param)
                            .then((component) => {
                                if (component == undefined) {
                                    expect(false).assertTrue();
                                    done();
                                    return;
                                }
                                expect(component.componentType == param).assertTrue();
                                expect(component.byteBuffer != undefined).assertTrue();
                                checkStride(component.rowStride, component.pixelStride);
                                done();
                                return;
                            })
                            .catch((error) => {
                                console.log(`${testNum} error:` + error);
                                expect(false).assertTrue();
                                done();
                                return;
                            });
                    }
                });
                expect(true).assertTrue();
            });
            var dummy = receiver.test;
        }

        async function getComponentCb(done, testNum, format, param, checkFormat, checkStride) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, format, CAPACITY);
            let once = false;
            if (receiver == undefined) {
                expect(false).assertTrue();
                done();
                return;
            }
            var error = receiver.checkDeviceTest;
            if (DEVICE_CODE == error) {
                expect(error == DEVICE_CODE).assertTrue();
                done();
                return;
            }
            receiver.on("imageArrival", () => {
                if (once) {
                    return;
                }
                once = true;
                receiver.readLatestImage((err, img) => {
                    if (err) {
                        expect(false).assertTrue();
                        done();
                        return;
                    } else {
                        expect(img.size.width == WIDTH).assertTrue();
                        expect(img.size.height == HEIGHT).assertTrue();
                        checkFormat(img.format);
                        expect(img.clipRect.size.width == WIDTH).assertTrue();
                        expect(img.clipRect.size.height == HEIGHT).assertTrue();
                        expect(img.clipRect.x == 0).assertTrue();
                        expect(img.clipRect.y == 0).assertTrue();
                        img.getComponent(param, (err, component) => {
                            if (err) {
                                expect(false).assertTrue();
                                console.log(`${testNum} geterror: ` + err);
                                done();
                                return;
                            } else {
                                expect(component != undefined).assertTrue();
                                expect(component.componentType == param).assertTrue();
                                expect(component.byteBuffer != undefined).assertTrue();
                                checkStride(component.rowStride, component.pixelStride);
                                done();
                                return;
                            }
                        });
                    }
                });
                expect(true).assertTrue();
            });
            var dummy = receiver.test;
        }

        async function onErr(done, testNum, param) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            expect(receiver != undefined).assertTrue();
            if (receiver == undefined) {
                expect(false).assertTrue();
                done();
                return;
            } else {
                try {
                    var error = receiver.checkDeviceTest;
                    if (DEVICE_CODE == error) {
                        expect(error == DEVICE_CODE).assertTrue();
                        done();
                        return;
                    }
                    receiver.on(param, () => {
                        expect(false).assertTrue();
                    });
                } catch (error) {
                    expect(error.code == 1).assertTrue();
                    console.log(`${testNum} error msg: ` + error);
                    done();
                    return;
                }
                var dummy = receiver.test;
            }
        }

        function isString(value) {
            return typeof value === "string";
        }

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0100
         * @tc.name      : createImageReceiver
         * @tc.desc      : 1.set width,height,format,capacity
         *                 2.create ImageReceiver
         *                 3.return ImageReceiver not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0100", 0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver == undefined) {
                expect(false).assertTrue();
                console.info("receiver_001 undefined");
                done();
                return;
            } else {
                expect(receiver.size.width == WIDTH).assertTrue();
                expect(receiver.size.height == HEIGHT).assertTrue();
                expect(receiver.capacity == CAPACITY).assertTrue();
                expect(receiver.format == FORMATJPEG).assertTrue();
                done();
                return;
            }
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0200
         * @tc.name      : createImageReceiver
         * @tc.desc      : 1.set width,height,format,capacity
         *                 2.create ImageReceiver
         *                 3.return ImageReceiver empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0200", 0, async function (done) {
            createRecriver(
                done,
                "SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0200",
                WIDTH,
                HEIGHT,
                FORMATJPEG,
                "hd!"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0100
         * @tc.name      : createImageReceiver-wrong format
         * @tc.desc      : 1.set width,height,format,capacity
         *                 2.create ImageReceiver
         *                 3.return ImageReceiver empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0100", 0, async function (done) {
            createRecriver(
                done,
                "SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0100",
                WIDTH,
                HEIGHT,
                null,
                CAPACITY
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0200
         * @tc.name      : createImageReceiver-wrong height
         * @tc.desc      : 1.set width,height,format,capacity
         *                 2.create ImageReceiver
         *                 3.return ImageReceiver empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0200", 0, async function (done) {
            createRecriver(
                done,
                "SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0200",
                WIDTH,
                null,
                FORMATJPEG,
                CAPACITY
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0300
         * @tc.name      : createImageReceiver-wrong width
         * @tc.desc      : 1.set width,height,format,capacity
         *                 2.create ImageReceiver
         *                 3.return ImageReceiver empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0300", 0, async function (done) {
            createRecriver(
                done,
                "SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0300",
                null,
                HEIGHT,
                FORMATJPEG,
                CAPACITY
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0400
         * @tc.name      : createImageReceiver-wrong capacity
         * @tc.desc      : 1.set width,height,format,capacity
         *                 2.create ImageReceiver
         *                 3.return ImageReceiver empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0400", 0, async function (done) {
            createRecriver(
                done,
                "SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0400",
                WIDTH,
                HEIGHT,
                FORMATJPEG,
                null
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0500
         * @tc.name      : createImageReceiver-wrong width
         * @tc.desc      : 1.set width,height,format,capacity
         *                 2.create ImageReceiver
         *                 3.return ImageReceiver empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0500", 0, async function (done) {
            createRecriver(
                done,
                "SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0500",
                false,
                HEIGHT,
                FORMATJPEG,
                CAPACITY
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0600
         * @tc.name      : createImageReceiver- wrong width
         * @tc.desc      : 1.set width,height,format,capacity
         *                 2.create ImageReceiver
         *                 3.return ImageReceiver empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0600", 0, async function (done) {
            createRecriver(
                done,
                "SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0600",
                { a: 10 },
                HEIGHT,
                FORMATJPEG,
                CAPACITY
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0300
         * @tc.name      : createImageReceiver
         * @tc.desc      : 1.set width,height,format,capacity
         *                 2.create ImageReceiver
         *                 3.return ImageReceiver empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0300", 0, async function (done) {
            createRecriver(
                done,
                "SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0300",
                WIDTH,
                false,
                FORMATJPEG,
                CAPACITY
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0700
         * @tc.name      : createImageReceiver- wrong format
         * @tc.desc      : 1.set width,height,format,capacity
         *                 2.create ImageReceiver
         *                 3.return ImageReceiver empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0700", 0, async function (done) {
            createRecriver(
                done,
                "SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0700",
                WIDTH,
                HEIGHT,
                "form.",
                CAPACITY
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0400
         * @tc.name      : createImageReceiver
         * @tc.desc      : 1.set width,height,format,capacity
         *                 2.create ImageReceiver
         *                 3.return ImageReceiver not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0400", 0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver == undefined) {
                expect(false).assertTrue();
                console.info("SUB_GRAPHIC_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0400 undefined");
                done();
                return;
            } else {
                expect(receiver.size.width == WIDTH).assertTrue();
                expect(receiver.size.height == HEIGHT).assertTrue();
                expect(receiver.capacity == CAPACITY).assertTrue();
                expect(receiver.format == FORMATJPEG).assertTrue();
                done();
                return;
            }
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_PROMISE_0100
         * @tc.name      : getReceivingSurfaceId-promise
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call getReceivingSurfaceId
         *                 3.return SurfaceId
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_PROMISE_0100", 0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver != undefined) {
                receiver
                    .getReceivingSurfaceId()
                    .then((id) => {
                        console.info(
                            "SUB_GRAPHIC_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_PROMISE_0100 getReceivingSurfaceId [" +
                            id +
                            "]"
                        );
                        expect(isString(id)).assertTrue();
                        done();
                        return;
                    })
                    .catch((error) => {
                        console.log("SUB_GRAPHIC_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_PROMISE_0100 error: " + error);
                        expect(false).assertTrue();
                        done();
                        return;
                    });
            } else {
                expect(false).assertTrue();
                done();
                return;
            }
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_CALLBACK_0100
         * @tc.name      : getReceivingSurfaceId-callback
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call getReceivingSurfaceId
         *                 3.return SurfaceId
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_CALLBACK_0100", 0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver != undefined) {
                receiver.getReceivingSurfaceId((err, id) => {
                    console.info(
                        "SUB_GRAPHIC_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_CALLBACK_0100 getReceivingSurfaceId call back [" +
                        id +
                        "]"
                    );
                    expect(isString(id)).assertTrue();
                    done();
                    return;
                });
            } else {
                expect(false).assertTrue();
                console.info("SUB_GRAPHIC_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_CALLBACK_0100 finished");
                done();
                return;
            }
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_RELEASE_PROMISE_0100
         * @tc.name      : release-promise
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_RELEASE_PROMISE_0100", 0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver != undefined) {
                receiver
                    .release()
                    .then(() => {
                        console.info("SUB_GRAPHIC_IMAGE_RECEIVER_RELEASE_PROMISE_0100 release ");
                        expect(true).assertTrue();
                        done();
                        return;
                    })
                    .catch((error) => {
                        expect(false).assertTrue();
                        done();
                        return;
                    });
            } else {
                expect(false).assertTrue();
                console.info("SUB_GRAPHIC_IMAGE_RECEIVER_RELEASE_PROMISE_0100 finished");
                done();
                return;
            }
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_RELEASE_CALLBACK_0100
         * @tc.name      : release-callback
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_RELEASE_CALLBACK_0100", 0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver != undefined) {
                receiver.release((err) => {
                    if (err) {
                        expect(false).assertTrue();
                        console.info("SUB_GRAPHIC_IMAGE_RECEIVER_RELEASE_CALLBACK_0100 release fail");
                        done();
                        return;
                    } else {
                        console.info("SUB_GRAPHIC_IMAGE_RECEIVER_RELEASE_CALLBACK_0100 release call back");
                        expect(true).assertTrue();
                        done();
                        return;
                    }
                });
            } else {
                expect(false).assertTrue();
                console.info("SUB_GRAPHIC_IMAGE_RECEIVER_RELEASE_CALLBACK_0100 finished");
                done();
                return;
            }
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_0100
         * @tc.name      : readLatestImage-promise
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call readLatestImage
         *                 3.return image
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_0100", 0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            var error = receiver.checkDeviceTest;
            if (DEVICE_CODE == error) {
                expect(error == DEVICE_CODE).assertTrue();
                done();
                return;
            }
            var dummy = receiver.test;
            if (receiver != undefined) {
                receiver
                    .readLatestImage()
                    .then((img) => {
                        console.info("SUB_GRAPHIC_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_0100 readLatestImage Success");
                        expect(img != undefined).assertTrue();
                        done();
                        return;
                    })
                    .catch((error) => {
                        console.log("SUB_GRAPHIC_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_0100 error: " + error);
                        expect(false).assertTrue();
                        done();
                        return;
                    });
            } else {
                expect(false).assertTrue();
                console.info("SUB_GRAPHIC_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_0100 finished");
                done();
                return;
            }
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_0100
         * @tc.name      : readLatestImage-callback
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call readLatestImage
         *                 3.return image
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_0100", 0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            var error = receiver.checkDeviceTest;
            if (DEVICE_CODE == error) {
                expect(error == DEVICE_CODE).assertTrue();
                done();
                return;
            }
            var dummy = receiver.test;
            if (receiver != undefined) {
                receiver.readLatestImage((err, img) => {
                    console.info(
                        "SUB_GRAPHIC_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_0100 readLatestImage call back Success"
                    );
                    expect(img != undefined).assertTrue();
                    done();
                    return;
                });
            } else {
                expect(false).assertTrue();
                console.info("SUB_GRAPHIC_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_0100 finished");
                done();
                return;
            }
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_0100
         * @tc.name      : readNextImage-promise
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call readNextImage
         *                 3.return image
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_0100", 0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            var error = receiver.checkDeviceTest;
            if (DEVICE_CODE == error) {
                expect(error == DEVICE_CODE).assertTrue();
                done();
                return;
            }
            var dummy = receiver.test;
            expect(receiver != undefined).assertTrue();
            if (receiver != undefined) {
                receiver
                    .readNextImage()
                    .then((img) => {
                        console.info("SUB_GRAPHIC_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_0100 readNextImage Success");
                        expect(img != undefined).assertTrue();
                        done();
                        return;
                    })
                    .catch((error) => {
                        console.log("SUB_GRAPHIC_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_0100 error: " + error);
                        expect(false).assertTrue();
                        done();
                        return;
                    });
            } else {
                expect(false).assertTrue();
                console.info("SUB_GRAPHIC_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_0100 finished");
                done();
                return;
            }
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_0100
         * @tc.name      : readNextImage-callback
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call readNextImage
         *                 3.return image
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_0100", 0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            var error = receiver.checkDeviceTest;
            if (DEVICE_CODE == error) {
                expect(error == DEVICE_CODE).assertTrue();
                done();
                return;
            }
            var dummy = receiver.test;
            if (receiver != undefined) {
                receiver.readNextImage((err, img) => {
                    if (err) {
                        expect(false).assertTrue();
                        done();
                        return;
                    } else {
                        console.info(
                            "SUB_GRAPHIC_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_0100 readNextImage call back Success"
                        );
                        expect(img != undefined).assertTrue();
                        done();
                        return;
                    }
                });
            } else {
                expect(false).assertTrue();
                console.info("SUB_GRAPHIC_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_0100 finished");
                done();
                return;
            }
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_PROMISE_JPEG_0100
         * @tc.name      : getComponent-jpeg
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         *                 3.readLatestImage
         *                 4.call getComponent
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_PROMISE_JPEG_0100", 0, async function (done) {
            function checkFormat(imgformat) {
                expect(imgformat == RGBA);
            }
            function checkStride(rowStride, pixelStride) {
                expect(rowStride == WIDTH / Jpg_Stride);
                expect(pixelStride == Jpg_Stride);
            }
            getComponentPromise(
                done,
                "SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_PROMISE_JPEG_0100",
                FORMATJPEG,
                JPEG,
                checkFormat,
                checkStride
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_CALLBACK_JPEG_0100
         * @tc.name      : getComponent-jpeg
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         *                 3.readLatestImage
         *                 4.call getComponent
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_CALLBACK_JPEG_0100", 0, async function (done) {
            function checkFormat(imgformat) {
                expect(imgformat == RGBA);
            }
            function checkStride(rowStride, pixelStride) {
                expect(rowStride == WIDTH / Jpg_Stride);
                expect(pixelStride == Jpg_Stride);
            }
            getComponentCb(
                done,
                "SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_CALLBACK_JPEG_0100",
                FORMATJPEG,
                JPEG,
                checkFormat,
                checkStride
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_RECEIVERON_0100
         * @tc.name      : on
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_RECEIVERON_0100", 0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver == undefined) {
                expect(false).assertTrue();
                done();
                return;
            } else {
                var error = receiver.checkDeviceTest;
                if (DEVICE_CODE == error) {
                    expect(error == DEVICE_CODE).assertTrue();
                    done();
                    return;
                }
                let pass = false;
                receiver.on("imageArrival", (err) => {
                    if (err) {
                        console.info("SUB_GRAPHIC_IMAGE_RECEIVER_RECEIVERON_0100 on err" + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    } else {
                        pass = true;
                        console.info("SUB_GRAPHIC_IMAGE_RECEIVER_RECEIVERON_0100 on call back IN");
                    }
                });

                var dummy = receiver.test;
                await sleep(2000);
                expect(pass).assertTrue();
                done();
                return;
            }
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_RELEASE_PROMISE_0200
         * @tc.name      : release-promise
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         *                 3.readLatestImage
         *                 4.call release
         *                 5.return the operation result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_RELEASE_PROMISE_0200", 0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver == undefined) {
                expect(false).assertTrue();
                done();
                return;
            }
            var error = receiver.checkDeviceTest;
            if (DEVICE_CODE == error) {
                expect(error == DEVICE_CODE).assertTrue();
                done();
                return;
            }
            receiver.on("imageArrival", () => {
                expect(true).assertTrue();
            });

            var dummy = receiver.test;

            receiver
                .readLatestImage()
                .then((img) => {
                    if (img == undefined) {
                        expect(false).assertTrue();
                        done();
                        return;
                    } else {
                        expect(img.size.width == WIDTH).assertTrue();
                        expect(img.size.height == HEIGHT).assertTrue();
                        expect(img.format == RGBA).assertTrue();
                        expect(img.clipRect.size.width == WIDTH).assertTrue();
                        expect(img.clipRect.size.height == HEIGHT).assertTrue();
                        expect(img.clipRect.x == 0).assertTrue();
                        expect(img.clipRect.y == 0).assertTrue();

                        img.release()
                            .then(() => {
                                expect(true).assertTrue();
                                done();
                                return;
                            })
                            .catch((error) => {
                                console.log("SUB_GRAPHIC_IMAGE_RECEIVER_RELEASE_PROMISE_0200 err" + error);
                                expect(false).assertTrue();
                                done();
                                return;
                            });
                    }
                })
                .catch((error) => {
                    console.log("SUB_GRAPHIC_IMAGE_RECEIVER_RELEASE_PROMISE_0200 readLatestImage err" + error);
                    expect(false).assertTrue();
                    done();
                    return;
                });
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_RELEASE_CALLBACK_0200
         * @tc.name      : release-callback
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         *                 3.readLatestImage
         *                 4.call release
         *                 5.return the operation result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_RELEASE_CALLBACK_0200", 0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver == undefined) {
                expect(false).assertTrue();
                done();
                return;
            }
            var error = receiver.checkDeviceTest;
            if (DEVICE_CODE == error) {
                expect(error == DEVICE_CODE).assertTrue();
                done();
                return;
            }
            receiver.on("imageArrival", () => {
                expect(true).assertTrue();
            });
            var dummy = receiver.test;
            receiver.readLatestImage((err, img) => {
                if (img == undefined) {
                    expect(false).assertTrue();
                    done();
                    return;
                }

                expect(img.size.width == WIDTH).assertTrue();
                expect(img.size.height == HEIGHT).assertTrue();
                expect(img.format == RGBA).assertTrue();
                expect(img.clipRect.size.width == WIDTH).assertTrue();
                expect(img.clipRect.size.height == HEIGHT).assertTrue();
                expect(img.clipRect.x == 0).assertTrue();
                expect(img.clipRect.y == 0).assertTrue();

                img.release((err) => {
                    if (err) {
                        expect(false).assertTrue();
                        done();
                        return;
                    } else {
                        expect(true).assertTrue();
                        done();
                        return;
                    }
                });
            });
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0100
         * @tc.name      : getComponent-wrong format
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         *                 3.readLatestImage
         *                 4.call getComponent
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0100", 0, async function (done) {
            getComponentCbErr(done, "SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0100", FORMATJPEG, null);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0200
         * @tc.name      : getComponent-wrong format
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         *                 3.readLatestImage
         *                 4.call getComponent
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0200", 0, async function (done) {
            getComponentCbErr(done, "SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0200", FORMATJPEG, "ab");
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0300
         * @tc.name      : getComponent-wrong format
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         *                 3.readLatestImage
         *                 4.call getComponent
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0300", 0, async function (done) {
            getComponentCbErr(done, "SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0300", FORMATJPEG, 0.1);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0400
         * @tc.name      : getComponent-wrong format
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         *                 3.readLatestImage
         *                 4.call getComponent
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0400", 0, async function (done) {
            getComponentCbErr(done, "SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0400", FORMATJPEG, { a: 1 });
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0500
         * @tc.name      : getComponent-wrong format
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         *                 3.readLatestImage
         *                 4.call getComponent
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0500", 0, async function (done) {
            getComponentProErr(done, "SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0500", FORMATJPEG, null);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0600
         * @tc.name      : getComponent-wrong format
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         *                 3.readLatestImage
         *                 4.call getComponent
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0600", 0, async function (done) {
            getComponentProErr(done, "SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0600", FORMATJPEG, "ab");
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0700
         * @tc.name      : getComponent-wrong format
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         *                 3.readLatestImage
         *                 4.call getComponent
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0700", 0, async function (done) {
            getComponentProErr(done, "SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0700", FORMATJPEG, 0.1);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0800
         * @tc.name      : getComponent-wrong format
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         *                 3.readLatestImage
         *                 4.call getComponent
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0800", 0, async function (done) {
            getComponentProErr(done, "SUB_GRAPHIC_IMAGE_RECEIVER_GETCOMPONENT_ERROR_0800", FORMATJPEG, { a: 1 });
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_IMAGERECEIVER_ON_ERROR_0100
         * @tc.name      : on-1
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_IMAGERECEIVER_ON_ERROR_0100", 0, async function (done) {
            onErr(done, "SUB_GRAPHIC_IMAGE_RECEIVER_IMAGERECEIVER_ON_ERROR_0100", 1);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_IMAGERECEIVER_ON_ERROR_0200
         * @tc.name      : on-null
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_IMAGERECEIVER_ON_ERROR_0200", 0, async function (done) {
            onErr(done, "SUB_GRAPHIC_IMAGE_RECEIVER_IMAGERECEIVER_ON_ERROR_0200", null);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_IMAGERECEIVER_ON_ERROR_0300
         * @tc.name      : on-{a : 1}
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_IMAGERECEIVER_ON_ERROR_0300", 0, async function (done) {
            onErr(done, "SUB_GRAPHIC_IMAGE_RECEIVER_IMAGERECEIVER_ON_ERROR_0300", { a: 1 });
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_RECEIVER_IMAGERECEIVER_ON_ERROR_0400
         * @tc.name      : on-'a'
         * @tc.desc      : 1.create ImageReceiver
         *                 2.call on
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_RECEIVER_IMAGERECEIVER_ON_ERROR_0400", 0, async function (done) {
            onErr(done, "SUB_GRAPHIC_IMAGE_RECEIVER_IMAGERECEIVER_ON_ERROR_0400", "a");
        });
    });
}
