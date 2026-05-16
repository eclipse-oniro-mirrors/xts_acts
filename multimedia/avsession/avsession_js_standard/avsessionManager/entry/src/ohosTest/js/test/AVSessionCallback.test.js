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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
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

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0100
         * @tc.desc   Testing call setAVMetadata(callback) set assetId
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0100]";
            let metadata0  = {
                assetId: '121278',
            };

            session.setAVMetadata(metadata0, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            });
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}Testlong:value.assetId = ${value.assetId}`);
                    expect(value.assetId).assertEqual(metadata0.assetId);
                    console.info(`${TAG}TestLog: Get assetId Successfully`);
                }

                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0200
         * @tc.desc   Testing call setAVMetadata(callback) set artist
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0200]";
            let metadata1  = {
                assetId: '121278',
                artist: 'Eminem',
            };
            session.setAVMetadata(metadata1, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set artist error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            });
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get artist error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}Testlong:value.artist = ${value.artist}`);
                    expect(value.artist).assertEqual(metadata1.artist);
                    console.info(`${TAG}TestLog: Get artist Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0300
         * @tc.desc   Testing call setAVMetadata(callback) set author
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0300]";
            let metadata2  = {
                assetId: '121278',
                author: 'ST',
            };
            session.setAVMetadata(metadata2, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set author error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get author error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}Testlong:value.author = ${value.author}`);
                    expect(value.author).assertEqual(metadata2.author);
                    console.info(`${TAG}TestLog: Get author Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0400
         * @tc.desc   Testing call setAVMetadata(callback) set album
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0400]";
            let metadata3  = {
                assetId: '121278',
                album: 'Slim shady',
            };
            session.setAVMetadata(metadata3, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set album error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get album error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}Testlong:value.album = ${value.album}`);
                    expect(value.album).assertEqual(metadata3.album);
                    console.info(`${TAG}TestLog: Get album Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0500
         * @tc.desc   Testing call setAVMetadata(callback) set writer
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0500]";
            let metadata4  = {
                assetId: '121278',
                writer: 'ST',
            };
            session.setAVMetadata(metadata4, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set writer error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get writer error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}Testlong:value.writer = ${value.writer}`);
                    expect(value.writer).assertEqual(metadata4.writer);
                    console.info(`${TAG}TestLog: Get writer Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0600
         * @tc.desc   Testing call setAVMetadata(callback) set composer
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0600]";
            let metadata5  = {
                assetId: '121278',
                composer: 'ST',
            };
            session.setAVMetadata(metadata5, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set composer error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get composer error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}Testlong:value.composer = ${value.composer}`);
                    expect(value.composer).assertEqual(metadata5.composer);
                    console.info(`${TAG}TestLog: Get composer Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0700
         * @tc.desc   Testing call setAVMetadata(callback) set duration
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0700]";
            let metadata6  = {
                assetId: '121278',
                duration: 2222,
            };
            session.setAVMetadata(metadata6, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set duration error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get duration error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}Testlong:value.duration = ${value.duration}`);
                    expect(value.duration).assertEqual(metadata6.duration);
                    console.info(`${TAG}TestLog: Get duration Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0800
         * @tc.desc   Testing call setAVMetadata(callback) set mediaImage(url)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0800]";
            let metadata7  = {
                assetId: '121278',
                mediaImage: 'https://img2.baidu.com/it/u=3583435814,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500',
            };
            session.setAVMetadata(metadata7, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set mediaImage error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get mediaImage error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}Testlong:value.mediaImage = ${value.mediaImage}`);
                    expect(value.mediaImage).assertEqual(metadata7.mediaImage);
                    console.info(`${TAG}TestLog: Get mediaImage Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0900
         * @tc.desc   Testing call setAVMetadata(callback) set mediaImage(pixelMap)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0900]";
            console.info(`${TAG}TestLog: Create pixelmap`);
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
                    console.info(`${TAG}TestLog: Set pixelMap error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            let pixMap;
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get pixelMap error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.assetId === metadata8.assetId) {
                    console.info(`${TAG}TestLog: Get pixelMap Successfully`);
                    pixMap = value.mediaImage;
                } else {
                    console.info(`${TAG}TestLog: Get pixelMap failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
            let pixelSize = pixMap.getPixelBytesNumber();
            console.info(`${TAG}TestLog: pixelSize is:${pixelSize}`);
            let readBuffer = new ArrayBuffer(pixelSize);
            pixMap.readPixelsToBuffer(readBuffer);
            await sleep(500);
            let bufferArr2 = new Uint8Array(readBuffer);
            for (let i = 0; i < bufferArr2.length; i++) {
                console.info(`${TAG}TestLog:bufferArr0[i] = ${bufferArr0[i]}`);
                expect(bufferArr0[i]).assertEqual(bufferArr2[i]);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1000
         * @tc.desc   Testing call setAVMetadata(callback) set publishDate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1000]";
            let metadata9  = {
                assetId: '121278',
                publishDate: new Date(1994,1,1,1),
            };
            session.setAVMetadata(metadata9, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set publishDate error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Set publishDate : successfully`);
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get publishDate error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog:value.publishDate.getTime() = ${value.publishDate.getTime()}`);
                    expect(value.publishDate.getTime()).assertEqual(metadata9.publishDate.getTime());
                    console.info(`${TAG}TestLog: Get publishDate Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1100
         * @tc.desc   Testing call setAVMetadata(callback) set subtitle
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1100]";
            let metadata10  = {
                assetId: '121278',
                subtitle: '8 Mile',
            };

            session.setAVMetadata(metadata10, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set subtitle error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Set subtitle successfully`);
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get subtitle error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}Testlong:value.subtitle = ${value.subtitle}`);
                    expect(value.subtitle).assertEqual(metadata10.subtitle);
                    console.info(`${TAG}TestLog: Get subtitle Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1200
         * @tc.desc   Testing call setAVMetadata(callback) set description
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1200]";
            let metadata11  = {
                assetId: '121278',
                description: 'Rap',
            };
            session.setAVMetadata(metadata11, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set description error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get description error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}Testlong:value.description = ${value.description}`);
                    expect(value.description).assertEqual(metadata11.description);
                    console.info(`${TAG}TestLog: Get description Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1300
         * @tc.desc   Testing call setAVMetadata(callback) set lyric
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1300]";
            let metadata12  = {
                assetId: '121278',
                lyric: 'https://lyric.tingmall.com/lyric/58/970/58970104-LRC-LRC.lrc?t=1649918948000',
            };

            session.setAVMetadata(metadata12, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set lyric error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get lyric error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}Testlong:value.lyric = ${value.lyric}`);
                    expect(value.lyric).assertEqual(metadata12.lyric);
                    console.info(`${TAG}TestLog: Get lyric Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1400
         * @tc.desc   Testing call setAVMetadata(callback) set previousAssetId & nextAssetId
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1400]";
            let metadata13  = {
                assetId: '121278',
                previousAssetId: '121277',
                nextAssetId: '121279',
            };

            session.setAVMetadata(metadata13, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}Testlong:value.previousAssetId = ${value.previousAssetId}`);
                    expect(value.previousAssetId).assertEqual(metadata13.previousAssetId);
                    console.info(`${TAG}Testlong:value.nextAssetId = ${value.nextAssetId}`);
                    expect(value.nextAssetId).assertEqual(metadata13.nextAssetId);
                    console.info(`${TAG}TestLog: Get assetId Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1500
         * @tc.desc   Testing call setAVMetadata(callback) set filter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1500]";
            let metadata16  = {
                assetId: '121278',
                filter: avSession.ProtocolType.TYPE_CAST_PLUS_MIRROR
            };

            session.setAVMetadata(metadata16, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set filter error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}Testlong:value.filter = ${value.filter}`);
                    expect(value.filter).assertEqual(metadata16.filter);
                    console.info(`${TAG}TestLog: Get filter Successfully`);
                }
                done();
            })
            await sleep(500);
        })
        
        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1600
         * @tc.desc   Testing call setAVMetadata(callback) set skipIntervals
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1600]";
            let metadata17  = {
                assetId: '121278',
                skipIntervals: avSession.SkipIntervals.SECONDS_10
            };

            session.setAVMetadata(metadata17, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set skipIntervals error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get skipIntervals error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}Testlong:value.skipIntervals = ${value.skipIntervals}`);
                    expect(value.skipIntervals).assertEqual(metadata17.skipIntervals);
                    console.info(`${TAG}TestLog: Get skipIntervals Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1700
         * @tc.desc   Testing call setAVMetadata(callback) set avQueueName、avQueueId、avQueueImage(pixelmap)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1700]";
            console.info(`${TAG}TestLog: Creat pixelmap`);
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
                    console.info(`${TAG}TestLog: set avQueueName、avQueueId、avQueueImage(pixelmap) error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            
            controller.getAVMetadata(async (err, value) => {
                let pixMap;
                if (err) {
                    console.info(`${TAG}TestLog: getAVMetadata error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value && value.assetId === '121278' && value.avQueueName === '121278' && value.avQueueId === '121278') {
                    console.info(`${TAG}TestLog: getAVMetadata Successfully`);
                    pixMap = value.avQueueImage;
                } else {
                    console.info(`${TAG}TestLog: getAVMetadata failed:${value}`);
                    expect(false).assertTrue();
                }
                if (pixMap) {
                    let pixelSize = pixMap.getPixelBytesNumber();
                    console.info(`${TAG}TestLog: pixelSize is: ${pixelSize}`);
                    let readBuffer = new ArrayBuffer(pixelSize);
                    await pixMap.readPixelsToBuffer(readBuffer);
                    let bufferArr2 = new Uint8Array(readBuffer);
                    for (let i = 0; i < bufferArr2.length; i++) {
                        console.info(`${TAG}Testlong: bufferArr = ${bufferArr0[i]}`);
                        expect(bufferArr0[i]).assertEqual(bufferArr2[i]);
                    }
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1800
         * @tc.desc   Testing call setAVMetadata(callback) set avQueueName、avQueueId、avQueueImage(string)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1800]";
            let metadata = {
                assetId: '121278',
                avQueueName: '121278',
                avQueueId: '121278',
                avQueueImage: 'https://img2.baidu.com/it/u=3583435814,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500'
            };

            session.setAVMetadata(metadata, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set avQueueName、avQueueId、avQueueImage(string) error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, data) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get avQueueName、avQueueId、avQueueImage(string) error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (data) {
                    expect(data.assetId).assertEqual(metadata.assetId);
                    expect(data.avQueueName).assertEqual(metadata.avQueueName);
                    expect(data.avQueueId).assertEqual(metadata.avQueueId);
                    expect(data.avQueueImage).assertEqual(metadata.avQueueImage);
                    console.info(`${TAG}TestLog: Get avQueueName、avQueueId、avQueueImage(string) Successfully`);
                } else {
                    console.info(`${TAG}TestLog: Get avQueueName、avQueueId、avQueueImage(string) failed:${data}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1900
         * @tc.desc   Testing call setAVMetadata(callback) set displayTags
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2000
         * @tc.desc   Testing call setAVMetadata(callback) set singleLyricText
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata = {
                assetId: '121278',
                singleLyricText: 'dream it possible'
            };
            try {
                session.setAVMetadata(metadata, (err) => {
                    if (err) {
                        console.info(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        controller.getAVMetadata((err, data) => {
                            if (err) {
                                console.info(`TestLog: Get singleLyricText error: code: ${err.code}, message: ${err.message}`);
                                expect(false).assertTrue();
                            } else if (data) {
                                console.info('TestLog: Get singleLyricText Successfully');
                                expect(data.assetId).assertEqual(metadata.assetId);
                                expect(data.singleLyricText).assertEqual(metadata.singleLyricText);
                            } else {
                                console.info(`TestLog: Get singleLyricText failed:${data}`);
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                })
            } catch (err) {
                console.info(`TestLog: set & get singleLyricText error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0100
         * @tc.desc   Testing call setAVPlaybackState(callback) set state & activeItemId
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0100]";
            let PlaybackState1 = {
                state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
            };
            session.setAVPlaybackState(PlaybackState1, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set State error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Set State successfully`);
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else {
                    console.info(`${TAG}Testlong:value.state = ${value.state}`);
                    expect(value.state).assertEqual(2);
                    console.info(`${TAG}TestLog: Get state Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0200
         * @tc.desc   Testing call setAVPlaybackState(callback) set speed
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0200]";
            let PlaybackState2 = {
                speed: 2.6,
            };

            session.setAVPlaybackState(PlaybackState2, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set speed error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Set speed successfully`);
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get speed error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else {
                    console.info(`${TAG}Testlong:value.speed = ${value.speed}`);
                    expect(value.speed).assertEqual(2.6);
                    console.info(`${TAG}TestLog: Get speed Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0300
         * @tc.desc   Testing call setAVPlaybackState(callback) set position
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0300]";
            let PlaybackState3 = {
                position:{elapsedTime:10, updateTime:(new Date()).getTime()},
            };

            session.setAVPlaybackState(PlaybackState3, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set position error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Set position successfully`);
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get position error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else {
                    console.info(`${TAG}Testlong:value.position.elapsedTime = ${value.position.elapsedTime}`);
                    expect(value.position.elapsedTime).assertEqual(10);
                    console.info(`${TAG}TestLog: Get position Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0400
         * @tc.desc   Testing call setAVPlaybackState(callback) set bufferedTime
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0400]";
            let PlaybackState4 = {
                bufferedTime: 1000,
            };

            session.setAVPlaybackState(PlaybackState4, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set bufferedTime error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Set bufferedTime successfully`);
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get bufferedTime error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else {
                    console.info(`${TAG}Testlong:value.bufferedTime = ${value.bufferedTime}`);
                    expect(value.bufferedTime).assertEqual(1000);
                    console.info(`${TAG}TestLog: Get bufferedTime Successfully`);
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0500
         * @tc.desc   Testing call setAVPlaybackState(callback) set loopMode(LOOP_MODE_SEQUENCE)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0500]";
            let PlaybackState5 = {
                loopMode:avSession.LoopMode.LOOP_MODE_SEQUENCE,
            };

            session.setAVPlaybackState(PlaybackState5, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Set loopMode successfully`);
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else {
                    console.info(`${TAG}Testlong:value.loopMode = ${value.loopMode}`);
                    expect(value.loopMode).assertEqual(0);
                    console.info(`${TAG}TestLog: Get loopMode Successfully`); 
                }
                done();
            })
            await sleep(1000);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0600
         * @tc.desc   Testing call setAVPlaybackState(callback) set loopMode(LOOP_MODE_SINGLE)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0600]";
            let PlaybackState6 = {
                loopMode:avSession.LoopMode.LOOP_MODE_SINGLE,
            };

            session.setAVPlaybackState(PlaybackState6, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Set loopMode successfully`);
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else {
                    console.info(`${TAG}Testlong:value.loopMode = ${value.loopMode}`);
                    expect(value.loopMode).assertEqual(1);
                    console.info(`${TAG}TestLog: Get loopMode Successfully`); 
                }
                done();
            })
            await sleep(1000);
        })
        
        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0700
         * @tc.desc   Testing call setAVPlaybackState(callback) set loopMode(LOOP_MODE_LIST)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0700]";
            let PlaybackState7 = {
                loopMode:avSession.LoopMode.LOOP_MODE_LIST,
            };

            session.setAVPlaybackState(PlaybackState7, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Set loopMode successfully`);
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else {
                    console.info(`${TAG}Testlong:value.loopMode = ${value.loopMode}`);
                    expect(value.loopMode).assertEqual(2);
                    console.info(`${TAG}TestLog: Get loopMode Successfully`); 
                }
                done();
            })
            await sleep(1000);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0800
         * @tc.desc   Testing call setAVPlaybackState(callback) set loopMode(LOOP_MODE_SHUFFLE)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0800]";
            let PlaybackState8 = {
                loopMode:avSession.LoopMode.LOOP_MODE_SHUFFLE,
            };

            session.setAVPlaybackState(PlaybackState8, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Set loopMode successfully`);
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else {
                    console.info(`${TAG}Testlong:value.loopMode = ${value.loopMode}`);
                    expect(value.loopMode).assertEqual(3);
                    console.info(`${TAG}TestLog: Get loopMode Successfully`); 
                }
                done();
            })
            await sleep(1000);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0900
         * @tc.desc   Testing call setAVPlaybackState(callback) set isFavorite
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0900]";
            let PlaybackState9 = {
                isFavorite:true,
            };

            session.setAVPlaybackState(PlaybackState9, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set isFavorite error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Set isFavorite successfully`);
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get isFavorite error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else {
                    console.info(`${TAG}Testlong:value.isFavorite = ${value.isFavorite}`);
                    expect(value.isFavorite).assertEqual(true);
                    console.info(`${TAG}TestLog: Get isFavorite Successfully`); 
                }
                done();
            })
            await sleep(1000);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1000
         * @tc.desc   Testing call setAVPlaybackState(callback) set state(PLAYBACK_STATE_IDLE)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1000]";
            let PlaybackState10 = {
                state:avSession.PlaybackState.PLAYBACK_STATE_IDLE,
            };
            session.setAVPlaybackState(PlaybackState10, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set State error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Set State successfully`);
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else {
                    console.info(`${TAG}Testlong:value.state = ${value.state}`);
                    expect(value.state).assertEqual(10);
                    console.info(`${TAG}TestLog: Get state Successfully`); 
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1100
         * @tc.desc   Testing call setAVPlaybackState(callback) set state(PLAYBACK_STATE_BUFFERING)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1100]";
            let PlaybackState11 = {
                state:avSession.PlaybackState.PLAYBACK_STATE_BUFFERING,
            };
            session.setAVPlaybackState(PlaybackState11, (err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Set State error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Set State successfully`);
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else {
                    console.info(`${TAG}Testlong:value.state = ${value.state}`);
                    expect(value.state).assertEqual(11);
                    console.info(`${TAG}TestLog: Get state Successfully`); 
                }
                done();
            })
            await sleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1200
         * @tc.desc   Testing call setAVPlaybackState(callback) set loopMode(LOOP_MODE_CUSTOM)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1200]";
            let PlaybackState = {
                loopMode: avSession.LoopMode.LOOP_MODE_CUSTOM
            };
            try {
                session.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`${TAG}TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info(`${TAG}TestLog: Set loopMode successfully`);
                        controller.getAVPlaybackState((err, value) => {
                            if (err) {
                                console.info(`${TAG}TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                                expect(false).assertTrue();
                            }else {
                                console.info(`${TAG}Testlong:value.loopMode = ${value.loopMode}`);
                                expect(value.loopMode).assertEqual(4);
                                console.info(`${TAG}TestLog: Get loopMode Successfully`); 
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

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1300
         * @tc.desc   Testing call setAVPlaybackState(callback) set maxVolume
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1300]";
            let PlaybackState = {
                maxVolume: 6
            };
            try {
                session.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`${TAG}TestLog: Set maxVolume error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info(`${TAG}TestLog: Set maxVolume successfully`);
                        controller.getAVPlaybackState((err, value) => {
                            if (err) {
                                console.info(`${TAG}TestLog: Get maxVolume error: code: ${err.code}, message: ${err.message}`);
                                expect(false).assertTrue();
                            }else {
                                console.info(`${TAG}Testlong:value.maxVolume = ${value.maxVolume}`);
                                expect(value.maxVolume).assertEqual(PlaybackState.maxVolume);
                                console.info(`${TAG}TestLog: Get maxVolume Successfully`); 
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

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1400
         * @tc.desc   Testing call setAVPlaybackState(callback) set muted
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1400]";
            let PlaybackState = {
                muted: false
            };
            try {
                session.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`${TAG}TestLog: Set muted error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info(`${TAG}TestLog: Set muted successfully`);
                        controller.getAVPlaybackState((err, value) => {
                            if (err) {
                                console.info(`${TAG}TestLog: Get muted error: code: ${err.code}, message: ${err.message}`);
                                expect(false).assertTrue();
                            }else {
                                console.info(`${TAG}Testlong:value.muted = ${value.muted}`);
                                expect(value.muted).assertEqual(PlaybackState.muted);
                                console.info(`${TAG}TestLog: Get muted Successfully`); 
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

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1500
         * @tc.desc   Testing call setAVPlaybackState(callback) set videoWidth & videoHeight
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1500]";
            let PlaybackState = {
                videoWidth: 1920,
                videoHeight: 1080
            };
            try {
                session.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`${TAG}TestLog: Set videoWidth & videoHeight error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info(`${TAG}TestLog: Set videoWidth & videoHeight successfully`);
                        controller.getAVPlaybackState((err, value) => {
                            if (err) {
                                console.info(`${TAG}TestLog: Get videoWidth & videoHeight error: code: ${err.code}, message: ${err.message}`);
                                expect(false).assertTrue();
                            }else {
                                console.info(`${TAG}Testlong:value.videoWidth = ${value.videoWidth}`);
                                expect(value.videoWidth).assertEqual(PlaybackState.videoWidth);
                                console.info(`${TAG}Testlong:value.videoHeight = ${value.videoHeight}`);
                                expect(value.videoHeight).assertEqual(PlaybackState.videoHeight);
                                
                                console.info(`${TAG}TestLog: Get videoWidth & videoHeight Successfully`); 
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

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1600
         * @tc.desc   Testing call setAVPlaybackState(callback) set duration
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1600]";
            let PlaybackState = {
                duration: 100
            };
            try {
                session.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`${TAG}TestLog: Set duration error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info(`${TAG}TestLog: Set duration successfully`);
                        controller.getAVPlaybackState((err, value) => {
                            if (err) {
                                console.info(`${TAG}TestLog: Get duration error: code: ${err.code}, message: ${err.message}`);
                                expect(false).assertTrue();
                            }else {
                                console.info(`${TAG}Testlong:value.duration = ${value.duration}`);
                                expect(value.duration).assertEqual(PlaybackState.duration);
                                console.info(`${TAG}TestLog: Get duration Successfully`); 
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

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_CALLBACK_0100
         * @tc.desc   Testing call setLaunchAbility(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function(done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_CALLBACK_0100]";
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
                    console.info(`${TAG}TestLog: Set launchAbility error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Set launchAbility successfully`);
                }
            });

            await sleep(500);
            let wantagent;
            controller.getLaunchAbility((err, value) => {
                if (err) {
                    console.info(`${TAG}TestLog: error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Get launchAbility`);
                    wantagent = value;
                }
            });
            await sleep(500);
            let agentBundleName = await WantAgent.getBundleName(agent);
            let wantagentBundleName = await WantAgent.getBundleName(wantagent);
            console.info(`${TAG}Testlong:agentBundleName = ${agentBundleName}`);
            expect(agentBundleName).assertEqual(wantagentBundleName);
            console.info(`${TAG}TestLog: AVSessionTest : Set LaunchAbility successfully`); 
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_CALLBACK_0100
         * @tc.desc   Testing destroy session(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_CALLBACK_0100]";
            let flag = false;
            controller.on('sessionDestroy', () => {
                console.info(`${TAG}TestLog: Session destroyed successfully`);
                flag = true;
            });

            session.destroy((err) => {
                if (err) {
                    console.info(`${TAG}TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: Session destroy`);
                }
            });

            await sleep(500);

            console.info(`${TAG}Testlong:flag = ${flag}`);
            expect(flag).assertTrue();
            console.info(`${TAG}TestLog: TestLog: Session destroyed successful`);
            session = await avSession.createAVSession(context,tag,type);
            done();
        })
    })
}