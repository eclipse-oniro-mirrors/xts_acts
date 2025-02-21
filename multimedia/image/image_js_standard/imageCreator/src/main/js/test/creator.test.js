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

import image from '@ohos.multimedia.image'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

describe('ImageCreator', function () {

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

    afterEach(function () {
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
            expect(error.code == 1).assertTrue();
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
            creator.dequeueImage().then(img => {
                if (img == undefined) {
                    expect(false).assertTrue();
                    done();
                    return
                }
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
            creator.dequeueImage().then(img => {
                if (img == undefined) {
                    expect(false).assertTrue();
                    done()
                } else {
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
    * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0100
    * @tc.name      : createImageCreator
    * @tc.desc      : 1.set width,height,format,capacity
    *                 2.create ImageCreator
    *                 3.return ImageCreator not empty
    * @tc.size      : MEDIUM 
    * @tc.type      : Functional
    * @tc.level     : Level 0
    */
    it('SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0100', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator == undefined) {
            expect(false).assertTrue();
            console.info('SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0100 undefined')
            done();
        } else {
            expect(creator.size.width == WIDTH).assertTrue();
            expect(creator.size.height == HEIGHT).assertTrue();
            expect(creator.capacity == CAPACITY).assertTrue();
            expect(creator.format == FORMAT).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0200
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0200', 0, async function (done) {
        createCreator(done, 'SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0200', WIDTH, HEIGHT, FORMAT, 'hd!');
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0300
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0300', 0, async function (done) {
        createCreator(done, 'SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0300', WIDTH, HEIGHT, null, CAPACITY);
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0400
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0400', 0, async function (done) {
        createCreator(done, 'SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0400', WIDTH, null, FORMAT, CAPACITY);
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0500
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0500', 0, async function (done) {
        createCreator(done, 'SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0500', null, HEIGHT, FORMAT, CAPACITY);
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0600
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0600', 0, async function (done) {
        createCreator(done, 'SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0600', WIDTH, HEIGHT, FORMAT, null);
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0700
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0700', 0, async function (done) {
        createCreator(done, 'SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0700', false, HEIGHT, FORMAT, CAPACITY);
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0800
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0800', 0, async function (done) {
        createCreator(done, 'SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0800', { a: 10 }, HEIGHT, FORMAT, CAPACITY);
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0900
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0900', 0, async function (done) {
        createCreator(done, 'SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_0900', WIDTH, false, FORMAT, CAPACITY);
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_1000
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_1000', 0, async function (done) {
        createCreator(done, 'SUB_GRAPHIC_IMAGE_CREATOR_CREATEIMAGECREATOR_1000', WIDTH, HEIGHT, 'form.', CAPACITY);
    })


    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_RELEASE_PROMISE_0100
     * @tc.name      : release-promise
     * @tc.desc      : 1.create ImageCreator
     *                 2.call release
     *                 3.return empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_RELEASE_PROMISE_0100', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator != undefined) {
            creator.release().then(() => {
                console.info('SUB_GRAPHIC_IMAGE_CREATOR_RELEASE_PROMISE_0100 release ');
                expect(true).assertTrue();
                done();
            }).catch(error => {
                expect(false).assertTrue();
                done();
            })
        } else {
            expect(false).assertTrue();
            console.info('SUB_GRAPHIC_IMAGE_CREATOR_RELEASE_PROMISE_0100 finished');
            done()
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_RELEASE_CALLBACK_0100
     * @tc.name      : release-callback
     * @tc.desc      : 1.create ImageCreator
     *                 2.call release
     *                 3.return empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_RELEASE_CALLBACK_0100', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator != undefined) {
            creator.release((err) => {
                if (err) {
                    console.info('SUB_GRAPHIC_IMAGE_CREATOR_RELEASE_CALLBACK_0100 release call back' + err);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info('SUB_GRAPHIC_IMAGE_CREATOR_RELEASE_CALLBACK_0100 release call back');
                expect(true).assertTrue();
                done();
            });
        } else {
            expect(false).assertTrue();
            console.info('SUB_GRAPHIC_IMAGE_CREATOR_RELEASE_CALLBACK_0100 finished');
            done()
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_0100
     * @tc.name      : dequeueImage-promise
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.return image
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_0100', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator != undefined) {
            creator.dequeueImage().then(img => {
                console.info('SUB_GRAPHIC_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_0100 dequeueImage Success');
                expect(img != undefined).assertTrue();
                done();
            }).catch(error => {
                console.log('SUB_GRAPHIC_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            })
        } else {
            expect(false).assertTrue();
            console.info('SUB_GRAPHIC_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_0100 finished');
            done();
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_0100
     * @tc.name      : dequeueImage-callback
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.return image
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_0100', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator != undefined) {
            creator.dequeueImage((err, img) => {
                if (err) {
                    console.info('SUB_GRAPHIC_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_0100 err:' + err);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info('SUB_GRAPHIC_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_0100 dequeueImage call back Success');
                expect(img != undefined).assertTrue();
                done();
            });
        } else {
            expect(false).assertTrue();
            console.info('SUB_GRAPHIC_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_0100 finished');
            done()
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0200
     * @tc.name      : queueImage-promise
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.call queueImage
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0200', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator != undefined) {
            creator.dequeueImage().then(img => {
                if (img == undefined) {
                    expect(false).assertTrue();
                    done();
                    return;
                }
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
                        console.info('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0200 queueImage Success');
                        var dummy = creator.test;
                        expect(true).assertTrue();
                        done();
                    }).catch(error => {
                        console.info('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0200 queueImage error: ' + error);
                        expect(false).assertTrue();
                        done();
                    })
                })
            })
        } else {
            expect(false).assertTrue();
            console.info('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0200 createImageCreator failed');
            done()
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0300
     * @tc.name      : queueImage-promise-1
     * @tc.desc      : 1.create ImageCreator
     *                 2.call queueImage
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0300', 0, async function (done) {
        queueImageError(done, 'SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0300', 1);
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0400
     * @tc.name      : queueImage-promise-null
     * @tc.desc      : 1.create ImageCreator
     *                 2.call queueImage
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0400', 0, async function (done) {
        queueImageError(done, 'SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0400', null);
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0500
     * @tc.name      : queueImage-promise-'a'
     * @tc.desc      : 1.create ImageCreator
     *                 2.call queueImage
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0500', 0, async function (done) {
        queueImageError(done, 'SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0500', 'a');
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0600
     * @tc.name      : on-{a : 1}
     * @tc.desc      : 1.create ImageCreator
     *                 2.call queueImage
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0600', 0, async function (done) {
        queueImageError(done, 'SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_0600', { a: 1 });
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200
     * @tc.name      : queueImage-callback
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.call queueImage
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */

    it('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator != undefined) {
            creator.dequeueImage((err, img) => {
                if (err || img == undefined) {
                    console.log('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200 dequeueImage error:' + err);
                    expect(false).assertTrue();
                    done();
                    return;
                }

                img.getComponent(JPEG, (err, component) => {
                    if (err) {
                        expect(false).assertTrue();
                        console.log('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200 getComponent error:' + err);
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
                            console.info('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200 queueImage err: ' + err);
                            expect(false).assertTrue();
                            done();
                        }
                        console.info('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200 queueImage Success');
                        var dummy = creator.test;
                        expect(true).assertTrue();
                        done();
                    })
                })
            })
        } else {
            expect(false).assertTrue();
            console.info('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0200 createImageCreator failed');
            done();
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0300
     * @tc.name      : queueImage-callback
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.call queueImage
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0300', 0, async function (done) {
        queueImageCbError(done, 'SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0300', 1);
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0400
     * @tc.name      : queueImage-callback
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.call queueImage
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0400', 0, async function (done) {
        queueImageCbError(done, 'SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0400', null);
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0500
     * @tc.name      : queueImage-callback
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.call queueImage
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0500', 0, async function (done) {
        queueImageCbError(done, 'SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0500', 'a');
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0600
     * @tc.name      : queueImage-callback
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.call queueImage
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0600', 0, async function (done) {
        queueImageCbError(done, 'SUB_GRAPHIC_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_0600', { a: 1 });
    })

    /**
        * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_ON_0100
        * @tc.name      : on
        * @tc.desc      : 1.create ImageCreator
        *                 2.call on
        *                 3.return image
        * @tc.size      : MEDIUM 
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
    it('SUB_GRAPHIC_IMAGE_CREATOR_ON_0100', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY)
        expect(creator != undefined).assertTrue();
        if (creator == undefined) {
            done()
            return;
        }
        creator.on('imageRelease', (err) => {
            if (err) {
                console.info('SUB_GRAPHIC_IMAGE_CREATOR_ON_0100 on release faild' + err);
                expect(false).assertTrue();
                done();
                return;
            }
            console.info('SUB_GRAPHIC_IMAGE_CREATOR_ON_0100 on call back IN');
            expect(true).assertTrue();
            done();
        })
        creator.dequeueImage((err, img) => {
            if (err || img == undefined) {
                console.info('SUB_GRAPHIC_IMAGE_CREATOR_ON_0100 dequeueImage fail: ' + err);
                expect(false).assertTrue();
                done();
                return;
            }
            img.getComponent(JPEG, (err, component) => {
                if (err || component == undefined) {
                    console.info('SUB_GRAPHIC_IMAGE_CREATOR_ON_0100 getComponent err:' + err);
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
                        console.info('SUB_GRAPHIC_IMAGE_CREATOR_ON_0100 queueImage failerr: ' + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info('SUB_GRAPHIC_IMAGE_CREATOR_ON_0100 queueImage Success');
                    expect(true).assertTrue();
                    var dummy = creator.test;
                })
            })
        })
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_ON_0200
     * @tc.name      : on-1
     * @tc.desc      : 1.create ImageCreator
     *                 2.call on
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_ON_0200', 0, async function (done) {
        onErr(done, 'SUB_GRAPHIC_IMAGE_CREATOR_ON_0200', 1);
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_ON_0300
     * @tc.name      : on-null
     * @tc.desc      : 1.create ImageCreator
     *                 2.call on
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_ON_0300', 0, async function (done) {
        onErr(done, 'SUB_GRAPHIC_IMAGE_CREATOR_ON_0300', null);
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_ON_0400
     * @tc.name      : on-{a : 1}
     * @tc.desc      : 1.create ImageCreator
     *                 2.call on
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_ON_0400', 0, async function (done) {
        onErr(done, 'SUB_GRAPHIC_IMAGE_CREATOR_ON_0400', { a: 1 });
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_CREATOR_ON_0500
     * @tc.name      : on-'a'
     * @tc.desc      : 1.create ImageCreator
     *                 2.call on
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_IMAGE_CREATOR_ON_0500', 0, async function (done) {
        onErr(done, 'SUB_GRAPHIC_IMAGE_CREATOR_ON_0500', 'a');
    })
})