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
import fileio from '@ohos.fileio'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import featureAbility from '@ohos.ability.featureAbility'

describe('imageExif', function () {
    let filePath;
    let fdNumber;
    let globalpixelmap;
    async function getFd(fileName) {
        let context = await featureAbility.getContext();
        await context.getFilesDir().then((data) => {
            filePath = data + '/' + fileName;
            console.info('image case filePath is ' + filePath);
        })
        await fileio.open(filePath).then((data) => {
            fdNumber = data;
            console.info("image case open fd success " + fdNumber);
        }, (err) => {
            console.info("image cese open fd fail" + err)
        }).catch((err) => {
            console.info("image case open fd err " + err);
        })
    }
    beforeAll(async function () {
        console.info('beforeAll case');
    })

    beforeEach(function () {
        console.info('beforeEach case');
    })

    afterEach(async function () {
        if (globalpixelmap != undefined) {
            await globalpixelmap.release();
        }
        await fileio.close(fdNumber).then(function(){
            console.info("close file succeed");
        }).catch(function(err){
            console.info("close file failed with error:"+ err);
        });
        console.info('afterEach case');
    })

    afterAll(async function () {
        console.info('afterAll case');
    })
 
    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0100
     * @tc.name      : getImageProperty(BitsPerSample)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(BitsPerSample)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0100', 0, async function (done) {
        await getFd('test_exif1.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0100 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("BitsPerSample")
                .then(data => {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0100 BitsPerSample ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0100 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0200
     * @tc.name      : getImageProperty(Orientation)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(Orientation)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0200', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0200 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("Orientation")
                .then(data => {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0200 Orientation ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0200 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0300
     * @tc.name      : getImageProperty(ImageLength)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageLength)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0300', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0300 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageLength")
                .then(data => {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0300 ImageLength ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0300 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0400
     * @tc.name      : getImageProperty(ImageWidth)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageWidth)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0400', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0400 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageWidth")
                .then(data => {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0400 ImageWidth ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0400 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0500
     * @tc.name      : getImageProperty(GPSLatitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitude)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0500', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0500 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitude")
                .then(data => {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0500 GPSLatitude ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0500 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0600
     * @tc.name      : getImageProperty(GPSLongitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitude)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0600', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0600 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitude")
                .then(data => {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0600 GPSLongitude ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0600 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0700
     * @tc.name      : getImageProperty(GPSLatitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitudeRef)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0700', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0700 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitudeRef")
                .then(data => {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0700 GPSLatitudeRef ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0700 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0800
     * @tc.name      : getImageProperty(GPSLongitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitudeRef)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0800', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0800 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitudeRef")
                .then(data => {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0800 GPSLongitudeRef ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0800 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0900
     * @tc.name      : getImageProperty(DateTimeOriginal)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(DateTimeOriginal)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0900', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0900 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("DateTimeOriginal")
                .then(data => {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0900 DateTimeOriginal ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0900 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0100
     * @tc.name      : getImageProperty(BitsPerSample)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(BitsPerSample)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0100', 0, async function (done) {
        await getFd('test_exif1.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0100 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("BitsPerSample", (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0100 getImageProperty BitsPerSample error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0100 BitsPerSample ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0200
     * @tc.name      : getImageProperty(Orientation)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(Orientation)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0200', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0200 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("Orientation", (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0200 getImageProperty Orientation error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0200 Orientation ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0300
     * @tc.name      : getImageProperty(ImageLength)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(ImageLength)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0300', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0300 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageLength", (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0300 getImageProperty ImageLength error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0300 ImageLength ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0400
     * @tc.name      : getImageProperty(ImageWidth)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(ImageWidth)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0400', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0400 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageWidth", (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0400 getImageProperty ImageWidth error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0400 ImageWidth ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0500
     * @tc.name      : getImageProperty(GPSLatitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLatitude)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0500', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0500 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitude", (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0500 getImageProperty GPSLatitude error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0500 GPSLatitude ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0600
     * @tc.name      : getImageProperty(GPSLongitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLongitude)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0600', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0600 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitude", (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0600 getImageProperty GPSLongitude error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0600 GPSLongitude ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0700
     * @tc.name      : getImageProperty(GPSLatitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLatitudeRef)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0700', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0700 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitudeRef", (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0700 getImageProperty GPSLatitudeRef error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0700 GPSLatitudeRef ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0800
     * @tc.name      : getImageProperty(GPSLongitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLongitudeRef)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0800', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0800 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitudeRef", (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0800 getImageProperty GPSLongitudeRef error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0800 GPSLongitudeRef ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0900
     * @tc.name      : getImageProperty(DateTimeOriginal)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(DateTimeOriginal)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0900', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0900 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("DateTimeOriginal", (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0900 getImageProperty DateTimeOriginal error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0900 DateTimeOriginal ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0100
     * @tc.name      : getImageProperty(BitsPerSample,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(BitsPerSample,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0100', 0, async function (done) {
        await getFd('test_exif1.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0100 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("BitsPerSample", property, (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0100 getImageProperty BitsPerSample error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0100 BitsPerSample ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0200
     * @tc.name      : getImageProperty(Orientation,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(Orientation,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0200', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0200 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("Orientation", property, (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0200 getImageProperty Orientation error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0200 Orientation ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0300
     * @tc.name      : getImageProperty(ImageLength,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageLength,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0300', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0300 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("ImageLength", property, (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0300 getImageProperty ImageLength error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0300 ImageLength ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0400
     * @tc.name      : getImageProperty(ImageWidth,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageWidth,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0400', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0400 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("ImageWidth", property, (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0400 getImageProperty ImageWidth error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0400 ImageWidth ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0500
     * @tc.name      : getImageProperty(GPSLatitude,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitude,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0500', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0500 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("GPSLatitude", property, (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0500 getImageProperty GPSLatitude error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0500 GPSLatitude ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0600
     * @tc.name      : getImageProperty(GPSLongitude,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitude,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0600', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0600 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("GPSLongitude", property, (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0600 getImageProperty GPSLongitude error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0600 GPSLongitude ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0700
     * @tc.name      : getImageProperty(GPSLatitudeRef,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitudeRef,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0700', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0700 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("GPSLatitudeRef", property, (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0700 getImageProperty GPSLatitudeRef error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0700 GPSLatitudeRef ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0800
     * @tc.name      : getImageProperty(GPSLongitudeRef,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitudeRef,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0800', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0800 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("GPSLongitudeRef", property, (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0800 getImageProperty GPSLongitudeRef error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0800 GPSLongitudeRef ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0900
     * @tc.name      : getImageProperty(DateTimeOriginal,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(DateTimeOriginal,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0900', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0900 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("DateTimeOriginal", property, (error, data) => {
                if (error) {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0900 getImageProperty DateTimeOriginal error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_GRAPHIC_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0900 DateTimeOriginal ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })
})