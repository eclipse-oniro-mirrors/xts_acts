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
import ohosWantAgent from '@ohos.wantAgent';
import WantAgent from '@ohos.app.ability.wantAgent';
import featureAbility from '@ohos.ability.featureAbility';

export default function AVSession() {
    describe('AVSession', function () {
        let tag = 'ApplicationA';
        let type = 'audio';
        let session;
        let controller;
        let OutputDeviceInfo = { isRemote: false, audioDeviceId: [0], deviceName: ['LocalDevice'] };
        let keyItem = { code: 0x49, pressedTime: 123456789, deviceId: 0 };
        let event = { action: 2, key: keyItem, keys: [keyItem] };
        let context = featureAbility.getContext();
        let castControlCommandType = 'play';
        let deviceInfo = {
            castCategory: 0,
            deviceId: "deviceId",
            deviceName: "deviceName",
        }
        let outputDeviceInfo = {
            devices: [deviceInfo],
        }

        function sleep(ms) {
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
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, AlphaType: 3 };
            return image.createPixelMap(color, opts);
        }

        beforeAll(function () {
            console.info('TestLog: Start Testing avSession Interfaces');
        })

        beforeEach(async function () {
            console.info('TestLog: Init Session And Controller');
            await init()
        });

        afterEach(async function (done) {
            console.info('TestLog: Destroy Session And Controller');
            await destroy();
            done();
        })

        afterAll(function () {
            console.info('TestLog: End Testing avSession Interfaces');
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_READ_SESSION_ID_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_READ_SESSION_ID_0100
         * @tc.desc   Testing read property sessionId
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_READ_SESSION_ID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            if (session.sessionId.length === 64 && controller.sessionId.length === 64) {
                console.info('TestLog: Read AVSession & Controler sessionId successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Read sessionId failed');
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0100
         * @tc.desc   Testing call setAVMetadata(promise) set assetId
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata0 = {
                assetId: '121278',
            };
            await session.setAVMetadata(metadata0).then(() => {
                console.info('TestLog: Set assetId successfully');
            }).catch((err) => {
                console.info(`TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.assetId === '121278') {
                    console.info('TestLog: Get assetId Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get assetId failed');
                    console.info(`TestLog: assetId is: ${data.assetId}`);
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0200
         * @tc.desc   Testing call setAVMetadata(promise) set artist
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata1 = {
                assetId: '121278',
                artist: 'Eminem',
            };
            await session.setAVMetadata(metadata1).then(() => {
                console.info('TestLog: Set artist successfully');
            }).catch((err) => {
                console.info(`TestLog: Set artist error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.artist === metadata1.artist) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get artist failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get artist error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0300
         * @tc.desc   Testing call setAVMetadata(promise) set author
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata2 = {
                assetId: '121278',
                author: 'ST',
            };
            await session.setAVMetadata(metadata2).then(() => {
                console.info('TestLog: Set author successfully');
            }).catch((err) => {
                console.info(`TestLog: Set author error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.author === metadata2.author) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get author failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get author error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0400
         * @tc.desc   Testing call setAVMetadata(promise) set album
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata3 = {
                assetId: '121278',
                album: 'Slim shady',
            };
            await session.setAVMetadata(metadata3).then(() => {
                console.info('TestLog: Set album successfully');
            }).catch((err) => {
                console.info(`TestLog: Set album error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.album === metadata3.album) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get album failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get album error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0500
         * @tc.desc   Testing call setAVMetadata(promise) set writer
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata4 = {
                assetId: '121278',
                writer: 'ST',
            };
            await session.setAVMetadata(metadata4).then(() => {
                console.info('TestLog: Set writer successfully');
            }).catch((err) => {
                console.info(`TestLog: Set writer error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.writer === metadata4.writer) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get writer failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get writer error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0600
         * @tc.desc   Testing call setAVMetadata(promise) set composer
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata5 = {
                assetId: '121278',
                composer: 'ST',
            };
            await session.setAVMetadata(metadata5).then(() => {
                console.info('TestLog: Set composer successfully');
            }).catch((err) => {
                console.info(`TestLog: Set composer error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.composer === metadata5.composer) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get composer failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get composer error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0700
         * @tc.desc   Testing call setAVMetadata(promise) set duration
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata6 = {
                assetId: '121278',
                duration: 2222,
            };
            await session.setAVMetadata(metadata6).then(() => {
                console.info('TestLog: Set duration successfully');
            }).catch((err) => {
                console.info(`TestLog: Set duration error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.duration === metadata6.duration) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get duration failed');
                    console.info(`TestLog: Get duration is: ${data.duration}`);
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get duration error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0800
         * @tc.desc   Testing call setAVMetadata(promise) set mediaImage(url)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata7 = {
                assetId: '121278',
                mediaImage: 'https://img2.baidu.com/it/u=3583435814,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500',
            };
            await session.setAVMetadata(metadata7).then(() => {
                console.info('TestLog: Set mediaImage successfully');
            }).catch((err) => {
                console.info(`TestLog: Set mediaImage error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.mediaImage === metadata7.mediaImage) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get mediaImage failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get mediaImage error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0900
         * @tc.desc   Testing call setAVMetadata(promise) set mediaImage(pixelMap)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('TestLog: Creat pixelmap');
            let pixelMap = await getPixelMap();
            let readBuffer0 = new ArrayBuffer(96);
            await pixelMap.readPixelsToBuffer(readBuffer0);
            let bufferArr0 = new Uint8Array(readBuffer0);
            let metadata8 = {
                assetId: '121278',
                mediaImage: pixelMap,
            };
            await session.setAVMetadata(metadata8).then(() => {
                console.info('TestLog: Set pixelMap successfully');
            }).catch((err) => {
                console.info(`TestLog: Set pixelMap error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            let pixMap;
            await controller.getAVMetadata().then((data) => {
                if (data.assetId === '121278') {
                    pixMap = data.mediaImage;
                } else {
                    console.info('TestLog: Get pixelMap failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get pixelMap error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
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
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1000
         * @tc.desc   Testing call setAVMetadata(promise) set publishDate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata9 = {
                assetId: '121278',
                publishDate: new Date(1994, 1, 1, 1),
            };
            await session.setAVMetadata(metadata9).then(() => {
                console.info('TestLog: Set publishDate successfully');
            }).catch((err) => {
                console.info(`TestLog: Set publishDate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.publishDate.getTime() === metadata9.publishDate.getTime()) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get publishDate failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get publishDate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1100
         * @tc.desc   Testing call setAVMetadata(promise) set subtitle
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata10 = {
                assetId: '121278',
                subtitle: '8 Mile',
            };
            await session.setAVMetadata(metadata10).then(() => {
                console.info('TestLog: Set subtitle successfully');
            }).catch((err) => {
                console.info(`TestLog: Set subtitle error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.subtitle === metadata10.subtitle) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get subtitle failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get subtitle error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1200
         * @tc.desc   Testing call setAVMetadata(promise) set description
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata11 = {
                assetId: '121278',
                description: 'Rap',
            };
            await session.setAVMetadata(metadata11).then(() => {
                console.info('TestLog: Set description successfully');
            }).catch((err) => {
                console.info(`TestLog: Set description error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.description === metadata11.description) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get description failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get description error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1300
         * @tc.desc   Testing call setAVMetadata(promise) set lyric
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata12 = {
                assetId: '121278',
                lyric: 'https://lyric.tingmall.com/lyric/58/970/589710004-LRC-LRC.lrc?t=1649918948000',
            };
            await session.setAVMetadata(metadata12).then(() => {
                console.info('TestLog: Set lyric successfully');
            }).catch((err) => {
                console.info(`TestLog: Set lyric error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.lyric === metadata12.lyric) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get lyric failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get lyric error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1400
         * @tc.desc   Testing call setAVMetadata(promise) set previousAssetId & nextAssetId
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata13 = {
                assetId: '121278',
                previousAssetId: '121277',
                nextAssetId: '121279',
            };
            await session.setAVMetadata(metadata13).then(() => {
                console.info('TestLog: Set assetId successfully');
            }).catch((err) => {
                console.info(`TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.previousAssetId === metadata13.previousAssetId
                    && data.nextAssetId === metadata13.nextAssetId) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get assetId failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

         /**
          * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1500
          * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1500
          * @tc.desc   Testing call setAVMetadata(promise) set filter(TYPE_CAST_PLUS_STREAM)
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata = {
                assetId: '121278',
                filter: avSession.ProtocolType.TYPE_CAST_PLUS_STREAM
            };
            await session.setAVMetadata(metadata).then(() => {
                console.info('TestLog: Set filter successfully');
            }).catch((err) => {
                console.info(`TestLog: Set filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.filter === metadata.filter) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get filter failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1600
         * @tc.desc   Testing call setAVMetadata(promise) set filter(TYPE_LOCAL)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata = {
                assetId: '121278',
                filter: avSession.ProtocolType.TYPE_LOCAL
            };
            await session.setAVMetadata(metadata).then(() => {
                console.info('TestLog: Set filter successfully');
            }).catch((err) => {
                console.info(`TestLog: Set filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.filter === metadata.filter) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get filter failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1700
         * @tc.desc   Testing call setAVMetadata(promise) set filter(TYPE_CAST_PLUS_MIRROR)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata = {
                assetId: '121278',
                filter: avSession.ProtocolType.TYPE_CAST_PLUS_MIRROR
            };
            await session.setAVMetadata(metadata).then(() => {
                console.info('TestLog: Set filter successfully');
            }).catch((err) => {
                console.info(`TestLog: Set filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.filter === metadata.filter) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get filter failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1800
         * @tc.desc   Testing call setAVMetadata(promise) set skipIntervals
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata = {
                assetId: '121278',
                skipIntervals: avSession.SkipIntervals.SECONDS_10
            };
            await session.setAVMetadata(metadata).then(() => {
                console.info('TestLog: Set skipIntervals successfully');
            }).catch((err) => {
                console.info(`TestLog: Set skipIntervals error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.skipIntervals === metadata.skipIntervals) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get skipIntervals failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get skipIntervals error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1900
         * @tc.desc   Testing call setAVMetadata(promise) set avQueueName、avQueueId、avQueueImage(pixelmap)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('TestLog: Creat pixelmap');
            let pixelMap = await getPixelMap();
            let readBuffer0 = new ArrayBuffer(96);
            await pixelMap.readPixelsToBuffer(readBuffer0);
            let bufferArr0 = new Uint8Array(readBuffer0);
            let metadata = {
                assetId: '121278',
                avQueueName: '121278',
                avQueueId: '121278',
                avQueueImage: pixelMap
            };
            await session.setAVMetadata(metadata).then(() => {
                console.info('TestLog: Set avQueueName、avQueueId、avQueueImage successfully');
            }).catch((err) => {
                console.info(`TestLog: Set avQueueName、avQueueId、avQueueImage error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            let pixMap;
            await controller.getAVMetadata().then((data) => {
                if (data.assetId === '121278' && data.avQueueName === '121278' && data.avQueueId === '121278') {
                    pixMap = data.avQueueImage;
                } else {
                    console.info('TestLog: getAVMetadata value error.');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: getAVMetadata error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
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

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2000
         * @tc.desc   Testing call setAVMetadata(promise) set avQueueName、avQueueId、avQueueImage(string)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata = {
                assetId: '121278',
                avQueueName: '121278',
                avQueueId: '121278',
                avQueueImage: 'https://img2.baidu.com/it/u=3583435814,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500'
            };
            await session.setAVMetadata(metadata).then(() => {
                console.info('TestLog: Set avQueueName、avQueueId、avQueueImage successfully');
            }).catch((err) => {
                console.info(`TestLog: Set avQueueName、avQueueId、avQueueImage error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await controller.getAVMetadata().then((data) => {
                if (data) {
                    expect(data.assetId).assertEqual(metadata.assetId);
                    expect(data.avQueueName).assertEqual(metadata.avQueueName);
                    expect(data.avQueueId).assertEqual(metadata.avQueueId);
                    expect(data.avQueueImage).assertEqual(metadata.avQueueImage);
                } else {
                    console.info('TestLog: getAVMetadata failed.');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: getAVMetadata error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2100
         * @tc.desc   Testing call setAVMetadata(promise) set displayTags
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata = {
                assetId: '121278',
                displayTags: avSession.DisplayTag.TAG_AUDIO_VIVID
            };
            await session.setAVMetadata(metadata).then(() => {
                console.info('TestLog: Set displayTags successfully');
            }).catch((err) => {
                console.info(`TestLog: Set displayTags error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await controller.getAVMetadata().then((data) => {
                if (data) {
                    expect(data.assetId).assertEqual(metadata.assetId);
                    expect(data.displayTags).assertEqual(metadata.displayTags);
                } else {
                    console.info('TestLog: getAVMetadata failed.');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: getAVMetadata error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0100
         * @tc.desc   Testing call setAVPlaybackState(promise) set state & activeItemId
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState1 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_PLAY,
                activeItemId: 0,
            };
            await session.setAVPlaybackState(PlaybackState1).then(() => {
                console.info('TestLog: Set State successfully');
            }).catch((err) => {
                console.info(`TestLog: Set State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 2) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0200
         * @tc.desc   Testing call setAVPlaybackState(promise) set speed
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState2 = {
                speed: 2.6,
            };

            await session.setAVPlaybackState(PlaybackState2).then(() => {
                console.info('TestLog: Set speed successfully');
            }).catch((err) => {
                console.info(`TestLog: Set speed error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.speed === 2.6) {
                    console.info('TestLog: Get speed successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get speed failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get speed error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0300
         * @tc.desc   Testing call setAVPlaybackState(promise) set position
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState3 = {
                position: { elapsedTime: 10, updateTime: (new Date()).getTime() },
            };

            await session.setAVPlaybackState(PlaybackState3).then(() => {
                console.info('TestLog: Set position successfully');
            }).catch((err) => {
                console.info(`TestLog: Set position error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.position.elapsedTime === 10) {
                    console.info('TestLog: Get position successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get position failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get position error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0400
         * @tc.desc   Testing call setAVPlaybackState(promise) set bufferedTime
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState4 = {
                bufferedTime: 1000,
            };

            await session.setAVPlaybackState(PlaybackState4).then(() => {
                console.info('TestLog: Set bufferedTime successfully');
            }).catch((err) => {
                console.info(`TestLog: Set bufferedTime error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.bufferedTime === 1000) {
                    console.info('TestLog: Get bufferedTime successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get bufferedTime failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get bufferedTime error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0500
         * @tc.desc   Testing call setAVPlaybackState(promise) set loopMode(LOOP_MODE_SEQUENCE)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState5 = {
                loopMode: avSession.LoopMode.LOOP_MODE_SEQUENCE,
            };

            await session.setAVPlaybackState(PlaybackState5).then(() => {
                console.info('TestLog: Set loopMode successfully');
            }).catch((err) => {
                console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.loopMode === 0) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0600
         * @tc.desc   Testing call setAVPlaybackState(promise) set loopMode(LOOP_MODE_SINGLE)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState6 = {
                loopMode: avSession.LoopMode.LOOP_MODE_SINGLE,
            };

            await session.setAVPlaybackState(PlaybackState6).then(() => {
                console.info('TestLog: Set loopMode successfully');
            }).catch((err) => {
                console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.loopMode === 1) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0700
         * @tc.desc   Testing call setAVPlaybackState(promise) set loopMode(LOOP_MODE_LIST)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState7 = {
                loopMode: avSession.LoopMode.LOOP_MODE_LIST,
            };

            await session.setAVPlaybackState(PlaybackState7).then(() => {
                console.info('TestLog: Set loopMode successfully');
            }).catch((err) => {
                console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.loopMode === 2) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0800
         * @tc.desc   Testing call setAVPlaybackState(promise) set loopMode(LOOP_MODE_SHUFFLE)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState8 = {
                loopMode: avSession.LoopMode.LOOP_MODE_SHUFFLE,
            };

            await session.setAVPlaybackState(PlaybackState8).then(() => {
                console.info('TestLog: Set loopMode successfully');
            }).catch((err) => {
                console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.loopMode === 3) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0900
         * @tc.desc   Testing call setAVPlaybackState(promise) set isFavorite
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState9 = {
                isFavorite: true,
            };

            await session.setAVPlaybackState(PlaybackState9).then(() => {
                console.info('TestLog: Set isFavorite successfully');
            }).catch((err) => {
                console.info(`TestLog: Set isFavorite error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.isFavorite === true) {
                    console.info('TestLog: Get isFavorite successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get isFavorite failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get isFavorite error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1000
         * @tc.desc   Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_INITIAL)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState12 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_INITIAL,
            };
            await session.setAVPlaybackState(PlaybackState12).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 0) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1100
         * @tc.desc   Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_PREPARE)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState13 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_PREPARE,
            };
            await session.setAVPlaybackState(PlaybackState13).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 1) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1200
         * @tc.desc   Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_PAUSE)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState14 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_PAUSE,
            };
            await session.setAVPlaybackState(PlaybackState14).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 3) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1300
         * @tc.desc   Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_FAST_FORWARD)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState15 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_FAST_FORWARD,
            };
            await session.setAVPlaybackState(PlaybackState15).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 4) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1400
         * @tc.desc   Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_REWIND)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState16 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_REWIND,
            };
            await session.setAVPlaybackState(PlaybackState16).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 5) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1500
         * @tc.desc   Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_STOP)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState17 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_STOP,
            };
            await session.setAVPlaybackState(PlaybackState17).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 6) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1600
         * @tc.desc   Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_IDLE)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState18 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_IDLE,
            };
            await session.setAVPlaybackState(PlaybackState18).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 10) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1700
         * @tc.desc   Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_BUFFERING)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let playbackState = {
                state: avSession.PlaybackState.PLAYBACK_STATE_BUFFERING,
            };
            await session.setAVPlaybackState(playbackState).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 11) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1800
         * @tc.desc   Testing call setAVPlaybackState(promise) set loopMode(LOOP_MODE_CUSTOM)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState5 = {
                loopMode: avSession.LoopMode.LOOP_MODE_CUSTOM,
            };

            await session.setAVPlaybackState(PlaybackState5).then(() => {
                console.info('TestLog: Set loopMode successfully');
            }).catch((err) => {
                console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.loopMode === 4) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1900
         * @tc.desc   Testing call setAVPlaybackState(promise) set maxVolume
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState = {
                maxVolume: 6
            };

            await session.setAVPlaybackState(PlaybackState).then(() => {
                console.info('TestLog: Set maxVolume successfully');
            }).catch((err) => {
                console.info(`TestLog: Set maxVolume error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.maxVolume === PlaybackState.maxVolume) {
                    console.info('TestLog: Get maxVolume successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get maxVolume failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get maxVolume error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_2000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_2000
         * @tc.desc   Testing call setAVPlaybackState(promise) set muted
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState = {
                muted: false
            };

            await session.setAVPlaybackState(PlaybackState).then(() => {
                console.info('TestLog: Set muted successfully');
            }).catch((err) => {
                console.info(`TestLog: Set muted error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.muted === PlaybackState.muted) {
                    console.info('TestLog: Get muted successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get muted failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get muted error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_2100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_2100
         * @tc.desc   Testing call setAVPlaybackState(promise) set videoWidth & videoHeight
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState = {
                videoWidth: 1920,
                videoHeight: 1080
            };

            await session.setAVPlaybackState(PlaybackState).then(() => {
                console.info('TestLog: Set videoWidth & videoHeight successfully');
            }).catch((err) => {
                console.info(`TestLog: Set videoWidth & videoHeight error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.videoWidth === PlaybackState.videoWidth && data.videoHeight === PlaybackState.videoHeight) {
                    console.info('TestLog: Get videoWidth & videoHeight successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get videoWidth & videoHeight failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get videoWidth & videoHeight error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_2200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_2200
         * @tc.desc   Testing call setAVPlaybackState(promise) set duration
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState = {
                duration: 100
            };

            await session.setAVPlaybackState(PlaybackState).then(() => {
                console.info('TestLog: Set duration successfully');
            }).catch((err) => {
                console.info(`TestLog: Set duration error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.duration === PlaybackState.duration) {
                    console.info('TestLog: Get duration successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get duration failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get duration error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_PROMISE_0100
         * @tc.desc   Testing call setLaunchAbility(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let wantAgentInfo = {
                wants: [
                    {
                        bundleName: 'com.example.myapplication',
                        abilityName: 'com.example.myapplication.MainAbility'
                    }
                ],
                operationType: ohosWantAgent.OperationType.START_ABILITIES,
                requestCode: 0,
                wantAgentFlags: [WantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
            };
            let agent;
            await WantAgent.getWantAgent(wantAgentInfo).then((callback) => {
                agent = callback;
            });

            await session.setLaunchAbility(agent).then(() => {
                console.info('TestLog: AVSessionTest : Set LaunchAbility');
            }).catch((err) => {
                console.info(`TestLog: Set LaunchAbility error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            let wantagent;
            await controller.getLaunchAbility().then((data) => {
                wantagent = data;
                console.info('TestLog: Get launchAbility');
            }).catch((err) => {
                console.info(`TestLog: Get LaunchAbility error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            let agentBundleName = await WantAgent.getBundleName(agent);
            let wantagentBundleName = await WantAgent.getBundleName(wantagent);
            if (agentBundleName == wantagentBundleName) {
                console.info('TestLog: AVSessionTest : Set LaunchAbility successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: AVSessionTest : Set LaunchAbility failed');
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_PROMISE_0100
         * @tc.desc   Testing set session active - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await session.activate().then(() => {
                console.info('TestLog: Set session active successfully');
            }).catch((err) => {
                console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            
            await controller.isActive().then((data) => {
                if (data) {
                    console.info('TestLog: session is active');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: session is directive');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: AVSessionTest error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_PROMISE_0100
         * @tc.desc   Testing set session deactivate - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await session.activate().then(() => {
                console.info('TestLog: Set session active');
            }).catch((err) => {
                console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await session.deactivate().then(() => {
                console.info('TestLog: Deactivate session');
            }).catch((err) => {
                console.info(`TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.isActive().then((data) => {
                if (data) {
                    console.info('TestLog: session deactivate failed');
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: session deactivate successfully');
                    expect(true).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: AVSessionTest error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_CALLBACK_0100
         * @tc.desc   Testing set session active - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                session.activate((err) => {
                    if (err) {
                        console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Set session active successfully');
                    }
                })
            } catch (err) {
                console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }

            await sleep(500);
            await controller.isActive((err, isActive) => {
                if(err) {
                    console.info(`TestLog: AVSessionTest error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    if (isActive) {
                        console.info('TestLog: session is active');
                        expect(true).assertTrue();
                    } else {
                        console.info('TestLog: session is directive');
                        expect(false).assertTrue();
                    }
                }
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_CALLBACK_0100
         * @tc.desc   Testing set session deactivate - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await session.activate().then(() => {
                console.info('TestLog: Set session active');
            }).catch((err) => {
                console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            try {
                session.deactivate((err) => {
                    if (err) {
                        console.info(`TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Deactivate session');
                    }
                })
            } catch (err) {
                console.info(`TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await sleep(500);

            await controller.isActive((err, isActive) => {
                if(err) {
                    console.info(`TestLog: AVSessionTest error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    if (isActive) {
                        console.info('TestLog: session deactivate failed');
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: session deactivate successfully');
                        expect(true).assertTrue();
                    }
                }
                
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAY_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAY_0100
         * @tc.desc   Testing onPlay callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('play', () => {
                console.info('TestLog: Play command callback registration successful');
                expect(true).assertTrue();
            });

            await controller.sendControlCommand({ command: 'play' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPAUSE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPAUSE_0100
         * @tc.desc   Testing onPause callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPAUSE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('pause', () => {
                console.info('TestLog: Pause command callback registration successful');
                expect(true).assertTrue();
            });

            await controller.sendControlCommand({ command: 'pause' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSTOP_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSTOP_0100
         * @tc.desc   Testing onStop callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSTOP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('stop', () => {
                console.info('TestLog: Stop command callback registration successful');
                expect(true).assertTrue();
            });

            await controller.sendControlCommand({ command: 'stop' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_0100
         * @tc.desc   Testing onPlayNext callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('playNext', () => {
                console.info('TestLog: PlayNext command callback registration successful');
                expect(true).assertTrue();
            });

            await controller.sendControlCommand({ command: 'playNext' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_0100
         * @tc.desc   Testing onPlayPrevious callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('playPrevious', () => {
                console.info('TestLog: PlayPrevious command callback registration successful');
                expect(true).assertTrue();
            });

            await controller.sendControlCommand({ command: 'playPrevious' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0100
         * @tc.desc   Testing onFastForward(no args) callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('fastForward', () => {
                console.info('TestLog: FastForward command callback registration successful');
                expect(true).assertTrue();
            });

            await controller.sendControlCommand({ command: 'fastForward' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0200
         * @tc.desc   Testing onFastForward(time 10s) callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('fastForward', (time) => {
                if (time == avSession.SkipIntervals.SECONDS_10) {
                    console.info('TestLog: FastForward command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
            });

            await controller.sendControlCommand({ command: 'fastForward', parameter: avSession.SkipIntervals.SECONDS_10 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0300
         * @tc.desc   Testing onFastForward(time 15s) callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('fastForward', (time) => {
                if (time == avSession.SkipIntervals.SECONDS_15) {
                    console.info('TestLog: FastForward command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
            });

            await controller.sendControlCommand({ command: 'fastForward', parameter: avSession.SkipIntervals.SECONDS_15 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0400
         * @tc.desc   Testing onFastForward(time 30s) callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('fastForward', (time) => {
                if (time == avSession.SkipIntervals.SECONDS_30) {
                    console.info('TestLog: FastForward command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
            });

            await controller.sendControlCommand({ command: 'fastForward', parameter: avSession.SkipIntervals.SECONDS_30 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_0100
         * @tc.desc   Testing onRewind callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('rewind', () => {
                console.info('TestLog: Rewind command callback registration successful');
                expect(true).assertTrue();
            });

            await controller.sendControlCommand({ command: 'rewind' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_0200
         * @tc.desc   Testing onRewind(time 10s) callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('rewind', (time) => {
                if (time == avSession.SkipIntervals.SECONDS_10) {
                    console.info('TestLog: Rewind command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
            });

            await controller.sendControlCommand({ command: 'rewind', parameter: avSession.SkipIntervals.SECONDS_10 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_0300
         * @tc.desc   Testing onRewind(time 15s) callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('rewind', (time) => {
                if (time == avSession.SkipIntervals.SECONDS_15) {
                    console.info('TestLog: Rewind command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
            });

            await controller.sendControlCommand({ command: 'rewind', parameter: avSession.SkipIntervals.SECONDS_15 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_0400
         * @tc.desc   Testing onRewind(time 30s) callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('rewind', (time) => {
                if (time == avSession.SkipIntervals.SECONDS_30) {
                    console.info('TestLog: Rewind command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
            });

            await controller.sendControlCommand({ command: 'rewind', parameter: avSession.SkipIntervals.SECONDS_30 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSEEK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSEEK_0100
         * @tc.desc   Testing onSeek callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSEEK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('seek', (callback) => {
                if (callback === 10) {
                    console.info('TestLog: Seek command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Seek command callback registration failed');
                    expect(false).assertTrue();
                }
            });

            await controller.sendControlCommand({ command: 'seek', parameter: 10 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_0100
         * @tc.desc   Testing on setSpeed callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('setSpeed', (callback) => {
                if (callback === 2.6) {
                    console.info('TestLog: SetSpeed command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: SetSpeed command callback registration error');
                    expect(false).assertTrue();
                }
            });

            await controller.sendControlCommand({ command: 'setSpeed', parameter: 2.6 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_0100
         * @tc.desc   Testing on setLoopMode callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('setLoopMode', (callback) => {
                if (callback === 1) {
                    console.info('TestLog: Set LoopMode command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Set LoopMode command callback registration error');
                    expect(false).assertTrue();
                }
            });

            await controller.sendControlCommand({
                command: 'setLoopMode', parameter:
                    avSession.LoopMode.LOOP_MODE_SINGLE
            }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_0100
         * @tc.desc   Testing on toggleFavorite callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('toggleFavorite', (callback) => {
                if (callback === 'false') {
                    console.info('TestLog: Set toggleFavorite command callback registration successful');
                    expect(true).assertTrue();
                }
                else {
                    console.info('TestLog: Set toggleFavorite command callback registration error');
                    expect(false).assertTrue();
                }
            });

            await controller.sendControlCommand({ command: 'toggleFavorite', parameter: 'false' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_0100
         * @tc.desc   Testing on handleKeyEvent callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('handleKeyEvent', (callback) => {
                if (callback.action === 2) {
                    console.info('TestLog: Handle keyEvent callback registration successful');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Handle keyEvent callback registration error');
                    expect(false).assertTrue();
                }
            });

            await controller.sendAVKeyEvent(event).then(() => {
                console.info('TestLog: Controller send AVKeyEvent successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send AVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONWRONGCALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONWRONGCALLBACK_0100
         * @tc.desc   Testing on wrongCall callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONWRONGCALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            try {
                session.on('wrongCall', () => {
                    console.info('TestLog: Wrong callback registration successful');
                });
            } catch (err) {
                console.info(`TestLog: Wrong callback registration error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_0100
         * @tc.desc   Testing off Play all callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1() {
                console.info('TestLog: Play command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Play command registration2 success');
                expect(false).assertTrue();
            }

            session.on('play', callback1);

            session.on('play', callback2);

            session.off('play');

            await controller.sendControlCommand({ command: 'play' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_0200
         * @tc.desc   Testing off Play specified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1() {
                console.info('TestLog: Play command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Play command registration2 success');
                expect(true).assertTrue();
            }

            session.on('play', callback1);

            session.on('play', callback2);

            session.off('play', callback1);

            await controller.sendControlCommand({ command: 'play' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })


        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_0100
         * @tc.desc   Testing off pause all callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1() {
                console.info('TestLog: Pause command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Pause command registration2 success');
                expect(false).assertTrue();
            }

            session.on('pause', callback1);

            session.on('pause', callback2);

            session.off('pause');

            await controller.sendControlCommand({ command: 'pause' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_0200
         * @tc.desc   Testing off pause specified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1() {
                console.info('TestLog: Pause command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Pause command registration2 success');
                expect(true).assertTrue();
            }

            session.on('pause', callback1);

            session.on('pause', callback2);

            session.off('pause', callback1);

            await controller.sendControlCommand({ command: 'pause' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSTOP_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSTOP_0100
         * @tc.desc   Testing off stop all callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSTOP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1() {
                console.info('TestLog: Stop command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Stop command registration2 success');
                expect(false).assertTrue();
            }

            session.on('stop', callback1)

            session.on('stop', callback2)

            session.off('stop');

            await controller.sendControlCommand({ command: 'stop' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSTOP_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSTOP_0200
         * @tc.desc   Testing off stop specified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSTOP_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1() {
                console.info('TestLog: Stop command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Stop command registration2 success');
                expect(true).assertTrue();
            }

            session.on('stop', callback1)

            session.on('stop', callback2)

            session.off('stop', callback1)

            await controller.sendControlCommand({ command: 'stop' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_0100
         * @tc.desc   Testing off playNext all callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1() {
                console.info('TestLog: PlayNext command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: PlayNext command registration2 success');
                expect(false).assertTrue();
            }

            session.on('playNext', callback1);

            session.on('playNext', callback2);

            session.off('playNext');

            await controller.sendControlCommand({ command: 'playNext' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_0200
         * @tc.desc   Testing off playNext specified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1() {
                console.info('TestLog: PlayNext command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: PlayNext command registration2 success');
                expect(true).assertTrue();
            }

            session.on('playNext', callback1);

            session.on('playNext', callback2);

            session.off('playNext', callback1);

            await controller.sendControlCommand({ command: 'playNext' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_0100
         * @tc.desc   Testing off playPrevious all callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1() {
                console.info('TestLog: PlayPrevious command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: PlayPrevious command registration2 success');
                expect(false).assertTrue();
            }

            session.on('playPrevious', callback1);

            session.on('playPrevious', callback2);

            session.off('playPrevious');

            await controller.sendControlCommand({ command: 'playPrevious' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_0200
         * @tc.desc   Testing off playPrevious specified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1() {
                console.info('TestLog: PlayPrevious command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: PlayPrevious command registration2 success');
                expect(true).assertTrue();
            }

            session.on('playPrevious', callback1);

            session.on('playPrevious', callback2);

            session.off('playPrevious', callback1);

            await controller.sendControlCommand({ command: 'playPrevious' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_0100
         * @tc.desc   Testing off fastForward all callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1() {
                console.info('TestLog: FastForward command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: FastForward command registration2 success');
                expect(false).assertTrue();
            }

            session.on('fastForward', callback1);

            session.on('fastForward', callback2);

            session.off('fastForward');

            await controller.sendControlCommand({ command: 'fastForward' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_0200
         * @tc.desc   Testing off fastForward specified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1() {
                console.info('TestLog: FastForward command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: FastForward command registration2 success');
                expect(true).assertTrue();
            }

            session.on('fastForward', callback1);

            session.on('fastForward', callback2);

            session.off('fastForward', callback1);

            await controller.sendControlCommand({ command: 'fastForward' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_0100
         * @tc.desc   Testing off rewind all callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1() {
                console.info('TestLog: Rewind command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Rewind command registration2 success');
                expect(false).assertTrue();
            }

            session.on('rewind', callback1);

            session.on('rewind', callback2);

            session.off('rewind');

            await controller.sendControlCommand({ command: 'rewind' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_0200
         * @tc.desc   Testing off rewind specified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1() {
                console.info('TestLog: Rewind command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Rewind command registration2 success');
                expect(true).assertTrue();
            }

            session.on('rewind', callback1);

            session.on('rewind', callback2);

            session.off('rewind', callback1);

            await controller.sendControlCommand({ command: 'rewind' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSEEK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSEEK_0100
         * @tc.desc   Testing off seek all callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSEEK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1(data) {
                if (data === 5) {
                    console.info('TestLog: offSeek callback1 registration');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 10) {
                    console.info('TestLog: offSeek callback2 registration');
                    expect(false).assertTrue;
                }
            }

            session.on('seek', callback1);

            session.on('seek', callback2);

            session.off('seek');

            await controller.sendControlCommand({ command: 'seek', parameter: 10 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSEEK_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSEEK_0200
         * @tc.desc   Testing off seek specified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSEEK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1(data) {
                if (data === 5) {
                    console.info('TestLog: offSeek callback1 registration');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 10) {
                    console.info('TestLog: offSeek callback2 registration');
                    expect(true).assertTrue;
                }
            }

            session.on('seek', callback1);

            session.on('seek', callback2);

            session.off('seek', callback1);

            await controller.sendControlCommand({ command: 'seek', parameter: 10 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_0100
         * @tc.desc   Testing off setSpeed all callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1(data) {
                if (data === 1.0) {
                    console.info('TestLog: SetSpend command registration1 success');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 2.0) {
                    console.info('TestLog: SetSpend command registration2 success');
                    expect(false).assertTrue;
                }
            }

            session.on('setSpeed', callback1);

            session.on('setSpeed', callback2);

            session.off('setSpeed');

            await controller.sendControlCommand({ command: 'setSpeed', parameter: 2.0 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_0200
         * @tc.desc   Testing off setSpeed specified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1(data) {
                if (data === 1.0) {
                    console.info('TestLog: SetSpend command registration1 success');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 2.0) {
                    console.info('TestLog: SetSpend command registration2 success');
                    expect(true).assertTrue;
                }
            }

            session.on('setSpeed', callback1);

            session.on('setSpeed', callback2);

            session.off('setSpeed', callback1);

            await controller.sendControlCommand({ command: 'setSpeed', parameter: 2.0 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_0100
         * @tc.desc   Testing off setLoopMode all callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1(data) {
                if (data === 1) {
                    console.info('TestLog: SetLoopMode command registration1 success');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 2) {
                    console.info('TestLog: SetLoopMode command registration2 success');
                    expect(false).assertTrue;
                }
            }

            session.on('setLoopMode', callback1);

            session.on('setLoopMode', callback2);

            session.off('setLoopMode');

            await controller.sendControlCommand({
                command: 'setLoopMode',
                parameter: avSession.LoopMode.LOOP_MODE_SINGLE
            }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_0200
         * @tc.desc   Testing off setLoopMode specified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1(data) {
                if (data === 2) {
                    console.info('TestLog: SetLoopMode command registration1 success');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 1) {
                    console.info('TestLog: SetLoopMode command registration2 success');
                    expect(true).assertTrue;
                }
            }

            session.on('setLoopMode', callback1);

            session.on('setLoopMode', callback2);

            session.off('setLoopMode', callback1);

            await controller.sendControlCommand({
                command: 'setLoopMode',
                parameter: avSession.LoopMode.LOOP_MODE_SINGLE
            }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_0100
         * @tc.desc   Testing off toggleFavorite all callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1(data) {
                if (data === 'true') {
                    console.info('TestLog: ToggleFavorite command registration1 success');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 'false') {
                    console.info('TestLog: ToggleFavorite command registration1 success');
                    expect(false).assertTrue;
                }
            }

            session.on('toggleFavorite', callback1);

            session.on('toggleFavorite', callback2);

            session.off('toggleFavorite');

            await controller.sendControlCommand({ command: 'toggleFavorite', parameter: 'false' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_0200
         * @tc.desc   Testing off toggleFavorite specified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1(data) {
                if (data === 'true') {
                    console.info('TestLog: ToggleFavorite command registration1 success');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 'false') {
                    console.info('TestLog: ToggleFavorite command registration2 success');
                    expect(true).assertTrue;
                }
            }

            session.on('toggleFavorite', callback1);

            session.on('toggleFavorite', callback2);

            session.off('toggleFavorite', callback1);

            await controller.sendControlCommand({ command: 'toggleFavorite', parameter: 'false' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_0100
         * @tc.desc   Testing off handleKeyEvent all callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let flag = true;
            function callback1(data) {
                if (data.action === 1) {
                    console.info('TestLog: HandleKeyEvent command registration1 success');
                    flag = false;
                }
            }

            function callback2(data) {
                if (data.action === 2) {
                    console.info('TestLog: HandleKeyEvent command registration2 success');
                    flag = false;
                }
            }

            session.on('handleKeyEvent', callback1);

            session.on('handleKeyEvent', callback2);

            session.off('handleKeyEvent');

            await controller.sendAVKeyEvent(event).then(() => {
                console.info('TestLog: Controller send AVKeyEvent successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send AVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            if (flag) {
                console.info('TestLog: HandleKeyEvent command callback unRegistration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: HandleKeyEvent command callback unRegistration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_0200
         * @tc.desc   Testing off handleKeyEvent specified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1(data) {
                if (data.action === 1) {
                    console.info('TestLog: HandleKeyEvent command registration1 success');
                    expect(false).assertTrue();
                }
            }

            function callback2(data) {
                if (data.action === 2) {
                    console.info('TestLog: HandleKeyEvent command registration2 success');
                    expect(true).assertTrue();
                }
            }

            session.on('handleKeyEvent', callback1);

            session.on('handleKeyEvent', callback2);

            session.off('handleKeyEvent', callback1);

            await controller.sendAVKeyEvent(event).then(() => {
                console.info('TestLog: Controller send AVKeyEvent successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send AVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_PROMISE_0100
         * @tc.desc   Testing call getOutputDevice(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('outputDeviceChange', (callback) => {
                if (!callback.isRemote) {
                    console.info(callback.audioDeviceId.size);
                    console.info(callback.deviceName.size);
                    console.info('outputDeviceChange callback registration successful');
                    expect(true).assertTrue();
                } else {
                    console.info('outputDeviceChange callback registration fail');
                    expect(false).assertTrue();
                }
            });

            session.off('outputDeviceChange');

            await session.getOutputDevice().then((data) => {
                if (!data.isRemote) {
                    let deviceInfo = data.devices[0]
                    if (deviceInfo && deviceInfo.castCategory !== undefined && deviceInfo.deviceId !== undefined &&
                        deviceInfo.deviceName !== undefined && deviceInfo.deviceType !== undefined && deviceInfo.ipAddress !== undefined &&
                        deviceInfo.providerId !== undefined && deviceInfo.supportedProtocols !== undefined && deviceInfo.authenticationStatus !== undefined) {
                        expect(true).assertTrue();
                    } else {
                        console.info('getOutputDevice value error.')
                        expect(false).assertTrue();
                    }
                } else {
                    console.info(avSession.OutputDeviceInfo.isRemote);
                    console.info(avSession.OutputDeviceInfo.audioDeviceId.size);
                    console.info(avSession.OutputDeviceInfo.deviceName.size);
                    console.info('getOutputDevice successfully');
                    console.info('Get device information failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`Get device BusinessError: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_0100
         * @tc.desc   Testing call getOutputDevice(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                session.getOutputDevice((err, value) => {
                    if (err) {
                        console.info(`Get device information BusinessError: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else if (!value.isRemote) {
                        console.info('Get device information successfully');
                        let deviceInfo = value.devices[0]
                        if (deviceInfo && deviceInfo.castCategory !== undefined && deviceInfo.deviceId !== undefined &&
                            deviceInfo.deviceName !== undefined && deviceInfo.deviceType !== undefined && deviceInfo.ipAddress !== undefined &&
                            deviceInfo.providerId !== undefined && deviceInfo.supportedProtocols !== undefined && deviceInfo.authenticationStatus !== undefined) {
                            expect(true).assertTrue();
                        } else {
                            console.info('getOutputDevice value error.')
                            expect(false).assertTrue();
                        }
                    } else {
                        console.info('Get device information failed');
                        expect(false).assertTrue();
                    }
                    done();
                });
            } catch (err) {
                console.info(`Get device information unknownError: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            } 
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_0200
         * @tc.desc   Testing call getOutputDevice(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                session.getOutputDevice((err, value) => {
                    if (err) {
                        console.info(`Get device information BusinessError: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else if (!value.isRemote) {
                        console.info('Get device information successfully');
                        let deviceInfo = value.devices[0]
                        console.info(`manufacturer:${deviceInfo.manufacturer},modelName:${deviceInfo.modelName}`);
                        if (deviceInfo.manufacturer == null || deviceInfo.modelName == null || deviceInfo.manufacturer == undefined || deviceInfo.modelName == undefined) {
                            expect(false).assertTrue();
                        }
                    } else {
                        console.info('Get device information failed');
                        expect(false).assertTrue();
                    }
                    done();
                });
            } catch (err) {
                console.info(`Get device information unknownError: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            } 
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_PROMISE_0100
         * @tc.desc   Testing call getController(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await session.getController().then((data) => {
                console.info('Get controller successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info('Get controller failed');
                console.info(`Get controller BusinessError: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_CALLBACK_0100
         * @tc.desc   Testing call getController(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                session.getController((err, data) => {
                    if (err) {
                        console.info('Get controller failed');
                        expect(false).assertTrue();
                    } else {
                        console.info('Get controller successfully');
                        expect(true).assertTrue();
                    }
                    done();
                })
            } catch (err) {
                console.info(`Get controller failed, unknown error: code: ${err.code} message: ${err.message}.`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_CALLBACK_0100
         * @tc.desc   Testing call sendAVKeyEvent(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.sendAVKeyEvent(event, (err, data) => {
                    if (err) {
                        console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('sendAVKeyEvent Successfully');
                        expect(true).assertTrue();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: sendAVKeyEvent unknownError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_PROMISE_0100
         * @tc.desc   Testing call sendAVKeyEvent(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await controller.sendAVKeyEvent(event).then(() => {
                console.info('sendAVKeyEvent Successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_0100
         * @tc.desc   Testing call getRealPlaybackPositionSync
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let realPosition = -1;
            try {
                realPosition = controller.getRealPlaybackPositionSync();
            } catch (err) {
                console.info(`TestLog: getRealPlaybackPositionSync error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            if (realPosition < 0) {
                console.info(`TestLog: getRealPlaybackPositionSync error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            } else {
                console.info(`TestLog: getRealPlaybackPositionSync Successfully, positon: ${realPosition}`);
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_PROMISE_0100
         * @tc.desc   Testing call getValidCommands(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            session.on('play', () => {});
            await sleep(500);
            await controller.getValidCommands().then((data) => {
                console.info(`TestLog: getValidCommands Successfully, the length ${data.length}`);
                expect(data[0]).assertEqual('play');
            }).catch((err) => {
                console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_CALLBACK_0100
         * @tc.desc   Testing call getValidCommands(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                session.on('play', () => {});
                await sleep(500);
                controller.getValidCommands((err, data) => {
                    if (err) {
                        console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info(`TestLog: getValidCommands Successfully, the length ${data.length}`);
                        expect(data[0]).assertEqual('play');
                    }
                    done();
                });
            } catch (err) {
                console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2200
         * @tc.desc   Testing call setAVMetadata(promise) set filter(ProtocolType.TYPE_DLN)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata0 = {
                assetId: '121278',
                filter: avSession.ProtocolType.TYPE_DLNA
            };
            await session.setAVMetadata(metadata0).then(() => {
                console.info('TestLog: Set assetId successfully');
            }).catch((err) => {
                console.error(`TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.filter === avSession.ProtocolType.TYPE_DLNA) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get filter failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2300
         * @tc.desc   Testing call setAVMetadata(promise) set drmSchemes
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata = {
                assetId: '121278',
                drmSchemes: ["abcdefghjkl","asdfghjklqw"]
            };
            await session.setAVMetadata(metadata).then(() => {
                console.info('TestLog: Set assetId successfully');
            }).catch((err) => {
                console.error(`TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (JSON.stringify(data.drmSchemes) === JSON.stringify(metadata.drmSchemes)) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get filter failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2400
         * @tc.desc   Testing call setAVMetadata(promise) set singleLyricText
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let metadata = {
                assetId: '121278',
                singleLyricText: 'dream it possible'
            };
            await session.setAVMetadata(metadata).then(() => {
                console.info('TestLog: Set singleLyricText successfully');
            }).catch((err) => {
                console.error(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (JSON.stringify(data.singleLyricText) === JSON.stringify(metadata.singleLyricText)) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get filter failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_SUPPORTEDDRMCAPABILITIES_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_SUPPORTEDDRMCAPABILITIES_0100
         * @tc.desc   Testing call getOutputDevice(supportedDrmCapabilities)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_SUPPORTEDDRMCAPABILITIES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                session.getOutputDevice((err, value) => {
                    if (err) {
                        console.error(`Get device information BusinessError: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else if (!value.isRemote) {
                        console.info('Get device information successfully');
                        let deviceInfo = value.devices[0]
                        if (deviceInfo && Array.isArray(deviceInfo.supportedDrmCapabilities)) {
                            expect(true).assertTrue();
                        } else {
                            console.info('getOutputDevice value error.')
                            expect(false).assertTrue();
                        }
                    } else {
                        console.info('Get device information failed');
                        expect(false).assertTrue();
                    }
                    done();
                });
            } catch (err) {
                console.error(`Get device information unknownError: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            } 
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_0100
         * @tc.desc   Testing call getAllCastDisplays(6600101)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            const isExtendedDisplayCast = canIUse('SystemCapability.Multimedia.AVSession.ExtendedDisplayCast');
            if (isExtendedDisplayCast) {
                try {
                    session.getAllCastDisplays().then((data) => {
                        if (Array.isArray(data)) {
                            console.info(`getAllCastDisplays success: ${JSON.stringify(data)}`);
                            expect(true).assertTrue();
                        } else {
                            console.info('getAllCastDisplays failed');
                            expect(false).assertTrue();
                            done();
                        }
                    }).catch((err) => {
                        expect(err.code).assertEqual(6600101);
                        console.info(`getAllCastDisplays successfully: ${err.code}, message: ${err.message}`)
                    })
                    done();
                } catch (err) {
                    console.error(`Session getAllCastDisplays: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600101);
                    done();
                }
            } else {
                console.info(`SystemCapability.Multimedia.AVSession.ExtendedDisplayCast false`);
                done();
            }
        })

    })
}
