/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import avSession from '@ohos.multimedia.avsession';
import {afterAll, afterEach, beforeAll, beforeEach, describe, expect, it} from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import WantAgent from '@ohos.wantAgent';
import featureAbility from '@ohos.ability.featureAbility';

export default function AVSessionCallback() {
    describe('AVSessionCallback', function () {
        let tag = 'ApplicationA';
        let type = 'audio';
        let session;
        let controller;
        let context = featureAbility.getContext();

        function sleep (ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        async function init() {
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
                session.sessionType = 'audio';
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            controller = await session.getController();
        }

        async function destroy() {
            await session.destroy().then(() => {
                console.info('TestLog: Session destroy success');
            }).catch((err) => {
                console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await controller.destroy().then(() => {
                console.info('TestLog: Controller destroy success');
            }).catch((err) => {
                console.info(`TestLog: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
        }

        async function getPixelMap() {
            let color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            bufferArr.fill('3', 0, 95);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, AlphaType: 3};
            return image.createPixelMap(color, opts);
        }

        beforeAll(function () {
            console.info('TestLog: Start Testing AVSession Interfaces');
        })

        beforeEach(async function () {
            console.info('TestLog: Init Session And Controller');
            await init();
        })

        afterEach(async function (done) {
            console.info('TestLog: Destroy Session And Controller');
            await destroy();
            done();
        })

        afterAll(function () {
            console.info('TestLog: End Testing AVSession Interfaces');
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0100
         * @tc.name      : setAVMetadata - callback - set assetId
         * @tc.desc      : Testing call setAVMetadata(callback) set assetId
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0100', 0, async function (done) {
            let metadata0  = {
                assetId: '121278',
            };

            session.setAVMetadata(metadata0, (err) => {
                if (err) {
                    console.info(`TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            });
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.assetId === metadata0.assetId) {
                    console.info('TestLog: Get assetId Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get assetId failed: ${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0200
         * @tc.name      : setAVMetadata - callback - set artist
         * @tc.desc      : Testing call setAVMetadata(callback) set artist
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0200', 0, async function (done) {
            let metadata1  = {
                assetId: '121278',
                artist: 'Eminem',
            };
            session.setAVMetadata(metadata1, (err) => {
                if (err) {
                    console.info(`TestLog: Set artist error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            });
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get artist error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.artist === metadata1.artist) {
                    console.info('TestLog: Get artist Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get artist failed' ${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0300
         * @tc.name      : setAVMetadata - callback - set author
         * @tc.desc      : Testing call setAVMetadata(callback) set author
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0300', 0, async function (done) {
            let metadata2  = {
                assetId: '121278',
                author: 'ST',
            };
            session.setAVMetadata(metadata2, (err) => {
                if (err) {
                    console.info(`TestLog: Set author error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get author error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.author === metadata2.author) {
                    console.info('TestLog: Get author Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get author failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0400
         * @tc.name      : setAVMetadata - callback - set album
         * @tc.desc      : Testing call setAVMetadata(callback) set album
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0400', 0, async function (done) {
            let metadata3  = {
                assetId: '121278',
                album: 'Slim shady',
            };
            session.setAVMetadata(metadata3, (err) => {
                if (err) {
                    console.info(`TestLog: Set album error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get album error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.album === metadata3.album) {
                    console.info('TestLog: Get album Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get album failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0500
         * @tc.name      : setAVMetadata - callback - set writer
         * @tc.desc      : Testing call setAVMetadata(callback) set writer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0500', 0, async function (done) {
            let metadata4  = {
                assetId: '121278',
                writer: 'ST',
            };
            session.setAVMetadata(metadata4, (err) => {
                if (err) {
                    console.info(`TestLog: Set writer error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get writer error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.writer === metadata4.writer) {
                    console.info('TestLog: Get writer Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get writer failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0600
         * @tc.name      : setAVMetadata - callback - set composer
         * @tc.desc      : Testing call setAVMetadata(callback) set composer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0600', 0, async function (done) {
            let metadata5  = {
                assetId: '121278',
                composer: 'ST',
            };
            session.setAVMetadata(metadata5, (err) => {
                if (err) {
                    console.info(`TestLog: Set composer error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get composer error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.composer === metadata5.composer) {
                    console.info('TestLog: Get composer Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get composer failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0700
         * @tc.name      : setAVMetadata - callback - set duration
         * @tc.desc      : Testing call setAVMetadata(callback) set duration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0700', 0, async function (done) {
            let metadata6  = {
                assetId: '121278',
                duration: 2222,
            };
            session.setAVMetadata(metadata6, (err) => {
                if (err) {
                    console.info(`TestLog: Set duration error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get duration error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.duration === metadata6.duration) {
                    console.info('TestLog: Get duration Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get duration failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0800
         * @tc.name      : setAVMetadata - callback - set mediaImage(url)
         * @tc.desc      : Testing call setAVMetadata(callback) set mediaImage(url)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0800', 0, async function (done) {
            let metadata7  = {
                assetId: '121278',
                mediaImage: 'https://img2.baidu.com/it/u=3583435814,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500',
            };
            session.setAVMetadata(metadata7, (err) => {
                if (err) {
                    console.info(`TestLog: Set mediaImage error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get mediaImage error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.mediaImage === metadata7.mediaImage) {
                    console.info('TestLog: Get mediaImage Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get mediaImage failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0900
         * @tc.name      : setAVMetadata - callback - set mediaImage(pixelMap)
         * @tc.desc      : Testing call setAVMetadata(callback) set mediaImage(pixelMap)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0900', 0, async function (done) {
            console.info('TestLog: Create pixelmap');
            let pixelMap = await getPixelMap();
            let readBuffer0 = new ArrayBuffer(96);
            await pixelMap.readPixelsToBuffer(readBuffer0);
            let bufferArr0 = new Uint8Array(readBuffer0);
            let metadata8  = {
                assetId: '121278',
                mediaImage: pixelMap,
            };
            session.setAVMetadata(metadata8, (err) => {
                if (err) {
                    console.info(`TestLog: Set pixelMap error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            let pixMap;
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get pixelMap error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.assetId === metadata8.assetId) {
                    console.info('TestLog: Get pixelMap Successfully');
                    pixMap = value.mediaImage;
                } else {
                    console.info(`TestLog: Get pixelMap failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
            let pixelSize = pixMap.getPixelBytesNumber();
            console.info(`TestLog: pixelSize is:${pixelSize}`);
            let readBuffer = new ArrayBuffer(pixelSize);
            pixMap.readPixelsToBuffer(readBuffer);
            await sleep(500);
            let bufferArr2 = new Uint8Array(readBuffer);
            for (let i = 0; i < bufferArr2.length; i++) {
                if (bufferArr0[i] !== bufferArr2[i]) {
                    expect(false).assertTrue();
                } else {
                    expect(true).assertTrue();
                }
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1000
         * @tc.name      : setAVMetadata - callback - set publishDate
         * @tc.desc      : Testing call setAVMetadata(callback) set publishDate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1000', 0, async function (done) {
            let metadata9  = {
                assetId: '121278',
                publishDate: new Date(1994,1,1,1),
            };
            session.setAVMetadata(metadata9, (err) => {
                if (err) {
                    console.info(`TestLog: Set publishDate error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set publishDate : successfully');
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get publishDate error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.publishDate.getTime() === metadata9.publishDate.getTime()) {
                    console.info('TestLog: Get publishDate Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get publishDate failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1100
         * @tc.name      : setAVMetadata - callback - set subtitle
         * @tc.desc      : Testing call setAVMetadata(callback) set subtitle
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1100', 0, async function (done) {
            let metadata10  = {
                assetId: '121278',
                subtitle: '8 Mile',
            };

            session.setAVMetadata(metadata10, (err) => {
                if (err) {
                    console.info(`TestLog: Set subtitle error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set subtitle successfully');
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get subtitle error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.subtitle === metadata10.subtitle) {
                    console.info('TestLog: Get subtitle Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get subtitle failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1200
         * @tc.name      : setAVMetadata - callback - set description
         * @tc.desc      : Testing call setAVMetadata(callback) set description
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1200', 0, async function (done) {
            let metadata11  = {
                assetId: '121278',
                description: 'Rap',
            };
            session.setAVMetadata(metadata11, (err) => {
                if (err) {
                    console.info(`TestLog: Set description error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get description error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.description === metadata11.description) {
                    console.info('TestLog: Get description Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get description failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1300
         * @tc.name      : setAVMetadata - callback - set lyric
         * @tc.desc      : Testing call setAVMetadata(callback) set lyric
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1300', 0, async function (done) {
            let metadata12  = {
                assetId: '121278',
                lyric: 'https://lyric.tingmall.com/lyric/58/970/58970104-LRC-LRC.lrc?t=1649918948000',
            };

            session.setAVMetadata(metadata12, (err) => {
                if (err) {
                    console.info(`TestLog: Set lyric error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get lyric error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.lyric === metadata12.lyric) {
                    console.info('TestLog: Get lyric Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get lyric failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1400
         * @tc.name      : setAVMetadata - callback - set previousAssetId & nextAssetId
         * @tc.desc      : Testing call setAVMetadata(callback) set previousAssetId & nextAssetId
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1400', 0, async function (done) {
            let metadata13  = {
                assetId: '121278',
                previousAssetId: '121277',
                nextAssetId: '121279',
            };

            session.setAVMetadata(metadata13, (err) => {
                if (err) {
                    console.info(`TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.previousAssetId === metadata13.previousAssetId
                    && value.nextAssetId === metadata13.nextAssetId) {
                    console.info('TestLog: Get assetId Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get assetId failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1500
         * @tc.name      : setAVMetadata - callback - set filter
         * @tc.desc      : Testing call setAVMetadata(callback) set filter
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1500', 0, async function (done) {
            let metadata16  = {
                assetId: '121278',
                filter: avSession.ProtocolType.TYPE_CAST_PLUS_MIRROR
            };

            session.setAVMetadata(metadata16, (err) => {
                if (err) {
                    console.info(`TestLog: Set filter error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.filter === metadata16.filter) {
                    console.info('TestLog: Get filter Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get filter failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })
        
        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1600
         * @tc.name      : setAVMetadata - callback - set skipIntervals
         * @tc.desc      : Testing call setAVMetadata(callback) set skipIntervals
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1600', 0, async function (done) {
            let metadata17  = {
                assetId: '121278',
                skipIntervals: avSession.SkipIntervals.SECONDS_10
            };

            session.setAVMetadata(metadata17, (err) => {
                if (err) {
                    console.info(`TestLog: Set skipIntervals error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get skipIntervals error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.skipIntervals === metadata17.skipIntervals) {
                    console.info('TestLog: Get skipIntervals Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get skipIntervals failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1700
         * @tc.name      : setAVMetadata - callback - set avQueueName、avQueueId、avQueueImage(pixelmap)
         * @tc.desc      : Testing call setAVMetadata(callback) set avQueueName、avQueueId、avQueueImage(pixelmap)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1700', 0, async function (done) {
            console.info('TestLog: Creat pixelmap');
            let pixelMap = await getPixelMap();
            let readBuffer0 = new ArrayBuffer(96);
            await pixelMap.readPixelsToBuffer(readBuffer0);
            let bufferArr0 = new Uint8Array(readBuffer0);
            let metadata18 = {
                assetId: '121278',
                avQueueName: '121278',
                avQueueId: '121278',
                avQueueImage: pixelMap
            };
            session.setAVMetadata(metadata18, (err) => {
                if (err) {
                    console.info(`TestLog: set avQueueName、avQueueId、avQueueImage(pixelmap) error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            
            controller.getAVMetadata(async (err, value) => {
                let pixMap;
                if (err) {
                    console.info(`TestLog: getAVMetadata error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value && value.assetId === '121278' && value.avQueueName === '121278' && value.avQueueId === '121278') {
                    console.info('TestLog: getAVMetadata Successfully');
                    pixMap = value.avQueueImage;
                } else {
                    console.info(`TestLog: getAVMetadata failed:${value}`);
                    expect(false).assertTrue();
                }
                if (pixMap) {
                    let pixelSize = pixMap.getPixelBytesNumber();
                    console.info(`TestLog: pixelSize is: ${pixelSize}`);
                    let readBuffer = new ArrayBuffer(pixelSize);
                    await pixMap.readPixelsToBuffer(readBuffer);
                    let bufferArr2 = new Uint8Array(readBuffer);
                    for (let i = 0; i < bufferArr2.length; i++) {
                        if (bufferArr0[i] !== bufferArr2[i]) {
                            expect(false).assertTrue();
                        } else {
                            expect(true).assertTrue();
                        }
                    }
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1800
         * @tc.name      : setAVMetadata - callback - set avQueueName、avQueueId、avQueueImage(string)
         * @tc.desc      : Testing call setAVMetadata(callback) set avQueueName、avQueueId、avQueueImage(string)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1800', 0, async function (done) {
            let metadata = {
                assetId: '121278',
                avQueueName: '121278',
                avQueueId: '121278',
                avQueueImage: 'https://img2.baidu.com/it/u=3583435814,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500'
            };

            session.setAVMetadata(metadata, (err) => {
                if (err) {
                    console.info(`TestLog: Set avQueueName、avQueueId、avQueueImage(string) error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, data) => {
                if (err) {
                    console.info(`TestLog: Get avQueueName、avQueueId、avQueueImage(string) error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (data) {
                    expect(data.assetId).assertEqual(metadata.assetId);
                    expect(data.avQueueName).assertEqual(metadata.avQueueName);
                    expect(data.avQueueId).assertEqual(metadata.avQueueId);
                    expect(data.avQueueImage).assertEqual(metadata.avQueueImage);
                    console.info('TestLog: Get avQueueName、avQueueId、avQueueImage(string) Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get avQueueName、avQueueId、avQueueImage(string) failed:${data}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1900
         * @tc.name      : setAVMetadata - callback - set displayTags
         * @tc.desc      : Testing call setAVMetadata(callback) set displayTags
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1900', 0, async function (done) {
            let metadata = {
                assetId: '121278',
                displayTags: avSession.DisplayTag.TAG_AUDIO_VIVID
            };
            try {
                session.setAVMetadata(metadata, (err) => {
                    if (err) {
                        console.info(`TestLog: Set displayTags error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        controller.getAVMetadata((err, data) => {
                            if (err) {
                                console.info(`TestLog: Get displayTags error: code: ${err.code}, message: ${err.message}`);
                                expect(false).assertTrue();
                            } else if (data) {
                                console.info('TestLog: Get displayTags Successfully');
                                expect(data.assetId).assertEqual(metadata.assetId);
                                expect(data.displayTags).assertEqual(metadata.displayTags);
                            } else {
                                console.info(`TestLog: Get displayTags failed:${data}`);
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                })
            } catch (err) {
                console.info(`TestLog: set & get displayTags error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0100
         * @tc.name      : setAVPlaybackState - callback - set state & activeItemId
         * @tc.desc      : Testing call setAVPlaybackState(callback) set state & activeItemId
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0100', 0, async function (done) {
            let PlaybackState1 = {
                state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
            };
            session.setAVPlaybackState(PlaybackState1, (err) => {
                if (err) {
                    console.info(`TestLog: Set State error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set State successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.state === 2) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0200
         * @tc.name      : setAVPlaybackState - callback - set speed
         * @tc.desc      : Testing call setAVPlaybackState(callback) set speed
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0200', 0, async function (done) {
            let PlaybackState2 = {
                speed: 2.6,
            };

            session.setAVPlaybackState(PlaybackState2, (err) => {
                if (err) {
                    console.info(`TestLog: Set speed error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set speed successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get speed error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.speed === 2.6) {
                    console.info('TestLog: Get speed successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get speed failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0300
         * @tc.name      : setAVPlaybackState - callback - set position
         * @tc.desc      : Testing call setAVPlaybackState(callback) set position
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0300', 0, async function (done) {
            let PlaybackState3 = {
                position:{elapsedTime:10, updateTime:(new Date()).getTime()},
            };

            session.setAVPlaybackState(PlaybackState3, (err) => {
                if (err) {
                    console.info(`TestLog: Set position error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set position successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get position error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.position.elapsedTime === 10) {
                    console.info('TestLog: Get position successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get position failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0400
         * @tc.name      : setAVPlaybackState - callback - set bufferedTime
         * @tc.desc      : Testing call setAVPlaybackState(callback) set bufferedTime
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0400', 0, async function (done) {
            let PlaybackState4 = {
                bufferedTime: 1000,
            };

            session.setAVPlaybackState(PlaybackState4, (err) => {
                if (err) {
                    console.info(`TestLog: Set bufferedTime error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set bufferedTime successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get bufferedTime error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.bufferedTime === 1000) {
                    console.info('TestLog: Get bufferedTime successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get bufferedTime failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0500
         * @tc.name      : setAVPlaybackState - callback - set loopMode(LOOP_MODE_SEQUENCE)
         * @tc.desc      : Testing call setAVPlaybackState(callback) set loopMode(LOOP_MODE_SEQUENCE)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0500', 0, async function (done) {
            let PlaybackState5 = {
                loopMode:avSession.LoopMode.LOOP_MODE_SEQUENCE,
            };

            session.setAVPlaybackState(PlaybackState5, (err) => {
                if (err) {
                    console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set loopMode successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.loopMode === 0) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(1000);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0600
         * @tc.name      : setAVPlaybackState - callback - set loopMode(LOOP_MODE_SINGLE)
         * @tc.desc      : Testing call setAVPlaybackState(callback) set loopMode(LOOP_MODE_SINGLE)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0600', 0, async function (done) {
            let PlaybackState6 = {
                loopMode:avSession.LoopMode.LOOP_MODE_SINGLE,
            };

            session.setAVPlaybackState(PlaybackState6, (err) => {
                if (err) {
                    console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set loopMode successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.loopMode === 1) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(1000);
        })
        
        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0700
         * @tc.name      : setAVPlaybackState - callback - set loopMode(LOOP_MODE_LIST)
         * @tc.desc      : Testing call setAVPlaybackState(callback) set loopMode(LOOP_MODE_LIST)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0700', 0, async function (done) {
            let PlaybackState7 = {
                loopMode:avSession.LoopMode.LOOP_MODE_LIST,
            };

            session.setAVPlaybackState(PlaybackState7, (err) => {
                if (err) {
                    console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set loopMode successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.loopMode === 2) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(1000);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0800
         * @tc.name      : setAVPlaybackState - callback - set loopMode(LOOP_MODE_SHUFFLE)
         * @tc.desc      : Testing call setAVPlaybackState(callback) set loopMode(LOOP_MODE_SHUFFLE)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0800', 0, async function (done) {
            let PlaybackState8 = {
                loopMode:avSession.LoopMode.LOOP_MODE_SHUFFLE,
            };

            session.setAVPlaybackState(PlaybackState8, (err) => {
                if (err) {
                    console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set loopMode successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.loopMode === 3) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(1000);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0900
         * @tc.name      : setAVPlaybackState - callback - set isFavorite
         * @tc.desc      : Testing call setAVPlaybackState(callback) set isFavorite
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0900', 0, async function (done) {
            let PlaybackState9 = {
                isFavorite:true,
            };

            session.setAVPlaybackState(PlaybackState9, (err) => {
                if (err) {
                    console.info(`TestLog: Set isFavorite error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set isFavorite successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get isFavorite error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.isFavorite === true) {
                    console.info('TestLog: Get isFavorite successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get isFavorite failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(1000);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1000
         * @tc.name      : setAVPlaybackState - callback - set state(PLAYBACK_STATE_IDLE)
         * @tc.desc      : Testing call setAVPlaybackState(callback) set state(PLAYBACK_STATE_IDLE)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1000', 0, async function (done) {
            let PlaybackState10 = {
                state:avSession.PlaybackState.PLAYBACK_STATE_IDLE,
            };
            session.setAVPlaybackState(PlaybackState10, (err) => {
                if (err) {
                    console.info(`TestLog: Set State error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set State successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.state === 10) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1100
         * @tc.name      : setAVPlaybackState - callback - set state(PLAYBACK_STATE_BUFFERING)
         * @tc.desc      : Testing call setAVPlaybackState(callback) set state(PLAYBACK_STATE_BUFFERING)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1100', 0, async function (done) {
            let PlaybackState11 = {
                state:avSession.PlaybackState.PLAYBACK_STATE_BUFFERING,
            };
            session.setAVPlaybackState(PlaybackState11, (err) => {
                if (err) {
                    console.info(`TestLog: Set State error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set State successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.state === 11) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1200
         * @tc.name      : setAVPlaybackState - callback - set loopMode(LOOP_MODE_CUSTOM)
         * @tc.desc      : Testing call setAVPlaybackState(callback) set loopMode(LOOP_MODE_CUSTOM)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1200', 0, async function (done) {
            let PlaybackState = {
                loopMode: avSession.LoopMode.LOOP_MODE_CUSTOM
            };
            try {
                session.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Set loopMode successfully');
                        controller.getAVPlaybackState((err, value) => {
                            if (err) {
                                console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                                expect(false).assertTrue();
                            }else if (value.loopMode === 4) {
                                console.info('TestLog: Get loopMode successfully');
                                expect(true).assertTrue();
                            } else {
                                console.info('TestLog: Get loopMode failed');
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                })
            } catch (err) {
                console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1300
         * @tc.name      : setAVPlaybackState - callback - set maxVolume
         * @tc.desc      : Testing call setAVPlaybackState(callback) set maxVolume
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1300', 0, async function (done) {
            let PlaybackState = {
                maxVolume: 6
            };
            try {
                session.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`TestLog: Set maxVolume error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Set maxVolume successfully');
                        controller.getAVPlaybackState((err, value) => {
                            if (err) {
                                console.info(`TestLog: Get maxVolume error: code: ${err.code}, message: ${err.message}`);
                                expect(false).assertTrue();
                            }else if (value.maxVolume === PlaybackState.maxVolume) {
                                console.info('TestLog: Get maxVolume successfully');
                                expect(true).assertTrue();
                            } else {
                                console.info('TestLog: Get maxVolume failed');
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                })
            } catch (err) {
                console.info(`TestLog: Set maxVolume error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1400
         * @tc.name      : setAVPlaybackState - callback - set muted
         * @tc.desc      : Testing call setAVPlaybackState(callback) set muted
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1400', 0, async function (done) {
            let PlaybackState = {
                muted: false
            };
            try {
                session.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`TestLog: Set muted error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Set muted successfully');
                        controller.getAVPlaybackState((err, value) => {
                            if (err) {
                                console.info(`TestLog: Get muted error: code: ${err.code}, message: ${err.message}`);
                                expect(false).assertTrue();
                            }else if (value.muted === PlaybackState.muted) {
                                console.info('TestLog: Get muted successfully');
                                expect(true).assertTrue();
                            } else {
                                console.info('TestLog: Get muted failed');
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                })
            } catch (err) {
                console.info(`TestLog: Set muted error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1500
         * @tc.name      : setAVPlaybackState - callback - set videoWidth & videoHeight
         * @tc.desc      : Testing call setAVPlaybackState(callback) set videoWidth & videoHeight
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1500', 0, async function (done) {
            let PlaybackState = {
                videoWidth: 1920,
                videoHeight: 1080
            };
            try {
                session.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`TestLog: Set videoWidth & videoHeight error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Set videoWidth & videoHeight successfully');
                        controller.getAVPlaybackState((err, value) => {
                            if (err) {
                                console.info(`TestLog: Get videoWidth & videoHeight error: code: ${err.code}, message: ${err.message}`);
                                expect(false).assertTrue();
                            }else if (value.videoWidth === PlaybackState.videoWidth && value.videoHeight === PlaybackState.videoHeight) {
                                console.info('TestLog: Get videoWidth & videoHeight successfully');
                                expect(true).assertTrue();
                            } else {
                                console.info('TestLog: Get videoWidth & videoHeight failed');
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                })
            } catch (err) {
                console.info(`TestLog: Set videoWidth & videoHeight error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1600
         * @tc.name      : setAVPlaybackState - callback - set duration
         * @tc.desc      : Testing call setAVPlaybackState(callback) set duration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1600', 0, async function (done) {
            let PlaybackState = {
                duration: 100
            };
            try {
                session.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`TestLog: Set duration error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Set duration successfully');
                        controller.getAVPlaybackState((err, value) => {
                            if (err) {
                                console.info(`TestLog: Get duration error: code: ${err.code}, message: ${err.message}`);
                                expect(false).assertTrue();
                            }else if (value.duration === PlaybackState.duration) {
                                console.info('TestLog: Get duration successfully');
                                expect(true).assertTrue();
                            } else {
                                console.info('TestLog: Get duration failed');
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                })
            } catch (err) {
                console.info(`TestLog: Set duration error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_CALLBACK_0100
         * @tc.name      : set session launchAbility - callback
         * @tc.desc      : Testing call setLaunchAbility(callback)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_CALLBACK_0100', 0, async function(done) {
            let wantAgentInfo = {
                wants : [
                    {
                        bundleName : 'com.example.myapplication',
                        abilityName: 'com.example.myapplication.MainAbility'
                    }
                ],
                operationType: WantAgent.OperationType.START_ABILITIES,
                requestCode: 0,
                wantAgentFlags: [WantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
            };
            let agent;
            await WantAgent.getWantAgent(wantAgentInfo).then((callback) => {
                agent = callback;
            });

            session.setLaunchAbility(agent, (err) => {
                if (err) {
                    console.info(`TestLog: Set launchAbility error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set launchAbility successfully');
                }
            });

            await sleep(500);
            let wantagent;
            controller.getLaunchAbility((err, value) => {
                if (err) {
                    console.info(`TestLog: error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Get launchAbility');
                    wantagent = value;
                }
            });
            await sleep(500);
            await WantAgent.equal(agent, wantagent).then((bool) => {
                if (bool) {
                    console.info('AVSessionTest : Set LaunchAbility successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('AVSessionTest : Set LaunchAbility failed');
                    expect(false).assertTrue();
                }
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_CALLBACK_0100
         * @tc.name      : destroy session - callback
         * @tc.desc      : Testing destroy session(callback)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_CALLBACK_0100', 0, async function (done) {
            let flag = false;
            controller.on('sessionDestroy', () => {
                console.info('TestLog: Session destroyed successfully');
                flag = true;
            });

            session.destroy((err) => {
                if (err) {
                    console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Session destroy');
                }
            });

            await sleep(500);

            if (flag) {
                console.info('TestLog: Session destroyed successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Session destroyed failed');
                expect(false).assertTrue();
            }
            session = await avSession.createAVSession(context,tag,type);
            done();
        })
    })
}