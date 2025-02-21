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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { iccbuf } from './testImg2'

export default function imageColorSpace() {
describe('imageColorSpace', function () {
    beforeAll(async function () {
        console.info('beforeAll case');
    })

    beforeEach(function () {
        console.info('beforeEach case');
    })

    afterEach(async function () {
        console.info('afterEach case');
    })

    afterAll(async function () {
        console.info('afterAll case');
    })

    function genPicSource() {
        var data = iccbuf.buffer;
        return image.createImageSource(data);
    }

    function loger(caseName) {
        return {
            myName: caseName,
            log:function(msg) {
                console.info(this.myName+ ' ' + msg);
            }
        }
    }

    async function packingCbFail(done, testNum, args){
        let logger = loger(`${testNum}`)
        try {
            let imageSource = genPicSource();
            logger.log("ImageSource " + (imageSource != undefined));
            if (imageSource == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            }else{
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                console.info(`${testNum} create image packer failed`);
                expect(false).assertTrue();
                done();
            }else{
                imagePackerApi.packing(imageSource, args, (err, data) => {
                    expect(data == undefined).assertTrue();
                    done();
                })
            }
        }
    } catch (error) {
            logger.log('failed ' + error);
            expect(false).assertTrue();
            done();
        }
     }
    
     async function packingPromiseFail(done, testNum, args) {
        let logger = loger(`testNum`)
        try {
            let imageSource = genPicSource();
            logger.log("ImageSource " + (imageSource != undefined));
            if (imageSource == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            }else{
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                console.info(`${testNum} create image packer failed`);
                expect(false).assertTrue();
                done();
            }else{
                imagePackerApi.packing(imageSource, args).then(data => {
                    expect(data == undefined).assertTrue();
                    done();
                }).catch(error => {
                    console.log(` ${testNum} error: ` + error);
                    expect(true).assertTrue();
                    done();
                })
            }
        }
    } catch (error) {
            logger.log('failed ' + error);
            expect(false).assertTrue();
            done();
        }
    } 

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_COLORSPACE_DECODE_0100
     * @tc.name      : Decode 
     * @tc.desc      : 1.create imagesource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_COLORSPACE_DECODE_0100', 0, async function (done) {
        let logger = loger('SUB_GRAPHIC_IMAGE_COLORSPACE_DECODE_0100')
        try {
            let imageSource = genPicSource();
            logger.log("ImageSource " + (imageSource != undefined));
            if (imageSource != undefined) {
                let pixelMap =  await imageSource.createPixelMap();
                logger.log("PixelMap " + pixelMap);
                logger.log("PixelMap " + (pixelMap != undefined));
                expect(pixelMap != undefined ).assertTrue();
                done();
            }
        } catch (error) {
            logger.log('failed ' + error);
            expect(false).assertTrue();
            done();
        }
        
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_COLORSPACE_DECODE_CALLBACK_0100
     * @tc.name      : Decode -callback
     * @tc.desc      : 1.create imagesource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_COLORSPACE_DECODE_CALLBACK_0100', 0, async function (done) {
        let logger = loger('SUB_GRAPHIC_IMAGE_COLORSPACE_DECODE_CALLBACK_0100')
        try {
            let imageSource = genPicSource();
            logger.log("ImageSource " + (imageSource != undefined));
            if (imageSource != undefined) {
                imageSource.createPixelMap((err,pixelMap)=>{
                    logger.log("PixelMap " + pixelMap);
                    logger.log("PixelMap " + (pixelMap != undefined));
                    expect(pixelMap != undefined ).assertTrue();
                    done();
                })
            }
        } catch (error) {
            logger.log('failed ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_0100
     * @tc.name      : Encode -callback
     * @tc.desc      : 1.create imagesource
     *                 2.createImagePacker
     *                 3.packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_0100', 0, async function (done) {
        let logger = loger('SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_0100')
        let testNum = 'SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_0100'
        try {
            let imageSource = genPicSource();
            logger.log("ImageSource " + (imageSource != undefined));
            if (imageSource == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            }else{
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                console.info(`${testNum} create image packer failed`);
                expect(false).assertTrue();
                done();
            }else{
                let packOpts = { format:["image/jpeg"], quality:90 }
                imagePackerApi.packing(imageSource, packOpts, (err, data) => {
                    expect(data != undefined).assertTrue();
                    var dataArr = new Uint8Array(data);
                    console.info(`${testNum} dataArr.length=` + dataArr.length);
                    for (var i = 0; i < dataArr.length; i++) {
                        console.info(`dataArr[` + i + `]=` + dataArr[i]);
                    }
                    done();
                })
            }
        }
    } catch (error) {
            logger.log('failed ' + error);
            expect(false).assertTrue();
            done();
        }
        
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_0100
     * @tc.name      : Encode -promise
     * @tc.desc      : 1.create imagesource
     *                 2.createImagePacker
     *                 3.packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_0100', 0, async function (done) {
        let logger = loger('SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_0100')
        let testNum = 'SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_0100'
        try {
            let imageSource = genPicSource();
            logger.log("ImageSource " + (imageSource != undefined));
            if (imageSource == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            }else{
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                console.info(`${testNum} create image packer failed`);
                expect(false).assertTrue();
                done();
            }else{
                let packOpts = { format:["image/jpeg"], quality:90 }
                imagePackerApi.packing(imageSource, packOpts).then(data => {
                    expect(data != undefined).assertTrue();
                    var dataArr = new Uint8Array(data);
                    console.info(`${testNum} dataArr.length=` + dataArr.length);
                    for (var i = 0; i < dataArr.length; i++) {
                        console.info(`dataArr[` + i + `]=` + dataArr[i]);
                    }
                    
                    done();
                }).catch(error => {
                    console.log('SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_0100 error: ' + error);
                    expect(false).assertTrue();
                    done();
                })
            }
        }
    } catch (error) {
            logger.log('failed ' + error);
            expect(false).assertTrue();
            done();
        }   
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_0200
     * @tc.name      : Encode -callback-
     * @tc.desc      : 1.create imagesource
     *                 2.createImagePacker
     *                 3.packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_0200', 0, async function (done) {
        let packOpts = { format:["image/gif"], quality:90 }
        packingCbFail(done, 'SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_0200', packOpts)
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_ERROR_FORMAT_0100
     * @tc.name      : Encode -callback-wrong format
     * @tc.desc      : 1.create imagesource
     *                 2.createImagePacker
     *                 3.packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_ERROR_FORMAT_0100', 0, async function (done) {
        let packOpts = { format:["image/jpeg"], quality:200 }
        packingCbFail(done, 'SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_ERROR_FORMAT_0100', packOpts)     
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_NO_QUALITY_0100
     * @tc.name      : Encode -callback-no quality
     * @tc.desc      : 1.create imagesource
     *                 2.createImagePacker
     *                 3.packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_NO_QUALITY_0100', 0, async function (done) {
        let packOpts = { format:["image/jpeg"] }
        packingCbFail(done, 'SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_NO_QUALITY_0100', packOpts)     
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_NO_FORMAT_0100
     * @tc.name      : Encode -callback-no format
     * @tc.desc      : 1.create imagesource
     *                 2.createImagePacker
     *                 3.packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_NO_FORMAT_0100', 0, async function (done) {
        let packOpts = {  quality:50 }
        packingCbFail(done, 'SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_CALLBACK_NO_FORMAT_0100', packOpts)      
    })
    
    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_0200
     * @tc.name      : Encode -promise
     * @tc.desc      : 1.create imagesource
     *                 2.createImagePacker
     *                 3.packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_0200', 0, async function (done) {
        let packOpts = { format:["image/gif"], quality:90 }
        packingPromiseFail(done, 'SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_0200', packOpts)       
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_0300
     * @tc.name      : Encode -promise
     * @tc.desc      : 1.create imagesource
     *                 2.createImagePacker
     *                 3.packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_0300', 0, async function (done) {
        let packOpts = { format:["image/jpeg"], quality:101 }
        packingPromiseFail(done, 'SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_0300', packOpts)           
    })   

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_NO_QUALITY_0100
     * @tc.name      : Encode -promise -no quality
     * @tc.desc      : 1.create imagesource
     *                 2.createImagePacker
     *                 3.packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_NO_QUALITY_0100', 0, async function (done) {
        let packOpts = { format:["image/jpeg"] }
        packingPromiseFail(done, 'SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_NO_QUALITY_0100', packOpts)        
    })

    /**
     * @tc.number    : SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_NO_FORMAT_0100
     * @tc.name      : Encode -promise -no format
     * @tc.desc      : 1.create imagesource
     *                 2.createImagePacker
     *                 3.packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_NO_FORMAT_0100', 0, async function (done) {
       let packOpts = { quality:100 }
       packingPromiseFail(done, 'SUB_GRAPHIC_IMAGE_COLORSPACE_ENCODE_PROMISE_NO_FORMAT_0100', packOpts)        
    })

})
}
