/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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


import tag from '@ohos.nfc.tag';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

let aTag = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
    ],
    "tagRfDiscId": 1,
};

let isoDepTaginfo = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 3],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
        {
            "HistoricalBytes": "4D54000500308693695B", "HiLayerResponse": "",
        },
    ],
    "tagRfDiscId": 1,
};

let getAtag = null ;

export default function nfcATagSessionTest() {
    describe('nfcATagSessionTest', function () {
        beforeAll(function () {
            console.info('rbeforeAll called')
            try {
                getAtag = tag.getNfcATag(aTag)
                console.info('Nfcget Connected data' + getAtag)
            } catch (error) {
                console.info('Nfcget Connected error' + error)
            }
        })
        beforeEach(function() {
            console.info('beforeEach called')
        })
        afterEach(function () {
            console.info('afterEach called')
        })
        afterAll(function () {
            console.info('afterAll called')
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_0100
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0100
         * @tc.desc   Test connectTag api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_0100', Level.LEVEL0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                let NfcConnected;
                try {
                    NfcConnected = getAtag.connectTag();
                    if (NfcConnected == true) {
                        console.log("[NFC_test] tagsession1 NfcConnected:" + NfcConnected);
                        expect(NfcConnected).assertTrue();
                    } else {
                        console.log("[NFC_test] tagsession1 NfcConnected:" + NfcConnected);
                        expect(NfcConnected).assertFalse();
                    }
                } catch (error) {
                    console.log('[NFC_test] tagsession1 NfcConnected error' + error)
                    expect().assertFail();
                }
            } else {
                console.log("[NFC_test]getAtag1 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_0200
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0200
         * @tc.desc   Test reset api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_0200', Level.LEVEL0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                try { 
                    getAtag.reset();
                    console.log('[NFC_test] tagsession2 reset1 pass' )
                    expect(true).assertTrue();
                } catch (error) {
                    console.log('[NFC_test] tagsession2 reset1 error' + error)
                    expect().assertFail();
                }
            } else {
                console.log("[NFC_test]getAtag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_0300
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0300
         * @tc.desc   Test isTagConnected api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_0300', Level.LEVEL0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                let isNfcConnected;
                try {
                    isNfcConnected = getAtag.isTagConnected();
                    if (isNfcConnected == true) {
                        console.log("[NFC_test] tagsession3 isNfcConnected:" +isNfcConnected);
                        expect(isNfcConnected).assertTrue();
                    }else {
                        console.log("[NFC_test] tagsession3 isNfcConnected:" +isNfcConnected);
                        expect(isNfcConnected).assertFalse();
                    }
                } catch (error) {
                    console.log('[NFC_test] tagsession3 isNfcConnected error' + error)
                    expect().assertFail();
                }
            } else {
                console.log("[NFC_test]getAtag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_0400
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0400
         * @tc.desc   Test getMaxSendLength api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_0400', Level.LEVEL0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                let mazSendLen;
                try {
                    mazSendLen = getAtag.getMaxSendLength();
                    console.info("[NFC_test] tagsession4 getMaxSendLength:" + mazSendLen);
                    expect(mazSendLen >= 0).assertTrue();
                } catch (error) {
                    console.info('[NFC_test] tagsession4 getMaxSendLength error' + error)
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]getAtag4 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_0500
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0500
         * @tc.desc   Test setSendDataTimeout api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_0500', Level.LEVEL0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                try {
                    let timeoutMs = 1000;
                    let settime = getAtag.setSendDataTimeout(timeoutMs);
                    if (settime == true) {
                        console.info("[NFC_test] tagsession5 setSendDataTimeout:" + settime);
                        expect(settime).assertTrue();
                    } else {
                        console.info("[NFC_test] tagsession5 setSendDataTimeout:" + settime);
                        expect(settime).assertFalse();
                    }
                } catch (error) {
                    console.info('[NFC_test] tagsession5 setSendDataTimeout error' + error)
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]getAtag5 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_0600
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0600
         * @tc.desc   Test getSendDataTimeout api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_0600', Level.LEVEL0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                let gettime;
                try {
                    gettime  = getAtag.getSendDataTimeout();
                    console.info("[NFC_test] tagsession6 getMaxSendLength:" + gettime);
                    expect(gettime).assertInstanceOf('Number')
                } catch (error) {
                    console.info('[NFC_test] tagsession6 getMaxSendLength error1' + error)
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]getAtag6 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_0700
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0700
         * @tc.desc   Test sendData api by peomise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_0700', Level.LEVEL0, async function (done) {
            if (getAtag != null && getAtag != undefined) {
                let sendDatas = [0x01, 0x02, 0x03, 0x04];
                await getAtag.sendData(sendDatas).then((data) => {
                    if(data.length > 0) {
                        expect(data.length > 0).assertTrue();
                    }  else {
                        expect(data).assertDeepEquals([]);
                    }
                    console.info("[NFC_test] tagsession7 nfcAtage sendData1 data: " + data);
                    expect(data).assertInstanceOf('Array')
                    done();
                }).catch((err)=> {
                    console.info("[NFC_test] tagsession7 nfcAtage sendData1 err: " + err);
                    expect('3100201').assertEqual(err.code)
                    done();
                });
                sleep(3500);
            } else {
                console.info("[NFC_test]getAtag7 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_0800
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0800
         * @tc.desc   Test sendData api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_0800', Level.LEVEL0, async function (done) {
            if (getAtag != null && getAtag != undefined) {
                let sendDatas = [0x01, 0x02, 0x03, 0x04];
                getAtag.sendData(sendDatas, (err, data)=> {
                    if (err) {
                        console.info("[NFC_test] tagsession8 nfcAtage sendData2 data err: " + err);
                        expect("3100201").assertEqual(err.code)
                        done();
                    } else {
                        sleep(2500);
                        if (data.length > 0) {
                            expect(data.length > 0).assertTrue();
                        } else {
                            expect(data).assertDeepEquals([]);
                        }
                        console.info("[NFC_test] tagsession8 nfcAtage sendData2 data: " + data );
                        data
                        done();
                    }
                });
                sleep(500);
            } else {
                console.info("[NFC_test]getAtag8 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_0900
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0900
         * @tc.desc   Test reset api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_0900', Level.LEVEL0, function ()  {
            try {
                tag.getNfcA(aTag).resetConnection();
                console.info('[NFC_test] tagsession9 resetConnection pass' )
                expect(true).assertTrue();
            } catch (error) {
                if (error.code == 3100201) {
                    console.info('[NFC_test] tagsession9 resetConnection error' + error);
                    expect(3100201).assertEqual(error.code);
                } else if (error.code == 801) {
                    console.info('[NFC_test] tagsession9 resetConnection error' + error);
                    expect(true).assertTrue();
                } else if (error.code == 201) {
                    console.info('[NFC_test] tagsession9 resetConnection error' + error);
                    expect(true).assertTrue();
                } else {
                    console.info('[NFC_test] tagsession9 resetConnection error' + error);
                    expect().assertFail();
                }
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_1000
         * @tc.number SUB_Communication_NFC_nfcAtage_js_1000
         * @tc.desc   Test setSendDataTimeout api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_1000', Level.LEVEL0, function ()  {
            let gettime;
            try {
                gettime = tag.getNfcATag(aTag).getTimeout();
                console.info("[NFC_test] tagsession10 getSendDataTimeout:" + gettime);
                expect(gettime).assertInstanceOf('Number')
            } catch (error) {
                if (error.code == 201) {
                    console.info('[NFC_test] tagsession10 getSendDataTimeout error' + error + error.code)
                    expect(true).assertTrue();
                } else if (error.code == 801) {
                    console.info('[NFC_test] tagsession10 getSendDataTimeout error' + error + error.code)
                    expect(true).assertTrue();
                } else if (error.code == 3100201) {
                    console.info('[NFC_test] tagsession10 getSendDataTimeout error' + error + error.code)
                    expect(true).assertTrue();
                } else {
                    console.info('[NFC_test] tagsession10 getSendDataTimeout error' + error + error.code)
                    expect().assertFail();
                }
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_1100
         * @tc.number SUB_Communication_NFC_nfcAtage_js_1100
         * @tc.desc   Test sendData api by peomise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_1100', Level.LEVEL0, async function (done) {
            let sendDatas = [0x01, 0x02, 0x03, 0x04];
            await tag.getNfcATag(aTag).transmit(sendDatas).then((data) => {
                console.info("[NFC_test] tagsession11 nfcAtage sendData1 data: " + data );
                if (data.length > 0) {
                    expect(data.length > 0).assertTrue();
                } else {
                    expect(data).assertDeepEquals([]);
                }
                expect(data).assertInstanceOf('Array')
                done();
            }).catch((err)=> {
                if (err.code == 201) {
                    console.info("[NFC_test] tagsession12 nfcAtage sendData1 data err: " + err);
                    expect(true).assertTrue();
                    done();
                } else if (err.code == 401) {
                    console.info("[NFC_test] tagsession12 nfcAtage sendData1 data err: " + err);
                    expect(true).assertTrue();
                    done();
                } else if (err.code == 801) {
                    console.info("[NFC_test] tagsession12 nfcAtage sendData1 data err: " + err);
                    expect(true).assertTrue();
                    done();
                } else if (err.code == 3100201) {
                    console.info("[NFC_test] tagsession12 nfcAtage sendData1 data err: " + err);
                    expect(true).assertTrue();
                    done();
                } else if (err.code == 3100204) {
                    console.info("[NFC_test] tagsession12 nfcAtage sendData1 data err: " + err);
                    expect(true).assertTrue();
                    done();
                } else {
                    sleep(2500);
                    console.info("[NFC_test] tagsession12 nfcAtage sendData1 data: " + data);
                    expect(data).assertInstanceOf('Array')
                    done();
                }
            });
            sleep(3500);
        })



        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_1200
         * @tc.number SUB_Communication_NFC_nfcAtage_js_1200
         * @tc.desc   Test sendData api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_1200', Level.LEVEL0, async function (done) {
            let sendDatas = [0x01, 0x02, 0x03, 0x04];
            tag.getNfcATag(aTag).transmit(sendDatas, (err, data)=> {
                if (err.code == 201) {
                    console.info("[NFC_test] tagsession12 nfcAtage sendData2 data err: " + err);
                    expect(true).assertTrue();
                    done();
                } else if (err.code == 401) {
                    console.info("[NFC_test] tagsession12 nfcAtage sendData2 data err: " + err);
                    expect(true).assertTrue();
                    done();
                } else if (err.code == 801) {
                    console.info("[NFC_test] tagsession12 nfcAtage sendData2 data err: " + err);
                    expect(true).assertTrue();
                    done();
                } else if (err.code == 3100201) {
                    console.info("[NFC_test] tagsession12 nfcAtage sendData2 data err: " + err);
                    expect(true).assertTrue();
                    done();
                } else if (err.code == 3100204) {
                    console.info("[NFC_test] tagsession12 nfcAtage sendData2 data err: " + err);
                    expect(true).assertTrue();
                    done();
                } else {
                    sleep(2500);
                    console.info("[NFC_test] tagsession12 nfcAtage sendData2 data: " + data);
                    if (data.length > 0) {
                        expect(data.length > 0).assertTrue();
                    } else {
                        expect(data).assertDeepEquals([]);
                    }
                    expect(data).assertInstanceOf('Array')
                    done();
                }
            });
            sleep(500);
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_1300
         * @tc.number SUB_Communication_NFC_nfcAtage_js_1300
         * @tc.desc   Test getMaxSendLength api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_1300', Level.LEVEL0, function ()  {
            let mazSendLen;
            try {
                mazSendLen  = tag.getNfcATag(aTag).getMaxTransmitSize();
                console.info("[NFC_test] tagsession13 getMaxTransmitSize:" +mazSendLen);
                expect(mazSendLen).assertInstanceOf('Number')
            } catch (error) {
                if (error.code == 201) {
                    console.info('[NFC_test] tagsession13 getMaxTransmitSize error' + error)
                    expect(true).assertTrue();
                } else if (error.code == 801) {
                    onsole.info('[NFC_test] tagsession13 getMaxTransmitSize error' + error)
                    expect(true).assertTrue();
                } else if (error.code == 3100201) {
                    onsole.info('[NFC_test] tagsession13 getMaxTransmitSize error' + error)
                    expect(true).assertTrue();
                } else {
                    console.info('[NFC_test] yangpengweitagsession13 getMaxTransmitSize error' + JSON.stringify(error))
                    expect().assertFail()
                }
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_1400
         * @tc.number SUB_Communication_NFC_nfcAtage_js_1400
         * @tc.desc   Test setSendDataTimeout api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_1400', Level.LEVEL0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                let settime;
                try {
                    let timeoutMs = 1000;
                    getAtag.setTimeout(timeoutMs);
                    console.info("[NFC_test] tagsession14 setTimeout success");
                    expect(true).assertTrue();
                } catch (error) {
                    console.info('[NFC_test] tagsession14 setTimeout error' + error)
                    expect(3100201).assertEqual(error.code)
                }
            } else {
                console.info("[NFC_test]getAtag14 = null & = undefined: ");
                expect().assertFail();
            }
        })
        
        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_1500
         * @tc.number SUB_Communication_NFC_nfcAtage_js_1500
         * @tc.desc   Test isConnected api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_1500', Level.LEVEL0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                try {
                    let istagConnected = tag.getIsoDep(isoDepTaginfo).isConnected(); 
                    if (istagConnected == true) {
                        console.info("[NFC_test] tagsession15 isConnected:" + istagConnected);
                        expect(istagConnected).assertTrue();
                    } else {
                        console.info("[NFC_test] tagsession15 isConnected:" + istagConnected);
                        expect(istagConnected).assertFalse();
                    }
                } catch (error) {
                    if (error.code == 801) {
                        console.info('[NFC_test] tagsession15 isConnected errorcode' + error.code);
                        expect(true).assertTrue();
                    } else {
                        console.info('[NFC_test] tagsession15 isConnected errorcode' + error.code);
                        expect().assertFail();
                    }
                }
            } else {
                console.info("[NFC_test]getAtag14 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_1600
         * @tc.number SUB_Communication_NFC_nfcAtage_js_1600
         * @tc.desc   Test connect api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_1600', Level.LEVEL0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                try {
                    getAtag.connect();
                    console.log("[NFC_test] tagsession16 NfcConnected pass");
                    expect(true).assertTrue();
                } catch (error) {
                    if (error.code == 3100201) {
                        console.log('[NFC_test] tagsession16 NfcConnected error' + error);
                        expect(true).assertTrue();
                    } else if (error.code == 801) {                     
                        console.log('[NFC_test] tagsession16 NfcConnected error' + error);
                        expect(true).assertTrue();
                    } else if (error.code == 201) {
                        console.log('[NFC_test] tagsession16 NfcConnected error' + error);
                        expect(true).assertTrue();
                    } else {
                        console.log('[NFC_test] tagsession16 NfcConnected error' + error);
                        expect().assertFail();
                    }
                }
            } else {
                console.log("[NFC_test]getAtag1 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_1700
         * @tc.number SUB_Communication_NFC_nfcAtage_js_1700
         * @tc.desc   Test getTagInfo api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_1700', Level.LEVEL0, function ()  {
                try {
                    tag.getNfcA(aTag).getTagInfo()
                    console.log("[NFC_test]17 tagsession17 getTagInfo pass");
                } catch (error) {
                    console.log('[NFC_test]17 tagsession17 getTagInfo error' + error);
                    expect().assertFail();
                }          
        })


        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_2100
         * @tc.number SUB_Communication_NFC_nfcAtage_js_2100
         * @tc.desc   Test setSendDataTimeout api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_2100', Level.LEVEL0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                let settime;
                try {
                    let timeoutMs = 1000;
                    getAtag.setTimeout(timeoutMs);
                    console.info("[NFC_test] tagsession14 setTimeout success");
                    expect(true).assertTrue();
                } catch (error) {
                    if (error.code == 801) {
                        console.info('[NFC_test] tagsession14 setTimeout error' + error);
                        expect(true).assertTrue();
                    } else if (error.code == 3100201) {
                        console.info('[NFC_test] tagsession14 setTimeout error' + error);
                        expect(true).assertTrue();
                    } else if (error.code == 201) {
                        console.info('[NFC_test] tagsession14 setTimeout error' + error);
                        expect(true).assertTrue();
                    } else {
                        console.info('[NFC_test] tagsession14 setTimeout error' + error);
                        expect().assertFail();
                    }
                }
            } else {
                console.info("[NFC_test]getAtag14 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcAtage_js_2200
         * @tc.number SUB_Communication_NFC_nfcAtage_js_2200
         * @tc.desc   Test setSendDataTimeout api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcAtage_js_2200', Level.LEVEL0, function ()  {
            if ( getAtag != null && getAtag != undefined){
                let settime;
                try {
                    let timeoutMs = 1000;
                    getAtag.setTimeout(timeoutMs);
                    console.info("[NFC_test] tagsession14 setTimeout success");
                    expect(true).assertTrue();
                } catch (error) {
                    console.info('[NFC_test] tagsession14 setTimeout error' + error)
                    expect(401).assertEqual(error.code)
                }
            } else {
                console.info("[NFC_test]getAtag14 != null && getAtag14 != undefined: ");
                expect().assertFail();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}
