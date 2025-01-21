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

import { BusinessError } from '@ohos.base';
import media from '@ohos.multimedia.media';
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function AVImageGeneratorTest() {
    describe('AVImageGeneratorTest', function () {
        // 初始化入参
        let timeUs: number = 0

        let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC

        let param: media.PixelMapParams = {
            width : 300,
            height : 300,
        }
        beforeAll(async function() {
            console.info('beforeAll case');
        })

        beforeEach(async function() {
            console.info('beforeEach case');
        })

        afterEach(async function() {
            console.info('afterEach case');
        })

        afterAll(async function() {
            console.info('afterAll case');
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0100
        * @tc.name      : 001.testAvImageGenerator fetchFrameByTime
        * @tc.desc      : AvImageGenerator fetchFrameByTime test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0100', 0, async (done : Function) => {
            media.createAVImageGenerator((err: BusinessError, generator: media.AVImageGenerator) => {
                if(generator != null){
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fetchFrameByTime(timeUs, queryOption, param, (error: BusinessError, pixelMap) => {
                        if (error) {
                            console.error(`fetchFrameByTime callback failed, err = ${JSON.stringify(error)}`)
                            expect().assertFail()
                            return
                        }
                        let pixel_map = pixelMap;
                        expect(pixel_map).assertNull()
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err.message}`);
                    expect().assertFail()
                };
            });
            done()
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0200
        * @tc.name      : 002.testAvImageGenerator fetchFrameByTime
        * @tc.desc      : AvImageGenerator fetchFrameByTime test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0200', 0, async (done : Function) => {
            media.createAVImageGenerator((err: BusinessError, generator: media.AVImageGenerator) => {
                if(generator != null){
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fetchFrameByTime(timeUs, queryOption, param).then((pixelMap: image.PixelMap) => {
                        let pixel_map = pixelMap;
                        expect(pixel_map).assertNull()
                    }).catch((error: BusinessError) => {
                        console.error(`fetchFrameByTime catchCallback, error message:${error.message}`);
                        expect().assertFail()
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err.message}`);
                    expect().assertFail()
                };
            });
            done()
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0300
        * @tc.name      : 003.testAvImageGenerator fetchFrameByTime AV_IMAGE_QUERY_PREVIOUS_SYNC
        * @tc.desc      : AvImageGenerator fetchFrameByTime test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0300', 0, async (done : Function) => {
            media.createAVImageGenerator((err: BusinessError, generator: media.AVImageGenerator) => {
                if(generator != null){
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fetchFrameByTime(timeUs, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, param)
                        .then((pixelMap: image.PixelMap) => {
                            let pixel_map = pixelMap;
                            expect(pixel_map).assertNull()
                        }).catch((error: BusinessError) => {
                        console.error(`fetchFrameByTime catchCallback, error message:${error.message}`);
                        expect().assertFail()
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err.message}`);
                    expect().assertFail()
                };
            });
            done()
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0400
        * @tc.name      : 004.testAvImageGenerator fetchFrameByTime AV_IMAGE_QUERY_CLOSEST_SYNC
        * @tc.desc      : AvImageGenerator fetchFrameByTime test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0400', 0, async (done : Function) => {
            media.createAVImageGenerator((err: BusinessError, generator: media.AVImageGenerator) => {
                if(generator != null){
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fetchFrameByTime(timeUs, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST_SYNC, param)
                        .then((pixelMap: image.PixelMap) => {
                            let pixel_map = pixelMap;
                            expect(pixel_map).assertNull()
                        }).catch((error: BusinessError) => {
                        console.error(`fetchFrameByTime catchCallback, error message:${error.message}`);
                        expect().assertFail()
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err.message}`);
                    expect().assertFail()
                };
            });
            done()
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0500
        * @tc.name      : 005.testAvImageGenerator fetchFrameByTime AV_IMAGE_QUERY_CLOSEST
        * @tc.desc      : AvImageGenerator fetchFrameByTime test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0500', 0, async (done : Function) => {
            media.createAVImageGenerator((err: BusinessError, generator: media.AVImageGenerator) => {
                if(generator != null){
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fetchFrameByTime(timeUs, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST, param)
                        .then((pixelMap: image.PixelMap) => {
                            let pixel_map = pixelMap;
                            expect(pixel_map).assertNull()
                        }).catch((error: BusinessError) => {
                        console.error(`fetchFrameByTime catchCallback, error message:${error.message}`);
                        expect().assertFail()
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err.message}`);
                    expect().assertFail()
                };
            });
            done()
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0600
        * @tc.name      : 006.testAvImageGenerator fetchFrameByTime RGB_565
        * @tc.desc      : AvImageGenerator fetchFrameByTime test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0600', 0, async (done : Function) => {
            let tmpParam: media.PixelMapParams = {
                width : 300,
                height : 300,
                colorFormat : media.PixelFormat.RGB_565
            }
            media.createAVImageGenerator((err: BusinessError, generator: media.AVImageGenerator) => {
                if(generator != null){
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fetchFrameByTime(timeUs, queryOption, tmpParam, (error: BusinessError, pixelMap) => {
                        if (error) {
                            console.error(`fetchFrameByTime callback failed, err = ${JSON.stringify(error)}`)
                            expect().assertFail()
                            return
                        }
                        let pixel_map = pixelMap;
                        expect(pixel_map).assertNull()
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err.message}`);
                    expect().assertFail()
                };
            });
            done()
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0700
        * @tc.name      : 007.testAvImageGenerator fetchFrameByTime RGBA_8888
        * @tc.desc      : AvImageGenerator fetchFrameByTime test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0700', 0, async (done : Function) => {
            let tmpParam: media.PixelMapParams = {
                width : 300,
                height : 300,
                colorFormat : media.PixelFormat.RGBA_8888
            }
            media.createAVImageGenerator((err: BusinessError, generator: media.AVImageGenerator) => {
                if(generator != null){
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fetchFrameByTime(timeUs, queryOption, tmpParam, (error: BusinessError, pixelMap) => {
                        if (error) {
                            console.error(`fetchFrameByTime callback failed, err = ${JSON.stringify(error)}`)
                            expect().assertFail()
                            return
                        }
                        let pixel_map = pixelMap;
                        expect(pixel_map).assertNull()
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err.message}`);
                    expect().assertFail()
                };
            });
            done()
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0800
        * @tc.name      : 008.testAvImageGenerator fetchFrameByTime RGB_888
        * @tc.desc      : AvImageGenerator fetchFrameByTime test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0800', 0, async (done : Function) => {
            let tmpParam: media.PixelMapParams = {
                width : 300,
                height : 300,
                colorFormat : media.PixelFormat.RGB_888
            }
            media.createAVImageGenerator((err: BusinessError, generator: media.AVImageGenerator) => {
                if(generator != null){
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fetchFrameByTime(timeUs, queryOption, tmpParam, (error: BusinessError, pixelMap) => {
                        if (error) {
                            console.error(`fetchFrameByTime callback failed, err = ${JSON.stringify(error)}`)
                            expect().assertFail()
                            return
                        }
                        let pixel_map = pixelMap;
                        expect(pixel_map).assertNull()
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err.message}`);
                    expect().assertFail()
                };
            });
            done()
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0900
        * @tc.name      : 009.testAvImageGenerator createAVImageGenerator
        * @tc.desc      : AvImageGenerator createAVImageGenerator test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0900', 0, async (done : Function) => {
            media.createAVImageGenerator().then((generator: media.AVImageGenerator) => {
                if (generator != null) {
                    expect(generator).assertNull();
                    console.info('createAVImageGenerator success');
                } else {
                    console.error('createAVImageGenerator fail');
                }
            }).catch((error: BusinessError) => {
                console.error(`AVImageGenerator catchCallback, error message:${error.message}`);
            });
            done()
        })
    });
}