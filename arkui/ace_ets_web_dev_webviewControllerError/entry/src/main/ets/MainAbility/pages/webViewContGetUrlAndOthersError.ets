/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
// @ts-nocheck

function Uint8ArrayToString(dataArray) {
    var dataString = ''
    for (var i = 0; i < dataArray.length; i++) {
        dataString += String.fromCharCode(dataArray[i])
    }
    return dataString
}

function ParseX509CertInfo(x509CertArray) {
    let res: string = 'getCertificate success: len = ' + x509CertArray.length;
    for (let i = 0; i < x509CertArray.length; i++) {
        res += ', index = ' + i + ', issuer name = '
        + Uint8ArrayToString(x509CertArray[i].getIssuerName().data) + ', subject name = '
        + Uint8ArrayToString(x509CertArray[i].getSubjectName().data) + ', valid start = '
        + x509CertArray[i].getNotBeforeTime()
        + ', valid end = ' + x509CertArray[i].getNotAfterTime()
    }
    return res
}

@Entry
@Component
struct webViewContGetUrlAndOthersError {
    controller: web_webview.WebviewController = new web_webview.WebviewController();
    controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
    @State str:string="emitGetUrlInitErr";
    @State userAgent:string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
    @State javaScriptAccess:boolean=true;
    @State fileAccess:boolean=true;
    @State domStorageAccess:boolean=false;
    @State imageAccess:boolean=true;
    @State onlineImageAccess:boolean=true;
    @State databaseAccess:boolean=true;
    @State errorCode: string = '0';
    @State errorMsg: string = 'failed';
    @State step: number = -2;
    @State outputStr: string = ''

    onPageShow(){
        let valueChangeEvent={
            eventId:10,
            priority:events_emitter.EventPriority.LOW
        }
        events_emitter.on(valueChangeEvent,this.valueChangeCallBack)
    }
    private valueChangeCallBack=(eventData)=>{
        console.info("webViewContGetUrlAndOthersError page valueChangeCallBack");
        if(eventData != null){
             console.info("valueChangeCallBack:"+   JSON.stringify(eventData));
             if(eventData.data.ACTION != null){
                 this.str = eventData.data.ACTION;
             }
        }
    }

    build(){
        Column(){
            Row() {
                Button("getUrlAndOthersErrorTest").key('webViewContGetUrlAndOthersError').onClick(() => {
                    console.info("key==>" + this.str)
                    switch (this.str) {
                        case "emitGetUrlInitErr": {
                            try {
                                this.controllerTwo.getUrl();
                            } catch (error) {
                                console.error(`emitGetUrlInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 712)
                            Utils.emitEvent(this.errorMsg, 713)
                            break;
                        }
                        case "emitStopInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.stop();
                            } catch (error) {
                                console.error(`emitStopInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 714)
                            Utils.emitEvent(this.errorMsg, 715)
                            break;
                        }
                        case "emitBackOrForwardInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.backOrForward(this.step);
                            } catch (error) {
                                console.error(`emitBackOrForwardInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 716)
                            Utils.emitEvent(this.errorMsg, 717)
                            break;
                        }
                        case "emitScrollToInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.scrollTo(50, 50);
                            } catch (error) {
                                console.error(`emitScrollToInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 718)
                            Utils.emitEvent(this.errorMsg, 719)
                            break;
                        }
                        case "emitScrollByInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.scrollBy(50, 50);
                            } catch (error) {
                                console.error(`emitScrollByInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 720)
                            Utils.emitEvent(this.errorMsg, 721)
                            break;
                        }
                        case "emitSlideScrollInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.slideScroll(500, 500);
                            } catch (error) {
                                console.error(`emitSlideScrollInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 722)
                            Utils.emitEvent(this.errorMsg, 723)
                            break;
                        }
                        case "emitGetOriginalUrlInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.getOriginalUrl();
                            } catch (error) {
                                console.error(`emitGetOriginalUrlInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 724)
                            Utils.emitEvent(this.errorMsg, 725)
                            break;
                        }
                        case "emitGetFaviconInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.getFavicon();
                            } catch (error) {
                                console.error(`emitGetFaviconInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 726)
                            Utils.emitEvent(this.errorMsg, 727)
                            break;
                        }
                        case "emitSetNetworkAvailableInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.setNetworkAvailable(true);
                            } catch (error) {
                                console.error(`emitSetNetworkAvailableInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 728)
                            Utils.emitEvent(this.errorMsg, 729)
                            break;
                        }
                        case "emitHasImageCallBackInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.hasImage((error, data) => {
                                    if (error) {
                                        console.info(`hasImage error: ` + JSON.stringify(error))
                                        return;
                                    }
                                    console.info("hasImage: " + data);
                                });
                            } catch (error) {
                                console.error(`emitHasImageCallBackInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 730)
                            Utils.emitEvent(this.errorMsg, 731)
                            break;
                        }
                        case "emitHasImagePromiseInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.hasImage()
                                    .then((data) => {
                                        console.info('hasImage: ' + data);
                                    })
                                    .catch(function (error) {
                                        console.error("error: " + error);
                                    })
                            } catch (error) {
                                console.error(`emitHasImagePromiseInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 732)
                            Utils.emitEvent(this.errorMsg, 733)
                            break;
                        }
                        case "emitRemoveCacheInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.removeCache(false);
                            } catch (error) {
                                console.error(`emitRemoveCacheInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 734)
                            Utils.emitEvent(this.errorMsg, 735)
                            break;
                        }
                        case "emitPageUpInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.pageUp(false);
                            } catch (error) {
                                console.error(`emitPageUpInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 736)
                            Utils.emitEvent(this.errorMsg, 737)
                            break;
                        }
                        case "emitPageDownInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.pageDown(false);
                            } catch (error) {
                                console.error(`emitPageDownInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 738)
                            Utils.emitEvent(this.errorMsg, 739)
                            break;
                        }
                        case "emitGetBackForwardEntriesInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.getBackForwardEntries();
                            } catch (error) {
                                console.error(`emitGetBackForwardEntriesInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 740)
                            Utils.emitEvent(this.errorMsg, 741)
                            break;
                        }
                        case "emitSerializeWebStateInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.serializeWebState();
                            } catch (error) {
                                console.error(`emitSerializeWebStateInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 742)
                            Utils.emitEvent(this.errorMsg, 743)
                            break;
                        }
                        case "emitRestoreWebStateInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                let size = 8;
                                let buf = new ArrayBuffer(size);
                                this.controllerTwo.restoreWebState(new Uint8Array(buf.slice(0, 8)));
                            } catch (error) {
                                console.error(`emitRestoreWebStateInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 744)
                            Utils.emitEvent(this.errorMsg, 745)
                            break;
                        }
                        case "emitGetCertificatePromiseInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.getCertificate().then(x509CertArray => {
                                    this.outputStr = ParseX509CertInfo(x509CertArray);
                                })
                            } catch (error) {
                                console.error(`emitGetCertificatePromiseInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 746)
                            Utils.emitEvent(this.errorMsg, 747)
                            break;
                        }
                        case "emitGetCertificateCallbackInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.getCertificate((error, x509CertArray) => {
                                    if (error) {
                                        this.outputStr = 'getCertificate failed: ' + error.code + ", errMsg: " + error.message;
                                    } else {
                                        this.outputStr = ParseX509CertInfo(x509CertArray);
                                    }
                                })
                            } catch (error) {
                                console.error(`emitGetCertificateCallbackInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 748)
                            Utils.emitEvent(this.errorMsg, 749)
                            break;
                        }
                        case "emitSetAudioMutedInitErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.controllerTwo.setAudioMuted(false)
                            } catch (error) {
                                console.error(`emitSetAudioMutedInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code;
                                this.errorMsg = error.message;
                            }
                            Utils.emitEvent(this.errorCode, 750)
                            Utils.emitEvent(this.errorMsg, 751)
                            break;
                        }
                    }
                })
            }
            Web({src:$rawfile('index.html'),controller:this.controller})
                .javaScriptAccess(this.javaScriptAccess)
                .fileAccess(this.fileAccess)
                .imageAccess(this.imageAccess)
                .domStorageAccess(this.domStorageAccess)
                .onlineImageAccess(this.onlineImageAccess)
                .databaseAccess(this.databaseAccess)
                .userAgent(this.userAgent)
        }
    }
}