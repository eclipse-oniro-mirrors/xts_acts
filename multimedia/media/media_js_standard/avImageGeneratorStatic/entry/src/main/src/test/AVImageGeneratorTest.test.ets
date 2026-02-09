/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import fileIo from '@ohos.file.fs'
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';

const VIDEO_SOURCE = 'H264_AAC.mp4';
let fileDescriptor: media.AVFileDescriptor | undefined;

async function getFdRead(pathName: string, done: () => void) {
    let fdReturn: number = 0;
    let g_context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
    pathName = g_context?.filesDir + '/' + pathName;
    console.log("pathName is " + pathName)
    await fileIo.open(pathName).then((fdNumber: fileIo.File) => {
        fdReturn = fdNumber.fd;
        console.info('[fileIo]case open fd success, fd is ' + fdReturn);
    })
    return new Promise<number>((resolve, reject) => {
        resolve(fdReturn)
    });
}

async function getFileDescriptorFromFileDir(filename: string, done: () => void): Promise< media.AVFileDescriptor> {
    let fileDescriptor: media.AVFileDescriptor | undefined;
    let fd = await getFdRead(filename, done)
    fileDescriptor = {
        fd: fd as int
    }
    return new Promise<media.AVFileDescriptor>((resolve, reject) => {
    resolve(fileDescriptor!)
    });
}
function openFileFailed() {
    console.info('case file fail');
}
async function closeFdNumber(fdNumber: number) {
    await fileIo.close(fdNumber.toInt());
}
export default function AVImageGeneratorTest() {
    describe('AVImageGeneratorTest',  () => {
        let timeUs: long = 0

        let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC

        let param: media.PixelMapParams = {
            width : 300,
            height : 300,
        }
        beforeAll(async () => {
            console.info('beforeAll case');
            await getFileDescriptorFromFileDir(VIDEO_SOURCE, openFileFailed).then((res: media.AVFileDescriptor) => {
              fileDescriptor = res;
            });
        })

        beforeEach(async () => {
            console.info('beforeEach case');
        })

        afterEach(async () => {
            console.info('afterEach case');
        })

        afterAll(async () => {
            console.info('afterAll case');
            await closeFdNumber(fileDescriptor!.fd);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FDSRC_static_0100
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FDSRC_static_0100
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FDSRC_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let tmpParam: media.PixelMapParams = {
                width : 300,
                height : 300
            }
            media.createAVImageGenerator((err: BusinessError|null, generator: undefined|media.AVImageGenerator) => {
                if (generator != null) {
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fdSrc = fileDescriptor!;
                    expect(avImageGenerator?.fdSrc != null && avImageGenerator.fdSrc != undefined).assertTrue();
                    let fd: int|undefined = avImageGenerator.fdSrc?.fd
                    if(fd == undefined || fd == null || fd < 0) {
                        expect(false).assertTrue();
                    }
                    done()
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err!!.message}`);
                    expect().assertFail()
                };
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FDSRC_static_0200
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FDSRC_static_0200
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FDSRC_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            media.createAVImageGenerator((err: BusinessError|null, generator: undefined|media.AVImageGenerator) => {
                if (generator != null) {
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fdSrc = fileDescriptor!;
                    expect(avImageGenerator?.fdSrc != null && avImageGenerator.fdSrc != undefined).assertTrue();
                    let fd: int | undefined = avImageGenerator.fdSrc?.fd
                    if(fd == undefined || fd == null || fd < 0) {
                        expect(false).assertTrue();
                    }
                    done()
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err!!.message}`);
                    expect().assertFail()
                };
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_RELEASE_static_0100
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_RELEASE_static_0100
         * @tc.desc   AvImageGenerator RELEASE test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_RELEASE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            media.createAVImageGenerator((err: BusinessError|null, generator: undefined|media.AVImageGenerator) => {
                if (generator != null) {
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.release((error: BusinessError|null) => {
                        if (error) {
                            console.error(`Failed to release, err = ${JSON.stringify(error)}`);
                            expect(false).assertTrue();
                        } else {
                            console.info(`Succeeded in releasing`);
                        }
                        done()
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err!!.message}`);
                    expect().assertFail()
                };
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0100
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0100
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            media.createAVImageGenerator((err: BusinessError|null, generator: undefined|media.AVImageGenerator) => {
                if(generator != null){
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fdSrc = fileDescriptor!;
                    avImageGenerator.fetchFrameByTime(timeUs, queryOption, param, (error: BusinessError|null, pixelMap: undefined|image.PixelMap) => {
                        if (error) {
                            console.error(`fetchFrameByTime callback failed, err = ${JSON.stringify(error)}`)
                            expect().assertFail()
                        } else {
                            let pixel_map = pixelMap;
                            expect(pixel_map).not().assertNull()
                        }
                        done()
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err!!.message}`);
                    expect().assertFail()
                };
            });
        })
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0200
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0200
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            media.createAVImageGenerator((err: BusinessError|null, generator: undefined|media.AVImageGenerator) => {
                if(generator != null){
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fdSrc = fileDescriptor!;
                    avImageGenerator.fetchFrameByTime(timeUs, queryOption, param).then((pixelMap: image.PixelMap|undefined) => {
                        let pixel_map = pixelMap;
                        expect(pixel_map).not().assertNull()
                        done()
                    }).catch((error: Error) => {
                        console.error(`fetchFrameByTime catchCallback, error message:${error.message}`);
                        expect().assertFail()
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err!!.message}`);
                    expect().assertFail()
                };
            });
        })
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0300
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0300
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            media.createAVImageGenerator((err: BusinessError|null, generator: undefined|media.AVImageGenerator) => {
                if(generator != null){
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fdSrc = fileDescriptor!;
                    avImageGenerator.fetchFrameByTime(timeUs, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, param)
                        .then((pixelMap: image.PixelMap|undefined) => {
                            let pixel_map = pixelMap;
                            expect(pixel_map).not().assertNull()
                            done()
                        }).catch((error: Error) => {
                        console.error(`fetchFrameByTime catchCallback, error message:${error.message}`);
                        expect().assertFail()
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err!!.message}`);
                    expect().assertFail()
                };
            });
        })
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0400
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0400
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            media.createAVImageGenerator((err: BusinessError|null, generator: undefined|media.AVImageGenerator) => {
                if(generator != null){
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fdSrc = fileDescriptor!;
                    avImageGenerator.fetchFrameByTime(timeUs, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST_SYNC, param)
                        .then((pixelMap: image.PixelMap|undefined) => {
                            let pixel_map = pixelMap;
                            expect(pixel_map).not().assertNull()
                            done()
                        }).catch((error: Error) => {
                        console.error(`fetchFrameByTime catchCallback, error message:${error.message}`);
                        expect().assertFail()
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err!!.message}`);
                    expect().assertFail()
                };
            });
        })
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0500
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0500
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            media.createAVImageGenerator((err: BusinessError|null, generator: undefined|media.AVImageGenerator) => {
                if(generator != null){
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fdSrc = fileDescriptor!;
                    avImageGenerator.fetchFrameByTime(timeUs, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST, param)
                        .then((pixelMap: image.PixelMap|undefined) => {
                            let pixel_map = pixelMap;
                            expect(pixel_map).not().assertNull()
                            done()
                        }).catch((error: Error) => {
                        console.error(`fetchFrameByTime catchCallback, error message:${error.message}`);
                        expect().assertFail()
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err!!.message}`);
                    expect().assertFail()
                };
            });
        })
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0600
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0600
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let tmpParam: media.PixelMapParams = {
                width : 300,
                height : 300,
                colorFormat : media.PixelFormat.RGB_565
            }
            media.createAVImageGenerator((err: BusinessError|null, generator: undefined|media.AVImageGenerator) => {
                if(generator != null){
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fdSrc = fileDescriptor!;
                    avImageGenerator.fetchFrameByTime(timeUs, queryOption, tmpParam, (error: BusinessError|null, pixelMap: image.PixelMap|undefined) => {
                        if (error) {
                            console.error(`fetchFrameByTime callback failed, err = ${JSON.stringify(error)}`)
                            expect().assertFail()
                        } else {
                            let pixel_map = pixelMap;
                            expect(pixel_map).not().assertNull()
                            done()
                        }
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err!!.message}`);
                    expect().assertFail()
                };
            });
        })
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0700
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0700
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let tmpParam: media.PixelMapParams = {
                width : 300,
                height : 300,
                colorFormat : media.PixelFormat.RGBA_8888
            }
            media.createAVImageGenerator((err: BusinessError|null, generator: undefined|media.AVImageGenerator) => {
                if(generator != null){
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fdSrc = fileDescriptor!;
                    avImageGenerator.fetchFrameByTime(timeUs, queryOption, tmpParam, (error: BusinessError|null, pixelMap: image.PixelMap|undefined) => {
                        if (error) {
                            console.error(`fetchFrameByTime callback failed, err = ${JSON.stringify(error)}`)
                            expect().assertFail()
                        } else {
                            let pixel_map = pixelMap;
                            expect(pixel_map).not().assertNull()
                        }
                        done()
                    });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err!!.message}`);
                    expect().assertFail()
                };
            });
        })
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0800
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0800
         * @tc.desc   AvImageGenerator fetchFrameByTime test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHFRAMEBYTIMME_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            let tmpParam: media.PixelMapParams = {
                width : 300,
                height : 300,
                colorFormat : media.PixelFormat.RGB_888
            }
            media.createAVImageGenerator((err: BusinessError | null,
                generator: undefined | media.AVImageGenerator) => {
                if (generator != null) {
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    avImageGenerator.fdSrc = fileDescriptor!;
                    avImageGenerator.fetchFrameByTime(timeUs, queryOption, tmpParam,
                        (error: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
                            if (error) {
                                console.error(`fetchFrameByTime callback failed, err = ${JSON.stringify(error)}`)
                                expect().assertFail()
                            } else {
                                let pixel_map = pixelMap;
                                expect(pixel_map).not().assertNull()
                            }
                            done()
                        });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err!!.message}`);
                    expect().assertFail()
                };
            });
        })
         /**
          * @tc.number  SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIMME_static_0100
          * @tc.name    SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIMME_static_0100
          * @tc.desc    AvImageGenerator fetchScaledFrameByTime test
          *               : 001.testAvImageGenerator fetchScaledFrameByTime RGB_888
          * @tc.size    MediumTest
          * @tc.type    Function test
          * @tc.level   Level1
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIMME_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            media.createAVImageGenerator((err: BusinessError | null,
                generator: undefined | media.AVImageGenerator) => {
                if (generator != null) {
                    let avImageGenerator = generator;
                    console.info(`createAVImageGenerator success`);
                    let param: media.OutputSize = {
                        width : 300,
                        height : 300,
                    }
                    avImageGenerator.fdSrc = fileDescriptor!;
                    avImageGenerator.fetchScaledFrameByTime(timeUs, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST, param)
                        .then((pixelMap: image.PixelMap | undefined) => {
                            let pixel_map = pixelMap;
                            console.info(`pixel_map == undefined?-->${pixelMap == undefined}`);
                            expect(pixel_map).not().assertNull();
                            done();
                        }).catch((error: Error) => {
                            console.error(`fetchScaledFrameByTime catchCallback, error message:${error.message}`);
                            expect().assertFail();
                        });
                } else {
                    console.error(`createAVImageGenerator fail, error message:${err!!.message}`);
                    expect().assertFail()
                }
            });
        })
    });
}
