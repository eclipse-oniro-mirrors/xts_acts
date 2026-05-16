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

import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";

export default function ImageCreator() {
    describe('ImageCreator', function () {
        let globalCreator;
        let globalImg;
        const JPEG = 4;
        const WIDTH = 8192;
        const HEIGHT = 8;
        const FORMAT = 4;
        const CAPACITY = 8;
    
        beforeAll(function () {
            console.info('beforeAll case');
        })
    
        beforeEach(function () {
            console.info('beforeEach case');
        })
    
        afterEach(async function () {
            if (globalCreator != undefined) {
                console.info("globalCreator release start");
                try {
                    await globalCreator.release();
                } catch (error) {
                    console.info("globalCreator release fail");
                }
            }
            if (globalImg != undefined) {
                console.info("globalImg release start");
                try {
                    await globalImg.release();
                } catch (error) {
                    console.info("globalImg release fail");
                }
            }
            console.info('afterEach case');
        })
    
        afterAll(function () {
            console.info('afterAll case');
        })
    
        function createCreator(done, testNum, wid, hei, fmt, cap) {
            try {
                image.createImageCreator(wid, hei, fmt, cap);
                expect(false).assertTrue();
                done();
            } catch (error) {
                expect(error.code == 401).assertTrue();
                console.info(`${testNum} err message` + error);
                done();
            }
        }
    
        async function onErr(done, testNum, param) {
            var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY)
            if (creator == undefined) {
                expect(false).assertTrue();
                done();
            } else {
                globalCreator = creator;
                try {
                    creator.on(param, (err) => {
                        expect(false).assertTrue();
                        done();
                    });
                } catch (error) {
                    expect(error.code == 1).assertTrue();
                    console.log(`${testNum} error msg: ` + error);
                    done();
                }
            }
        }
    
        async function queueImageError(done, testNum, param) {
            var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
            if (creator != undefined) {
                globalCreator = creator;
                creator.dequeueImage().then(img => {
                    if (img == undefined) {
                        expect(false).assertTrue();
                        done();
                        return
                    }
                    globalImg = img;
                    img.getComponent(JPEG, async (err, component) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.log(`${testNum} getComponent err:` + err);
                            done();
                            return;
                        }
                        expect(component.componentType == JPEG).assertTrue();
                        expect(component.byteBuffer != undefined).assertTrue();
                        var bufferArr = new Uint8Array(component.byteBuffer);
    
                        for (var i = 0; i < bufferArr.length; i += 4) {
                            bufferArr[i] = 0; //B
                            bufferArr[i + 1] = 0; //G
                            bufferArr[i + 2] = 255; //R
                            bufferArr[i + 3] = 255; //A
                        }
    
                        try {
                            await creator.queueImage(param);
                            expect(false).assertTrue();
                            done();
                        } catch (error) {
                            expect(error.code == 1).assertTrue();
                            console.log(`${testNum} error msg: ` + error);
                            done();
                        }
                    })
                }).catch(error => {
                    console.log(`${testNum} dequeue error:` + error);
                    expect(false).assertTrue();
                    done();
                })
            } else {
                console.log(`${testNum} createImageCreator: failed `);
                expect(false).assertTrue();
                done();
            }
        }
    
        async function queueImageCbError(done, testNum, param) {
            var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
            if (creator != undefined) {
                globalCreator = creator;
                creator.dequeueImage().then(img => {
                    if (img == undefined) {
                        expect(false).assertTrue();
                        done()
                    } else {
                        globalImg = img;
                        img.getComponent(JPEG, (err, component) => {
                            if (err) {
                                expect(false).assertTrue();
                                console.log(`${testNum} getComponent error:` + err);
                                done();
                                return;
                            }
                            expect(component.componentType == JPEG).assertTrue();
                            expect(component.byteBuffer != undefined).assertTrue();
                            var bufferArr = new Uint8Array(component.byteBuffer);
    
                            for (var i = 0; i < bufferArr.length; i += 4) {
                                bufferArr[i] = 0; //B
                                bufferArr[i + 1] = 0; //G
                                bufferArr[i + 2] = 255; //R
                                bufferArr[i + 3] = 255; //A
                            }
    
                            try {
                                creator.queueImage(param, (err) => {
                                    expect(false).assertTrue();
                                    done();
                                })
                            } catch (error) {
                                expect(error.code == 1).assertTrue();
                                console.log(`${testNum} error msg: ` + error);
                                done();
                            }
                        })
                    }
                }).catch(error => {
                    console.log(`${testNum} dequeue error:` + error);
                    expect(false).assertTrue();
                    done();
                })
            } else {
                console.log(`${testNum} createImageCreator: failed `);
                expect(false).assertTrue();
                done();
            }
        }
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0100
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0100', Level.LEVEL0, async function (done) {
            var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
            if (creator == undefined) {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0100 undefined')
                done();
            } else {
                globalCreator = creator;
                expect(creator.size.width == WIDTH).assertTrue();
                expect(creator.size.height == HEIGHT).assertTrue();
                expect(creator.capacity == CAPACITY).assertTrue();
                expect(creator.format == FORMAT).assertTrue();
                done();
            }
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0200
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0200', Level.LEVEL0, async function (done) {
            createCreator(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0200', WIDTH, HEIGHT, FORMAT, 'hd!');
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0300
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0300', Level.LEVEL0, async function (done) {
            createCreator(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0300', WIDTH, HEIGHT, null, CAPACITY);
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0400
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0400', Level.LEVEL0, async function (done) {
            createCreator(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0400', WIDTH, null, FORMAT, CAPACITY);
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0500
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0500', Level.LEVEL0, async function (done) {
            createCreator(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0500', null, HEIGHT, FORMAT, CAPACITY);
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0600
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0600', Level.LEVEL0, async function (done) {
            createCreator(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0600', WIDTH, HEIGHT, FORMAT, null);
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0700
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0700', Level.LEVEL0, async function (done) {
            createCreator(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0700', false, HEIGHT, FORMAT, CAPACITY);
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0800
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0800
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0800', Level.LEVEL0, async function (done) {
            createCreator(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0800', { a: 10 }, HEIGHT, FORMAT, CAPACITY);
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0900
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0900
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0900', Level.LEVEL0, async function (done) {
            createCreator(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_0900', WIDTH, false, FORMAT, CAPACITY);
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_1000
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_1000
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_1000', Level.LEVEL0, async function (done) {
            createCreator(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_CREATEIMAGECREATOR_1000', WIDTH, HEIGHT, 'form.', CAPACITY);
        })
    
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_PROMISE_0100
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_PROMISE_0100', Level.LEVEL0, async function (done) {
            var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
            if (creator != undefined) {
                globalCreator = creator;
                creator.release().then(() => {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_PROMISE_0100 release ');
                    done();
                }).catch(error => {
                    expect(false).assertTrue();
                    done();
                })
            } else {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_PROMISE_0100 finished');
                done()
            }
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_CALLBACK_0100
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_CALLBACK_0100', Level.LEVEL0, async function (done) {
            var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
            if (creator != undefined) {
                globalCreator = creator;
                creator.release((err) => {
                    if (err) {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_CALLBACK_0100 release call back' + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_CALLBACK_0100 release call back');
                    done();
                });
            } else {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_CALLBACK_0100 finished');
                done()
            }
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_0100
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_0100', Level.LEVEL0, async function (done) {
            var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
            if (creator != undefined) {
                globalCreator = creator;
                creator.dequeueImage().then(img => {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_0100 dequeueImage Success');
                    expect(img != undefined).assertTrue();
                    globalImg = img;
                    done();
                }).catch(error => {
                    console.log('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_0100 error: ' + error);
                    expect(false).assertTrue();
                    done();
                })
            } else {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_0100 finished');
                done();
            }
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_0100
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_0100', Level.LEVEL0, async function (done) {
            var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
            if (creator != undefined) {
                globalCreator = creator;
                creator.dequeueImage((err, img) => {
                    if (err) {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_0100 err:' + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    globalImg = img;
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_0100 dequeueImage call back Success');
                    expect(img != undefined).assertTrue();
                    done();
                });
            } else {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_0100 finished');
                done()
            }
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0200
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0200', Level.LEVEL0, async function (done) {
            var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
            if (creator != undefined) {
                globalCreator = creator;
                creator.dequeueImage().then(img => {
                    if (img == undefined) {
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    globalImg = img;
                    img.getComponent(JPEG, (err, component) => {
                        if (err) {
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        expect(component.componentType == JPEG).assertTrue();
                        expect(component.byteBuffer != undefined).assertTrue();
                        var bufferArr = new Uint8Array(component.byteBuffer);
    
                        for (var i = 0; i < bufferArr.length; i += 4) {
                            bufferArr[i] = 0; //B
                            bufferArr[i + 1] = 0; //G
                            bufferArr[i + 2] = 255; //R
                            bufferArr[i + 3] = 255; //A
                        }
                        console.info("this is img " + img);
    
                        creator.queueImage(img).then(() => {
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0200 queueImage Success');
                            creator.test;
                            done();
                        }).catch(error => {
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0200 queueImage error: ' + error);
                            expect(false).assertTrue();
                            done();
                        })
                    })
                })
            } else {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0200 createImageCreator failed');
                done()
            }
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0300
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0300', Level.LEVEL0, async function (done) {
            queueImageError(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0300', 1);
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0400
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0400', Level.LEVEL0, async function (done) {
            queueImageError(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0400', null);
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0500
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0500', Level.LEVEL0, async function (done) {
            queueImageError(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0500', 'a');
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0600
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0600', Level.LEVEL0, async function (done) {
            queueImageError(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0600', { a: 1 });
        })
    
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200
         * @tc.desc   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200', Level.LEVEL0, async function (done) {
            var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
            if (creator != undefined) {
                globalCreator = creator;
                creator.dequeueImage((err, img) => {
                    if (err || img == undefined) {
                        console.log('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200 dequeueImage error:' + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    globalImg = img;
                    img.getComponent(JPEG, (err, component) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.log('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200 getComponent error:' + err);
                            done();
                            return;
                        }
                        expect(component.componentType == JPEG).assertTrue();
                        expect(component.byteBuffer != undefined).assertTrue();
                        var bufferArr = new Uint8Array(component.byteBuffer);
    
                        for (var i = 0; i < bufferArr.length; i += 4) {
                            bufferArr[i] = 0; //B
                            bufferArr[i + 1] = 0; //G
                            bufferArr[i + 2] = 255; //R
                            bufferArr[i + 3] = 255; //A
                        }
                        console.info("this is img " + img);
                        creator.queueImage(img, (err) => {
                            if (err) {
                                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200 queueImage err: ' + err);
                                expect(false).assertTrue();
                                done();
                            }
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200 queueImage Success');
                            creator.test;
                            done();
                        })
                    })
                })
            } else {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200 createImageCreator failed');
                done();
            }
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0300
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0300', Level.LEVEL0, async function (done) {
            queueImageCbError(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0300', 1);
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0400
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0400', Level.LEVEL0, async function (done) {
            queueImageCbError(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0400', null);
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0500
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0500', Level.LEVEL0, async function (done) {
            queueImageCbError(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0500', 'a');
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0600
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0600', Level.LEVEL0, async function (done) {
            queueImageCbError(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0600', { a: 1 });
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0100
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0100', Level.LEVEL0, async function (done) {
            var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY)
            expect(creator != undefined).assertTrue();
            if (creator == undefined) {
                done()
                return;
            }
            globalCreator = creator;
            creator.on('imageRelease', (err) => {
                if (err) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0100 on release faild' + err);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0100 on call back IN');
                done();
            })
            creator.dequeueImage((err, img) => {
                if (err || img == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0100 dequeueImage fail: ' + err);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                globalImg = img;
                img.getComponent(JPEG, (err, component) => {
                    if (err || component == undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0100 getComponent err:' + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    expect(component.componentType == JPEG).assertTrue();
                    expect(component.byteBuffer != undefined).assertTrue();
                    var bufferArr = new Uint8Array(component.byteBuffer);
                    for (var i = 0; i < bufferArr.length; i += 4) {
                        bufferArr[i] = 0; //B
                        bufferArr[i + 1] = 0; //G
                        bufferArr[i + 2] = 255; //R
                        bufferArr[i + 3] = 255; //A
                    }
                    creator.queueImage(img, (err) => {
                        if (err) {
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0100 queueImage failerr: ' + err);
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0100 queueImage Success');
                        creator.test;
                    })
                })
            })
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0200
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0200', Level.LEVEL0, async function (done) {
            onErr(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0200', 1);
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0300
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0300', Level.LEVEL0, async function (done) {
            onErr(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0300', null);
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0400
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0400', Level.LEVEL0, async function (done) {
            onErr(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0400', { a: 1 });
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0500
         * @tc.desc   1.create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0500', Level.LEVEL0, async function (done) {
            onErr(done, 'SUB_MULTIMEDIA_IMAGE_CREATOR_ON_0500', 'a');
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_SUCCESS_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_SUCCESS_0100
         * @tc.desc   1.Create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_SUCCESS_0100', Level.LEVEL0, async function (done) {
            console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_SUCCESS_0100 start');
            let size = {height: HEIGHT, width: WIDTH}
            var creator = image.createImageCreator(size, image.ImageFormat.JPEG, CAPACITY);
            expect(creator != undefined).assertTrue();
            if (creator == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_SUCCESS_0100 create image creator failed');
                done();
                return;
            }
            globalCreator = creator;
            let ret = creator.off('imageRelease');
            if (ret == undefined) {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_SUCCESS_0100 off failed');
                done();
                return;
            } else {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_SUCCESS_0100 off success');
                done();
                return;
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_ERROR_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_ERROR_0200
         * @tc.desc   1.Create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_ERROR_0200', Level.LEVEL0, async function (done) {
            console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_ERROR_0200 start');
            let size = {height: HEIGHT, width: WIDTH}
            var creator = image.createImageCreator(size, image.ImageFormat.JPEG, CAPACITY);
            expect(creator != undefined).assertTrue();
            if (creator == undefined) {
                expect(false).assertTrue();
                done();
                return;
            } else {
                globalCreator = creator;
                try {
                    creator.off('a');
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_ERROR_0200 off failed');
                    done();
                } catch (error) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_ERROR_0200 error: ' + JSON.stringify(error));
                    expect(error.code == 1).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_ON_AND_OFF_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_ON_AND_OFF_0300
         * @tc.desc   1.Create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_AND_OFF_0300', Level.LEVEL0, async function (done) {
            console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_AND_OFF_0300 start');
            let size = {height: HEIGHT, width: WIDTH}
            var creator = image.createImageCreator(size, image.ImageFormat.JPEG, CAPACITY);
            if (creator == undefined) {
                expect(creator != undefined).assertTrue();
                done()
                return;
            } else{
                globalCreator = creator;
                let pass = true;
                creator.on('imageRelease', (err) => {
                    if (err) {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_AND_OFF_0300 on faild' + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    } else {
                        pass = false;
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_AND_OFF_0300 on call back IN');
                        creator.dequeueImage((err, img) => {
                            if (err || img == undefined) {
                                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_AND_OFF_0300 dequeueImage fail: ' + err);
                                expect(false).assertTrue();
                                done();
                                return;
                            }
                            globalImg = img;
                            console.info("SUB_MULTIMEDIA_IMAGE_CREATOR_ON_AND_OFF_0300 Img Size Height: " + img.size.height);
                            console.info("SUB_MULTIMEDIA_IMAGE_CREATOR_ON_AND_OFF_0300 Img Size Width: " + img.size.width);
                        })
                    }
                })
                creator.off("imageRelease");
                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_AND_OFF_0300 off success');
                creator.test;
                expect(pass).assertTrue();
                done();
                return;
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_AND_ON_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_AND_ON_0400
         * @tc.desc   1.Create ImageCreator
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_AND_ON_0400', Level.LEVEL0, async function (done) {
            console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_AND_ON_0400 start');
            let size = {height: HEIGHT, width: WIDTH}
            var creator = image.createImageCreator(size, image.ImageFormat.JPEG, CAPACITY);
            if (creator == undefined) {
                expect(creator != undefined).assertTrue();
                done()
                return;
            } else{
                globalCreator = creator;
                let pass = false;
                creator.off("imageRelease");
                creator.on('imageRelease', (err) => {
                    if (err) {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_AND_ON_0400 on faild' + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    } else {
                        pass = true;
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_AND_ON_0400 on call back IN');
                        creator.dequeueImage((err, img) => {
                            if (err || img == undefined) {
                                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_AND_ON_0400 dequeueImage fail: ' + err);
                                expect(false).assertTrue();
                                done();
                                return;
                            }
                            globalImg = img;
                            console.info("SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_AND_ON_0400 Img Size Height: " + img.size.height);
                            console.info("SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_AND_ON_0400 Img Size Width: " + img.size.width);
                            expect(pass).assertTrue();
                            done();
                            return;
                        })
                    }
                })
                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_AND_ON_0400 creator.test;');
                creator.test;
            }
        })
    })
}
