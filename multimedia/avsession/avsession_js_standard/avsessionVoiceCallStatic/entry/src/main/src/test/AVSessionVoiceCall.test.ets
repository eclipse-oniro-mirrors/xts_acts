/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import Utils from './Util.test';
import avSession from '@ohos.multimedia.avsession';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'

let context: common.UIAbilityContext | undefined;
export default function abilityTest() {
    describe('AVSessionVoiceCallTest', () => {
        let TAG: string = "[AVSessionVoiceCallTest]";
        let session: avSession.AVSession | null = null;
        let controller: avSession.AVSessionController | undefined;
        let receivedCallback1: boolean = false;
        let receivedCallback2: boolean = false;
        let tag: string = 'VoiceCallXTS';
        let assetId: string = 'assetIdTest';
        let assetId1: string = '';
        let assetId2: string = '';
        let assetId3: string = '~!@#$%^&*()_+{}:">?,./123456789'+'a'.repeat(40928);
        let assetId4: string = 'a'.repeat(40960)
        let assetId5: double = 123

        let getPixelMap = async () => {
            let color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            bufferArr.fill(3, 0, 95);
            let opts: image.InitializationOptions = {
                editable: true,
                pixelFormat: image.PixelMapFormat.RGBA_8888,
                size: {
                    height: 4, width: 6
                },
                alphaType: image.AlphaType.UNPREMUL
            };
            console.info(`${TAG}: getPixelMap 5`);
            return image.createPixelMap(color, opts);
            console.info(`${TAG}: getPixelMap 6`);
        }

        let callMetadataChangeCallback1 = (callMetadata: avSession.CallMetadata) => {
            console.info(`${TAG}: callMetadataChangeCallback1 received callMetadata: ${JSON.stringify(callMetadata)}`);
            if (callMetadata.name != '123456789' || callMetadata.phoneNumber != '65432111' || callMetadata.avatar != null) {
                console.error(`${TAG}: callMetadataChangeCallback1 received callMetadata unmatch`);
                expect().assertFail();
            }
            receivedCallback1 = true;
        }

        let callMetadataChangeCallback2 = (callMetadata: avSession.CallMetadata) => {
            console.info(`${TAG}: callMetadataChangeCallback2 received callMetadata: ${JSON.stringify(callMetadata)}`);
            if (callMetadata.name != '123456789' || callMetadata.phoneNumber != '65432111' || callMetadata.avatar != null) {
                console.error(`${TAG}: callMetadataChangeCallback2 received callMetadata unmatch`);
                expect().assertFail();
            }
            receivedCallback2 = true;
        }

        let callStateChangeCallback1 = (callState: avSession.AVCallState) => {
            console.info(`${TAG}: callStateChangeCallback1 received callState: ${JSON.stringify(callState)}`);
            if (callState.state != avSession.CallState.CALL_STATE_WAITING || callState.muted) {
                console.error(`${TAG}: callStateChangeCallback1 received callState unmatch`);
                expect().assertFail();
            }
            receivedCallback1 = true;
        }

        let callStateChangeCallback2 = (callState: avSession.AVCallState) => {
            console.info(`${TAG}: callStateChangeCallback2 received callState: ${JSON.stringify(callState)}`);
            if (callState.state != avSession.CallState.CALL_STATE_WAITING || callState.muted) {
                console.error(`${TAG}: callStateChangeCallback2 received callState unmatch`);
                expect().assertFail();
            }
            receivedCallback2 = true;
        }

        let answerCallback1 = () => {
            console.info(`${TAG}: answerCallback1 received`);
            receivedCallback1 = true;
        }

        let answerCallback2 = () => {
            console.info(`${TAG}: answerCallback2 received`);
            receivedCallback2 = true;
        }

        let hangUpCallback1 = () => {
            console.info(`${TAG}: hangUpCallback1 received`);
            receivedCallback1 = true;
        }

        let hangUpCallback2 = () => {
            console.info(`${TAG}: hangUpCallback2 received`);
            receivedCallback2 = true;
        }

        let toggleCallMuteCallback1 = () => {
            console.info(`${TAG}: toggleCallMuteCallback1 received`);
            receivedCallback1 = true;
        }

        let toggleCallMuteCallback2 = () => {
            console.info(`${TAG}: toggleCallMuteCallback2 received`);
            receivedCallback2 = true;
        }

        let playWithAssetIdCallback1 = (data: string) => {
            console.info(`${TAG}: playWithAssetIdCallback1 received ${data}`);
            assetId1 = data;
        }

        let playWithAssetIdCallback2 = (data: string) => {
            console.info(`${TAG}: playWithAssetIdCallback2 received ${data}`);
            assetId2 = data;
        }

        beforeAll(() => {
            context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            console.info(`${TAG}: beforeAll in`);
        })

        beforeEach(async () => {
            console.info(`${TAG}: beforeEach in`);
            console.info(`${TAG}: createAVSession begin`);
            try{
                session = await avSession.createAVSession(context!, tag, 'voice_call')
                console.info(`${TAG}: avSession create success`);
                console.info(`${session!.sessionType}`);
            }catch(err){
                console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
            };
            try{
                await session!.activate()
                console.info(`${TAG}: Session activate`);
            }catch(err){
                console.info(`${TAG}: Session activate error: code: ${err.code}, message: ${err.message}`);
            };
            try {
                controller = await session!.getController();
            } catch (err) {
                console.info(`${TAG}: getController error: code: ${err.code}, message: ${err.message}`);
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
                }catch(err){
                    console.info(`${TAG}: Session destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`${TAG}: Session is already destroy`);
            }
            if (controller != null) {
                try{
                    await controller!.destroy()
                    console.info(`${TAG}: Controller destroy success`);
                }catch(err){
                    console.info(`${TAG}: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`${TAG}: Controller is already destroy`);
            }
            console.info(`${TAG}: afterEach out`);
        })

        afterAll(() => {
            console.info(`${TAG}: afterAll in`);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_STATIC_0100
         * @tc.desc   Testing set callMetadata - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let pixelMap: image.PixelMap = await getPixelMap();
            let readBuffer0 = new ArrayBuffer(96);
            await pixelMap.readPixelsToBuffer(readBuffer0);
            let bufferArr0 = new Uint8Array(readBuffer0);
            let callMetadata0: avSession.CallMetadata = {
                name: '12345678',
                phoneNumber: '65432111',
                avatar: pixelMap
            };
            try{
                await session!.setCallMetadata(callMetadata0)
                console.info(`${TAG}: setCallMetadata set avatar successfully`);
            }catch(err){
                console.info(`${TAG}: setCallMetadata set avatar error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let pixMap: image.PixelMap | undefined;
            let data: avSession.CallMetadata;
            try{
                data = await controller!.getCallMetadata()
                if (data.name === '12345678' && data.phoneNumber === '65432111') {
                    console.info(`${TAG}: getCallMetadata get name and phoneNumber Successfully`);
                } else {
                    console.info(`${TAG}: getCallMetadata get name and phoneNumber failed`);
                    console.info(`${TAG}: name is: ${data.name}, phoneNumber is ${data.phoneNumber}`);
                    expect(false).assertTrue();
                    done();
                }
                pixMap = data.avatar as image.PixelMap;
            }catch(err){
                console.info(`${TAG}: getCallMetadata set avatar error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let pixelSize: number = pixMap!.getPixelBytesNumber();
            console.info(`${TAG}: pixelSize is: ${pixelSize}`);
            let readBuffer = new ArrayBuffer(pixelSize);
            await pixMap!.readPixelsToBuffer(readBuffer);
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
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_STATIC_0600
         * @tc.desc   Testing destroy before setCallMetadata - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callMetadata5: avSession.CallMetadata = {
                name: '12345678',
                phoneNumber: '65432111'
            };
            await session!.destroy();
            try{
                await session!.setCallMetadata(callMetadata5)
                console.info(`${TAG}: setCallMetadata without avsession test fail, set successful!`);
                expect(false).assertTrue();
            }catch(err){
                if (err.code == 6600102) {
                    console.info(`${TAG}: setCallMetadata without avsession test success, error: code: ${err.code}, message: ${err.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: setCallMetadata errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_STATIC_0700
         * @tc.desc   Testing set name - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callMetadata6: avSession.CallMetadata = {
                name: '12345678'
            };
            try{
                await session!.setCallMetadata(callMetadata6)
                console.info(`${TAG}: setCallMetadata set name successfully`);
            }catch(err){
                console.info(`${TAG}: setCallMetadata set name error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.CallMetadata;
            try{
                data = await controller!.getCallMetadata()
                if (data.name === '12345678') {
                    console.info(`${TAG}: getCallMetadata get name Successfully`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: getCallMetadata get name failed`);
                    console.info(`${TAG}: name is: ${data.name}`);
                    expect(false).assertTrue();
                }
            }catch(err){
                console.info(`${TAG}: getCallMetadata get name error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_STATIC_0800
         * @tc.desc   Testing set phoneNumber - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callMetadata7: avSession.CallMetadata = {
                phoneNumber: '65432111'
            };
            try{
                await session!.setCallMetadata(callMetadata7)
                console.info(`${TAG}: setCallMetadata set phoneNumber successfully`);
            }catch(err){
                console.info(`${TAG}: setCallMetadata set phoneNumber error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.CallMetadata;
            try{
                data = await controller!.getCallMetadata()
                if (data.phoneNumber === '65432111') {
                    console.info(`${TAG}: getCallMetadata get phoneNumber Successfully`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: getCallMetadata get phoneNumber failed`);
                    console.info(`${TAG}: phoneNumber is: ${data.phoneNumber}`);
                    expect(false).assertTrue();
                }
            }catch(err){
                console.info(`${TAG}: getCallMetadata get phoneNumber error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_STATIC_0900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_STATIC_0900
         * @tc.desc   Testing set avatar - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let pixelMap = await getPixelMap();
            let readBuffer0 = new ArrayBuffer(96);
            await pixelMap.readPixelsToBuffer(readBuffer0);
            let bufferArr0 = new Uint8Array(readBuffer0);
            let callMetadata8: avSession.CallMetadata = {
                avatar: pixelMap
            };
            try{
                await session!.setCallMetadata(callMetadata8)
                console.info(`${TAG}: setCallMetadata set avatar successfully`);
            }catch(err){
                console.info(`${TAG}: setCallMetadata set avatar error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let pixMap: image.PixelMap | undefined;
            let data: avSession.CallMetadata;
            try{
                data = await controller!.getCallMetadata()
                pixMap = data.avatar as image.PixelMap;
            }catch(err){
                console.info(`${TAG}: getCallMetadata set avatar error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let pixelSize: number = pixMap!.getPixelBytesNumber();
            console.info(`${TAG}: pixelSize is: ${pixelSize}`);
            let readBuffer = new ArrayBuffer(pixelSize);
            await pixMap!.readPixelsToBuffer(readBuffer);
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
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_STATIC_0100
         * @tc.desc   Testing destroy before getCallMetadata - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let callMetadata0: avSession.CallMetadata = {
                name: '1234568',
                phoneNumber: '65432111'
            };
            await session!.setCallMetadata(callMetadata0).then(() => {
                console.info(`${TAG}: setCallMetadata successfully`);
            }).catch((err: Error) => {
                console.info(`${TAG}: setCallMetadata error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await session!.destroy();
            await controller!.getCallMetadata().then(() => {
                console.info(`${TAG}: getCallMetadata without avsession test fail, get successful!`);
                expect(false).assertTrue();
            }).catch((err: Error) => {
                if (err) {
                if (err.code == 6600102) {
                    console.info(`${TAG}: getCallMetadata without avsession test success, error: code: ${err.code}, message: ${err.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: getCallMetadata errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
                } else {
                console.info(`${TAG}: getCallMetadata get successful without avsession test fail, get successful!`);
                expect(false).assertTrue();
                }
            });
            session = null;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_STATIC_0200
         * @tc.desc   Testing destroy before getCallMetadata - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callMetadata1: avSession.CallMetadata = {
                name: '12345678',
                phoneNumber: '65432111'
            };
            try{
                await session!.setCallMetadata(callMetadata1)
                console.info(`${TAG}: setCallMetadata successfully`);
            }catch(err){
                console.info(`${TAG}: setCallMetadata error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            await controller!.destroy();
            try{
                await controller!.getCallMetadata()
                console.info(`${TAG}: getCallMetadata without controller test fail, get successful!`);
                expect(false).assertTrue();
            }catch(err){
                if (err.code) {
                    if (err.code == 6600103) {
                        console.info(`${TAG}: getCallMetadata without controller test success, error: code: ${err.code}, message: ${err.message}`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TAG}: getCallMetadata errorCode != 6600103, error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    }
                } else {
                    console.info(`${TAG}: getCallMetadata without controller test fail, get successful!`);
                    expect(false).assertTrue();
                }
            };

            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_STATIC_0100
         * @tc.desc   Testing set callMetadata0 - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let pixelMap = await getPixelMap();
                let readBuffer0 = new ArrayBuffer(96);
                await pixelMap.readPixelsToBuffer(readBuffer0);
                let bufferArr0 = new Uint8Array(readBuffer0);
                let callMetadata0: avSession.CallMetadata = {
                    name: '12345678',
                    phoneNumber: '65432111',
                    avatar: pixelMap
                };
                session!.setCallMetadata(callMetadata0, (err: BusinessError | null) => {
                    if (err?.code) {
                        console.info(`${TAG}: setCallMetadataCallback error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(`${TAG}: setCallMetadataCallback set successfully`);
                        let pixMap: image.PixelMap | undefined;
                        controller!.getCallMetadata((err: BusinessError|null, data: avSession.CallMetadata|undefined) => {
                            if (err?.code) {
                                console.info(`${TAG}: getCallMetadataCallback error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                                done();
                            } else {
                                if (data?.name === '12345678' && data?.phoneNumber === '65432111') {
                                    console.info(`${TAG}: getCallMetadataCallback get name and phoneNumber Successfully`);
                                } else {
                                    console.info(`${TAG}: getCallMetadataCallback failed, name is: ${data?.name}, phoneNumber is ${data?.phoneNumber}`);
                                    expect(false).assertTrue();
                                    done();
                                }
                                pixMap = data?.avatar as image.PixelMap;
                                let pixelSize: number = pixMap!.getPixelBytesNumber();
                                console.info(`${TAG}: pixelSize is: ${pixelSize}`);
                                let readBuffer = new ArrayBuffer(pixelSize);
                                await pixMap!.readPixelsToBuffer(readBuffer);
                                let bufferArr2 = new Uint8Array(readBuffer);
                                console.info(`${TAG}: buffer0Size is: ${bufferArr0.length}`);
                                console.info(`${TAG}: buffer2Size is: ${bufferArr2.length}`);
                                for (let i = 0; i < bufferArr2.length; i++) {
                                    if (bufferArr0[i] !== bufferArr2[i]) {
                                        expect(false).assertTrue();
                                    } else {
                                        expect(true).assertTrue();
                                    }
                                }
                                done();
                            }
                        })
                    }
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_STATIC_0600
         * @tc.desc   Testing destroy before setCallMetadata - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callMetadata5: avSession.CallMetadata = {
                name: '12345678',
                phoneNumber: '65432111'
            };
            try {
                await session!.destroy();
                session!.setCallMetadata(callMetadata5, (err: BusinessError | null) => {
                    if (err?.code) {
                        if (err?.code == 6600102) {
                            console.info(`${TAG}: setCallMetadataCallback without avsession test success, error: code: ${err?.code}, message: ${err?.message}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TAG}: setCallMetadataCallback errorCode != 6600102, error: code: ${err?.code}, message: ${err?.message}`);
                            expect(false).assertTrue();
                        }
                    } else {
                        console.info(`${TAG}: setCallMetadataCallback without avsession test fail, set successful!`);
                        expect(false).assertTrue();
                    }

                    done();
                })
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_STATIC_0070
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_STATIC_0070
         * @tc.desc   Testing set name - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_STATIC_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callMetadata6: avSession.CallMetadata = {
                name: '12345678'
            };
            try {
                session!.setCallMetadata(callMetadata6, (err: BusinessError | null) => {
                    if (err?.code) {
                        console.info(`${TAG}: setCallMetadataCallback set name error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info(`${TAG}: setCallMetadataCallback set name successfully`);
                        try{
                            let data: avSession.CallMetadata = await controller!.getCallMetadata();
                            if (data.name === '12345678') {
                                console.info(`${TAG}: getCallMetadata get name Successfully`);
                                expect(true).assertTrue();
                            } else {
                                console.info(`${TAG}: getCallMetadata get name failed`);
                                console.info(`${TAG}: name is: ${data.name}`);
                                expect(false).assertTrue();
                            }
                            done();
                        }catch(err){
                            console.info(`${TAG}: getCallMetadata get name error: code: ${err.code}, message: ${err.message}`);
                            expect(false).assertTrue();
                            done();
                        };
                    }
                })
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_STATIC_0080
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_STATIC_0080
         * @tc.desc   Testing set phoneNumber - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_STATIC_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callMetadata7: avSession.CallMetadata = {
                phoneNumber: '65432111'
            };
            try {
                session!.setCallMetadata(callMetadata7, (err: BusinessError | null) => {
                    if (err?.code) {
                        console.info(`${TAG}: setCallMetadataCallback set phoneNumber error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info(`${TAG}: setCallMetadataCallback set phoneNumber successfully`);
                        try{
                            let data: avSession.CallMetadata = await controller!.getCallMetadata();
                            if (data.phoneNumber === '65432111') {
                                console.info(`${TAG}: getCallMetadata get phoneNumber Successfully`);
                                expect(true).assertTrue();
                            } else {
                                console.info(`${TAG}: getCallMetadata get phoneNumber failed`);
                                console.info(`${TAG}: name is: ${data.name}`);
                                expect(false).assertTrue();
                            }
                            done();
                        }catch(err){
                            console.info(`${TAG}: getCallMetadata get phoneNumber error: code: ${err.code}, message: ${err.message}`);
                            expect(false).assertTrue();
                            done();
                        };
                    }
                })
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_STATIC_0090
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_STATIC_0090
         * @tc.desc   Testing set avatar - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_STATIC_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let pixelMap = await getPixelMap();
                let readBuffer0 = new ArrayBuffer(96);
                await pixelMap.readPixelsToBuffer(readBuffer0);
                let bufferArr0 = new Uint8Array(readBuffer0);
                let callMetadata8: avSession.CallMetadata = {
                    avatar: pixelMap
                };
                session!.setCallMetadata(callMetadata8, (err: BusinessError | null) => {
                    if (err?.code) {
                        console.info(`${TAG}: setCallMetadataCallback set avatar error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info(`${TAG}: setCallMetadataCallback set avatar successfully`);
                        let pixMap: image.PixelMap | undefined;
                        controller!.getCallMetadata((err: BusinessError|null, data: avSession.CallMetadata|undefined) => {
                            if (err?.code) {
                                console.info(`${TAG}: getCallMetadataCallback error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                                done();
                            } else {
                                pixMap = data?.avatar as image.PixelMap;
                                let pixelSize: number = pixMap!.getPixelBytesNumber();
                                console.info(`${TAG}: pixelSize is: ${pixelSize}`);
                                let readBuffer = new ArrayBuffer(pixelSize);
                                await pixMap!.readPixelsToBuffer(readBuffer);
                                let bufferArr2 = new Uint8Array(readBuffer);
                                console.info(`${TAG}: buffer0Size is: ${bufferArr0.length}`);
                                console.info(`${TAG}: buffer2Size is: ${bufferArr2.length}`);
                                for (let i = 0; i < bufferArr2.length; i++) {
                                    if (bufferArr0[i] !== bufferArr2[i]) {
                                        expect(false).assertTrue();
                                    } else {
                                        expect(true).assertTrue();
                                    }
                                }
                                done();
                            }
                        })
                    }
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_STATIC_0100
         * @tc.desc   Testing destroy before getCallMetadata - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                await session!.destroy();
                controller!.getCallMetadata((err: BusinessError | null, data: avSession.CallMetadata | undefined) => {
                if (err) {
                    if (err.code == 6600102) {
                        console.info(`${TAG}: getCallMetadataCallback without avsession test success, error: code: ${err.code}, message: ${err.message}`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TAG}: getCallMetadataCallback errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    }
                } else {
                    console.info(`${TAG}: getCallMetadataCallback without avsession test fail, get successful!`);
                    expect(false).assertTrue();
                }
                    session = null;
                    done();
                })
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_STATIC_0200
         * @tc.desc   Testing destroy before getCallMetadata - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                await controller!.destroy();
                controller!.getCallMetadata((err: BusinessError|null, data: avSession.CallMetadata|undefined) => {
                    if (err?.code) {
                        if (err?.code == 6600103) {
                            console.info(`${TAG}: getCallMetadataCallback without controller test success, error: code: ${err?.code}, message: ${err?.message}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TAG}: getCallMetadataCallback errorCode != 6600103, error: code: ${err?.code}, message: ${err?.message}`);
                            expect(false).assertTrue();
                        }
                    } else {
                        console.info(`${TAG}: getCallMetadataCallback without avsession test fail, get successful!`);
                        expect(false).assertTrue();
                    }

                    done();
                })
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0100
         * @tc.desc   Testing set AVCallstate - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState0: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_ACTIVE,
                muted: true,
            };
            try{
                await session!.setAVCallState(avCallState0)
                console.info(`${TAG}: setAVCallState successfully`);
            }catch(err){
                console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVCallState;
            try{
                data = await controller!.getAVCallState()
                if (data.state === 2 && data.muted) {
                    console.info(`${TAG}: getAVCallState successfully`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: getAVCallState failed, callState: ${JSON.stringify(data)}`);
                    expect(false).assertTrue();
                }
            }catch(err){
                console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0200
         * @tc.desc   Testing set AVCallstate - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState1: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_IDLE,
                muted: true,
            };
            try{
                await session!.setAVCallState(avCallState1)
                console.info(`${TAG}: setAVCallState successfully`);
            }catch(err){
                console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVCallState;
            try{
                data = await controller!.getAVCallState()
                if (data.state === 0 && data.muted) {
                    console.info(`${TAG}: getAVCallState successfully`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: getAVCallState failed, callState: ${JSON.stringify(data)}`);
                    expect(false).assertTrue();
                }
            }catch(err){
                console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0300
         * @tc.desc   Testing set AVCallstate - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState2: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_INCOMING,
                muted: true,
            };
            try{
            await session!.setAVCallState(avCallState2)
                console.info(`${TAG}: setAVCallState successfully`);
            }catch(err){
                console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVCallState;
            try{
                data = await controller!.getAVCallState()
                if (data.state === 1 && data.muted) {
                    console.info(`${TAG}: getAVCallState successfully`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: getAVCallState failed`);
                    expect(false).assertTrue();
                }
            }catch(err){
                console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0400
         * @tc.desc   Testing set AVCallstate - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState3: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_DIALING,
                muted: true,
            };
            try{
                await session!.setAVCallState(avCallState3)
                console.info(`${TAG}: setAVCallState successfully`);
            }catch(err){
                console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVCallState
            try{
                data = await controller!.getAVCallState()
                if (data.state === 3 && data.muted) {
                    console.info(`${TAG}: getAVCallState successfully`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: getAVCallState failed`);
                    expect(false).assertTrue();
                }
            }catch(err){
                console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0500
         * @tc.desc   Testing set AVCallstate - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState4: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_WAITING,
                muted: true,
            };
            try{
                await session!.setAVCallState(avCallState4)
                console.info(`${TAG}: setAVCallState successfully`);
            }catch(err){
                console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVCallState;
            try{
                data = await controller!.getAVCallState()
                if (data.state === 4 && data.muted) {
                    console.info(`${TAG}: getAVCallState successfully`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: getAVCallState failed`);
                    expect(false).assertTrue();
                }
            }catch(err){
                console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0600
         * @tc.desc   Testing set AVCallstate - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState5: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_HOLDING,
                muted: true,
            };
            try{
            await session!.setAVCallState(avCallState5)
                console.info(`${TAG}: setAVCallState successfully`);
            }catch(err){
                console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVCallState;
            try{
                data = await controller!.getAVCallState()
                if (data.state === 5 && data.muted) {
                    console.info(`${TAG}: getAVCallState successfully`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: getAVCallState failed`);
                    expect(false).assertTrue();
                }
            }catch(err){
                console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0700
         * @tc.desc   Testing set AVCallstate - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState6: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_DISCONNECTING,
                muted: true,
            };
            try{
                await session!.setAVCallState(avCallState6)
                console.info(`${TAG}: setAVCallState successfully`);
            }catch(err){
                console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVCallState;
            try{
                data = await controller!.getAVCallState()
                if (data.state === 6 && data.muted) {
                    console.info(`${TAG}: getAVCallState successfully`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: getAVCallState failed`);
                    expect(false).assertTrue();
                }
            }catch(err){
                console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0800
         * @tc.desc   Testing set AVCallstate - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState7: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_IDLE,
                muted: false,
            };
            try{
            await session!.setAVCallState(avCallState7)
                console.info(`${TAG}: setAVCallState successfully`);
            }catch(err){
                console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVCallState;
            try{
                data = await controller!.getAVCallState()
                if (data.state === 0 && !data.muted) {
                    console.info(`${TAG}: getAVCallState successfully`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: getAVCallState failed`);
                    expect(false).assertTrue();
                }
            }catch(err){
                console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_1300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_1300
         * @tc.desc   Testing destroy before setAVCallState - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState12: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_IDLE,
                muted: true,
            };
            await session!.destroy();
            try{
                await session!.setAVCallState(avCallState12)
                console.info(`${TAG}: setAVCallState without avsession test fail, set successful!`);
                expect(false).assertTrue();
            }catch(err){
                if (err.code == 6600102) {
                    console.info(`${TAG}: setAVCallState without avsession test success, error: code: ${err.code}, message: ${err.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: setAVCallState errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_STATIC_0100
         * @tc.desc   Testing destroy before getAVCallState - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let avCallState0: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_DIALING,
                muted: true,
            };
            try {
                await session!.setAVCallState(avCallState0).then(() => {
                    console.info(`${TAG}: setAVCallState successfully`);
                }).catch((err: Error) => {
                    console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                });
                await session!.destroy();
                await controller!.getAVCallState().then(() => {
                    console.info(`${TAG}: getAVCallState without session test fail, get successful!`);
                    expect(false).assertTrue();
                }).catch((err: Error) => {
                    if (err.code == 6600102) {
                        console.info(`${TAG}: getCallMetadata without session test success, error: code: ${err.code}, message: ${err.message}`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TAG}: getCallMetadata errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    }
                });
                session = null;
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_STATIC_0200
         * @tc.desc   Testing destroy before getAVCallState - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState1: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_DIALING,
                muted: true,
            };
            try {
                try{
                    await session!.setAVCallState(avCallState1)
                    console.info(`${TAG}: setAVCallState successfully`);
                }catch(err){
                    console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                };
                await controller!.destroy();
                try{
                    await controller!.getAVCallState()
                    console.info(`${TAG}: getAVCallState without controller test fail, get successful!`);
                    expect(false).assertTrue();
                }catch(err){
                    if (err.code == 6600103) {
                        console.info(`${TAG}: getCallMetadata without controller test success, error: code: ${err.code}, message: ${err.message}`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TAG}: getCallMetadata errorCode != 6600103, error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    }
                };

                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0100
         * @tc.desc   Testing set AVCallstate - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState0: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_ACTIVE,
                muted: true,
            };
            try {
                session!.setAVCallState(avCallState0, (err: BusinessError | null) => {
                    if (err?.code) {
                        console.info(`${TAG}: setAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(`${TAG}: setAVCallStateCallback successfully`);
                        controller!.getAVCallState((err: BusinessError|null, data: avSession.AVCallState|undefined) => {
                            if (err?.code) {
                                console.info(`${TAG}: getAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                            } else if (data?.state === avSession.CallState.CALL_STATE_ACTIVE && data?.muted) {
                                console.info(`${TAG}: getAVCallStateCallback successfully`);
                                expect(true).assertTrue();
                            } else {
                                console.info(`${TAG}: getAVCallStateCallback failed`);
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0200
         * @tc.desc   Testing set AVCallstate - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState1: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_IDLE,
                muted: true,
            };
            try {
                session!.setAVCallState(avCallState1, (err: BusinessError | null) => {
                    if (err?.code) {
                        console.info(`${TAG}: setAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(`${TAG}: setAVCallStateCallback successfully`);
                        controller!.getAVCallState((err: BusinessError|null, data: avSession.AVCallState|undefined) => {
                            if (err?.code) {
                                console.info(`${TAG}: getAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                            } else if (data?.state === avSession.CallState.CALL_STATE_IDLE && data?.muted) {
                                console.info(`${TAG}: getAVCallStateCallback successfully`);
                                expect(true).assertTrue();
                            } else {
                                console.info(`${TAG}: getAVCallStateCallback failed`);
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                })
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0300
         * @tc.desc   Testing set AVCallstate - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState2: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_INCOMING,
                muted: true,
            };
            try {
                session!.setAVCallState(avCallState2, (err: BusinessError | null) => {
                    if (err?.code) {
                        console.info(`${TAG}: setAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(`${TAG}: setAVCallStateCallback successfully`);
                        controller!.getAVCallState((err: BusinessError|null, data: avSession.AVCallState|undefined) => {
                            if (err?.code) {
                                console.info(`${TAG}: getAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                            } else if (data?.state === avSession.CallState.CALL_STATE_INCOMING && data?.muted) {
                                console.info(`${TAG}: getAVCallStateCallback successfully`);
                                expect(true).assertTrue();
                            } else {
                                console.info(`${TAG}: getAVCallStateCallback failed`);
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                })
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0400
         * @tc.desc   Testing set AVCallstate - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState3: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_DIALING,
                muted: true,
            };
            try {
                session!.setAVCallState(avCallState3, (err: BusinessError | null) => {
                    if (err?.code) {
                        console.info(`${TAG}: setAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(`${TAG}: setAVCallStateCallback successfully`);
                        controller!.getAVCallState((err: BusinessError|null, data: avSession.AVCallState|undefined) => {
                            if (err?.code) {
                                console.info(`${TAG}: getAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                            } else if (data?.state === avSession.CallState.CALL_STATE_DIALING && data?.muted) {
                                console.info(`${TAG}: getAVCallStateCallback successfully`);
                                expect(true).assertTrue();
                            } else {
                                console.info(`${TAG}: getAVCallStateCallback failed`);
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                })
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0500
         * @tc.desc   Testing set AVCallstate - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState4: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_WAITING,
                muted: true,
            };
            try {
                session!.setAVCallState(avCallState4, (err: BusinessError | null) => {
                    if (err?.code) {
                        console.info(`${TAG}: setAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(`${TAG}: setAVCallStateCallback successfully`);
                        controller!.getAVCallState((err: BusinessError|null, data: avSession.AVCallState|undefined) => {
                            if (err?.code) {
                                console.info(`${TAG}: getAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                            } else if (data?.state === avSession.CallState.CALL_STATE_WAITING && data?.muted) {
                                console.info(`${TAG}: getAVCallStateCallback successfully`);
                                expect(true).assertTrue();
                            } else {
                                console.info(`${TAG}: getAVCallStateCallback failed`);
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0600
         * @tc.desc   Testing set AVCallstate - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState5: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_HOLDING,
                muted: true,
            };
            try {
                session!.setAVCallState(avCallState5, (err: BusinessError | null) => {
                    if (err?.code) {
                        console.info(`${TAG}: setAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(`${TAG}: setAVCallStateCallback successfully`);
                        controller!.getAVCallState((err: BusinessError | null, data: avSession.AVCallState | undefined) => {
                            if (err?.code) {
                                console.info(`${TAG}: getAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                            } else if (data?.state === avSession.CallState.CALL_STATE_HOLDING && data?.muted) {
                                console.info(`${TAG}: getAVCallStateCallback successfully`);
                                expect(true).assertTrue();
                            } else {
                                console.info(`${TAG}: getAVCallStateCallback failed`);
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0700
         * @tc.desc   Testing set AVCallstate - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState6: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_DISCONNECTING,
                muted: true,
            };
            try {
                session!.setAVCallState(avCallState6, (err: BusinessError | null) => {
                    if (err?.code) {
                        console.info(`${TAG}: setAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(`${TAG}: setAVCallStateCallback successfully`);
                        controller!.getAVCallState((err: BusinessError|null, data: avSession.AVCallState|undefined) => {
                            if (err?.code) {
                                console.info(`${TAG}: getAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                            } else if (data?.state === avSession.CallState.CALL_STATE_DISCONNECTING && data?.muted) {
                                console.info(`${TAG}: getAVCallStateCallback successfully`);
                                expect(true).assertTrue();
                            } else {
                                console.info(`${TAG}: getAVCallStateCallback failed`);
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0800
         * @tc.desc   Testing set AVCallstate - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState7: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_IDLE,
                muted: false,
            };
            try {
                session!.setAVCallState(avCallState7, (err: BusinessError | null) => {
                    if (err?.code) {
                        console.info(`${TAG}: setAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(`${TAG}: setAVCallStateCallback successfully`);
                        controller!.getAVCallState((err: BusinessError|null, data: avSession.AVCallState|undefined) => {
                            if (err?.code) {
                                console.info(`${TAG}: getAVCallStateCallback error: code: ${err?.code}, message: ${err?.message}`);
                                expect(false).assertTrue();
                            } else if (data?.state === avSession.CallState.CALL_STATE_IDLE && !data?.muted) {
                                console.info(`${TAG}: getAVCallStateCallback successfully`);
                                expect(true).assertTrue();
                            } else {
                                console.info(`${TAG}: getAVCallStateCallback failed`);
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_1300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_1300
         * @tc.desc   Testing destroy before setAVCallState - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let avCallState12: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_IDLE,
                muted: true,
            };
            try {
                await session!.destroy();
                session!.setAVCallState(avCallState12, (err: BusinessError | null) => {
                    if (err?.code) {
                        if (err?.code == 6600102) {
                            console.info(`${TAG}: setAVCallStateCallback without avsession test success, error: code: ${err?.code}, message: ${err?.message}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TAG}: setAVCallStateCallback errorCode != 6600102, error: code: ${err?.code}, message: ${err?.message}`);
                            expect(false).assertTrue();
                        }
                    } else {
                        console.info(`${TAG}: setAVCallStateCallback without avsession test fail, set successful!`);
                        expect(false).assertTrue();
                    }

                    done();
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_STATIC_0100
         * @tc.desc   Testing destroy before getAVCallState - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await session!.destroy();
                controller!.getAVCallState((err: BusinessError | null, data: avSession.AVCallState | undefined) => {
                if (err) {
                    if (err.code == 6600102) {
                    console.info(`${TAG}: getAVCallStateCallback without avsession test success, error: code: ${err.code}, message: ${err.message}`);
                    expect(true).assertTrue();
                    } else {
                    console.info(`${TAG}: getAVCallStateCallback errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                    }
                } else {
                    console.info(`${TAG}: getAVCallStateCallback without avsession test fail, get successful!`);
                    expect(false).assertTrue();
                }
                session = null;
                done();
                })
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_STATIC_0200
         * @tc.desc   Testing destroy before getAVCallState - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                await controller!.destroy();
                controller!.getAVCallState((err: BusinessError | null, data: avSession.AVCallState|undefined) => {
                    if (err?.code) {
                        if (err?.code == 6600103) {
                            console.info(`${TAG}: getAVCallStateCallback without controller test success, error: code: ${err?.code}, message: ${err?.message}`);
                            expect(true).assertTrue();
                        } else {
                            console.info(`${TAG}: getAVCallStateCallback errorCode != 6600102, error: code: ${err?.code}, message: ${err?.message}`);
                            expect(false).assertTrue();
                        }
                    } else {
                        console.info(`${TAG}: getAVCallStateCallback without controller test fail, get successful!`);
                        expect(false).assertTrue();
                    }
                    done();
                })
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0100
         * @tc.desc   Testing on('callMetadataChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callMetadata: avSession.CallMetadata = {
                name: '12345678',
                phoneNumber: '65432111'
            };
            try {
                let metadata = ['name', 'phoneNumber'];
                controller!.onCallMetadataChange(metadata, (callMetadata: avSession.CallMetadata) => {
                    console.info(`on callMetadataChange callMetadata : ${JSON.stringify(callMetadata)}`);
                    if (callMetadata.name != '12345678' || callMetadata.phoneNumber != '65432111' ||
                        callMetadata.avatar != null) {
                        console.error(`${TAG}: on callMetadataChange received callMetadata unmatch`);
                        expect(false).assertTrue();
                    } else {
                        expect(true).assertTrue();
                    }
                    done();
                });
                await session!.setCallMetadata(callMetadata);
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0200
         * @tc.desc   Testing on('callMetadataChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callMetadata: avSession.CallMetadata = {
                name: '12345678',
                phoneNumber: '654321111'
            };
            try {
                controller!.onCallMetadataChangeAll((callMetadata: avSession.CallMetadata) => {
                    console.info(`on callMetadataChange callMetadata : ${JSON.stringify(callMetadata)}`);
                    if (callMetadata.name != '12345678' || callMetadata.phoneNumber != '654321111' ||
                        callMetadata.avatar != null) {
                        console.error(`${TAG}: on callMetadataChange received callMetadata unmatch`);
                        expect(false).assertTrue();
                    } else {
                        expect(true).assertTrue();
                    }
                    done();
                });
                await session!.setCallMetadata(callMetadata);
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0300
         * @tc.desc   Testing on('callMetadataChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callMetadata: avSession.CallMetadata = {
                name: '12345678',
                phoneNumber: '65432111'
            };
            let flag = false;
            try {
                controller!.onCallMetadataChangeAll((callMetadata: avSession.CallMetadata) => {
                    console.info(`on callMetadataChange callMetadata : ${JSON.stringify(callMetadata)}`);
                    flag = true;
                });
                controller!.offCallMetadataChange();
                await session!.setCallMetadata(callMetadata);
                await Utils.msSleep(500);
                if (flag) {
                    console.info(`${TAG}: callMetadataChange off fail, on callMetadataChange called!`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}: callMetadataChange off`);
                    expect(true).assertTrue();
                }
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0400
         * @tc.desc   Testing on('callMetadataChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callMetadata: avSession.CallMetadata = {
                name: '123456789',
                phoneNumber: '65432111'
            };
            try {
                let metadata = ['name', 'phoneNumber'];
                controller!.onCallMetadataChange(metadata, callMetadataChangeCallback1);
                controller!.onCallMetadataChange(metadata, callMetadataChangeCallback2);
                try {
                    await session!.setCallMetadata(callMetadata)
                }catch(err){
                    console.info(`${TAG}: setCallMetadata failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                };
                await Utils.msSleep(500);
                if (receivedCallback1 && receivedCallback2) {
                    console.log(`${TAG}: on callMetadataChange called!`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: on callMetadataChange not received`);
                    expect(false).assertTrue();
                }
                receivedCallback1 = false;
                receivedCallback2 = false;
                controller!.offCallMetadataChange();
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0500
         * @tc.desc   Testing on('callMetadataChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callMetadata: avSession.CallMetadata = {
                name: '123456789',
                phoneNumber: '65432111'
            };
            try {
                let metadata = ['name', 'phoneNumber'];
                controller!.onCallMetadataChange(metadata, callMetadataChangeCallback1);
                controller!.onCallMetadataChange(metadata, callMetadataChangeCallback2);
                controller!.offCallMetadataChange(callMetadataChangeCallback1);
                try {
                    await session!.setCallMetadata(callMetadata)
                }catch(err){
                    console.info(`${TAG}: setCallMetadata failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                };
                await Utils.msSleep(500);
                if (!receivedCallback1 && receivedCallback2) {
                    console.log(`${TAG}: off callMetadataChange success and on callMetadataChange called!`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
                    expect(false).assertTrue();
                }
                receivedCallback1 = false;
                receivedCallback2 = false;
                controller!.offCallMetadataChange();
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0600
         * @tc.desc   Testing on('callMetadataChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callMetadata: avSession.CallMetadata = {
                name: '123456789',
                phoneNumber: '65432111'
            };
            try {
                let metadata = ['name', 'phoneNumber'];
                controller!.onCallMetadataChange(metadata, callMetadataChangeCallback1);
                controller!.onCallMetadataChange(metadata, callMetadataChangeCallback2);
                controller!.offCallMetadataChange();
                try {
                    await session!.setCallMetadata(callMetadata)
                }catch(err){
                    console.info(`${TAG}: setCallMetadata failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                };
                await Utils.msSleep(500);
                if (!receivedCallback1 && !receivedCallback2) {
                    console.log(`${TAG}: off callMetadataChange success!`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
                    expect(false).assertTrue();
                }
                receivedCallback1 = false;
                receivedCallback2 = false;
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0700
         * @tc.desc   Testing on('callMetadataChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callMetadata: avSession.CallMetadata = {
                name: '123456789',
                phoneNumber: '65432111'
            };
            try {
                let metadata = ['avatar'];
                controller!.onCallMetadataChange(metadata, (callMetadata: avSession.CallMetadata) => {
                    console.info(`${TAG}: on callMetadataChange called!`);
                    if (callMetadata.avatar != null || callMetadata.name != null || callMetadata.phoneNumber != null) {
                        console.info(`${TAG}: callMetadata is not empty, test failed! callMetadata: ${JSON.stringify(callMetadata)}`);
                        expect(false).assertTrue();
                    } else {
                        console.info(`${TAG}: callMetadata is empty, test success`);
                        expect(true).assertTrue();
                    }
                    done();
                });
                await session!.setCallMetadata(callMetadata);
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0800
         * @tc.desc   Testing on('callMetadataChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                await controller!.destroy();
                let metadata = ['name', 'phoneNumber'];
                controller!.onCallMetadataChange(metadata, (callMetadata: avSession.CallMetadata) => {
                    console.error(`${TAG}: on callMetadataChange called, test failed!`);
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 6600103) {
                    console.info(`${TAG}: on callMetadataChange without controller test success, error: code: ${error.code}, message: ${error.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: on callMetadataChange errorCode != 6600103, error: code: ${error.code}, message: ${error.message}`);
                    expect(false).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0900
         * @tc.desc   Testing on('callMetadataChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let metadata = ['abc'];
                controller!.onCallMetadataChange(metadata, (callMetadata: avSession.CallMetadata) => {
                console.error(`${TAG}: on callMetadataChange called, test failed!`);
                expect(false).assertTrue();
                done();
                });
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 6600101) {
                    console.info(`${TAG}: on callMetadataChange with error metadata test success, error: code: ${error.code}, message: ${error.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: on callMetadataChange errorCode != 6600101, error: code: ${error.code}, message: ${error.message}`);
                    expect(false).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CALLMETADATACHANGE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CALLMETADATACHANGE_STATIC_0100
         * @tc.desc   Testing off('callMetadataChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_CALLMETADATACHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller!.destroy();
            try {
                controller!.offCallMetadataChange();
            } catch(error) {
                error = error as BusinessError;
                if (error.code == 6600103) {
                    console.info(`${TAG}: off callMetadataChange without controller test success, error: code: ${error.code}, message: ${error.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: off callMetadataChange errorCode != 6600103, error: code: ${error.code}, message: ${error.message}`);
                    expect(false).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0100
         * @tc.desc   Testing on('callStateChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let AVCallState: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_DIALING,
                muted: false
            };
            try {
                let state: Array<string> | 'all' = ['state'];
                controller!.onCallStateChange(state, (callState: avSession.AVCallState) => {
                    console.info(`on callStateChange callState : ${JSON.stringify(callState)}`);
                    if (callState.state != avSession.CallState.CALL_STATE_DIALING || callState.muted != false) {
                        console.error(`${TAG}: on callStateChange received callState unmatch`);
                        expect(false).assertTrue();
                    } else {
                        expect(true).assertTrue();
                    }
                    done();
                });
                await session!.setAVCallState(AVCallState);
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0200
         * @tc.desc   Testing on('callStateChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let AVCallState: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_INCOMING,
                muted: true
            };
            try {
                controller!.onCallStateChangeAll((callState: avSession.AVCallState) => {
                    console.info(`on callStateChange callState : ${JSON.stringify(callState)}`);
                    if (callState.state != avSession.CallState.CALL_STATE_INCOMING || !callState.muted) {
                        console.error(`${TAG}: on callStateChange received callState unmatch`);
                        expect(false).assertTrue();
                    } else {
                        expect(true).assertTrue();
                    }
                    done();
                });
                await session!.setAVCallState(AVCallState);
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0300
         * @tc.desc   Testing on('callStateChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let AVCallState: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_HOLDING,
                muted: true
            };
            let flag = false;
            try {
                controller!.onCallStateChangeAll((stateChange: avSession.AVCallState) => {
                    console.info(`on callStateChange stateChange : ${JSON.stringify(stateChange)}`);
                    flag = true;
                });
                controller!.offCallStateChange();
                await session!.setAVCallState(AVCallState);
                await Utils.msSleep(500);
                if (flag) {
                    console.info(`${TAG}: callStateChange off fail, on callStateChange called!`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}: callStateChange off`);
                    expect(true).assertTrue();
                }
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0400
         * @tc.desc   Testing on('callStateChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let AVCallState: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_WAITING,
                muted: false
            };
            try {
                controller!.onCallStateChangeAll(callStateChangeCallback2);
                controller!.onCallStateChangeAll(callStateChangeCallback1);
                try {
                    await session!.setAVCallState(AVCallState)
                }catch(err){
                    console.info(`${TAG}: setAVCallState failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                };
                await Utils.msSleep(500);
                if (receivedCallback1 && receivedCallback2) {
                    console.log(`${TAG}: on callStateChange called!`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: on callStateChange not received`);
                    expect(false).assertTrue();
                }
                receivedCallback1 = false;
                receivedCallback2 = false;
                controller!.offCallStateChange();
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0500
         * @tc.desc   Testing on('callStateChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let AVCallState: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_WAITING,
                muted: false
            };
            try {
                controller!.onCallStateChangeAll(callStateChangeCallback2);
                controller!.onCallStateChangeAll(callStateChangeCallback1);
                controller!.offCallStateChange(callStateChangeCallback2);
                try {
                    await session!.setAVCallState(AVCallState)
                }catch(err){
                    console.info(`${TAG}: setAVCallState failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                };
                await Utils.msSleep(500);
                if (receivedCallback1 && !receivedCallback2) {
                    console.log(`${TAG}: off callStateChange success and on callStateChange called!`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
                    expect(false).assertTrue();
                }
                receivedCallback1 = false;
                receivedCallback2 = false;
                controller!.offCallStateChange();
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0600
         * @tc.desc   Testing on('callStateChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let AVCallState: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_WAITING,
                muted: false
            };
            try {
                controller!.onCallStateChangeAll(callStateChangeCallback2);
                controller!.onCallStateChangeAll(callStateChangeCallback1);
                controller!.offCallStateChange();
                try {
                    await session!.setAVCallState(AVCallState)
                }catch(err){
                    console.info(`${TAG}: setAVCallState failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                };
                await Utils.msSleep(500);
                if (!receivedCallback1 && !receivedCallback2) {
                    console.log(`${TAG}: off callStateChange success!`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
                    expect(false).assertTrue();
                }
                receivedCallback1 = false;
                receivedCallback2 = false;
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0700
         * @tc.desc   Testing on('callStateChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let AVCallState: avSession.AVCallState = {
                state: avSession.CallState.CALL_STATE_DIALING,
                muted: false
            };
            try {
                let state: Array<string> | 'all' = ['state'];
                controller!.onCallStateChange(state, (callState: avSession.AVCallState) => {
                    console.info(`on callStateChange called, callState : ${JSON.stringify(callState)}`);
                    if (callState.state != avSession.CallState.CALL_STATE_DIALING || callState.muted != false) {
                        console.info(`${TAG}: on callStateChange test failed!`);
                        expect(false).assertTrue();
                    } else {
                        console.info(`${TAG}: on callStateChange test success, muted is empty`);
                        expect(true).assertTrue();
                    }
                    done();
                });
                await session!.setAVCallState(AVCallState);
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0800
         * @tc.desc   Testing on('callStateChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                await controller!.destroy();
                let state = ['muted'];
                controller!.onCallStateChange(state, (stateChange: avSession.AVCallState) => {
                    console.info(`${TAG}: on callStateChange called, stateChange: ${JSON.stringify(stateChange)}`);
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 6600103) {
                    console.info(`${TAG}: on callStateChange without controller test success, error: code: ${error.code}, message: ${error.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: on callStateChange errorCode != 6600103, error: code: ${error.code}, message: ${error.message}`);
                    expect(false).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0900
         * @tc.desc   Testing on('callStateChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let state = ['abc'];
                controller!.onCallStateChange(state, (stateChange: avSession.AVCallState) => {
                    console.info(`${TAG}: on callStateChange with error param test failed! stateChange: ${JSON.stringify(stateChange)}`);
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 6600101) {
                    console.info(`${TAG}: on callStateChange with error param test success, error: code: ${error.code}, message: ${error.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: on callStateChange errorCode != 6600101, error: code: ${error.code}, message: ${error.message}`);
                    expect(false).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CALLSTATECHANGE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CALLSTATECHANGE_STATIC_0100
         * @tc.desc   Testing off('callStateChange')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_CALLSTATECHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller!.destroy();
            try {
                controller!.offCallStateChange();
            } catch(error) {
                error = error as BusinessError;
                if (error.code == 6600103) {
                    console.info(`${TAG}: off callStateChange without controller test success, error: code: ${error.code}, message: ${error.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: off callStateChange errorCode != 6600103, error: code: ${error.code}, message: ${error.message}`);
                    expect(false).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0100
         * @tc.desc   Testing on('answer')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'answer',
            }
            try {
                session!.onAnswer(() => {
                    console.info(`${TAG}: on answer called`);
                    expect(true).assertTrue();
                    done();
                });
                await controller!.sendControlCommand(command);
            } catch(error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0200
         * @tc.desc   Testing on('answer')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'answer',
            }
            let flag = false;
            try {
                session!.onAnswer(() => {
                    console.info(`${TAG}: on answer called`);
                    flag = true;
                });
                session!.offAnswer();
                await controller!.sendControlCommand(command);
                await Utils.msSleep(500);
                if (flag) {
                    console.info(`${TAG}: answer off fail, on answer called!`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}: answer off`);
                    expect(true).assertTrue();
                }
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0300
         * @tc.desc   Testing on('answer')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'answer',
            }
            try {
                session!.onAnswer(answerCallback1);
                session!.onAnswer(answerCallback2);
                try {
                    await controller!.sendControlCommand(command)
                } catch(err) {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                };
                await Utils.msSleep(500);
                if (receivedCallback1 && receivedCallback2) {
                    console.log(`${TAG}: on answer called!`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: on answer not received`);
                    expect(false).assertTrue();
                }
                receivedCallback1 = false;
                receivedCallback2 = false;
                session!.offAnswer();
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0400
         * @tc.desc   Testing on('answer')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'answer',
            }
            try {
                session!.onAnswer(answerCallback1);
                session!.onAnswer(answerCallback2);
                session!.offAnswer(answerCallback1);
                try {
                    await controller!.sendControlCommand(command)
                } catch(err) {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                };
                await Utils.msSleep(500);
                if (!receivedCallback1 && receivedCallback2) {
                    console.log(`${TAG}: off answer success and on answer called!`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
                    expect(false).assertTrue();
                }
                receivedCallback1 = false;
                receivedCallback2 = false;
                session!.offAnswer();
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0500
         * @tc.desc   Testing on('answer')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'answer',
            }
            try {
                session!.onAnswer(answerCallback1);
                session!.onAnswer(answerCallback2);
                session!.offAnswer();
                try {
                    await controller!.sendControlCommand(command)
                } catch(err) {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                };
                await Utils.msSleep(500);
                if (!receivedCallback1 && !receivedCallback2) {
                    console.log(`${TAG}: answer off called`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
                    expect(false).assertTrue();
                }
                receivedCallback1 = false;
                receivedCallback2 = false;
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0600
         * @tc.desc   Testing destroy before on('answer')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                await session!.destroy();
                session!.onAnswer(() => {
                    console.info(`${TAG}: on answer called`);
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 6600102) {
                    console.info(`${TAG}: on answer test success, error: code: ${error.code}, message: ${error.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: on answer errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
                    expect(false).assertTrue();
                }

                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_ANSWER_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_ANSWER_STATIC_0100
         * @tc.desc   Testing destroy before off('answer')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_ANSWER_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy();
            try {
                session!.offAnswer();
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 6600102) {
                    console.info(`${TAG}: off answer test success, error: code: ${error.code}, message: ${error.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: off answer errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
                    expect(false).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0100
         * @tc.desc   Testing on('hangUp')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'hangUp',
            }
            try {
                session!.onHangUp(() => {
                    console.info(`${TAG}: on hangUp called`);
                    expect(true).assertTrue();
                    done();
                });
                await controller!.sendControlCommand(command);
            } catch(error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0200
         * @tc.desc   Testing on('hangUp')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'hangUp',
            }
            let flag = false;
            try {
                session!.onHangUp(() => {
                    console.info(`${TAG}: on hangUp called`);
                    flag = true;
                });
                session!.offHangUp();
                await controller!.sendControlCommand(command);
                await Utils.msSleep(500);
                if (flag) {
                    console.info(`${TAG}: hangUp off fail, on hangUp called!`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}: hangUp off`);
                    expect(true).assertTrue();
                }
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0300
         * @tc.desc   Testing on('hangUp')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'hangUp',
            }
            try {
                session!.onHangUp(hangUpCallback1);
                session!.onHangUp(hangUpCallback2);
                try {
                    await controller!.sendControlCommand(command)
                } catch(err) {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                };
                await Utils.msSleep(500);
                if (receivedCallback1 && receivedCallback2) {
                    console.log(`${TAG}: on hangUp called!`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: on hangUp not received`);
                    expect(false).assertTrue();
                }
                receivedCallback1 = false;
                receivedCallback2 = false;
                session!.offHangUp();
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0400
         * @tc.desc   Testing on('hangUp')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'hangUp',
            }
            try {
                session!.onHangUp(hangUpCallback1);
                session!.onHangUp(hangUpCallback2);
                session!.offHangUp(hangUpCallback2);
                try {
                    await controller!.sendControlCommand(command)
                } catch(err) {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                };
                await Utils.msSleep(500);
                if (receivedCallback1 && !receivedCallback2) {
                    console.log(`${TAG}: off hangUp success and on hangUp called!`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
                    expect(false).assertTrue();
                }
                receivedCallback1 = false;
                receivedCallback2 = false;
                session!.offHangUp();
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0500
         * @tc.desc   Testing on('hangUp')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'hangUp',
            }
            try {
                session!.onHangUp(hangUpCallback1);
                session!.onHangUp(hangUpCallback2);
                session!.offHangUp();
                try {
                    await controller!.sendControlCommand(command)
                } catch(err) {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                };
                await Utils.msSleep(500);
                if (!receivedCallback1 && !receivedCallback2) {
                    console.log(`${TAG}: hangUp off called`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
                    expect(false).assertTrue();
                }
                receivedCallback1 = false;
                receivedCallback2 = false;
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0600
         * @tc.desc   Testing destroy before on('hangUp')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                await session!.destroy();
                session!.onHangUp(() => {
                    console.info(`${TAG}: on hangUp called`);
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 6600102) {
                    console.info(`${TAG}: on hangUp without avsession test success, error: code: ${error.code}, message: ${error.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: on hangUp errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
                    expect(false).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_HANGUP_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_HANGUP_STATIC_0100
         * @tc.desc   Testing destroy before off('hangUp')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_HANGUP_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy();
            try {
                session!.offHangUp();
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 6600102) {
                    console.info(`${TAG}: off hangUp without avsession test success, error: code: ${error.code}, message: ${error.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: off hangUp errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
                    expect(false).assertTrue();
                }

                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0100
         * @tc.desc   Testing on('toggleCallMute')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'toggleCallMute',
            }
            try {
                session!.onToggleCallMute(() => {
                    console.info(`${TAG}: on toggleCallMute called`);
                    expect(true).assertTrue();
                    done();
                });
                await controller!.sendControlCommand(command);
            } catch(error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0200
         * @tc.desc   Testing on('toggleCallMute')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'toggleCallMute',
            }
            let flag = false;
            try {
                session!.onToggleCallMute(() => {
                    console.info(`${TAG}: on toggleCallMute called`);
                    flag = true;
                });
                session!.offToggleCallMute();
                await controller!.sendControlCommand(command);
                await Utils.msSleep(500);
                if (flag) {
                    console.info(`${TAG}: toggleCallMute off fail, on toggleCallMute called!`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}: toggleCallMute off`);
                    expect(true).assertTrue();
                }
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0300
         * @tc.desc   Testing on('toggleCallMute')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'toggleCallMute',
            }
            try {
                session!.onToggleCallMute(toggleCallMuteCallback1);
                session!.onToggleCallMute(toggleCallMuteCallback2);
                try {
                    await controller!.sendControlCommand(command)
                } catch(err) {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                };
                await Utils.msSleep(500);
                if (receivedCallback1 && receivedCallback2) {
                    console.log(`${TAG}: on toggleCallMute called!`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: on toggleCallMute not received`);
                    expect(false).assertTrue();
                }
                receivedCallback1 = false;
                receivedCallback2 = false;
                session!.offToggleCallMute();
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0400
         * @tc.desc   Testing on('toggleCallMute')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'toggleCallMute',
            }
            try {
                session!.onToggleCallMute(toggleCallMuteCallback1);
                session!.onToggleCallMute(toggleCallMuteCallback2);
                session!.offToggleCallMute(toggleCallMuteCallback2);
                try {
                    await controller!.sendControlCommand(command)
                } catch(err) {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                };
                await Utils.msSleep(500);
                if (receivedCallback1 && !receivedCallback2) {
                    console.log(`${TAG}: off toggleCallMute success and on toggleCallMute called!`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
                    expect(false).assertTrue();
                }
                receivedCallback1 = false;
                receivedCallback2 = false;
                session!.offToggleCallMute();
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0500
         * @tc.desc   Testing on('toggleCallMute')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'toggleCallMute',
            }
            try {
                session!.onToggleCallMute(toggleCallMuteCallback1);
                session!.onToggleCallMute(toggleCallMuteCallback2);
                session!.offToggleCallMute();
                try {
                    await controller!.sendControlCommand(command)
                } catch(err) {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                };
                await Utils.msSleep(500);
                if (!receivedCallback1 && !receivedCallback2) {
                    console.log(`${TAG}: toggleCallMute off called`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
                    expect(false).assertTrue();
                }
                receivedCallback1 = false;
                receivedCallback2 = false;
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0600
         * @tc.desc   Testing destroy before on('toggleCallMute')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                await session!.destroy();
                session!.onToggleCallMute(() => {
                    console.info(`${TAG}: on toggleCallMute called`);
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 6600102) {
                    console.info(`${TAG}: on toggleCallMute without avsession test success, error: code: ${error.code}, message: ${error.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: on toggleCallMute errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
                    expect(false).assertTrue();
                }

                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLECALLMUTE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLECALLMUTE_STATIC_0100
         * @tc.desc   Testing destroy before off('toggleCallMute')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLECALLMUTE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy();
            try {
                session!.offToggleCallMute();
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 6600102) {
                    console.info(`${TAG}: off toggleCallMute without avsession test success, error: code: ${error.code}, message: ${error.message}`);
                } else {
                    console.info(`${TAG}: off toggleCallMute errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
                    expect(false).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_STATIC_0100
         * @tc.desc   Testing on('playWithAssetId') -- one on function
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'playWithAssetId',
                parameter: assetId
            }
            try {
                session!.onPlayWithAssetId((data: string) => {
                    console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
                    expect(data === assetId).assertTrue();
                    done();
                });
                await controller!.sendControlCommand(command)
            } catch(error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_STATIC_0200
         * @tc.desc   Testing on('playWithAssetId') -- many on functions
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'playWithAssetId',
                parameter: assetId
            }
            try {
                session!.onPlayWithAssetId(playWithAssetIdCallback1);
                session!.onPlayWithAssetId(playWithAssetIdCallback2);
                await controller!.sendControlCommand(command).catch((err: Error) => {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                });
                await Utils.msSleep(500);
                if ((assetId1 === assetId) && (assetId2 === assetId)) {
                    console.log(`${TAG}: on playWithAssetId called`);
                    expect(true).assertTrue();
                } else {
                    console.error(`${TAG}: on playWithAssetId not received`);
                    expect(false).assertTrue();
                }
                assetId1 = '';
                assetId2 = '';
                session!.offPlayWithAssetId();
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_STATIC_0300
         * @tc.desc   Testing destroy before on('playWithAssetId')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
            try {
                await session!.destroy();
                session!.onPlayWithAssetId((data: string) => {
                    console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 6600102) {
                    console.info(`${TAG}: on playWithAssetId without avsession test success, error: code: ${error.code}, message: ${error.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: on playWithAssetId errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
                    expect(false).assertTrue();
                }
                session = null;
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_STATIC_0100
         * @tc.desc   Testing off('playWithAssetId') --off one function
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'playWithAssetId',
                parameter: assetId
            }
            try {
                session!.onPlayWithAssetId((data: string) => {
                    console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
                    assetId1=data;
                });
                session!.offPlayWithAssetId()
                await controller!.sendControlCommand(command).catch((err: Error) => {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(err.code).assertEqual(6600105);
                    done();
                });
                await Utils.msSleep(500);
                if (assetId1 === assetId) {
                    console.log(`${TAG}: off playWithAssetId fail, on playWithAssetId called`);
                    expect(false).assertTrue();
                } else {
                    console.info(`${TAG}: playWithAssetId off`);
                    expect(true).assertTrue();
                }
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_STATIC_0200
         * @tc.desc   Testing off('playWithAssetId') -- off select on functions
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'playWithAssetId',
                parameter: assetId
            }
            try {
                session!.onPlayWithAssetId(playWithAssetIdCallback1);
                session!.onPlayWithAssetId(playWithAssetIdCallback2);
                session!.offPlayWithAssetId(playWithAssetIdCallback2);
                await controller!.sendControlCommand(command).catch((err: Error) => {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(false).assertTrue();
                    done();
                });
                await Utils.msSleep(500);
                if (assetId2 === assetId) {
                    console.log(`${TAG}: on playWithAssetId called`);
                    expect(false).assertTrue();
                } else {
                    console.error(`${TAG}: on playWithAssetId not received`);
                    expect(true).assertTrue();
                }
                assetId1 = '';
                assetId2 = '';
                session!.offPlayWithAssetId();
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_STATIC_0300
         * @tc.desc   Testing off('playWithAssetId') -- off all on functions
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'playWithAssetId',
                parameter: assetId
            }
            try {
                session!.onPlayWithAssetId(playWithAssetIdCallback1);
                session!.onPlayWithAssetId(playWithAssetIdCallback2);
                session!.offPlayWithAssetId();
                await controller!.sendControlCommand(command).catch((err: Error) => {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(err.code).assertEqual(6600105);
                    done();
                });
                done();
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_STATIC_0400
         * @tc.desc   Testing not on('playWithAssetId') before off('playWithAssetId')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
            try {
                session!.offPlayWithAssetId();
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 6600101) {
                    console.info(`${TAG}: off playWithAssetId without avsession test success, error: code: ${error.code}, message: ${error.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: off playWithAssetId errorCode != 6600101, error: code: ${error.code}, message: ${error.message}`);
                    expect(false).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_STATIC_0500
         * @tc.desc   Testing destroy before off('playWithAssetId')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
            await session!.destroy();
            try {
                session!.offPlayWithAssetId()
            } catch (error) {
                error = error as BusinessError;
                if (error.code == 6600102) {
                    console.info(`${TAG}: off playWithAssetId without avsession test success, error: code: ${error.code}, message: ${error.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: off playWithAssetId errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
                    expect(false).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1200
         * @tc.desc   Testing sendControlCommand(command)-promise-special characters &max length
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'playWithAssetId',
                parameter: assetId3
            }
            try {
                session!.onPlayWithAssetId((data: string) => {
                    console.info(`${TAG}: on playWithAssetId, assetId3 = ${data}`);
                    expect(data == assetId3).assertTrue();
                    session!.offPlayWithAssetId()
                    done();
                });
                await controller!.sendControlCommand(command);
            } catch(error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1300
         * @tc.desc   Testing sendControlCommand(command)-promise-exceed max length
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'playWithAssetId',
                parameter: assetId4
            }
            try {
                session!.onPlayWithAssetId((data: string) => {
                    console.info(`${TAG}: on playWithAssetId, assetId4 = ${data}`);
                    session!.offPlayWithAssetId();
                    done();
                });
                await controller!.sendControlCommand(command).catch((err: Error) => {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(err.code).assertEqual(401);
                    done();
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1400
         * @tc.desc   Testing sendControlCommand(command)-promise-with no parameters
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'playWithAssetId',
            }
            try {
                session!.onPlayWithAssetId((data: string) => {
                    console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
                    session!.offPlayWithAssetId();
                    done();
                });
                await controller!.sendControlCommand(command).catch((err: Error) => {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(err.code).assertEqual(401);
                    done();
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1500
         * @tc.desc   Testing sendControlCommand(command)-promise-type error
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'playWithAssetId',
                parameter: assetId5
            }
            try {
                session!.onPlayWithAssetId((data: string) => {
                    console.info(`${TAG}: on playWithAssetId, assetId5 = ${data}`);
                    session!.offPlayWithAssetId();
                    done();
                });
                await controller!.sendControlCommand(command).catch((err: Error) => {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(err.code).assertEqual(401);
                    done();
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1600
         * @tc.desc   Testing sendControlCommand(command)-promise-parameter to None
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'playWithAssetId',
                parameter: assetId1
            }
            try {
                session!.onPlayWithAssetId((data: string) => {
                    console.info(`${TAG}: on playWithAssetId, assetId1 = ${data}`);
                    session!.offPlayWithAssetId();
                    done();
                });
                await controller!.sendControlCommand(command).catch((err: Error) => {
                    console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
                    expect(err.code).assertEqual(401);
                    done();
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1200
         * @tc.desc   Testing sendControlCommand(command)-callback-special characters &max length
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'playWithAssetId',
                parameter: assetId3
            }
            try {
                session!.onPlayWithAssetId((data: string) => {
                    console.info(`${TAG}: on playWithAssetId, assetId3 = ${data}`);
                    expect(data == assetId3).assertTrue();
                    session!.offPlayWithAssetId()
                    done();
                });
                controller!.sendControlCommand(command, (err: BusinessError | null) => {
                    if (err) {
                        console.error(`SendControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
                    } else {
                        console.info('SendControlCommand successfully');
                    }
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1300
         * @tc.desc   Testing sendControlCommand(command)-callback-exceed max length
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'playWithAssetId',
                parameter: assetId4
            }
            try {
                session!.onPlayWithAssetId((data: string) => {
                    console.info(`${TAG}: on playWithAssetId, assetId4 = ${data}`);
                    session!.offPlayWithAssetId();
                    done();
                });
                controller!.sendControlCommand(command, (err: BusinessError | null) => {
                    if (err) {
                        console.error(`SendControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('SendControlCommand successfully');
                    }
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1400
         * @tc.desc   Testing sendControlCommand(command)-callback-with no parameters
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'playWithAssetId',
            }
            try {
                session!.onPlayWithAssetId((data: string) => {
                    console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
                    session!.offPlayWithAssetId();
                    done();
                });
                controller!.sendControlCommand(command, (err: BusinessError | null) => {
                    if (err) {
                        console.error(`SendControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('SendControlCommand successfully');
                    }
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1500
         * @tc.desc   Testing sendControlCommand(command)-callback-type error
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'playWithAssetId',
                parameter: assetId5
            }
            try {
                session!.onPlayWithAssetId((data: string) => {
                    console.info(`${TAG}: on playWithAssetId, assetId5 = ${data}`);
                    session!.offPlayWithAssetId();
                    done();
                });
                controller!.sendControlCommand(command, (err: BusinessError | null) => {
                    if (err) {
                        console.error(`SendControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('SendControlCommand successfully');
                    }
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1600
         * @tc.desc   Testing sendControlCommand(command)-callback-parameter to None
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
            let command: avSession.AVControlCommand = {
                command: 'playWithAssetId',
                parameter: assetId1
            }
            try {
                session!.onPlayWithAssetId((data: string) => {
                    console.info(`${TAG}: on playWithAssetId, assetId1 = ${data}`);
                    session!.offPlayWithAssetId();
                    done();
                });
                controller!.sendControlCommand(command, (err: BusinessError | null) => {
                    if (err) {
                        console.error(`SendControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('SendControlCommand successfully');
                    }
                });
            } catch (error) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_STATIC_1100
         * @tc.desc   test onPlayNext callback registration
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            try {
                session!.onPlayNext((info:avSession.CommandInfo) => {
                console.info(`onPlayNext entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
                });
                await controller!.sendControlCommand({command:'playNext',commandInfo:{callerModuleName:'Center'}});

                await Utils.msSleep(300);
            } catch (err) {
                console.info(`on playNext entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertFail();
            }
            expect(flag).assertEqual(1);
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_STATIC_1100
         * @tc.desc   test onPlayNext errcode 6600102
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy();
            try {
                session!.onPlayNext((info:avSession.CommandInfo) => {
                console.info(`onPlayNext entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                expect(false).assertTrue()
                });
            } catch (err) {
                console.info(`onplayNext entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_STATIC_1100
         * @tc.desc   test offPlayNext callback unregistration
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            let onCallback1 = (info:avSession.CommandInfo) => {
                console.info(`onPlayNext 1 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag+=10
            }
            let onCallback2 = (info:avSession.CommandInfo) => {
                console.info(`onPlayNext 2 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
            }

            try {
                session!.onPlayNext(onCallback1);
                session!.onPlayNext(onCallback2);
                await Utils.msSleep(300);
                session!.offPlayNext();
                await controller!.sendControlCommand({command:'playNext',commandInfo:{callerModuleName:'Center'}});
            } catch (err) {
                console.info(`offplayNext entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            }
            expect(flag).assertEqual(0);
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_STATIC_1200
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_STATIC_1200
         * @tc.desc   test offPlayNext callback unregistration with specified onCallback
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            let onCallback1 = (info:avSession.CommandInfo) => {
                console.info(`onPlayNext 1 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag+=10
            }
            let onCallback2 = (info:avSession.CommandInfo) => {
                console.info(`onPlayNext 2 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
            }
            try {
                session!.onPlayNext(onCallback2);
                session!.onPlayNext(onCallback1);
                await Utils.msSleep(500);

                session!.offPlayNext(onCallback2);
                await controller!.sendControlCommand({command:'playNext',commandInfo:{callerModuleName:'Center'}});
                await Utils.msSleep(200);
                expect(flag).assertEqual(10);
            } catch (err) {
                console.info(`offplayNext entry error,error code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_STATIC_1100
         * @tc.desc   test offPlayNext errcode 6600102
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy();
            try {
                session!.offPlayNext();
                expect(false).assertTrue();
            } catch (err) {
                console.info(`offplayNext entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_STATIC_1300
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_STATIC_1300
         * @tc.desc   test offPlayNext errcode 6600101
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                session!.offPlayNext();
                expect(false).assertTrue();
            } catch (err) {
                console.info(`offplayNext entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600101);
            }
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_STATIC_1100
         * @tc.desc   test onPlayPrevious callback registration
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            try {
                session!.onPlayPrevious((info:avSession.CommandInfo) => {
                console.info(`onPlayPrevious entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
                });
                await controller!.sendControlCommand({command:'playPrevious',commandInfo:{callerModuleName:'Center'}});
                await Utils.msSleep(300);
            } catch (err) {
                console.info(`onplayPrevious entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertFail();
            }
            expect(flag).assertEqual(1);
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_STATIC_1100
         * @tc.desc   test onPlayPrevious errcode 6600102
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy();
            try {
                session!.onPlayPrevious((info:avSession.CommandInfo) => {
                console.info(`onPlayPrevious entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                expect(false).assertTrue()
                });
            } catch (err) {
                console.info(`onplayPrevious entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_STATIC_1100
         * @tc.desc   test offPlayPrevious callback unregistration
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            try {
                session!.onPlayPrevious((info:avSession.CommandInfo) => {
                console.info(`onPlayPrevious 1 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
                });
                session!.onPlayPrevious((info:avSession.CommandInfo) => {
                console.info(`onPlayPrevious 2 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
                });
                session!.offPlayPrevious();
                await controller!.sendControlCommand({command:'playPrevious',commandInfo:{callerModuleName:'Center'}});
            } catch (err) {
                console.info(`off playPrevious entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            }
            expect(flag).assertEqual(0);
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_STATIC_1200
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_STATIC_1200
         * @tc.desc   test offPlayPrevious callback unregistration with specified onCallback
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            let onCallback1 = (info:avSession.CommandInfo) => {
                console.info(`onPlayPrevious 1 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag+=10
            }
            let onCallback2 = (info:avSession.CommandInfo) => {
                console.info(`onPlayPrevious 2 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
            }
            try {
                session!.onPlayPrevious(onCallback1);
                session!.onPlayPrevious(onCallback2);
                await Utils.msSleep(500);

                session!.offPlayPrevious(onCallback1);
                await controller!.sendControlCommand({command:'playPrevious',commandInfo:{callerModuleName:'Center'}});
                await Utils.msSleep(200);
                expect(flag).assertEqual(1);
            } catch (err) {
                console.info(`offPlayPrevious entry error,error code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }

            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_STATIC_1100
         * @tc.desc   test offPlayPrevious errcode 6600102
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy();
            try {
                session!.offPlayPrevious();
                expect(false).assertTrue();
            } catch (err) {
                console.info(`offplayPrevious entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_STATIC_1300
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_STATIC_1300
         * @tc.desc   test offPlayPrevious errcode 6600101
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                session!.offPlayPrevious();
                expect(false).assertTrue();
            } catch (err) {
                console.info(`offplayPrevious entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600101);
            }
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAY_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAY_STATIC_1100
         * @tc.desc   test onPlay callback registration
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAY_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            try {
                session!.onPlay((info:avSession.CommandInfo) => {
                console.info(`onPlay entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
                });
                await controller!.sendControlCommand({command:'play',commandInfo:{callerModuleName:'Center'}});
                await Utils.msSleep(300);
            } catch (err) {
                console.info(`onplay entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertFail();
            }
            expect(flag).assertEqual(1);
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_STATIC_1100
         * @tc.desc   test onPlay errcode 6600102
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy();
            try {
                session!.onPlay((info:avSession.CommandInfo) => {
                console.info(`onPlay entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                expect(false).assertTrue()
                });
            } catch (err) {
                console.info(`onplay entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            }
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_STATIC_1100
         * @tc.desc   test offPlay callback unregistration
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            try {
                session!.onPlay((info:avSession.CommandInfo) => {
                console.info(`onPlay entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
                });
                session!.offPlay();
                await controller!.sendControlCommand({command:'play',commandInfo:{callerModuleName:'Center'}});
            } catch (err) {
                console.info(`offplay entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            }
            expect(flag).assertEqual(0);
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_STATIC_1200
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_STATIC_1200
         * @tc.desc   test offPlay callback unregistration with param
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            let onCallback1 = (info:avSession.CommandInfo) => {
                console.info(`onPlay entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
            }

            let onCallback2 = (info:avSession.CommandInfo) => {
                console.info(`onPlay 2 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
            }

            try {
                session!.onPlay(onCallback1);
                session!.onPlay(onCallback2);
                session!.offPlay(onCallback1);
                await controller!.sendControlCommand({command:'play',commandInfo:{callerModuleName:'Center'}});
            } catch (err) {
                console.info(`offplay entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertFail();
            }
            expect(flag).assertEqual(1);
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_STATIC_1100
         * @tc.desc   test offPlay errcode 6600102
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy();
            try {
                session!.offPlay();
                expect(false).assertTrue();
            } catch (err) {
                console.info(`offplay entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            }
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_STATIC_1300
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_STATIC_1300
         * @tc.desc   test offPlay errcode 6600101
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                session!.offPlay();
                expect(false).assertTrue();
            } catch (err) {
                console.info(`offplay entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600101);
            }
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_1100
         * @tc.desc   test onRewind callback registration
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            let infocallback:avSession.TwoParamCallback<long, avSession.CommandInfo> = ((time:long,info:avSession.CommandInfo)=>{
                console.info(`onRewind entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
            })
            try {
                session!.onRewind(infocallback);
                await controller!.sendControlCommand({command:'rewind',commandInfo:{callerModuleName:'Center'}});
                await Utils.msSleep(300);
            } catch (err) {
                console.info(`onRewind entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertFail();
            }
            expect(flag).assertEqual(1);
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_1200
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_1200
         * @tc.desc   test onRewind callback registration
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            let infocallback:avSession.TwoParamCallback<long,avSession.CommandInfo> = ((time:long,info:avSession.CommandInfo)=>{
                console.info(`onRewind entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
            })
            try {
                session!.onRewind(infocallback);
                await controller!.sendControlCommand({command:'rewind',parameter:10,commandInfo:{callerModuleName:'Center'}});
                await Utils.msSleep(300);
            } catch (err) {
                console.info(`onRewind entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertFail();
            }
            expect(flag).assertEqual(1);
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_STATIC_1100
         * @tc.desc   test onRewind errcode 6600102
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy();
            let infocallback:avSession.TwoParamCallback<long,avSession.CommandInfo> = ((time:long,info:avSession.CommandInfo)=>{
                console.info(`onFastForward entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                expect(false).assertTrue()
            })
            try {
                session!.onRewind(infocallback);
            } catch (err) {
                console.info(`onRewind entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_STATIC_1100
         * @tc.desc   test offRewind callback unregistration
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            try {
                session!.onRewind((time:long,info:avSession.CommandInfo) => {
                console.info(`onRewind entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
                });
                session!.offRewind();
                await controller!.sendControlCommand({command:'rewind',commandInfo:{callerModuleName:'Center'}});
            } catch (err) {
                console.info(`offRewind entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            }
            expect(flag).assertEqual(0);
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_STATIC_1200
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_STATIC_1200
         * @tc.desc   test offRewind callback unregistration with specified onCallback
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            try {
                let onCallback1 = (time:long,info:avSession.CommandInfo) => {
                console.info(`onRewind 1 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag+=10
                }
                let onCallback2 = (time:long,info:avSession.CommandInfo) => {
                console.info(`onRewind 2 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
                }
                session!.onRewind(onCallback1);
                session!.onRewind(onCallback2);

                session!.offRewind(onCallback2);
                await controller!.sendControlCommand({command:'rewind',commandInfo:{callerModuleName:'Center'}});
                await Utils.msSleep(200);
                expect(flag).assertEqual(10);
            } catch (err) {
                console.info(`offRewind entry error,error code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_STATIC_1100
         * @tc.desc   test offRewind errcode 6600102
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy();
            try {
                session!.offRewind();
                expect(false).assertTrue();
            } catch (err) {
                console.info(`offRewind entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_STATIC_1300
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_STATIC_1300
         * @tc.desc   test offRewind errcode 6600101
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                session!.offRewind();
                expect(false).assertTrue();
            } catch (err) {
                console.info(`offRewind entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600101);
            }
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_1100
         * @tc.desc   test onFastForward callback registration
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            let infocallback:avSession.TwoParamCallback<long,avSession.CommandInfo> = ((time:long,info:avSession.CommandInfo)=>{
                console.info(`onFastForward entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
            })
            try {
                session!.onFastForward(infocallback);
                await controller!.sendControlCommand({command:'fastForward',commandInfo:{callerModuleName:'Center'}});
                await Utils.msSleep(300);
            } catch (err) {
                console.info(`onFastForward entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertFail();
            }
            expect(flag).assertEqual(1);
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_1200
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_1200
         * @tc.desc   test onFastForward callback registration
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            let infocallback:avSession.TwoParamCallback<long,avSession.CommandInfo> = ((time:long,info:avSession.CommandInfo)=>{
                console.info(`onFastForward entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
            })
            try {
                session!.onFastForward(infocallback);
                await controller!.sendControlCommand({command:'fastForward',parameter:10,commandInfo:{callerModuleName:'Center'}});
                await Utils.msSleep(300);
            } catch (err) {
                console.info(`onFastForward entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertFail();
            }
            expect(flag).assertEqual(1);
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_STATIC_1100
         * @tc.desc   test onFastForward errcode 6600102
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy();
            let infocallback:avSession.TwoParamCallback<long,avSession.CommandInfo> = ((time:long,info:avSession.CommandInfo)=>{
                console.info(`onFastForward entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                expect(false).assertTrue()
            })
            try {
                session!.onFastForward(infocallback);
            } catch (err) {
                console.info(`onFastForward entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            }
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_STATIC_1100
         * @tc.desc   test offFastForward callback unregistration
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            try {
                session!.onFastForward((time:long,info:avSession.CommandInfo) => {
                console.info(`onFastForward entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
                });
                session!.offFastForward();
                await controller!.sendControlCommand({command:'fastForward',commandInfo:{callerModuleName:'Center'}});
            } catch (err) {
                console.info(`offFastForward entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            }
            expect(flag).assertEqual(0);
            done();
        })

        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_STATIC_1200
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_STATIC_1200
         * @tc.desc   test offFastForward callback unregistration with specified onCallback
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag = 0;
            try {
                let onCallback1 = (time:long,info:avSession.CommandInfo) => {
                console.info(`onFastForward 1 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag+=10
                }
                let onCallback2 = (time:long,info:avSession.CommandInfo) => {
                console.info(`onFastForward 2 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
                flag++
                }
                session!.onFastForward(onCallback1);
                session!.onFastForward(onCallback2);

                session!.offFastForward(onCallback1);
                await controller!.sendControlCommand({command:'fastForward',commandInfo:{callerModuleName:'Center'}});
                await Utils.msSleep(200);
                expect(flag).assertEqual(1);
            } catch (err) {
                console.info(`offFastForward entry error,error code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_STATIC_1100
         * @tc.desc   test offFastForward errcode 6600102
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy();
            try {
                session!.offFastForward();
                expect(false).assertTrue();
            } catch (err) {
                console.info(`offFastForward entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            }
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_STATIC_1300
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_STATIC_1300
         * @tc.desc   test offFastForward errcode 6600101
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                session!.offFastForward();
                expect(false).assertTrue();
            } catch (err) {
                console.info(`offFastForward entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600101);
            }
            done();
        })

    })
}