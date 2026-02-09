/*
 * Copyright (c) 2021-2023 Huawei Device Co., Ltd.
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


import secureElement from '@ohos.secureElement';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

async function getSEService() {
    return new Promise((resolve, reject) => {
        Service = secureElement.newSEService("serviceState", (state) => {
            if (state == secureElement.ServiceState.DISCONNECTED) {
                console.info("[nfc_test] getSEService newService state is Disconnected");
                let err = null;
                err.code = -1;
                err.message = "newSEService failed, service is not connected"
                reject(err);
            } else {
                console.info("[nfc_test] getSEService newService state is Connected");
                resolve(Service);
            }
        });
    });
}

let Service = null;
let Reader = null;
let Session = null;
let getReader = null;
let nfcSEService = null;
let aidArray = [160, 0, 0, 1, 81, 0, 0, 0];
let p2 = 0x00;
let command = [128, 202, 159, 127, 0];
let readerIsPresent = null;

export default function channelCallbacktest() {
    describe('channelCallbacktest', function () {
        beforeAll(async function (done) {
            await getSEService().then(async (data) => {
                Service = data;
                let seIsConnected = Service.isConnected();
                console.info("[NFC_test] Logical SEService isConnected The connection status is: " + seIsConnected);
                if (seIsConnected) {
                    getReader = Service.getReaders();
                    if (getReader.length > 0) {
                        expect(getReader.length > 0).assertTrue();
                    } else {
                        expect(getReader).assertDeepEquals([]);
                    }
                    console.info("[NFC_test] newSEService channelCallbacktest getReader value  is: " + getReader);                                    
                    for (let i = 0; i < getReader.length; i++) {
                        if (getReader[i].getName() != "eSE") {
                            console.info("[NFC_test] se reader not ese.");
                            continue;
                        }

                        let getReaderstate = getReader[i].isSecureElementPresent();

                        if (getReaderstate == false) {
                            console.info("[NFC_test] se not present : " + i);
                            expect(getReaderstate).assertFalse();
                            continue;
                        } else {
                            Reader = getReader[i];
                            console.info("[NFC_test] newSEService channelCallbacktest getReader name is: " + Reader.getName());
                            Session = Reader.openSession();
                            let sessionIsClosed = Session.isClosed();
                            console.info("[NFC_test] Logical Session isConnected The connection status is: " + sessionIsClosed);
                            expect(getReaderstate).assertTrue();
                        }
                    }
                }
            }).catch((err) =>{
                if (err.code == 801) {
                    expect(801).assertEqual(err.code);
                }
                console.info("[NFC_test] getSEService err.code " + err.code + "err.message " + err.message);
            })
            done();
            console.info('beforeAll called');
        })

        beforeEach(function() {
            console.info('beforeEach called');
        })

        afterEach(function () {

            console.info('afterEach success');
        })

        afterAll(async function (done) {
            nfcSEService.shutdown();
            sleep(900);
            console.info('[nfc_test] afterAll channelcallback shutdown success');
            done();
        })

        /**
         * @tc.name   SUB_Communication_Ese_LogicalChannel_js_0900
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_0900
         * @tc.desc   open BasicChannel Check whether the channel is a basic channel.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_Ese_LogicalChannel_js_0900', Level.LEVEL0, async function (done) {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]09 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    function P2BasicChannel_callback(){
                        return new Promise((resolve, reject) => {
                            Session.openBasicChannel(aidArray, p2,
                                (err, result) => {
                                    if(err) {
                                        console.info("[NFC_test]09 openBasicChannel data == null" + err.code + "---" + err);
                                        reject(err.code);
                                    } else {
                                        console.info("[NFC_test]09 openBasicChannel data != null " + result);
                                        let P2BasicChannel = result;
                                        let isBasic = P2BasicChannel.isBasicChannel();
                                        if (isBasic == true) {
                                            console.info("[NFC_test]09 Check whether the channel is a basic channel: " + isBasic);
                                            expect(isBasic).assertTrue();
                                        } else {
                                            console.info("[NFC_test]09 Check whether the channel is a basic channel: " + isBasic);
                                            expect(isBasic).assertFalse();
                                        }
                                        P2BasicChannel.close();
                                        console.info("[NFC_test]09 Data received by the application select command: " );
                                        resolve();
                                    }
                                });
                        });
                    }
                    await P2BasicChannel_callback().then((data) => {
                        console.info("[NFC_test]09 openBasicChannel done");
                    })
                    .catch(error => {
                        if (error == 401) {
                            console.info("[NFC_test]09 openBasicChannel_p2_callback occurs exception:" + error.code + "---" + error);
                            expect(true).assertTrue();
                        } else if (error == 3300101) {
                            console.info("[NFC_test]09 openBasicChannel_p2_callback occurs exception:" + error);
                            expect(true).assertTrue();
                        } else if (error == 3300102) {
                            console.info("[NFC_test]09 openBasicChannel_p2_callback occurs exception:" + error);
                            expect(true).assertTrue();
                        } else if (error == 3300103) {
                            console.info("[NFC_test]09 openBasicChannel_p2_callback occurs exception:" + error);
                            expect(3300103).assertEqual(error);
                        } else if (error == 3300104) {
                            console.info("[NFC_test]09 openBasicChannel_p2_callback occurs exception:" + error);
                            expect(true).assertTrue();
                        } else {
                            console.info("[NFC_test]09 openBasicChannel_p2_callback occurs exception:" + error);
                            expect().assertFail();
                        }
                    })
                }
            } catch (error) {
                console.info("[NFC_test]09 openBasicChannel_p2_callback occurs exception:" + error.code + "---" + error);
                expect(801).assertEqual(error.code);
            }
            sleep(900);
            done();
        })

        /**
         * @tc.name   SUB_Communication_Ese_LogicalChannel_js_1000
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_1000
         * @tc.desc   open LogicalChannel Check whether the channel is closed.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_Ese_LogicalChannel_js_1000', Level.LEVEL0, async function (done) {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]10 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    function LogicalChannel_callback(){
                        return new Promise((resolve, reject) => {
                            Session.openLogicalChannel(aidArray, p2,
                                (err, result) => {
                                    if(err) {
                                        console.info("[NFC_test]10 openLogicalChannel data == null" + err);
                                        reject(err.code);
                                    } else {
                                        console.info("[NFC_test]10 openLogicalChannel data == null" + result);
                                        let P2LogicalChannel = result;
                                        P2LogicalChannel.close();
                                        console.info("[NFC_test]10 Data received by the application select command: " );
                                        let isChannelClosed = P2LogicalChannel.isClosed();
                                        if (isChannelClosed == true) {
                                            console.info("[NFC_test]10 Check whether the channel is closed: " + isChannelClosed);
                                            expect(isChannelClosed).assertTrue(); 
                                        } else {
                                            console.info("[NFC_test]10 Check whether the channel is closed: " + isChannelClosed);
                                            expect(isChannelClosed).assertFalse(); 
                                        }                           
                                    }
                                    resolve();
                                });
                        });
                    }
                    await LogicalChannel_callback().then((data) => {
                        console.info("[NFC_test]10 openBasicChannel done");
						let seChannel = data
						let seSession = seChannel.getSession();
                        expect(true).assertEqual(seSession!=null);
                    })
                    .catch(error => {
                        console.info("[NFC_test]10 openBasicChannel failed" + error + "--error.code--" + error.code);
                        if (error == 401) {
                            console.info("[NFC_test]10 openBasicChannel failed" + error);
                            expect(true).assertTrue();
                        } else if (error == 3300101) {
                            console.info("[NFC_test]10 openLogicalChannel occurs exception:"+ error);
                            expect(true).assertTrue();
                        } else if (error == 3300102) {
                            console.info("[NFC_test]10 openLogicalChannel occurs exception:" + error);
                            expect(true).assertTrue();
                        } else if (error == 3300103) {
                            console.info("[NFC_test]10 openLogicalChannel occurs exception:" + error);
                            expect(true).assertTrue();
                        } else if (error == 3300104) {
                            console.info("[NFC_test]10 openLogicalChannel occurs exception:" + error);
                            expect(true).assertTrue();
                        } else {
                            console.info("[NFC_test]10 openLogicalChannel occurs exception:" + error);
                            expect().assertFail();
                        }
                        done();
                    })
                }
            } catch (error) {
                console.info("[NFC_test]10 openLogicalChannel_P2_callback occurs exception:" + error.code + "---" + error);
                expect(801).assertEqual(error.code);
            }
            sleep(900);
            done();
        })


        /**
         * @tc.name   SUB_Communication_Ese_LogicalChannel_js_1100
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_1100
         * @tc.desc   open BasicChannel Returns the data received from the application selection command.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_Ese_LogicalChannel_js_1100', Level.LEVEL0, async function (done) {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]11 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    function BasicChannel_callback(){
                        return new Promise((resolve, reject) => {
                            Session.openBasicChannel(aidArray,
                                (err, result) => {
                                    if(err) {
                                        console.info("[NFC_test]11 to get openBasicChannel:" + JSON.stringify(err));
                                        reject(err.code);
                                    } else {
                                        console.info("[NFC_test]11 openBasicChannel data != null " + result);
                                        let nfcBasicChannel = result;
                                        let getResponse = nfcBasicChannel.getSelectResponse();
                                        console.info("[NFC_test]11 getSelectResponse data: " + getResponse);
                                        if (getResponse.length > 0) {
                                            expect(getResponse.length > 0).assertTrue();
                                        } else {
                                            expect(getResponse).assertDeepEquals([]);
                                        }
                                        nfcBasicChannel.close();
                                        console.info("[NFC_test]11 Data received by the application select command: " );
                                        expect(getResponse).assertInstanceOf('Array');                                        
                                    }
                                    resolve();
                                });
                        });
                    }
                    await BasicChannel_callback().then((data) => {
                        console.info("[NFC_test]11 openBasicChannel done");
                    })
                    .catch(e => {
                        console.info("[NFC_test]11 openBasicChannel failed" + e);
                        expect(3300103).assertEqual(e);
                    })
            }
            } catch (error) {
                console.info("[NFC_test]11 openBasicChannel_callback occurs exception:" + error.code + "---" + error);
                expect(801).assertEqual(error.code);
            }
            sleep(900);
            done();
        })

        /**
         * @tc.name   SUB_Communication_Ese_LogicalChannel_js_1200
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_1200
         * @tc.desc   open LogicalChannel Send an APDU command to the SE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_Ese_LogicalChannel_js_1200', Level.LEVEL0, async function (done) {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]12 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    function LogicalChannel_callback(){
                        return new Promise((resolve, reject) => {
                            Session.openLogicalChannel(aidArray,
                                (err, result) => {
                                    if(err) {
                                        console.info("[NFC_test]12 failed to get openLogicalChannel:" + JSON.stringify(err));
                                        reject(err.code);
                                    } else {
                                        console.info("[NFC_test]12 openLogicalChannel data != null " + result);
                                        let nfcLogicalChannel = result;
                                        nfcLogicalChannel.transmit(command, (err, data) => {
                                            if (err) {
                                                console.info("[NFC_test]12 Send error an APDU command to the SE: " + err);
                                                expect().assertFail();
                                            } else {
                                                console.info("[NFC_test]12 Send an APDU command to the SE: " + data);
                                                if (data.length > 0) {
                                                    expect(data.length > 0).assertTrue();
                                                } else {
                                                    expect(data).assertDeepEquals([]);
                                                }
                                                expect(data).assertInstanceOf('Array');
                                            }
                                        });
                                        sleep(900);
                                        nfcLogicalChannel.close();
                                        console.info("[NFC_test]12 Data received by the application select command: " );                                        
                                    }
                                    resolve();
                                });
                        });
                    }
                    await LogicalChannel_callback().then((data) => {
                        console.info("[NFC_test]12 openBasicChannel done");
                    })
                    .catch(e => {
                        console.info("[NFC_test]12 openBasicChannel failed" + e);
                        expect(3300103).assertEqual(e);
                    })
                }
            } catch (error) {
                console.info("[NFC_test]12 openLogicalChannel_callback occurs exception:" + error.code + "---" + error);
                expect(801).assertEqual(error.code);
            }
            sleep(900);
            done();
        })

        /**
         * @tc.name   SUB_Communication_Ese_LogicalChannel_js_1201
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_1201
         * @tc.desc   open LogicalChannel Send an APDU command to the SE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_Ese_LogicalChannel_js_1201', Level.LEVEL0, async function (done) {
            let command1 = [];
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]12 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    function LogicalChannel_callback(){
                        return new Promise((resolve, reject) => {
                            Session.openLogicalChannel(aidArray,
                                (err, result) => {
                                    if(err) {
                                        console.info("[NFC_test]12 failed to get openLogicalChannel:" + JSON.stringify(err));
                                        reject(err.code);
                                    } else {
                                        console.info("[NFC_test]12 openLogicalChannel data != null " + result);
                                        let nfcLogicalChannel = result;
                                        nfcLogicalChannel.transmit(command1, (err, data) => {
                                            if (err) {
                                                console.info("[NFC_test]12 Send error an APDU command1 to the SE: " + err);
                                                expect().assertFail();
                                            } else {
                                                console.info("[NFC_test]12 Send an APDU command1 to the SE: " + data);
                                                if (data.length > 0) {
                                                    expect(data.length > 0).assertTrue();
                                                } else {
                                                    expect(data).assertDeepEquals([]);
                                                }
                                                expect(data).assertInstanceOf('Array');
                                            }
                                        });
                                        sleep(900);
                                        nfcLogicalChannel.close();
                                        console.info("[NFC_test]12 Data received by the application select command: " );                                        
                                    }
                                    resolve();
                                });
                        });
                    }
                    await LogicalChannel_callback().then((data) => {
                        console.info("[NFC_test]12 openBasicChannel done");
                    })
                    .catch(e => {
                        console.info("[NFC_test]12 openBasicChannel failed" + e);
                        expect(3300103).assertEqual(e);
                    })
                }
            } catch (error) {
                console.info("[NFC_test]12 openLogicalChannel_callback occurs exception:" + error.code + "---" + error);
                expect(801).assertEqual(error.code);
            }
            sleep(900);
            done();
        })

        /**
         * @tc.name   SUB_Communication_Ese_LogicalChannel_js_1300
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_1300
         * @tc.desc   open LogicalChannel Send an APDU command to the SE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_Ese_LogicalChannel_js_1300', Level.LEVEL0, async function (done) {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]13 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let getPromise = Session.openBasicChannel(aidArray);
                    await getPromise.then((data) => {
                        console.info("[NFC_test]13 openBasicChannel openBasicChannel data: " + data);
                        if ( data != undefined && data != null){
                            console.info("[NFC_test]13 openBasicChannel data != null");
                            let OmaBasicChannel = data;
                            OmaBasicChannel.close();
                            console.info("[NFC_test]13 Data received by the application select command: " );
                        }
                        else {
                            console.info("[NFC_test]13 openBasicChannel data == null");
                        }
                    }).catch((error)=> {
                        console.info("[NFC_test]13 openBasicChannel catch error" + error);
                        expect(3300103).assertEqual(error.code)
                    });
                    sleep(5000);
                }
            } catch (error) {
                console.info("[NFC_test]13 openBasicChannel_Promise occurs exception:" + error.code + "---" + error);
                expect(801).assertEqual(error.code);
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_Ese_LogicalChannel_js_1400
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_1400
         * @tc.desc   open LogicalChannel Check whether the channel is a basic channel.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_Ese_LogicalChannel_js_1400', Level.LEVEL0, async function (done) {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]14 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let getPromise = Session.openLogicalChannel(aidArray);
                    await getPromise.then((data) => {
                        console.info("[NFC_test]14  openLogicalChannel data: " + data);
                        if ( data != undefined && data != null){
                            console.info("[NFC_test]14 openLogicalChannel data != null");
                            let OmaLogicalChannel = data;
                            OmaLogicalChannel.close();
                            let isChannelClosed = OmaLogicalChannel.isClosed();
                            if (isChannelClosed == true) {
                                console.info("[NFC_test]14 Check whether the channel is disabled: " + isChannelClosed);
                                expect(isChannelClosed).assertTrue();
                            } else {
                                console.info("[NFC_test]14 Check whether the channel is disabled: " + isChannelClosed);
                                expect(isChannelClosed).assertFalse();
                            }                        
                        }
                        else {
                            console.info("[NFC_test]14 openLogicalChannel data == null");
                        }
                    }).catch((error)=> {
                        console.info("[NFC_test]14 openLogicalChannel catch error" + error.code + "---" + error);
                        expect(3300103).assertEqual(error.code)
                    });
                    sleep(5000);
                }
            } catch (error) {
                console.info("[NFC_test]14 openLogicalChannel_Promise occurs exception:" + error.code + "---" + error);
                expect(801).assertEqual(error.code);
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_Ese_LogicalChannel_js_1500
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_1500
         * @tc.desc   open BasicChannel Check whether the channel is a basic channel.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_Ese_LogicalChannel_js_1500', Level.LEVEL0, async function (done) {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]15 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let getPromise = Session.openBasicChannel(aidArray,p2);
                    await getPromise.then((data) => {
                        console.info("[NFC_test]15  openBasicChannel data: " + data);
                        if ( data != undefined && data != null){
                            console.info("[NFC_test]15 openBasicChannel data != null");
                            let OmaLogicalChannel = data;
                            OmaLogicalChannel.close();
                            let isChannelClosed = OmaLogicalChannel.isClosed();
                            if (isChannelClosed == true) {
                                console.info("[NFC_test]15 Check whether the channel is disabled: " + isChannelClosed);
                                expect(isChannelClosed).assertTrue();
                            } else {
                                console.info("[NFC_test]15 Check whether the channel is disabled: " + isChannelClosed);
                                expect(isChannelClosed).assertFalse();
                            }
                        }
                        else {
                            console.info("[NFC_test]15 openBasicChannel data == null");
                        }
                    }).catch((error)=> {
                        console.info("[NFC_test]15 openBasicChannel catch error" + error.code + "---" + error);
                        expect(3300103).assertEqual(error.code)
                    });
                    sleep(5000);
                }
            } catch (error) {
                console.info("[NFC_test]15 openBasicChannel occurs exception:" + error.code + "---" + error);
                expect(801).assertEqual(error.code);
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_Ese_LogicalChannel_js_1600
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_1600
         * @tc.desc   Check whether the channel is closed.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_Ese_LogicalChannel_js_1600', Level.LEVEL0, async function (done) {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]16 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let getPromise = Session.openLogicalChannel(aidArray,p2);
                    await getPromise.then((data) => {
                        console.info("[NFC_test]16  openLogicalChannel data: " + data);
                        if ( data != undefined && data != null){
                            console.info("[NFC_test]16 openLogicalChannel data != null");
                            let OmaLogicalChannel = data;
                            OmaLogicalChannel.close();
                            let isChannelClosed = OmaLogicalChannel.isClosed();
                            if (isChannelClosed == true) {
                                console.info("[NFC_test]16 Check whether the channel is disabled: " + isChannelClosed);
                                expect(isChannelClosed).assertTrue();
                            } else {
                                console.info("[NFC_test]16 Check whether the channel is disabled: " + isChannelClosed);
                                expect(isChannelClosed).assertFalse();
                            }
                        }
                        else {
                            console.info("[NFC_test]16 openLogicalChannel data == null");
                        }
                    }).catch((error)=> {
                        console.info("[NFC_test]16 openLogicalChannel catch error" + error.code + "---" + error);
                        expect(3300103).assertEqual(error.code)
                    });
                    sleep(5000);
                }
            } catch (error) {
                console.info("[NFC_test]16 openLogicalChannel_Promise occurs exception:" + error.code + "---" + error);
                expect(801).assertEqual(error.code);
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_Ese_LogicalChannel_js_1700
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_1700
         * @tc.desc   hasHceCapability to support a certain type of card emulation.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_Ese_LogicalChannel_js_1700', Level.LEVEL0, function () {
			try{
				if (getReader == undefined){
					console.info("[NFC_test]17 This Function is not support because the phone NFC chip is ST chip");
				}else{
					let closeChannels = Session.closeChannels();
					console.info("[NFC_test]17 Session.closeChannels success" + closeChannels);
				}
			}catch(error){
					console.info("[NFC_test]17 closeChannels error" + error.code + "---" + JSON.stringify(error));
					expect(801).assertEqual(error.code)
				}
			})
			
        /**
         * @tc.name   SUB_Communication_Ese_LogicalChannel_js_1900
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_1900
         * @tc.desc   open asicChannel Check whether the channel is a basic channel
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_Ese_LogicalChannel_js_1900', Level.LEVEL0, async function (done) {
			try{
				function getServiceStateFunc(ServiceState){console.info("[NFC_js] get ServiceState result:" + JSON.stringify(ServiceState));}
				let seService = secureElement.newSEService("serviceState", getServiceStateFunc);
				expect(true).assertEqual(seService != null);
				done();
			}catch(error){
				console.info("[NFC_test]1900 openBasicChannel error result:" + JSON.stringify(error) + "error_code:" + error.code);
				if (error.code == 401){
					expect(true).assertTrue();
				}else if (error.code == 801){
					expect(true).assertTrue();
				}else{
					expect().assertFail();
				}
                done();
			}
		})
		
        /**
         * @tc.name   SUB_Communication_Ese_LogicalChannel_js_2500
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_2500
         * @tc.desc   createService
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_Ese_LogicalChannel_js_2500', Level.LEVEL0, async function (done) {
			try{
				await secureElemente.createService().then( (data) => {
					console.info("[NFC_test]25 SecureElementDemo createService data ="+data);
					Service = data;
					let connect = Service.isConnected();
					console.info("[NFC_test]25 SecureElementDemo createService connect = " + connect);
					return Service;
				})
				.catch ((err) => {
					console.info("[NFC_test]25 createService createService err = " + err);
				})
			} catch (error) {
				console.info("[NFC_test]25 createService occurs exception:" + error.code + "---" + JSON.stringify(error));
				if (error.code == 801){
					expect(true).assertTrue();
				}else{
					expect().assertFail;
				}
			}
			done();
		})

        /**
         * @tc.name   SUB_Communication_Ese_LogicalChannel_js_2600
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_2600
         * @tc.desc   open LogicalChannel Send an APDU command to the SE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_Ese_LogicalChannel_js_2600', Level.LEVEL0, async function (done) {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]26 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    function LogicalChannel_callback(){
                        return new Promise((resolve, reject) => {
                            Session.openLogicalChannel(aidArray,
                                (err, result) => {
                                    if(err) {
                                        console.info("[NFC_test]26 failed to get openLogicalChannel:" + JSON.stringify(err));
                                        reject(err.code);
                                    } else {
                                        let cmdData = [0x01, 0x02, 0x03, 0x04];
                                        console.info("[NFC_test]26 openLogicalChannel data != null " + result);
                                        let nfcLogicalChannel = result;
                                        nfcLogicalChannel.transmit(cmdData).then((data) => {
                                            console.info("[NFC_test]26 Send an APDU command to the SE: " + data);
                                            if (data.length > 0) {
                                                expect(data.length > 0).assertTrue();
                                            } else {
                                                expect(data).assertDeepEquals([]);
                                            }
                                        }).catch((error) => {
                                            if (error.code == 401) {
                                                console.info("[NFC_test]26 transmit failed" + error + "--error.code--" + error.code);
                                                expect(true).assertTrue();
                                            } else if (error.code == 3300101) {
                                                console.info("[NFC_test]26 transmit failed" + error + "--error.code--" + error.code);
                                                expect(true).assertTrue();
                                            } else if (error.code == 3300103) {
                                                console.info("[NFC_test]26 transmit failed" + error + "--error.code--" + error.code);
                                                expect(true).assertTrue();
                                            } else if (error.code == 3300104) {
                                                console.info("[NFC_test]26 transmit failed" + error + "--error.code--" + error.code);
                                                expect(true).assertTrue();
                                            } else  {
                                                console.info("[NFC_test]26 transmit failed" + error + "--error.code--" + error.code);
                                                expect().assertFail();
                                            }
                                        });
                                        sleep(900);
                                        nfcLogicalChannel.close();
                                        console.info("[NFC_test]26 Data received by the application select command: " );                                        
                                    }
                                    resolve();
                                });
                        });
                    }
                    await LogicalChannel_callback().then((data) => {
                        console.info("[NFC_test]26 openBasicChannel done");
                    })
                    .catch(e => {
                        console.info("[NFC_test]26 openBasicChannel failed" + e);
                        expect(3300103).assertEqual(e);
                    })
                }
            } catch (error) {
                console.info("[NFC_test]26 openLogicalChannel_callback occurs exception:" + error.code + "---" + error);
                expect(801).assertEqual(error.code);
            }
            sleep(900);
            done();
        })

        /**
         * @tc.name   SUB_Communication_Ese_LogicalChannel_js_2601
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_2601
         * @tc.desc   open LogicalChannel Send an APDU command to the SE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_Ese_LogicalChannel_js_2601', Level.LEVEL0, async function (done) {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]26 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    function LogicalChannel_callback(){
                        return new Promise((resolve, reject) => {
                            Session.openLogicalChannel(aidArray,
                                (err, result) => {
                                    if(err) {
                                        console.info("[NFC_test]26 failed to get openLogicalChannel:" + JSON.stringify(err));
                                        reject(err.code);
                                    } else {
                                        let cmdData1 = [];
                                        console.info("[NFC_test]26 openLogicalChannel data != null " + result);
                                        let nfcLogicalChannel = result;
                                        nfcLogicalChannel.transmit(cmdData1).then((data) => {
                                            console.info("[NFC_test]26 Send an APDU command to the SE: " + data);
                                            if (data.length > 0) {
                                                expect(data.length > 0).assertTrue();
                                            } else {
                                                expect(data).assertDeepEquals([]);
                                            }
                                        }).catch((error) => {
                                            if (error.code == 401) {
                                                console.info("[NFC_test]26 transmit failed" + error + "--error.code--" + error.code);
                                                expect(true).assertTrue();
                                            } else if (error.code == 3300101) {
                                                console.info("[NFC_test]26 transmit failed" + error + "--error.code--" + error.code);
                                                expect(true).assertTrue();
                                            } else if (error.code == 3300103) {
                                                console.info("[NFC_test]26 transmit failed" + error + "--error.code--" + error.code);
                                                expect(true).assertTrue();
                                            } else if (error.code == 3300104) {
                                                console.info("[NFC_test]26 transmit failed" + error + "--error.code--" + error.code);
                                                expect(true).assertTrue();
                                            } else  {
                                                console.info("[NFC_test]26 transmit failed" + error + "--error.code--" + error.code);
                                                expect().assertFail();
                                            }
                                        });
                                        sleep(900);
                                        nfcLogicalChannel.close();
                                        console.info("[NFC_test]26 Data received by the application select command: " );                                        
                                    }
                                    resolve();
                                });
                        });
                    }
                    await LogicalChannel_callback().then((data) => {
                        console.info("[NFC_test]26 openBasicChannel done");
                    })
                    .catch(e => {
                        console.info("[NFC_test]26 openBasicChannel failed" + e);
                        expect(3300103).assertEqual(e);
                    })
                }
            } catch (error) {
                console.info("[NFC_test]26 openLogicalChannel_callback occurs exception:" + error.code + "---" + error);
                expect(801).assertEqual(error.code);
            }
            sleep(900);
            done();
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}