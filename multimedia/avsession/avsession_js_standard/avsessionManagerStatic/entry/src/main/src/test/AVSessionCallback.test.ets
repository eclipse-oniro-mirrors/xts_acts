/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import image from '@ohos.multimedia.image';
import { WantAgent } from '@ohos.app.ability.wantAgent';
import Utils from './Util.test';
import image from '@ohos.multimedia.image';
import { WantAgentInfo } from 'wantAgent.wantAgentInfo';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import wantAgent from '@ohos.app.ability.wantAgent';
import { AppStorage } from '@ohos.arkui.stateManagement'

let context: common.UIAbilityContext;
export default function abilityTest() {
    describe('AVSessionCallback', () => {
        let TAG: string = "[AVSessionCallbackTest]";
        let tag = 'ApplicationA';
        let type = 'audio';
        let session: avSession.AVSession | null;
        let controller: avSession.AVSessionController;

        let getPixelMap = async ()=> {
            let color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            bufferArr.fill(3, 0, 95);
            let opts: image.InitializationOptions = { editable: true, pixelFormat: 3 as image.PixelMapFormat, size: { height: 4, width: 6 }, alphaType: 3 as image.AlphaType };
            return image.createPixelMap(color, opts);
        }

        beforeAll(()=> {
            context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            console.info('TestLog: Start Testing avSession Interfaces');
        })

        beforeEach(async () => {
            try{
                session = await avSession.createAVSession(context, tag, 'audio');
                console.info(`${session!.sessionType}`);
            }catch(err: BusinessError){
                console.info(`${TAG}: Session create error: code: ${err?.code}, message: ${err?.message}`);
            };
            try{
                await session!.activate();
                console.info(`${TAG}: Session activate`);
            }catch(err: BusinessError){
                console.info(`${TAG}: Session activate error: code: ${err?.code}, message: ${err?.message}`);
            };
            try {
                controller = await session!.getController();
                console.info(`${TAG}: controller getController`);
            } catch (err: BusinessError) {
                console.info(`${TAG}: getController error: code: ${err?.code}, message: ${err?.message}`);
            }
            await Utils.msSleep(800);
            console.info(`${TAG}: beforeEach out`);
        })

        afterEach(async () => {
            console.info(`${TAG}: afterEach in`);
            if (session != null) {
                try{
                    await session!.destroy()
                    console.info(`${TAG}: Session destroy success`);
                } catch (err: BusinessError) {
                    console.info(`${TAG}: Session destroy error: code: ${err?.code}, message: ${err?.message}`);
                };
            } else {
                console.info(`${TAG}: Session is already destroy`);
            }
            if (controller != null) {
                try{
                    await controller.destroy()
                    console.info(`${TAG}: Controller destroy success`);
                } catch (err: BusinessError) {
                    console.info(`${TAG}: Controller destroy error: code: ${err?.code}, message: ${err?.message}`);
                };
            } else {
                console.info(`${TAG}: Controller is already destroy`);
            }
            console.info(`${TAG}: afterEach out`);
        })

        afterAll(()=> {
            console.info('TestLog: End Testing avSession Interfaces');
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0100
         * @tc.desc   Testing call setAVMetadata(callback) set assetId
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata0:avSession.AVMetadata = {
                assetId: '121278'
            }

            session!.setAVMetadata(metadata0, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set assetId error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }
            });
            await Utils.msSleep(500);
            controller.getAVMetadata((err, value) => {
                if (err?.code) {
                    console.info(`TestLog: Get assetId error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.assetId === metadata0.assetId) {
                    console.info('TestLog: Get assetId Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get assetId failed: ${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0200
         * @tc.desc   Testing call setAVMetadata(callback) set artist
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata1:avSession.AVMetadata = {
                assetId: '121278',
                artist: 'Eminem'
            }
            session!.setAVMetadata(metadata1, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set artist error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }
            });
            await Utils.msSleep(500);
            controller.getAVMetadata((err, value) => {
                if (err?.code) {
                    console.info(`TestLog: Get artist error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.artist === metadata1.artist) {
                    console.info('TestLog: Get artist Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get artist failed' ${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0300
         * @tc.desc   Testing call setAVMetadata(callback) set author
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata2:avSession.AVMetadata ={
                assetId: '121278',
                author: 'ST'
            }
            session!.setAVMetadata(metadata2, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set author error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(500);
            controller.getAVMetadata((err, value) => {
                if (err?.code) {
                    console.info(`TestLog: Get author error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.author === metadata2.author) {
                    console.info('TestLog: Get author Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get author failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0400
         * @tc.desc   Testing call setAVMetadata(callback) set album
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata3:avSession.AVMetadata ={
                assetId: '121278',
                album: 'Slim shady'
            }
            session!.setAVMetadata(metadata3, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set album error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(500);
            controller.getAVMetadata((err, value) => {
                if (err?.code) {
                    console.info(`TestLog: Get album error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.album === metadata3.album) {
                    console.info('TestLog: Get album Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get album failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0500
         * @tc.desc   Testing call setAVMetadata(callback) set writer
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata4:avSession.AVMetadata ={
                assetId: '121278',
                writer: 'ST'
            }
            session!.setAVMetadata(metadata4, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set writer error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(500);
            controller.getAVMetadata((err, value) => {
                if (err?.code) {
                    console.info(`TestLog: Get writer error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.writer === metadata4.writer) {
                    console.info('TestLog: Get writer Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get writer failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0600
         * @tc.desc   Testing call setAVMetadata(callback) set composer
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata5:avSession.AVMetadata = {
                assetId: '121278',
                composer: 'ST'
            }
            session!.setAVMetadata(metadata5, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set composer error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(500);
            controller.getAVMetadata((err, value) => {
                if (err?.code) {
                    console.info(`TestLog: Get composer error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.composer === metadata5.composer) {
                    console.info('TestLog: Get composer Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get composer failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0700
         * @tc.desc   Testing call setAVMetadata(callback) set duration
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata6:avSession.AVMetadata = {
                assetId: '121278',
                duration: 2222
            }
            session!.setAVMetadata(metadata6, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set duration error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(500);
            controller.getAVMetadata((err, value) => {
                if (err?.code) {
                    console.info(`TestLog: Get duration error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.duration === metadata6.duration) {
                    console.info('TestLog: Get duration Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get duration failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0800
         * @tc.desc   Testing call setAVMetadata(callback) set mediaImage(url)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata7:avSession.AVMetadata ={
                assetId: '121278',
                mediaImage: 'https://img2.baidu.com/it/u=3583435814,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500'
            }

            session!.setAVMetadata(metadata7, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set mediaImage error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(500);
            controller.getAVMetadata((err, value) => {
                if (err?.code) {
                    console.info(`TestLog: Get mediaImage error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.mediaImage === metadata7.mediaImage) {
                    console.info('TestLog: Get mediaImage Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get mediaImage failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0900
         * @tc.desc   Testing call setAVMetadata(callback) set mediaImage(pixelMap)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let pixelMap = await getPixelMap();
            let readBuffer0 = new ArrayBuffer(96);
            await pixelMap.readPixelsToBuffer(readBuffer0);
            let bufferArr0 = new Uint8Array(readBuffer0);
            let metadata8:avSession.AVMetadata = {
                assetId: '121278',
                mediaImage: pixelMap
            }
            session!.setAVMetadata(metadata8, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set pixelMap error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(500);
            let pixMap: image.PixelMap;
            controller.getAVMetadata((err, value) => {
                if (err?.code) {
                    console.info(`TestLog: Get pixelMap error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.assetId === metadata8.assetId) {
                    console.info('TestLog: Get pixelMap Successfully');
                    pixMap = value?.mediaImage as image.PixelMap;
                } else {
                    console.info(`TestLog: Get pixelMap failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
            let pixelSize = pixMap.getPixelBytesNumber();
            console.info(`TestLog: pixelSize is:${pixelSize}`);
            let readBuffer = new ArrayBuffer(pixelSize);
            pixMap.readPixelsToBuffer(readBuffer);
            await Utils.msSleep(500);
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
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1000
         * @tc.desc   Testing call setAVMetadata(callback) set publishDate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let time0: long = 2021;
            let metadata9: avSession.AVMetadata = {
                assetId: '121278',
                publishDate: new Date(time0),
            };
            session!.setAVMetadata(metadata9, (err: BusinessError | null) => {
                if (err) {
                    console.info(`TestLog: Set publishDate error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set publishDate : successfully');
                }
            })
            await Utils.msSleep(500);
            controller.getAVMetadata((err: BusinessError | null, value: avSession.AVMetadata | undefined) => {
                if (err?.code) {
                    console.info(`TestLog: Get publishDate error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.publishDate?.getTime() === metadata9?.publishDate?.getTime()) {
                    console.info('TestLog: Get publishDate Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get publishDate failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1100
         * @tc.desc   Testing call setAVMetadata(callback) set subtitle
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata10: avSession.AVMetadata ={
                assetId: '121278',
                subtitle: '8 Mile'
            }

            session!.setAVMetadata(metadata10, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set subtitle error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set subtitle successfully');
                }
            })
            await Utils.msSleep(500);
            controller.getAVMetadata((err, value) => {
                if (err?.code) {
                    console.info(`TestLog: Get subtitle error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.subtitle === metadata10.subtitle) {
                    console.info('TestLog: Get subtitle Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get subtitle failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1200
         * @tc.desc   Testing call setAVMetadata(callback) set description
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata11: avSession.AVMetadata ={
                assetId: '121278',
                description: 'Rap'
            }

            session!.setAVMetadata(metadata11, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set description error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(500);
            controller.getAVMetadata((err, value) => {
                if (err?.code) {
                    console.info(`TestLog: Get description error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.description === metadata11.description) {
                    console.info('TestLog: Get description Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get description failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1300
         * @tc.desc   Testing call setAVMetadata(callback) set lyric
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata12: avSession.AVMetadata = {
                assetId: '121278',
                lyric: 'https://lyric.tingmall.com/lyric/58/970/58970104-LRC-LRC.lrc?t=1649918948000    '
            }

            session!.setAVMetadata(metadata12, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set lyric error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(500);
            controller.getAVMetadata((err, value) => {
                if (err?.code) {
                    console.info(`TestLog: Get lyric error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.lyric === metadata12.lyric) {
                    console.info('TestLog: Get lyric Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get lyric failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1400
         * @tc.desc   Testing call setAVMetadata(callback) set previousAssetId & nextAssetId
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata13: avSession.AVMetadata ={
                assetId: '121278',
                previousAssetId: '121277',
                nextAssetId: '121279'
            }

            session!.setAVMetadata(metadata13, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set assetId error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(500);
            controller.getAVMetadata((err, value) => {
                if (err?.code) {
                    console.info(`TestLog: Get assetId error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.previousAssetId === metadata13.previousAssetId
                    && value?.nextAssetId === metadata13.nextAssetId) {
                    console.info('TestLog: Get assetId Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get assetId failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1500
         * @tc.desc   Testing call setAVMetadata(callback) set filter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata16: avSession.AVMetadata ={
                assetId: '121278',
                filter: avSession.ProtocolType.TYPE_CAST_PLUS_MIRROR
            }

            session!.setAVMetadata(metadata16, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set filter error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(500);
            controller.getAVMetadata((err, value) => {
                if (err?.code) {
                    console.info(`TestLog: Get filter error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.filter === metadata16.filter) {
                    console.info('TestLog: Get filter Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get filter failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1600
         * @tc.desc   Testing call setAVMetadata(callback) set skipIntervals
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata17: avSession.AVMetadata ={
                assetId: '121278',
                skipIntervals: avSession.SkipIntervals.SECONDS_10
            }

            session!.setAVMetadata(metadata17, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set skipIntervals error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(500);
            controller.getAVMetadata((err, value) => {
                if (err?.code) {
                    console.info(`TestLog: Get skipIntervals error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (value?.skipIntervals === metadata17.skipIntervals) {
                    console.info('TestLog: Get skipIntervals Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get skipIntervals failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1800
         * @tc.desc   Testing call setAVMetadata(callback) set avQueueName、avQueueId、avQueueImage(string)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata: avSession.AVMetadata = {
                assetId: '121278',
                avQueueName: '121278',
                avQueueId: '121278',
                avQueueImage: 'https://img2.baidu.com/it/u=3583435814    ,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500'
            }

            session!.setAVMetadata(metadata, (err) => {
                if (err?.code) {
                    console.info(`TestLog: Set avQueueName、avQueueId、avQueueImage(string) error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(500);
            controller.getAVMetadata((err, data) => {
                if (err?.code) {
                    console.info(`TestLog: Get avQueueName、avQueueId、avQueueImage(string) error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else if (data) {
                    expect(data?.assetId).assertEqual(metadata.assetId);
                    expect(data?.avQueueName).assertEqual(metadata.avQueueName);
                    expect(data?.avQueueId).assertEqual(metadata.avQueueId);
                    expect(data?.avQueueImage).assertEqual(metadata.avQueueImage);
                    console.info('TestLog: Get avQueueName、avQueueId、avQueueImage(string) Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get avQueueName、avQueueId、avQueueImage(string) failed:${data}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1900
         * @tc.desc   Testing call setAVMetadata(callback) set displayTags
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata: avSession.AVMetadata = {
                assetId: '121278',
                displayTags: avSession.DisplayTag.TAG_AUDIO_VIVID
            }

            try {
                session!.setAVMetadata(metadata, (err) => {
                    if (err?.code) {
                        console.info(`TestLog: Set displayTags error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                    } else {
                        controller.getAVMetadata((err, data) => {
                            if (err?.code) {
                                console.info(`TestLog: Get displayTags error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                            } else if (data) {
                                console.info('TestLog: Get displayTags Successfully');
                                expect(data?.assetId).assertEqual(metadata.assetId);
                                expect(data?.displayTags).assertEqual(metadata.displayTags);
                            } else {
                                console.info(`TestLog: Get displayTags failed:${data}`);
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                })
            } catch (err: BusinessError) {
                console.info(`TestLog: set & get displayTags error: code: ${err?.code}, message: ${err?.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_2000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_2000
         * @tc.desc   Testing call setAVMetadata(callback) set singleLyricText
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata: avSession.AVMetadata ={
                assetId: '121278',
                singleLyricText: 'dream it possible'
            }

            try {
                session!.setAVMetadata(metadata, (err) => {
                    if (err?.code) {
                        console.info(`TestLog: Set singleLyricText error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                    } else {
                        controller.getAVMetadata((err, data) => {
                            if (err?.code) {
                                console.info(`TestLog: Get singleLyricText error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                            } else if (data) {
                                console.info('TestLog: Get singleLyricText Successfully');
                                expect(data?.assetId).assertEqual(metadata.assetId);
                                expect(data?.singleLyricText).assertEqual(metadata.singleLyricText);
                            } else {
                                console.info(`TestLog: Get singleLyricText failed:${data}`);
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                })
            } catch (err: BusinessError) {
                console.info(`TestLog: set & get singleLyricText error: code: ${err?.code}, message: ${err?.message}`);
                expect(true).assertFalse();
                done();
            }
        })
        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0100
         * @tc.desc   Testing call setAVPlaybackState(callback) set state & activeItemId
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState1: avSession.AVPlaybackState = {
                state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
            };
            session!.setAVPlaybackState(PlaybackState1, (err) => {
                if (err) {
                    console.info(`TestLog: Set State error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set State successfully');
                }
            })
            await Utils.msSleep(500);
            controller.getAVPlaybackState((err:BusinessError|null, value: avSession.AVPlaybackState|undefined) => {
                if (err) {
                    console.info(`TestLog: Get State error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }else if (value?.state === avSession.PlaybackState.PLAYBACK_STATE_PLAY) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0200
         * @tc.desc   Testing call setAVPlaybackState(callback) set speed
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState2: avSession.AVPlaybackState = {
                speed: 2.6,
            };

            session!.setAVPlaybackState(PlaybackState2, (err) => {
                if (err) {
                    console.info(`TestLog: Set speed error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set speed successfully');
                }
            })
            await Utils.msSleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get speed error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }else if (value?.speed === 2.6) {
                    console.info('TestLog: Get speed successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get speed failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0300
         * @tc.desc   Testing call setAVPlaybackState(callback) set position
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState3: avSession.AVPlaybackState = {
                position:{elapsedTime:10, updateTime:(new Date()).getTime() as long} as avSession.PlaybackPosition,
            };

            session!.setAVPlaybackState(PlaybackState3, (err) => {
                if (err) {
                    console.info(`TestLog: Set position error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set position successfully');
                }
            })
            await Utils.msSleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get position error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }else if (value?.position?.elapsedTime === 10) {
                    console.info('TestLog: Get position successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get position failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0400
         * @tc.desc   Testing call setAVPlaybackState(callback) set bufferedTime
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState4: avSession.AVPlaybackState = {
                bufferedTime: 1000,
            };

            session!.setAVPlaybackState(PlaybackState4, (err) => {
                if (err) {
                    console.info(`TestLog: Set bufferedTime error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set bufferedTime successfully');
                }
            })
            await Utils.msSleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get bufferedTime error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }else if (value?.bufferedTime === 1000) {
                    console.info('TestLog: Get bufferedTime successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get bufferedTime failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0500
         * @tc.desc   Testing call setAVPlaybackState(callback) set loopMode(LOOP_MODE_SEQUENCE)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState5: avSession.AVPlaybackState = {
                loopMode:avSession.LoopMode.LOOP_MODE_SEQUENCE,
            };

            session!.setAVPlaybackState(PlaybackState5, (err) => {
                if (err) {
                    console.info(`TestLog: Set loopMode error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set loopMode successfully');
                }
            })
            await Utils.msSleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }else if (value?.loopMode === avSession.LoopMode.LOOP_MODE_SEQUENCE) {
                    console.info('TestLog: Get loopMode successfully');
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(1000);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0600
         * @tc.desc   Testing call setAVPlaybackState(callback) set loopMode(LOOP_MODE_SINGLE)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState6: avSession.AVPlaybackState = {
                loopMode:avSession.LoopMode.LOOP_MODE_SINGLE,
            };

            session!.setAVPlaybackState(PlaybackState6, (err) => {
                if (err) {
                    console.info(`TestLog: Set loopMode error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set loopMode successfully');
                }
            })
            await Utils.msSleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }else if (value?.loopMode === avSession.LoopMode.LOOP_MODE_SINGLE) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(1000);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0700
         * @tc.desc   Testing call setAVPlaybackState(callback) set loopMode(LOOP_MODE_LIST)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState7: avSession.AVPlaybackState = {
                loopMode:avSession.LoopMode.LOOP_MODE_LIST,
            };

            session!.setAVPlaybackState(PlaybackState7, (err) => {
                if (err) {
                    console.info(`TestLog: Set loopMode error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set loopMode successfully');
                }
            })
            await Utils.msSleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }else if (value?.loopMode === avSession.LoopMode.LOOP_MODE_LIST) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(1000);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0800
         * @tc.desc   Testing call setAVPlaybackState(callback) set loopMode(LOOP_MODE_SHUFFLE)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState8: avSession.AVPlaybackState = {
                loopMode:avSession.LoopMode.LOOP_MODE_SHUFFLE,
            };

            session!.setAVPlaybackState(PlaybackState8, (err) => {
                if (err) {
                    console.info(`TestLog: Set loopMode error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set loopMode successfully');
                }
            })
            await Utils.msSleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }else if (value?.loopMode === avSession.LoopMode.LOOP_MODE_SHUFFLE) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(1000);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0900
         * @tc.desc   Testing call setAVPlaybackState(callback) set isFavorite
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState9: avSession.AVPlaybackState = {
                isFavorite:true,
            };

            session!.setAVPlaybackState(PlaybackState9, (err) => {
                if (err) {
                    console.info(`TestLog: Set isFavorite error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set isFavorite successfully');
                }
            })
            await Utils.msSleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get isFavorite error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }else if (value?.isFavorite === true) {
                    console.info('TestLog: Get isFavorite successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get isFavorite failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(1000);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1000
         * @tc.desc   Testing call setAVPlaybackState(callback) set state(PLAYBACK_STATE_IDLE)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let PlaybackState10: avSession.AVPlaybackState = {
                state: avSession.PlaybackState.PLAYBACK_STATE_IDLE,
            };

            session!.setAVPlaybackState(PlaybackState10, (err) => {
                if (err) {
                    console.info(`TestLog: Set State error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set State successfully');
                }
            })
            await Utils.msSleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get State error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }else if (value?.state === avSession.PlaybackState.PLAYBACK_STATE_IDLE) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1100
         * @tc.desc   Testing call setAVPlaybackState(callback) set state(PLAYBACK_STATE_BUFFERING)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState11: avSession.AVPlaybackState = {
                state:avSession.PlaybackState.PLAYBACK_STATE_BUFFERING,
            };
            session!.setAVPlaybackState(PlaybackState11, (err) => {
                if (err) {
                    console.info(`TestLog: Set State error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set State successfully');
                }
            })
            await Utils.msSleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get State error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                }else if (value?.state === avSession.PlaybackState.PLAYBACK_STATE_BUFFERING) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await Utils.msSleep(500);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1200
         * @tc.desc   Testing call setAVPlaybackState(callback) set loopMode(LOOP_MODE_CUSTOM)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState: avSession.AVPlaybackState = {
                loopMode: avSession.LoopMode.LOOP_MODE_CUSTOM
            };
            try {
                session!.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`TestLog: Set loopMode error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Set loopMode successfully');
                        controller.getAVPlaybackState((err, value) => {
                            if (err) {
                                console.info(`TestLog: Get loopMode error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                            }else if (value?.loopMode === avSession.LoopMode.LOOP_MODE_CUSTOM) {
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
            } catch (err: BusinessError) {
                console.info(`TestLog: Set loopMode error: code: ${err?.code}, message: ${err?.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1300
         * @tc.desc   Testing call setAVPlaybackState(callback) set maxVolume
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState: avSession.AVPlaybackState = {
                maxVolume: 6
            };
            try {
                session!.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`TestLog: Set maxVolume error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Set maxVolume successfully');
                        controller.getAVPlaybackState((err, value) => {
                            if (err) {
                                console.info(`TestLog: Get maxVolume error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                            }else if (value?.maxVolume === PlaybackState.maxVolume) {
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
            } catch (err: BusinessError) {
                console.info(`TestLog: Set maxVolume error: code: ${err?.code}, message: ${err?.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1400
         * @tc.desc   Testing call setAVPlaybackState(callback) set muted
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState: avSession.AVPlaybackState = {
                muted: false
            };
            try {
                session!.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`TestLog: Set muted error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Set muted successfully');
                        controller.getAVPlaybackState((err, value) => {
                            if (err) {
                                console.info(`TestLog: Get muted error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                            }else if (value?.muted === PlaybackState.muted) {
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
            } catch (err: BusinessError) {
                console.info(`TestLog: Set muted error: code: ${err?.code}, message: ${err?.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1500
         * @tc.desc   Testing call setAVPlaybackState(callback) set videoWidth & videoHeight
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState: avSession.AVPlaybackState = {
                videoWidth: 1920,
                videoHeight: 1080
            };
            try {
                session!.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`TestLog: Set videoWidth & videoHeight error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Set videoWidth & videoHeight successfully');
                        controller.getAVPlaybackState((err, value) => {
                            if (err) {
                                console.info(`TestLog: Get videoWidth & videoHeight error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                            }else if (value?.videoWidth === PlaybackState.videoWidth && value?.videoHeight === PlaybackState.videoHeight) {
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
            } catch (err: BusinessError) {
                console.info(`TestLog: Set videoWidth & videoHeight error: code: ${err?.code}, message: ${err?.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1600
         * @tc.desc   Testing call setAVPlaybackState(callback) set duration
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState: avSession.AVPlaybackState = {
                duration: 100
            };
            try {
                session!.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`TestLog: Set duration error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Set duration successfully');
                        controller.getAVPlaybackState((err, value) => {
                            if (err) {
                                console.info(`TestLog: Get duration error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                            }else if (value?.duration === PlaybackState.duration) {
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
            } catch (err: BusinessError) {
                console.info(`TestLog: Set duration error: code: ${err?.code}, message: ${err?.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_CALLBACK_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_CALLBACK_STATIC_0100
         * @tc.desc   Testing call setLaunchAbility(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let wantAgentInfo: WantAgentInfo = {
                wants : [
                    {
                        bundleName : 'com.example.myapplication.static',
                        abilityName: 'EntryAbility'
                    }
                ],
                actionType: wantAgent.OperationType.START_ABILITIES,
                requestCode: 0,
                actionFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
            };
            let agent: WantAgent;
            await wantAgent.getWantAgent(wantAgentInfo).then((callback) => {
                agent = callback;
            });

            session!.setLaunchAbility(agent, (err) => {
                if (err) {
                    console.info(`TestLog: Set launchAbility error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set launchAbility successfully');
                }
            });

            await Utils.msSleep(500);
            let wantagent: WantAgent;
            controller.getLaunchAbility((err, value) => {
                if (err) {
                    console.info(`TestLog: error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Get launchAbility');
                    wantagent = value!;
                }
            });
            await Utils.msSleep(500);

            let agentBundleName: string = await wantAgent.getBundleName(agent);
            console.info(`TestLog: agentBundleName: ${agentBundleName}`);
            let wantagentBundleName: string = await wantAgent.getBundleName(wantagent);
            console.info(`TestLog: wantagentBundleName: ${wantagentBundleName}`);

            if (agentBundleName == wantagentBundleName) {
                console.info('AVSessionTest : Set LaunchAbility successfully');
                expect(true).assertTrue();
            } else {
                console.info('AVSessionTest : Set LaunchAbility failed');
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_CALLBACK_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_CALLBACK_STATIC_0100
         * @tc.desc   Testing destroy session(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let flag = false;
            controller.onSessionDestroy(() => {
                console.info('TestLog: Session destroyed successfully');
                flag = true;
            });

            session!.destroy((err) => {
                if (err) {
                    console.info(`TestLog: Session destroy error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Session destroy');
                }
            });

            await Utils.msSleep(500);

            if (flag) {
                console.info('TestLog: Session destroyed successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Session destroyed failed');
                expect(false).assertTrue();
            }
            session = await avSession.createAVSession(context,tag,type as avSession.AVSessionType);
            done();
        })
    })
}