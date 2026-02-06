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

import myavcapability from 'libavcapability.so'
import { BusinessError } from '@ohos.base';
import media from '@ohos.multimedia.media';
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import resourceManager from '@ohos.resourceManager';


interface FetchedSize {
    width: number;
    height: number;
}

let videoSource = "demo.mp4"
let avFd: media.AVFileDescriptor
let orgWidth: number = 1024
let orgHeight: number = 1280
let defaultQueryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC
let MaxUint32Num = 4294967295
let avImageGenerator: media.AVImageGenerator | undefined = undefined

async function getFileDescriptor(fileName: string) {
    let fileDescriptor: resourceManager.RawFileDescriptor | undefined = undefined;
    await globalThis.abilityContext.resourceManager.getRawFd(fileName)
        .then(async (value: resourceManager.RawFileDescriptor) => {
            fileDescriptor = {
                fd: value.fd, offset: value.offset, length: value.length
            };
        });
    return fileDescriptor;
}

function getFetchedSize(outSize: media.OutputSize) {
    let fetchedSize: FetchedSize = {
        width: outSize.width != undefined ? outSize.width : orgWidth,
        height: outSize.height != undefined ? outSize.height : orgHeight
    }
    if (fetchedSize.width == 0 && fetchedSize.height != 0) {
        fetchedSize.width = orgWidth * fetchedSize.height / orgHeight
    } else if (fetchedSize.height == 0 && fetchedSize.width != 0) {
        fetchedSize.height = orgHeight * fetchedSize.width / orgWidth
    } else if (fetchedSize.width == 0 && fetchedSize.height == 0) {
        fetchedSize.width = orgWidth
        fetchedSize.height = orgHeight
    }
    if (fetchedSize.width < 0) {
        fetchedSize.width = orgWidth
    }
    if (fetchedSize.height < 0) {
        fetchedSize.height = orgHeight
    }
    if (fetchedSize.width > orgWidth) {
        fetchedSize.width = orgWidth
    }
    if (fetchedSize.height > orgHeight) {
        fetchedSize.height = orgHeight
    }
    if (!Number.isInteger(fetchedSize.width)) {
        fetchedSize.width = Math.floor(fetchedSize.width)
    }
    if (!Number.isInteger(fetchedSize.height)) {
        fetchedSize.height = Math.floor(fetchedSize.height)
    }
    return fetchedSize;
}
async function fetchScaledFrameByTimeTest(testNum: string, done: Function, outSize: media.OutputSize, timeUs = 0,
    queryOption = defaultQueryOption, fdSrc = avFd) {
    console.info(`${testNum} fetchScaledFrameByTimeTest start`);
    media.createAVImageGenerator((err: BusinessError, generator: media.AVImageGenerator) => {
        if (generator != null) {
            avImageGenerator = generator;
            avImageGenerator.fdSrc = fdSrc;
            console.info(`${testNum} createAVImageGenerator success`);
            avImageGenerator.fetchScaledFrameByTime(timeUs, queryOption, outSize).then((pixelMap: image.PixelMap) => {
                expect(pixelMap != undefined).assertTrue()
                console.info(`${testNum} fetchScaledFrameByTime success`);
                let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
                let exceptedSize: media.OutputSize = getFetchedSize(outSize);
                console.info(`${testNum} pixel_map size width: ${imageInfo.size.width}, height: ${imageInfo.size.height}`);
                console.info(`${testNum} exceptedSize width: ${exceptedSize.width}, height: ${exceptedSize.height}`);
                expect(imageInfo.size.width == exceptedSize.width).assertTrue()
                expect(imageInfo.size.height == exceptedSize.height).assertTrue()
                done()
            })
        } else {
            console.error(`${testNum}createAVImageGenerator fail, error message:${err.message}`);
            expect().assertFail()
        };
    });
}

function getRandomNumber(min: number, max: number): number{
    if(min > max) return Math.random() > 0.5 ? max : min
    return min + Number((Math.random() * (max - min)).toFixed())
}

async function getVideoDuration(fdSrc: media.AVFileDescriptor, done: Function): Promise<number>{
    let avPlayer: media.AVPlayer | undefined
    await media.createAVPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
            console.info('case createAVPlayer success');
            avPlayer = video;
        } else {
            console.error('case createAVPlayer failed');
            expect().assertFail();
            done();
        }
    })
    let videoMS: number = await new Promise(res => {
        avPlayer?.on("stateChange",async (state: string) => {
            console.log(`avPlayer state is ${state}`)
            switch (state) {
                case "initialized":
                    avPlayer?.prepare()
                    break;
                case "prepared":
                    res(avPlayer?.duration || -1)
                    break;
            }
        })
        if(avPlayer) avPlayer.fdSrc = fdSrc
    })
    avPlayer?.release()
    if(videoMS == -1){
        console.error(`get video duration error`)
        expect().assertFail()
        done()
    }
    return videoMS
}
export default function FetchScaledFrameByTimeTest() {
    describe('FetchScaledFrameByTimeTest', () => {

        beforeAll(async () => {
            await getFileDescriptor(videoSource).then((fileDescriptor: media.AVFileDescriptor | undefined) => {
                if (fileDescriptor != undefined) {
                    avFd = fileDescriptor
                }
            })
            console.info(`FetchScaledFrameByTimeTest beforeAll avFd: ${avFd}`);
        })

        afterEach(async () => {
            try {
                if (avImageGenerator != undefined) {
                    await avImageGenerator.release();
                    avImageGenerator = undefined;
                }
            } catch(error) {
                console.info(`FetchScaledFrameByTimeTest afterEach release error: ${JSON.stringify(error)}`);
            }
            console.info(`FetchScaledFrameByTimeTest afterEach`);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0100
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize as 1/4 of the original size
         * @tc.desc      : Verify that the frame is fetched correctly with reduced dimensions.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0100";
            let outSize: media.OutputSize = {
                width: orgWidth / 4,
                height: orgHeight / 4
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0200
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize as the original size
         * @tc.desc      : Verify that the frame is fetched correctly with original dimensions.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0200";
            let outSize: media.OutputSize = {
                width: orgWidth,
                height: orgHeight
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0300
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize as 1.5 times the original size
         * @tc.desc      : Verify that the frame is fetched correctly with enlarged dimensions.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0300";
            let outSize: media.OutputSize = {
                width: orgWidth * 3 / 2,
                height: orgHeight * 3 / 2
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0400
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize width as 0 and height as 1/8 of the original
         * @tc.desc      : Verify that the width is calculated proportionally when set to 0.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0400";
            let outSize: media.OutputSize = {
                width: 0,
                height: orgHeight / 8
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0500
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize width as -1 and height as 1/2 of the original
         * @tc.desc      : Verify that negative width is handled correctly by resetting to default.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0500";
            let outSize: media.OutputSize = {
                width: -1,
                height: orgHeight / 2
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0600
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize width and height as -1 and 0 respectively
         * @tc.desc      : Verify that invalid dimensions are handled correctly by resetting to default.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0600";
            let outSize: media.OutputSize = {
                width: -1,
                height: 0
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0700
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize as maximum possible values
         * @tc.desc      : Verify that oversized dimensions are capped to the original size.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0700";
            let outSize: media.OutputSize = {
                width: MaxUint32Num,
                height: MaxUint32Num
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0800
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize as 1/3 of the original size
         * @tc.desc      : Verify that the frame is fetched correctly with reduced dimensions.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0800";
            let outSize: media.OutputSize = {
                width: orgWidth / 3,
                height: orgHeight
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0900
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize as 1/3 of the original size
         * @tc.desc      : Verify that the frame is fetched correctly with reduced dimensions.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_0900";
            let outSize: media.OutputSize = {
                width: orgWidth,
                height: orgHeight / 3
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1000
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize as the original size and timeUs as 100
         * @tc.desc      : Verify that the frame is fetched correctly with original dimensions and specific time.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1000";
            let outSize: media.OutputSize = {
                width: orgWidth,
                height: orgHeight
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize, 100);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1100
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize as the original size and timeUs as maximum value
         * @tc.desc      : Verify that the frame is fetched correctly with original dimensions and maximum time.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1100";
            let outSize: media.OutputSize = {
                width: orgWidth,
                height: orgHeight
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize, MaxUint32Num);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1200
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize as the original size and timeUs as a float value
         * @tc.desc      : Verify that the frame is fetched correctly with original dimensions and float time.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1200";
            let outSize: media.OutputSize = {
                width: orgWidth,
                height: orgHeight
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize, 3.1415926);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1300
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize as the original size and timeUs as -1
         * @tc.desc      : Verify that the frame is fetched correctly with original dimensions and negative time.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1300";
            let outSize: media.OutputSize = {
                width: orgWidth,
                height: orgHeight
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize, -1);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1400
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize as the original size and queryOption as PREVIOUS_SYNC
         * @tc.desc      : Verify that the frame is fetched correctly with original dimensions and previous sync option.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1400";
            let outSize: media.OutputSize = {
                width: orgWidth,
                height: orgHeight
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize, 0, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1500
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize as the original size and queryOption as CLOSEST_SYNC
         * @tc.desc      : Verify that the frame is fetched correctly with original dimensions and closest sync option.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1500";
            let outSize: media.OutputSize = {
                width: orgWidth,
                height: orgHeight
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize, 0, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST_SYNC);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1600
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize as the original size and queryOption as CLOSEST
         * @tc.desc      : Verify that the frame is fetched correctly with original dimensions and closest option.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1600";
            let outSize: media.OutputSize = {
                width: orgWidth,
                height: orgHeight
            }
            await fetchScaledFrameByTimeTest(testNum, done, outSize, 0, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1700
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize as 111x111 and file descriptor as SDR
         * @tc.desc      : Verify that the frame is fetched correctly with specific dimensions and SDR file.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1700";
            let outSize: media.OutputSize = {
                width: 111,
                height: 111
            }
            let sdrFd: media.AVFileDescriptor | undefined = undefined
            await getFileDescriptor("sdr.mp4").then((fileDescriptor: resourceManager.RawFileDescriptor | undefined) => {
                if (fileDescriptor != undefined) {
                    sdrFd = {
                        fd: fileDescriptor.fd, offset: fileDescriptor.offset, length: fileDescriptor.length
                    };
                }
            })
            await fetchScaledFrameByTimeTest(testNum, done, outSize, 0, defaultQueryOption, sdrFd);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1800
         * @tc.name      : Test fetchScaledFrameByTime with OutputSize as 111x111 and file descriptor as HDR
         * @tc.desc      : Verify that the frame is fetched correctly with specific dimensions and HDR file.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1800";
            let outSize: media.OutputSize = {
                width: 111,
                height: 111
            }
            let isSupport = await myavcapability.AVCapabilityIsVideoSizeSupported(2336, 1080);
            if (isSupport == -1) {
                console.info(`${testNum} AVCapabilityIsVideoSizeSupported Failed`);
                done();
                return;
            }
            let hdrFd: media.AVFileDescriptor | undefined = undefined
            await getFileDescriptor("hdr.mp4").then((fileDescriptor: resourceManager.RawFileDescriptor | undefined) => {
                if (fileDescriptor != undefined) {
                    hdrFd = {
                        fd: fileDescriptor.fd, offset: fileDescriptor.offset, length: fileDescriptor.length
                    };
                }
            })
            await fetchScaledFrameByTimeTest(testNum, done, outSize, 0, defaultQueryOption, hdrFd);
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1900
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1900
        * @tc.desc      : Verify that the frame is fetched correctly with specific dimensions and HDR file.
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_1900";
            let outSize: media.OutputSize = {
                width: orgWidth,
                height: orgHeight
            }
            try {
                let videoMS: number = await getVideoDuration(avFd,done)
                await fetchScaledFrameByTimeTest(testNum, done, outSize, videoMS * 1000);
            } catch (error) {
                console.error(`Test exception: ${JSON.stringify(error)}`);
                expect().assertFail()
                done()
            }
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2000
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2000
        * @tc.desc      : Verify that the frame is fetched correctly with reduced dimensions.
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2000";
            let outSize: media.OutputSize = {
                width: orgWidth / 2,
                height: orgHeight / 2
            }
            try {
                let videoMS: number = await getVideoDuration(avFd,done)
                let ustime: number = getRandomNumber(Math.floor(videoMS * 1000 / 3), Math.floor(videoMS * 1000 * 2 / 3))
                await fetchScaledFrameByTimeTest(testNum, done, outSize, ustime);
            } catch (error) {
                console.error(`Test exception: ${JSON.stringify(error)}`);
                expect().assertFail()
                done()
            }
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2100
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2100
        * @tc.desc      : Verify that the frame is fetched correctly with reduced dimensions.
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2100";
            let outSize: media.OutputSize = {
                width: orgWidth / 2,
                height: orgHeight / 2
            }
            try {
                let videoMS: number = await getVideoDuration(avFd,done)
                let ustime: number = getRandomNumber(Math.floor(videoMS * 1000 / 3), Math.floor(videoMS * 1000 * 2 / 3))
                await fetchScaledFrameByTimeTest(testNum, done, outSize, ustime, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC);
            } catch (error) {
                console.error(`Test exception: ${JSON.stringify(error)}`);
                expect().assertFail()
                done()
            }
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2200
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2200
        * @tc.desc      : Verify that the frame is fetched correctly with reduced dimensions.
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2200";
            let outSize: media.OutputSize = {
                width: orgWidth / 2,
                height: orgHeight / 2
            }
            try {
                let videoMS: number = await getVideoDuration(avFd,done)
                let ustime: number = getRandomNumber(Math.floor(videoMS * 1000 / 3), Math.floor(videoMS * 1000 * 2 / 3))
                await fetchScaledFrameByTimeTest(testNum, done, outSize, ustime, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST_SYNC);
            } catch (error) {
                console.error(`Test exception: ${JSON.stringify(error)}`);
                expect().assertFail()
                done()
            }
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2300
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2300
        * @tc.desc      : Verify that the frame is fetched correctly with reduced dimensions.
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2300";
            let outSize: media.OutputSize = {
                width: orgWidth / 2,
                height: orgHeight / 2
            }
            try {
                let videoMS: number = await getVideoDuration(avFd,done)
                let ustime: number = getRandomNumber(Math.floor(videoMS * 1000 / 3), Math.floor(videoMS * 1000 * 2 / 3))
                await fetchScaledFrameByTimeTest(testNum, done, outSize, ustime, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST);
            } catch (error) {
                console.error(`Test exception: ${JSON.stringify(error)}`);
                expect().assertFail()
                done()
            }
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2400
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2400
        * @tc.desc      : Verify that the frame is fetched correctly with reduced dimensions.
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2400";
            let outSize: media.OutputSize = {
                width: -1,
                height: -1
            }
            try {
                await fetchScaledFrameByTimeTest(testNum, done, outSize);
            } catch (error) {
                console.error(`Test exception: ${JSON.stringify(error)}`);
                expect().assertFail()
                done()
            }
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2500
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2500
        * @tc.desc      : Verify that the frame is fetched correctly with reduced dimensions.
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2500";
            let outSize: media.OutputSize = {
                width: 0,
                height: 0
            }
            try {
                await fetchScaledFrameByTimeTest(testNum, done, outSize);
            } catch (error) {
                console.error(`Test exception: ${JSON.stringify(error)}`);
                expect().assertFail()
                done()
            }
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2600
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2600
        * @tc.desc      : Verify that the frame is fetched incorrectly after release
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_MEDIA_AVIMAGEGENERATOR_FETCHSCALEDFRAMEBYTIME_2600";
            let outSize: media.OutputSize = {
                width: orgWidth,
                height: orgHeight
            }
            console.info(`${testNum} fetchScaledFrameByTimeTest start`);
            try {
                const avImageGenerator = await media.createAVImageGenerator()
                avImageGenerator.fdSrc = avFd;
                console.info(`${testNum} createAVImageGenerator success`);
                await avImageGenerator.release()
                console.info(`${testNum} releaseAVImageGenerator success`);
                await avImageGenerator.fetchScaledFrameByTime(0, defaultQueryOption, outSize).then((pixelMap: image.PixelMap) => {
                    console.info(`${testNum} fetchScaledFrameByTime success`);
                    expect().assertFail()
                }).catch((error: BusinessError) => {
                    if(error.code == 5400106){
                        console.info(`${testNum} fetchScaledFrameByTime after release success, error.code:${error.code} error.message:${error.message}`)
                    }else{
                        console.info(`${testNum} fetchScaledFrameByTime after release fail, code is not 5400106 ,error.code:${error.code} error.message:${error.message}`)
                        expect().assertFail()
                    }
                })
            } catch (error) {
                console.error(`${testNum} test fetchScaledFrameByTime with error fail, error code:${error.code} message:${error.message}`);
                expect().assertFail()
            }
            done()
        })
    })

}