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
        let keyItem = {code:0x49, pressedTime:2, deviceId:0};
        let event = {id:1, deviceId:0, actionTime:1, screenId:1, windowId:1, action:2, key:keyItem, unicodeChar:0, keys:[keyItem], ctrlKey:false, altKey:false, shiftKey:false, logoKey:false, fnKey:false, capsLock:false, numLock:false, scrollLock:false};
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_READ_SESSION_ID_0100]";
            console.info(`{TAG}TestLog:length1 = ${session.sessionId.length},length2 = ${controller.sessionId.length}`);
            expect(session.sessionId.length).assertEqual(64);
            expect(controller.sessionId.length).assertEqual(64);
            console.info(`${TAG}TestLog: Read AVSession & Controler sessionId successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0100]";
            let metadata0 = {
                assetId: '121278',
            };
            await session.setAVMetadata(metadata0).then(() => {
                console.info(`${TAG}TestLog: Set assetId successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:assetId = ${data.assetId}`);
                expect(data.assetId).assertEqual('121278');
                console.info(`${TAG}TestLog: Get assetId Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0200]";
            let metadata1 = {
                assetId: '121278',
                artist: 'Eminem',
            };
            await session.setAVMetadata(metadata1).then(() => {
                console.info(`${TAG}TestLog: Set artist successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set artist error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:artist = ${data.artist}`);
                expect(data.artist).assertEqual(metadata1.artist);
                console.info(`${TAG}TestLog: Get artist Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get artist error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0300]";
            let metadata2 = {
                assetId: '121278',
                author: 'ST',
            };
            await session.setAVMetadata(metadata2).then(() => {
                console.info(`${TAG}TestLog: Set author successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set author error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:author = ${data.author}`);
                expect(data.author).assertEqual(metadata2.author);
                console.info(`${TAG}TestLog: Get author Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get author error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0400]";
            let metadata3 = {
                assetId: '121278',
                album: 'Slim shady',
            };
            await session.setAVMetadata(metadata3).then(() => {
                console.info(`${TAG}TestLog: Set album successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set album error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:album = ${data.album}`);
                expect(data.album).assertEqual(metadata3.album);
                console.info(`${TAG}TestLog: Get album Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get album error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0500]";
            let metadata4 = {
                assetId: '121278',
                writer: 'ST',
            };
            await session.setAVMetadata(metadata4).then(() => {
                console.info(`${TAG}TestLog: Set writer successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set writer error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:writer = ${data.writer}`);
                expect(data.writer).assertEqual(metadata4.writer);
                console.info(`${TAG}TestLog: Get writer Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get writer error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0600]";
            let metadata5 = {
                assetId: '121278',
                composer: 'ST',
            };
            await session.setAVMetadata(metadata5).then(() => {
                console.info(`${TAG}TestLog: Set composer successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set composer error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:composer = ${data.composer}`);
                expect(data.composer).assertEqual(metadata5.composer);
                console.info(`${TAG}TestLog: Get composer Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get composer error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0700]";
            let metadata6 = {
                assetId: '121278',
                duration: 2222,
            };
            await session.setAVMetadata(metadata6).then(() => {
                console.info(`${TAG}TestLog: Set duration successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set duration error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:duration = ${data.duration}`);
                expect(data.duration).assertEqual(metadata6.duration);
                console.info(`${TAG}TestLog: Get duration Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get duration error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0800]";
            let metadata7 = {
                assetId: '121278',
                mediaImage: 'https://img2.baidu.com/it/u=3583435814,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500',
            };
            await session.setAVMetadata(metadata7).then(() => {
                console.info(`${TAG}TestLog: Set mediaImage successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set mediaImage error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:mediaImage = ${data.mediaImage}`);
                expect(data.mediaImage).assertEqual(metadata7.mediaImage);
                console.info(`${TAG}TestLog: Get mediaImage Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get mediaImage error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0900]";
            console.info(`${TAG}TestLog: Creat pixelmap`);
            let pixelMap = await getPixelMap();
            let readBuffer0 = new ArrayBuffer(96);
            await pixelMap.readPixelsToBuffer(readBuffer0);
            let bufferArr0 = new Uint8Array(readBuffer0);
            let metadata8 = {
                assetId: '121278',
                mediaImage: pixelMap,
            };
            await session.setAVMetadata(metadata8).then(() => {
                console.info(`${TAG}TestLog: Set pixelMap successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set pixelMap error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            let pixMap;
            await controller.getAVMetadata().then((data) => {
                if (data.assetId === '121278') {
                    pixMap = data.mediaImage;
                } else {
                    console.info(`${TAG}TestLog: Get pixelMap failed`);
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get pixelMap error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            let pixelSize = pixMap.getPixelBytesNumber();
            console.info(`${TAG}TestLog: pixelSize is: ${pixelSize}`);
            let readBuffer = new ArrayBuffer(pixelSize);
            await pixMap.readPixelsToBuffer(readBuffer);
            let bufferArr2 = new Uint8Array(readBuffer);
            for (let i = 0; i < bufferArr2.length; i++) {
                console.info(`${TAG}TestLog:bufferArr0 = ${bufferArr0[i]}`);
                expect(bufferArr0[i]).assertEqual(bufferArr2[i]);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1000]";
            let metadata9 = {
                assetId: '121278',
                publishDate: new Date(1994, 1, 1, 1),
            };
            await session.setAVMetadata(metadata9).then(() => {
                console.info(`${TAG}TestLog: Set publishDate successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set publishDate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:getTime = ${data.publishDate.getTime()}`);
                expect(data.publishDate.getTime()).assertEqual(metadata9.publishDate.getTime());
                console.info(`${TAG}TestLog: Get publishDate Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get publishDate error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1100]";
            let metadata10 = {
                assetId: '121278',
                subtitle: '8 Mile',
            };
            await session.setAVMetadata(metadata10).then(() => {
                console.info(`${TAG}TestLog: Set subtitle successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set subtitle error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:subtitle = ${data.subtitle}`);
                expect(data.subtitle).assertEqual(metadata10.subtitle);
                console.info(`${TAG}TestLog: Get subtitle Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get subtitle error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1200]";
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
                console.info(`${TAG}TestLog:description = ${data.description}`);
                expect(data.description).assertEqual(metadata11.description);
                console.info(`${TAG}TestLog: Get description Successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1300]";
            let metadata12 = {
                assetId: '121278',
                lyric: 'https://lyric.tingmall.com/lyric/58/970/589710004-LRC-LRC.lrc?t=1649918948000',
            };
            await session.setAVMetadata(metadata12).then(() => {
                console.info(`${TAG}TestLog: Set lyric successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set lyric error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:lyric = ${data.lyric}`);
                expect(data.lyric).assertEqual(metadata12.lyric);
                console.info(`${TAG}TestLog: Get lyric Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get lyric error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1400]";
            let metadata13 = {
                assetId: '121278',
                previousAssetId: '121277',
                nextAssetId: '121279',
            };
            await session.setAVMetadata(metadata13).then(() => {
                console.info(`${TAG}TestLog: Set assetId successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:previousAssetId = ${data.previousAssetId}`);
                expect(data.previousAssetId).assertEqual(metadata13.previousAssetId);
                console.info(`${TAG}TestLog:nextAssetId = ${data.nextAssetId}`);
                expect(data.nextAssetId).assertEqual(metadata13.nextAssetId);
                console.info(`${TAG}TestLog: Get AssetId Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1500]";
            let metadata = {
                assetId: '121278',
                filter: avSession.ProtocolType.TYPE_CAST_PLUS_STREAM
            };
            await session.setAVMetadata(metadata).then(() => {
                console.info(`${TAG}TestLog: Set filter successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:filter = ${data.filter}`);
                expect(data.filter).assertEqual(metadata.filter);
                console.info(`${TAG}TestLog: Get filter Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1600]";
            let metadata = {
                assetId: '121278',
                filter: avSession.ProtocolType.TYPE_LOCAL
            };
            await session.setAVMetadata(metadata).then(() => {
                console.info(`${TAG}TestLog: Set filter successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:filter = ${data.filter}`);
                expect(data.filter).assertEqual(metadata.filter);
                console.info(`${TAG}TestLog: Get filter Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1700]";
            let metadata = {
                assetId: '121278',
                filter: avSession.ProtocolType.TYPE_CAST_PLUS_MIRROR
            };
            await session.setAVMetadata(metadata).then(() => {
                console.info(`${TAG}TestLog: Set filter successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:filter = ${data.filter}`);
                expect(data.filter).assertEqual(metadata.filter);
                console.info(`${TAG}TestLog: Get filter Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1800]";
            let metadata = {
                assetId: '121278',
                skipIntervals: avSession.SkipIntervals.SECONDS_10
            };
            await session.setAVMetadata(metadata).then(() => {
                console.info(`${TAG}TestLog: Set skipIntervals successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set skipIntervals error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog:skipIntervals = ${data.skipIntervals}`);
                expect(data.skipIntervals).assertEqual(metadata.skipIntervals);
                console.info(`${TAG}TestLog: Get skipIntervals Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get skipIntervals error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1900]";
            console.info(`${TAG}TestLog: Creat pixelmap`);
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
                console.info(`${TAG}TestLog: Set avQueueName、avQueueId、avQueueImage successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set avQueueName、avQueueId、avQueueImage error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            let pixMap;
            await controller.getAVMetadata().then((data) => {
                if (data.assetId === '121278' && data.avQueueName === '121278' && data.avQueueId === '121278') {
                    pixMap = data.avQueueImage;
                } else {
                    console.info(`${TAG}TestLog: getAVMetadata value error.`);
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`${TAG}TestLog: getAVMetadata error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            if (pixMap) {
                let pixelSize = pixMap.getPixelBytesNumber();
                console.info(`${TAG}TestLog: pixelSize is: ${pixelSize}`);
                let readBuffer = new ArrayBuffer(pixelSize);
                await pixMap.readPixelsToBuffer(readBuffer);
                let bufferArr2 = new Uint8Array(readBuffer);
                for (let i = 0; i < bufferArr2.length; i++) {
                    console.info(`${TAG}TestLog:bufferArr0 = ${bufferArr0[i]}`);
                    expect(bufferArr0[i]).assertEqual(bufferArr2[i]);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0100]";
            let PlaybackState1 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_PLAY,
                activeItemId: 0,
            };
            await session.setAVPlaybackState(PlaybackState1).then(() => {
                console.info(`${TAG}TestLog: Set State successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:state = ${data.state}`);
                expect(data.state).assertEqual(2);
                console.info(`${TAG}TestLog: Get state Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0200]";
            let PlaybackState2 = {
                speed: 2.6,
            };

            await session.setAVPlaybackState(PlaybackState2).then(() => {
                console.info(`${TAG}TestLog: Set speed successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set speed error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:speed = ${data.speed}`);
                expect(data.speed).assertEqual(2.6);
                console.info(`${TAG}TestLog: Get speed Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get speed error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0300]";
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
                console.info(`${TAG}TestLog:position = ${data.position.elapsedTime}`);
                expect(data.position.elapsedTime).assertEqual(10);
                console.info(`${TAG}TestLog: Get position Successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0400]";
            let PlaybackState4 = {
                bufferedTime: 1000,
            };

            await session.setAVPlaybackState(PlaybackState4).then(() => {
                console.info(`${TAG}TestLog: Set bufferedTime successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set bufferedTime error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:bufferedTime = ${data.bufferedTime}`);
                expect(data.bufferedTime).assertEqual(1000);
                console.info(`${TAG}TestLog: Get bufferedTime Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get bufferedTime error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0500]";
            let PlaybackState5 = {
                loopMode: avSession.LoopMode.LOOP_MODE_SEQUENCE,
            };

            await session.setAVPlaybackState(PlaybackState5).then(() => {
                console.info(`${TAG}TestLog: Set loopMode successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:loopMode = ${data.loopMode}`);
                expect(data.loopMode).assertEqual(0);
                console.info(`${TAG}TestLog: Get loopMode Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0600]";
            let PlaybackState6 = {
                loopMode: avSession.LoopMode.LOOP_MODE_SINGLE,
            };

            await session.setAVPlaybackState(PlaybackState6).then(() => {
                console.info(`${TAG}TestLog: Set loopMode successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:loopMode = ${data.loopMode}`);
                expect(data.loopMode).assertEqual(1);
                console.info(`${TAG}TestLog: Get loopMode Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0700]";
            let PlaybackState7 = {
                loopMode: avSession.LoopMode.LOOP_MODE_LIST,
            };

            await session.setAVPlaybackState(PlaybackState7).then(() => {
                console.info(`${TAG}TestLog: Set loopMode successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:loopMode = ${data.loopMode}`);
                expect(data.loopMode).assertEqual(2);
                console.info(`${TAG}TestLog: Get loopMode Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0800]";
            let PlaybackState8 = {
                loopMode: avSession.LoopMode.LOOP_MODE_SHUFFLE,
            };

            await session.setAVPlaybackState(PlaybackState8).then(() => {
                console.info(`${TAG}TestLog: Set loopMode successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:loopMode = ${data.loopMode}`);
                expect(data.loopMode).assertEqual(3);
                console.info(`${TAG}TestLog: Get loopMode Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0900]";
            let PlaybackState9 = {
                isFavorite: true,
            };

            await session.setAVPlaybackState(PlaybackState9).then(() => {
                console.info(`${TAG}TestLog: Set isFavorite successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set isFavorite error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:isFavorite = ${data.isFavorite}`);
                expect(data.isFavorite).assertEqual(true);
                console.info(`${TAG}TestLog: Get isFavorite Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get isFavorite error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1000]";
            let PlaybackState12 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_INITIAL,
            };
            await session.setAVPlaybackState(PlaybackState12).then(() => {
                console.info(`${TAG}TestLog: Set playbackState successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:state = ${data.state}`);
                expect(data.state).assertEqual(0);
                console.info(`${TAG}TestLog: Get state Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1100]";
            let PlaybackState13 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_PREPARE,
            };
            await session.setAVPlaybackState(PlaybackState13).then(() => {
                console.info(`${TAG}TestLog: Set playbackState successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:state = ${data.state}`);
                expect(data.state).assertEqual(1);
                console.info(`${TAG}TestLog: Get state Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1200]";
            let PlaybackState14 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_PAUSE,
            };
            await session.setAVPlaybackState(PlaybackState14).then(() => {
                console.info('TestLog: Set playbackState successfully');
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:state = ${data.state}`);
                expect(data.state).assertEqual(3);
                console.info(`${TAG}TestLog: Get state Successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1300]";
            let PlaybackState15 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_FAST_FORWARD,
            };
            await session.setAVPlaybackState(PlaybackState15).then(() => {
                console.info(`${TAG}TestLog: Set playbackState successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:state = ${data.state}`);
                expect(data.state).assertEqual(4);
                console.info(`${TAG}TestLog: Get state Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1400]";
            let PlaybackState16 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_REWIND,
            };
            await session.setAVPlaybackState(PlaybackState16).then(() => {
                console.info(`${TAG}TestLog: Set playbackState successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:state = ${data.state}`);
                expect(data.state).assertEqual(5);
                console.info(`${TAG}TestLog: Get state Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1500]";
            let PlaybackState17 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_STOP,
            };
            await session.setAVPlaybackState(PlaybackState17).then(() => {
                console.info(`${TAG}TestLog: Set playbackState successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:state = ${data.state}`);
                expect(data.state).assertEqual(6);
                console.info(`${TAG}TestLog: Get state Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1600]";
            let PlaybackState18 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_IDLE,
            };
            await session.setAVPlaybackState(PlaybackState18).then(() => {
                console.info(`${TAG}TestLog: Set playbackState successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:state = ${data.state}`);
                expect(data.state).assertEqual(10);
                console.info(`${TAG}TestLog: Get state Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1700]";
            let playbackState = {
                state: avSession.PlaybackState.PLAYBACK_STATE_BUFFERING,
            };
            await session.setAVPlaybackState(playbackState).then(() => {
                console.info(`${TAG}TestLog: Set playbackState successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:state = ${data.state}`);
                expect(data.state).assertEqual(11);
                console.info(`${TAG}TestLog: Get state Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1800]";
            let PlaybackState5 = {
                loopMode: avSession.LoopMode.LOOP_MODE_CUSTOM,
            };

            await session.setAVPlaybackState(PlaybackState5).then(() => {
                console.info(`${TAG}TestLog: Set loopMode successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:loopMode = ${data.loopMode}`);
                expect(data.loopMode).assertEqual(4);
                console.info(`${TAG}TestLog: Get loopMode Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1900]";
            let PlaybackState = {
                maxVolume: 6
            };

            await session.setAVPlaybackState(PlaybackState).then(() => {
                console.info(`${TAG}TestLog: Set maxVolume successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set maxVolume error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:maxVolume = ${data.maxVolume}`);
                expect(data.maxVolume).assertEqual(PlaybackState.maxVolume);
                console.info(`${TAG}TestLog: Get maxVolume Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get maxVolume error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_2000]";
            let PlaybackState = {
                muted: false
            };

            await session.setAVPlaybackState(PlaybackState).then(() => {
                console.info(`${TAG}TestLog: Set muted successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set muted error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:muted = ${data.muted}`);
                expect(data.muted).assertEqual(PlaybackState.muted);
                console.info(`${TAG}TestLog: Get muted Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get muted error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_2100]";
            let PlaybackState = {
                videoWidth: 1920,
                videoHeight: 1080
            };

            await session.setAVPlaybackState(PlaybackState).then(() => {
                console.info(`${TAG}TestLog: Set videoWidth & videoHeight successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set videoWidth & videoHeight error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:videoWidth = ${data.videoWidth}`);
                expect(data.videoWidth).assertEqual(PlaybackState.videoWidth);
                console.info(`${TAG}TestLog:videoHeight = ${data.videoHeight}`);
                expect(data.videoHeight).assertEqual(PlaybackState.videoHeight);
                console.info(`${TAG}TestLog: Get videoWidth & videoHeight Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get videoWidth & videoHeight error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_2200]";
            let PlaybackState = {
                duration: 100
            };

            await session.setAVPlaybackState(PlaybackState).then(() => {
                console.info(`${TAG}TestLog: Set duration successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set duration error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                console.info(`${TAG}TestLog:duration = ${data.duration}`);
                expect(data.duration).assertEqual(PlaybackState.duration);
                console.info(`${TAG}TestLog: Get duration Successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get duration error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_PROMISE_0100]";
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
                console.info(`${TAG}TestLog: AVSessionTest : Set LaunchAbility`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set LaunchAbility error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            let wantagent;
            await controller.getLaunchAbility().then((data) => {
                wantagent = data;
                console.info(`${TAG}TestLog: Get launchAbility`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Get LaunchAbility error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            let agentBundleName = await WantAgent.getBundleName(agent);
            let wantagentBundleName = await WantAgent.getBundleName(wantagent);
            console.info(`${TAG}TestLog:agentBundleName = ${agentBundleName}`);
            console.info(`${TAG}TestLog:wantagentBundleName = ${wantagentBundleName}`);
            expect(agentBundleName).assertEqual(wantagentBundleName);
            console.info(`${TAG}TestLog: AVSessionTest : Set LaunchAbility successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_PROMISE_0100]";
            await session.activate().then(() => {
                console.info(`${TAG}TestLog: Set session active successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            
            await controller.isActive().then((data) => {
                console.info(`${TAG}TestLog: data = ${data}`);
                expect(data).assertTrue();
                console.info(`${TAG}TestLog: session is active`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: AVSessionTest error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_PROMISE_0100]";
            await session.activate().then(() => {
                console.info(`${TAG}TestLog: Set session active`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await session.deactivate().then(() => {
                console.info(`${TAG}TestLog: Deactivate session`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.isActive().then((data) => {
                console.info(`${TAG}TestLog: data = ${data}`);
                expect(data).assertFalse();
                console.info(`${TAG}TestLog: session deactivate successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: AVSessionTest error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_CALLBACK_0100]";
            try {
                session.activate((err) => {
                    if (err) {
                        console.info(`${TAG}TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info(`${TAG}TestLog: Set session active successfully`);
                    }
                })
            } catch (err) {
                console.info(`${TAG}TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }

            await sleep(500);
            await controller.isActive((err, isActive) => {
                if(err) {
                    console.info(`${TAG}TestLog: AVSessionTest error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: active = ${isActive}`);
                    expect(isActive).assertTrue();
                    console.info(`${TAG}TestLog: session is active`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_CALLBACK_0100]";
            await session.activate().then(() => {
                console.info(`${TAG}TestLog: Set session active`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            try {
                session.deactivate((err) => {
                    if (err) {
                        console.info(`${TAG}TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info(`${TAG}TestLog: Deactivate session`);
                    }
                })
            } catch (err) {
                console.info(`${TAG}TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await sleep(500);

            await controller.isActive((err, isActive) => {
                if(err) {
                    console.info(`${TAG}TestLog: AVSessionTest error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}TestLog: isActive = ${isActive}`);
                    expect(isActive).assertFalse();
                    console.info(`${TAG}TestLog: session deactivate successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONPLAY_0100]"; 
            let flag = false;
            session.on('play', () => {
                console.info(`${TAG}TestLog: Play command callback registration successful`);
                flag = true;
            });

            await controller.sendControlCommand({ command: 'play' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            console.info(`${TAG}TestLog: callback = ${flag}`);
            expect(flag).assertTrue();
            console.info(`${TAG}TestLog: callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONPAUSE_0100]"; 
            let flag = false;
            session.on('pause', () => {
                console.info(`${TAG}TestLog: Pause command callback registration successful`);
                flag = true;
            });

            await controller.sendControlCommand({ command: 'pause' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            console.info(`${TAG}TestLog: callback = ${flag}`);
            expect(flag).assertTrue();
            console.info(`${TAG}TestLog: callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONSTOP_0100]"; 
            let flag = false;
            session.on('stop', () => {
                console.info(`${TAG}TestLog: Stop command callback registration successful`);
                flag = true;
            });

            await controller.sendControlCommand({ command: 'stop' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            console.info(`${TAG}TestLog: callback = ${flag}`);
            expect(flag).assertTrue();
            console.info(`${TAG}TestLog: callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_0100]"; 
            let flag = false;
            session.on('playNext', () => {
                console.info(`${TAG}TestLog: PlayNext command callback registration successful`);
                flag = true;
            });

            await controller.sendControlCommand({ command: 'playNext' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback = ${flag}`);
            expect(flag).assertTrue();
            console.info(`${TAG}TestLog: callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_0100]"; 
            let flag = false;
            session.on('playPrevious', () => {
                console.info(`${TAG}TestLog: PlayPrevious command callback registration successful`);
                flag = true;
            });

            await controller.sendControlCommand({ command: 'playPrevious' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            
            console.info(`${TAG}TestLog: callback = ${flag}`);
            expect(flag).assertTrue();
            console.info(`${TAG}TestLog: callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0100]"; 
            let flag = false;
            session.on('fastForward', () => {
                console.info(`${TAG}TestLog: FastForward command callback registration successful`);
                flag = true;
            });

            await controller.sendControlCommand({ command: 'fastForward' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback = ${flag}`);
            expect(flag).assertTrue();
            console.info(`${TAG}TestLog: callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0200]"; 
            session.on('fastForward', (time) => {
                console.info(`${TAG}TestLog: time = ${time}`);
                expect(time).assertEqual(avSession.SkipIntervals.SECONDS_10);
                console.info(`${TAG}TestLog: FastForward command callback registration successful`);
            });

            await controller.sendControlCommand({ command: 'fastForward', parameter: avSession.SkipIntervals.SECONDS_10 }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0300]"; 
            session.on('fastForward', (time) => {
                console.info(`${TAG}TestLog: time = ${time}`);
                expect(time).assertEqual(avSession.SkipIntervals.SECONDS_15);
                console.info(`${TAG}TestLog: FastForward command callback registration successful`);
            });

            await controller.sendControlCommand({ command: 'fastForward', parameter: avSession.SkipIntervals.SECONDS_15 }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0400]"; 
            session.on('fastForward', (time) => {
                console.info(`${TAG}TestLog: time = ${time}`);
                expect(time).assertEqual(avSession.SkipIntervals.SECONDS_30);
                console.info(`${TAG}TestLog: FastForward command callback registration successful`);
            });

            await controller.sendControlCommand({ command: 'fastForward', parameter: avSession.SkipIntervals.SECONDS_30 }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONREWIND_0100]"; 
            let flag = false;
            session.on('rewind', () => {
                console.info(`${TAG}TestLog: Rewind command callback registration successful`);
                flag = true;
            });

            await controller.sendControlCommand({ command: 'rewind' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            console.info(`${TAG}TestLog: callback = ${flag}`);
            expect(flag).assertTrue();
            console.info(`${TAG}TestLog: callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONREWIND_0200]"; 
            session.on('rewind', (time) => {
                console.info(`${TAG}TestLog: time = ${time}`);
                expect(time).assertEqual(avSession.SkipIntervals.SECONDS_10);
                console.info(`${TAG}TestLog: Rewind command callback registration successful`);
            });

            await controller.sendControlCommand({ command: 'rewind', parameter: avSession.SkipIntervals.SECONDS_10 }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONREWIND_0300]"; 
            session.on('rewind', (time) => {
                console.info(`${TAG}TestLog: time = ${time}`);
                expect(time).assertEqual(avSession.SkipIntervals.SECONDS_15);
                console.info(`${TAG}TestLog: Rewind command callback registration successful`);
            });

            await controller.sendControlCommand({ command: 'rewind', parameter: avSession.SkipIntervals.SECONDS_15 }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONREWIND_0400]"; 
            session.on('rewind', (time) => {
                console.info(`${TAG}TestLog: time = ${time}`);
                expect(time).assertEqual(avSession.SkipIntervals.SECONDS_30);
                console.info(`${TAG}TestLog: Rewind command callback registration successful`);
            });

            await controller.sendControlCommand({ command: 'rewind', parameter: avSession.SkipIntervals.SECONDS_30 }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONSEEK_0100]";
            session.on('seek', (callback) => {
                console.info(`${TAG}TestLog: callback = ${callback}`);
                expect(callback).assertEqual(10);
                console.info(`${TAG}TestLog: Seek command callback registration successful`);
            });

            await controller.sendControlCommand({ command: 'seek', parameter: 10 }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_0100]";
            session.on('setSpeed', (callback) => {
                console.info(`${TAG}TestLog: callback = ${callback}`);
                expect(callback).assertEqual(2.6);
                console.info(`${TAG}TestLog: SetSpeed command callback registration successful`);
            });

            await controller.sendControlCommand({ command: 'setSpeed', parameter: 2.6 }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_0100]";
            session.on('setLoopMode', (callback) => {
                console.info(`${TAG}TestLog: callback = ${callback}`);
                expect(callback).assertEqual(1);
                console.info(`${TAG}TestLog: Set LoopMode command callback registration successful`);
            });

            await controller.sendControlCommand({
                command: 'setLoopMode', parameter:
                    avSession.LoopMode.LOOP_MODE_SINGLE
            }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_0100]";
            session.on('toggleFavorite', (callback) => {
                console.info(`${TAG}TestLog: callback = ${callback}`);
                expect(callback).assertFalse;
                console.info(`${TAG}TestLog: Set toggleFavorite command callback registration successful`);
            });

            await controller.sendControlCommand({ command: 'toggleFavorite', parameter: 'false' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_0100]";
            session.on('handleKeyEvent', (callback) => {
                console.info(`${TAG}TestLog: callback = ${callback.action}`);
                expect(callback.action).assertEqual(2);
                console.info(`${TAG}TestLog: Handle keyEvent callback registration successful`);
            });

            await controller.sendAVKeyEvent(event).then(() => {
                console.info(`${TAG}TestLog: Controller send AVKeyEvent successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send AVKeyEvent error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONWRONGCALLBACK_0100]";
            try {
                session.on('wrongCall', () => {
                    console.info(`${TAG}TestLog: Wrong callback registration successful`);
                });
            } catch (err) {
                console.info(`${TAG}TestLog: Wrong callback registration error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            }
            done();
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFPLAY_0100]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1() {
                console.info('TestLog: Play command registration1 success');
                callback1Called = true;
            }

            function callback2() {
                console.info('TestLog: Play command registration2 success');
                callback2Called = true;
            }

            session.on('play', callback1);

            session.on('play', callback2);

            session.off('play');

            await controller.sendControlCommand({ command: 'play' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertFalse();
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFPLAY_0200]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1() {
                console.info(`${TAG}TestLog: Play command registration1 success`);
                callback1Called = true;
            }

            function callback2() {
                console.info(`${TAG}TestLog: Play command registration2 success`);
                callback2Called = true;
            }

            session.on('play', callback1);

            session.on('play', callback2);

            session.off('play', callback1);

            await controller.sendControlCommand({ command: 'play' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertTrue();
            console.info(`${TAG}TestLog: off Play specified callback successfully`);

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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_0100]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1() {
                console.info(`${TAG}TestLog: Pause command registration1 success`);
                callback1Called = true;
            }

            function callback2() {
                console.info(`${TAG}TestLog: Pause command registration2 success`);
                callback2Called = true;
            }

            session.on('pause', callback1);

            session.on('pause', callback2);

            session.off('pause');

            await controller.sendControlCommand({ command: 'pause' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertFalse();
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_0200]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1() {
                console.info(`${TAG}TestLog: Pause command registration1 success`);
                callback1Called = true;
            }

            function callback2() {
                console.info(`${TAG}TestLog: Pause command registration2 success`);
                callback2Called = true;
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

            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertTrue();
            console.info(`${TAG}TestLog: off pause specified callback successfully`);

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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFSTOP_0100]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1() {
                console.info(`${TAG}TestLog: Stop command registration1 success`);
                callback1Called = true;
            }

            function callback2() {
                console.info(`${TAG}TestLog: Stop command registration2 success`);
                callback2Called = true;
            }

            session.on('stop', callback1)

            session.on('stop', callback2)

            session.off('stop');

            await controller.sendControlCommand({ command: 'stop' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertFalse();
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFSTOP_0200]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1() {
                console.info(`${TAG}TestLog: Stop command registration1 success`);
                callback1Called = true;
            }

            function callback2() {
                console.info(`${TAG}TestLog: Stop command registration2 success`);
                callback2Called = true;
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
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertTrue();
            console.info(`${TAG}TestLog: off stop specified callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_0100]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1() {
                console.info('TestLog: PlayNext command registration1 success');
                callback1Called = true;
            }

            function callback2() {
                console.info('TestLog: PlayNext command registration2 success');
                callback2Called = true;
            }

            session.on('playNext', callback1);

            session.on('playNext', callback2);

            session.off('playNext');

            await controller.sendControlCommand({ command: 'playNext' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertFalse();
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_0200]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1() {
                console.info(`${TAG}TestLog: PlayNext command registration1 success`);
                callback1Called = true;
            }

            function callback2() {
                console.info(`${TAG}TestLog: PlayNext command registration2 success`);
                callback2Called = true;
            }

            session.on('playNext', callback1);

            session.on('playNext', callback2);

            session.off('playNext', callback1);

            await controller.sendControlCommand({ command: 'playNext' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertTrue();
            console.info(`${TAG}TestLog: off playNext specified callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_0100]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1() {
                console.info(`${TAG}TestLog: PlayPrevious command registration1 success`);
                callback1Called = true;
            }

            function callback2() {
                console.info(`${TAG}TestLog: PlayPrevious command registration2 success`);
                callback2Called = true;
            }

            session.on('playPrevious', callback1);

            session.on('playPrevious', callback2);

            session.off('playPrevious');

            await controller.sendControlCommand({ command: 'playPrevious' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertFalse();
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_0200]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1() {
                console.info(`${TAG}TestLog: PlayPrevious command registration1 success`);
                callback1Called = true;
            }

            function callback2() {
                console.info(`${TAG}TestLog: PlayPrevious command registration2 success`);
                callback2Called = true;
            }

            session.on('playPrevious', callback1);

            session.on('playPrevious', callback2);

            session.off('playPrevious', callback1);

            await controller.sendControlCommand({ command: 'playPrevious' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertTrue();
            console.info(`${TAG}TestLog: off playPrevious specified callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_0100]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1() {
                console.info(`${TAG}TestLog: FastForward command registration1 success`);
                callback1Called = true;
            }

            function callback2() {
                console.info(`${TAG}TestLog: FastForward command registration2 success`);
                callback1Called = true;
            }

            session.on('fastForward', callback1);

            session.on('fastForward', callback2);

            session.off('fastForward');

            await controller.sendControlCommand({ command: 'fastForward' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertFalse();
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_0200]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1() {
                console.info(`${TAG}TestLog: FastForward command registration1 success`);
                callback1Called = true;
            }

            function callback2() {
                console.info(`${TAG}TestLog: FastForward command registration2 success`);
                callback2Called = true;
            }

            session.on('fastForward', callback1);

            session.on('fastForward', callback2);

            session.off('fastForward', callback1);

            await controller.sendControlCommand({ command: 'fastForward' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertTrue();
            console.info(`${TAG}TestLog: off fastForward specified callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFREWIND_0100]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1() {
                console.info(`${TAG}TestLog: Rewind command registration1 success`);
                callback1Called = true;
            }

            function callback2() {
                console.info(`${TAG}TestLog: Rewind command registration2 success`);
                callback2Called = true;
            }

            session.on('rewind', callback1);

            session.on('rewind', callback2);

            session.off('rewind');

            await controller.sendControlCommand({ command: 'rewind' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertFalse();
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFREWIND_0200]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1() {
                console.info(`${TAG}TestLog: Rewind command registration1 success`);
                callback1Called = true;
            }

            function callback2() {
                console.info(`${TAG}TestLog: Rewind command registration2 success`);
                callback2Called = true;
            }

            session.on('rewind', callback1);

            session.on('rewind', callback2);

            session.off('rewind', callback1);

            await controller.sendControlCommand({ command: 'rewind' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertTrue();
            console.info(`${TAG}TestLog: off fastForward specified callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFSEEK_0100]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1(data) {
                if (data === 5) {
                    console.info(`${TAG}TestLog: offSeek callback1 registration`);
                    callback1Called = true;
                }
            }

            function callback2(data) {
                if (data === 10) {
                    console.info(`${TAG}TestLog: offSeek callback2 registration`);
                    callback2Called = true;
                }
            }

            session.on('seek', callback1);

            session.on('seek', callback2);

            session.off('seek');

            await controller.sendControlCommand({ command: 'seek', parameter: 10 }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertFalse();
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFSEEK_0200]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1(data) {
                if (data === 5) {
                    console.info(`${TAG}TestLog: offSeek callback1 registration`);
                    callback1Called = true;
                }
            }

            function callback2(data) {
                if (data === 10) {
                    console.info(`${TAG}TestLog: offSeek callback2 registration`);
                    callback2Called = true;
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
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertTrue();
            console.info(`${TAG}TestLog: off seek specified callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_0100]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1(data) {
                if (data === 1.0) {
                    console.info(`${TAG}TestLog: SetSpend command registration1 success`);
                    callback1Called = true;
                }
            }

            function callback2(data) {
                if (data === 2.0) {
                    console.info(`${TAG}TestLog: SetSpend command registration2 success`);
                    callback2Called = true;
                }
            }

            session.on('setSpeed', callback1);

            session.on('setSpeed', callback2);

            session.off('setSpeed');

            await controller.sendControlCommand({ command: 'setSpeed', parameter: 2.0 }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertFalse();
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_0200]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1(data) {
                if (data === 1.0) {
                    console.info(`${TAG}TestLog: SetSpend command registration1 success`);
                    callback1Called = true;
                }
            }

            function callback2(data) {
                if (data === 2.0) {
                    console.info(`${TAG}TestLog: SetSpend command registration2 success`);
                    callback2Called = true;
                }
            }

            session.on('setSpeed', callback1);

            session.on('setSpeed', callback2);

            session.off('setSpeed', callback1);

            await controller.sendControlCommand({ command: 'setSpeed', parameter: 2.0 }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertTrue();
            console.info(`${TAG}TestLog: off setSpeed specified callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_0100]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1(data) {
                if (data === 1) {
                    console.info(`${TAG}TestLog: SetLoopMode command registration1 success`);
                    callback1Called = true;
                }
            }

            function callback2(data) {
                if (data === 2) {
                    console.info(`${TAG}TestLog: SetLoopMode command registration2 success`);
                    callback2Called = true;
                }
            }

            session.on('setLoopMode', callback1);

            session.on('setLoopMode', callback2);

            session.off('setLoopMode');

            await controller.sendControlCommand({
                command: 'setLoopMode', parameter:
                avSession.LoopMode.LOOP_MODE_SINGLE
              }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
              }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
              });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertFalse();
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_0200]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1(data) {
                if (data === 2) {
                    console.info(`${TAG}TestLog: SetLoopMode command registration1 success`);
                    callback1Called = true;
                }
            }

            function callback2(data) {
                if (data === 1) {
                    console.info(`${TAG}TestLog: SetLoopMode command registration2 success`);
                    callback2Called = true;
                }
            }

            session.on('setLoopMode', callback1);

            session.on('setLoopMode', callback2);

            session.off('setLoopMode', callback1);

            await controller.sendControlCommand({
                command: 'setLoopMode', parameter:
                avSession.LoopMode.LOOP_MODE_SINGLE
              }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
              }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertTrue();
            console.info(`${TAG}TestLog: off setLoopMode specified callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_0100]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1(data) {
                if (data === 'true') {
                    console.info(`${TAG}TestLog: ToggleFavorite command registration1 success`);
                    callback1Called = true;
                }
            }

            function callback2(data) {
                if (data === 'false') {
                    console.info(`${TAG}TestLog: ToggleFavorite command registration1 success`);
                    callback2Called = true;
                }
            }

            session.on('toggleFavorite', callback1);

            session.on('toggleFavorite', callback2);

            session.off('toggleFavorite');

            await controller.sendControlCommand({ command: 'toggleFavorite', parameter: 'false' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertFalse();
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_0200]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1(data) {
                if (data === 'true') {
                    console.info(`${TAG}TestLog: ToggleFavorite command registration1 success`);
                    callback1Called = true;
                }
            }

            function callback2(data) {
                if (data === 'false') {
                    console.info(`${TAG}TestLog: ToggleFavorite command registration2 success`);
                    callback2Called = true;
                }
            }

            session.on('toggleFavorite', callback1);

            session.on('toggleFavorite', callback2);

            session.off('toggleFavorite', callback1);

            await controller.sendControlCommand({ command: 'toggleFavorite', parameter: 'false' }).then(() => {
                console.info(`${TAG}TestLog: Controller send command successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertTrue();
            console.info(`${TAG}TestLog: off toggleFavorite specified callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_0100]";
            let flag1 = false;
            let flag2 = false;
            function callback1(data) {
                if (data.action === 1) {
                    console.info(`${TAG}TestLog: HandleKeyEvent command registration1 success`);
                    flag1 = true;
                }
            }

            function callback2(data) {
                if (data.action === 2) {
                    console.info(`${TAG}TestLog: HandleKeyEvent command registration2 success`);
                    flag2 = true;
                }
            }

            session.on('handleKeyEvent', callback1);

            session.on('handleKeyEvent', callback2);

            session.off('handleKeyEvent');

            await controller.sendAVKeyEvent(event).then(() => {
                console.info(`${TAG}TestLog: Controller send AVKeyEvent successfully`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send AVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            });
            await sleep(500);

            console.info(`${TAG}TestLog: flag1 = ${flag1}`);
            expect(flag1).assertFalse();
            console.info(`${TAG}TestLog: flag2 = ${flag2}`);
            expect(flag2).assertFalse();
            console.info(`${TAG}TestLog: HandleKeyEvent command callback unRegistration successful`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_0200]";
            let callback1Called = false;
            let callback2Called = false;
            function callback1(data) {
                if (data.action === 1) {
                    console.info(`${TAG}TestLog: HandleKeyEvent command registration1 success`);
                    callback1Called = true;
                }
            }

            function callback2(data) {
                if (data.action === 2) {
                    console.info(`${TAG}TestLog: HandleKeyEvent command registration2 success`);
                    callback2Called = true;
                }
            }

            session.on('handleKeyEvent', callback1);

            session.on('handleKeyEvent', callback2);

            session.off('handleKeyEvent', callback1);

            await controller.sendAVKeyEvent(event).then(() => {
                console.info(`${TAG}TestLog: Controller send AVKeyEvent successfully`);
              }).catch((err) => {
                console.info(`${TAG}TestLog: Controller send AVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              });
            await sleep(500);
            console.info(`${TAG}TestLog: callback1Called = ${callback1Called}`);
            expect(callback1Called).assertFalse();
            console.info(`${TAG}TestLog: callback2Called = ${callback2Called}`);
            expect(callback2Called).assertTrue();
            console.info(`${TAG}TestLog: off handleKeyEvent specified callback successfully`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_PROMISE_0100]";
        
            await session.getOutputDevice().then((data) => {
                let deviceInfo = data.devices[0]
                console.info(`${TAG}estLog1 length = ${data.devices.length}`);
                expect(data.devices.length).assertEqual(1);
                console.info(`${TAG}TestLog1 castCategory = ${deviceInfo.castCategory}`);
                expect(deviceInfo.modelName).not().assertEqual(undefined);
                console.info(`${TAG}TestLog1 deviceId = ${deviceInfo.deviceId}`);
                expect(deviceInfo.deviceId).assertEqual("0");
                console.info(`${TAG}TestLog1 deviceName = ${deviceInfo.deviceName}`);
                expect(deviceInfo.deviceName).assertEqual("LocalDevice");
                console.info(`${TAG}TestLog1 deviceType = ${deviceInfo.deviceType}`);
                expect(deviceInfo.deviceType).assertEqual(0);
                console.info(`${TAG}TestLog1 modelName = ${deviceInfo.modelName}`);
                expect(deviceInfo.modelName).assertEqual("");
                console.info(`${TAG}TestLog1 supportedPullClients = ${deviceInfo.supportedPullClients}`);
                expect(deviceInfo.supportedPullClients).assertEqual(undefined);
                console.info(`${TAG}TestLog1 supportedProtocols = ${deviceInfo.supportedProtocols}`);
                expect(deviceInfo.supportedProtocols).assertEqual(0);
                console.info(`${TAG}TestLog1 supportedDrmCapabilities = ${deviceInfo.supportedDrmCapabilities}`);
                expect(deviceInfo.supportedDrmCapabilities).not().assertEqual(undefined);
            }).catch((err) => {
                console.info(`${TAG}Get device BusinessError: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_0100]";
            try {
                session.getOutputDevice((err, value) => {
                    if (err) {
                        console.info(`Get device information BusinessError: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else if (!value.isRemote) {
                        console.info('Get device information successfully');
                        let deviceInfo = value.devices[0]
                        console.info(`${TAG}estLog1 length = ${value.devices.length}`);
                        expect(value.devices.length).assertEqual(1);
                        console.info(`${TAG}TestLog1 castCategory = ${deviceInfo.castCategory}`);
                        expect(deviceInfo.modelName).not().assertEqual(undefined);
                        console.info(`${TAG}TestLog1 deviceId = ${deviceInfo.deviceId}`);
                        expect(deviceInfo.deviceId).assertEqual("0");
                        console.info(`${TAG}TestLog1 deviceName = ${deviceInfo.deviceName}`);
                        expect(deviceInfo.deviceName).assertEqual("LocalDevice");
                        console.info(`${TAG}TestLog1 deviceType = ${deviceInfo.deviceType}`);
                        expect(deviceInfo.deviceType).assertEqual(0);
                        console.info(`${TAG}TestLog1 modelName = ${deviceInfo.modelName}`);
                        expect(deviceInfo.modelName).assertEqual("");
                        console.info(`${TAG}TestLog1 supportedPullClients = ${deviceInfo.supportedPullClients}`);
                        expect(deviceInfo.supportedPullClients).assertEqual(undefined);
                    } else {
                        console.info('Get device information failed');
                        expect(false).assertTrue();
                    }
                });
            } catch (err) {
                console.info(`Get device information unknownError: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            } 
            done();
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_0100]";
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_PROMISE_0100]";
            let avSessionController;
            await session.getController().then((data) => {
                avSessionController = data;
                console.info(`${TAG}Testlog:Get avSessionController.sessionId = ${avSessionController.sessionId}`);
                expect(avSessionController.sessionId).not().assertUndefined();
                console.info(`${TAG}Testlog:Get controller successfully`);
            }).catch((err) => {
                console.info(`${TAG}Testlog:Get controller failed`);
                console.info(`${TAG}Testlog:Get controller BusinessError: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_CALLBACK_0100]";
            let avSessionController;
            try {
                session.getController((err, data) => {
                    if (err) {
                        console.info('Get controller failed');
                        expect(false).assertTrue();
                    } else {
                        avSessionController = data;
                        console.info(`${TAG}Testlog:Get avSessionController.sessionId = ${avSessionController.sessionId}`);
                        expect(avSessionController.sessionId).not().assertUndefined();
                        console.info(`${TAG}Testlog:Get controller successfully`);
                    }
                })
            } catch (err) {
                console.info(`${TAG}Testlog:Get controller failed, unknown error: code: ${err.code} message: ${err.message}.`);
                expect(false).assertTrue();
            }
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
            console.info(`TestLog: getRealPlaybackPositionSync Successfully, positon: ${realPosition}`);
            expect(realPosition).assertLargerOrEqual(0);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2200]";
            let metadata0 = {
                assetId: '121278',
                filter: avSession.ProtocolType.TYPE_DLNA
            };
            await session.setAVMetadata(metadata0).then(() => {
                console.info(`${TAG}TestLog: Set assetId successfully`);
            }).catch((err) => {
                console.error(`${TAG}TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog: filter = ${data.filter}`);
                expect(data.filter).assertEqual(avSession.ProtocolType.TYPE_DLNA);
                console.info(`${TAG}TestLog: Get filter successfully`);
            }).catch((err) => {
                console.error(`${TAG}TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2300]";
            let metadata = {
                assetId: '121278',
                drmSchemes: ["abcdefghjkl","asdfghjklqw"]
            };
            await session.setAVMetadata(metadata).then(() => {
                console.info(`${TAG}TestLog: Set assetId successfully`);
            }).catch((err) => {
                console.error(`${TAG}TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog: drmSchemes = ${JSON.stringify(data.drmSchemes)}`);
                expect(JSON.stringify(data.drmSchemes)).assertEqual(JSON.stringify(metadata.drmSchemes));
                console.info(`${TAG}TestLog: Get drmSchemes successfully`);
            }).catch((err) => {
                console.error(`${TAG}TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_2400]";
            let metadata = {
                assetId: '121278',
                singleLyricText: 'dream it possible'
            };
            await session.setAVMetadata(metadata).then(() => {
                console.info(`${TAG}TestLog: Set singleLyricText successfully`);
            }).catch((err) => {
                console.error(`${TAG}TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                console.info(`${TAG}TestLog: singleLyricText = ${JSON.stringify(data.singleLyricText)}`);
                expect(JSON.stringify(data.singleLyricText)).assertEqual(JSON.stringify(metadata.singleLyricText));
                console.info(`${TAG}TestLog: Get singleLyricText successfully`);
            }).catch((err) => {
                console.error(`${TAG}TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
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
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_SUPPORTEDDRMCAPABILITIES_0100]";
            try {
                session.getOutputDevice((err, value) => {
                    if (err) {
                        console.error(`${TAG}Get device information BusinessError: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else if (!value.isRemote) {
                        console.info(`${TAG}Get device information successfully`);
                        let deviceInfo = value.devices[0];
                        console.info(`${TAG}estLog1 length = ${value.devices.length}`);
                        expect(value.devices.length).assertEqual(1);
                        console.info(`${TAG}TestLog1 supportedPullClients = ${deviceInfo.supportedPullClients}`);
                        expect(deviceInfo.supportedPullClients).assertEqual(undefined);
                    } else {
                        console.info(`${TAG}Get device information failed`);
                        expect(false).assertTrue();
                    }
                });
            } catch (err) {
                console.error(`${TAG}Get device information unknownError: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            } 
            done();
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
