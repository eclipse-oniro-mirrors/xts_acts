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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function AVImageGeneratorTest() {
    describe('AVImageGeneratorTest',  () => {
        // 初始化入参
        let timeUs: number = 0

        let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC

        let param: media.PixelMapParams = {
            width : 300,
            height : 300,
        }
        beforeAll(async () => {
            console.info('beforeAll case');
        })

        beforeEach(async () => {
            console.info('beforeEach case');
        })

        afterEach(async () => {
            console.info('afterEach case');
        })

        afterAll(async () => {
            console.info('afterAll case');
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0100
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0100
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0100', Level.LEVEL0, async (done : Function) => {
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

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0200
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0200
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0200', Level.LEVEL0, async (done : Function) => {
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

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0300
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0300
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0300', Level.LEVEL0, async (done : Function) => {
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

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0400
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0400
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0400', Level.LEVEL0, async (done : Function) => {
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

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0500
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0500
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0500', Level.LEVEL0, async (done : Function) => {
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

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0600
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0600
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0600', Level.LEVEL0, async (done : Function) => {
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

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0700
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0700
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0700', Level.LEVEL0, async (done : Function) => {
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

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0800
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0800
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0800', Level.LEVEL0, async (done : Function) => {
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

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0900
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0900
         * @tc.desc   AvImageGenerator createAVImageGenerator test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_0900', Level.LEVEL0, async (done : Function) => {
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


        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FDSRC_0100
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FDSRC_0100
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FDSRC_0100', Level.LEVEL0, async (done : Function) => {
            let tmpParam: media.PixelMapParams = {
                width : 300,
                height : 300,
                colorFormat : media.PixelFormat.RGB_888
            }
            media.createAVImageGenerator((err: BusinessError, generator: media.AVImageGenerator) => {
                if (generator != null) {
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    expect(avImageGenerator?.fdSrc != null && avImageGenerator.fdSrc != undefined).assertTrue();
                    if(avImageGenerator.fdSrc?.fd == undefined || avImageGenerator.fdSrc?.fd == null || avImageGenerator.fdSrc?.fd < 0) {
                        expect(false).assertTrue;
                    }
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err.message}`);
                    expect().assertFail()
                };
            });
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FDSRC_0100
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FDSRC_0100
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FDSRC_0100', Level.LEVEL0, async (done : Function) => {
            media.createAVImageGenerator((err: BusinessError, generator: media.AVImageGenerator) => {
                if (generator != null) {
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    expect(avImageGenerator?.fdSrc != null && avImageGenerator.fdSrc != undefined).assertTrue();
                    if(avImageGenerator.fdSrc?.fd == undefined || avImageGenerator.fdSrc?.fd == null || avImageGenerator.fdSrc?.fd < 0) {
                        expect(false).assertTrue;
                    }
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err.message}`);
                    expect().assertFail()
                };
            });
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_RELEASE_0100
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_RELEASE_0100
         * @tc.desc   AvImageGenerator RELEASE test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_RELEASE_0100', Level.LEVEL0, async (done : Function) => {
            media.createAVImageGenerator((err: BusinessError, generator: media.AVImageGenerator) => {
                if (generator != null) {
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.release((error: BusinessError) => {
                        if (error) {
                            console.error(`Failed to release, err = ${JSON.stringify(error)}`);
                            return;
                        }
                        console.info(`Succeeded in releasing`);
                        expect(false).assertTrue;
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err.message}`);
                    expect().assertFail()
                };
            });
            done()
        })
    });
}