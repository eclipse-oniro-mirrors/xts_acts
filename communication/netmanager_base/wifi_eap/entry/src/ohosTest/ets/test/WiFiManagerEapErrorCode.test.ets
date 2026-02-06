/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import eap from '@ohos.net.eap';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {BusinessError,Callback} from '@ohos.base'

function sleep(delay:number):Promise<void> {
    return new Promise((resolve) => {setTimeout(()=>{resolve()}, delay);});
}
export default function wifiEapErrorTest(){
    const eapData: eap.EapData={
        msgId:1,
        eapBuffer:new Uint8Array([1,2,3,4,5]),
        bufferLen:1
    }
    describe('wifiEapErrorTest', async () =>{
        beforeAll(async (done :Function)=>{
            console.info('beforeAll called');
            done();
        })
        beforeEach(() =>{
            console.info('beforeEach called');
        })
        afterEach(() =>{
            console.info('afterEach called');
        })
        afterAll(async (done:Function) =>{
            console.info('afterAll called');
            done();
        })

        /**
         * @tc.number SUB_Communication_Netmanager_Eap_ErrorCode_0100
         * @tc.name SUB_Communication_Netmanager_Eap_ErrorCode_0100
         * @tc.desc Test eap register api functionality.
         * @tc.size LargeTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_Netmanager_Eap_ErrorCode_0100',TestType.FUNCTION|Size.LARGETEST|Level.LEVEL1, async (done:Function) => {
            let isAccessToken = canIUse("SystemCapability.Communication.NetManager.Eap");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support eap api.");
                expect(isAccessToken).assertFalse();
                done();
                return;
            } 
            try{
                const invalidNetType=3;
                const validEapCode=1;
                const validEapType=1;
                let getEapData=(eapData: eap.EapData):void=>{
                    console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0100 callback eapData : " + JSON.stringify(eapData));
                    setTimeout(()=>{
                        try{
                            console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0100 callback replyCustom");
                            eap.replyCustomEapData(eap.CustomResult.RESULT_NEXT,eapData);
                            console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0100 replyCustomEapData success");
                        }catch(error){
                            console.error("SUB_Communication_Netmanager_Eap_ErrorCode_0100 replyCustomEapData failed : ",error);
                        }finally{
                            try{
                                eap.unregCustomEapHandler(invalidNetType,validEapCode,validEapType,getEapData);
                                console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0100 unregCustomEapHandler success");
                            }catch(error){
                                console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0100 unregCustomEapHandler failed :,code is ${error.code}, message is ${error.message}`);
                            }
                        }
                    },1*1000);
                }
                eap.regCustomEapHandler(invalidNetType,validEapCode,validEapType,getEapData);
                console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0100 regCustomEapHandler success");
                expect().assertFail();
            }catch(error){
                console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0100 regCustomEapHandler failed,code is ${error.code}, message is ${error.message}`);
                if(error.code==801){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0100 eap register is not support`);
                    expect(true).assertTrue();
                }else if(error.code==201){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0100 eap register permission denied`);
                    expect(true).assertTrue();
                }else if(error.code==33200006){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0100 eap register invalid NetType`);
                    expect(true).assertTrue();
                }else if(error.code==33200007){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0100 eap register invalid EapCode`);
                    expect().assertFail();
                }else if(error.code==33200008){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0100 eap register invalid EapType`);
                    expect().assertFail();
                }else if(error.code==33200009){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0100 eap register netmanager stop`);
                    expect(true).assertTrue();
                }else if(error.code==33200099){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0100 eap register internal error`);
                    expect(true).assertTrue();
                }else {
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0100 eap register undefined errorcode`);
                    expect().assertFail();
                }
            }finally{
                done();
            }
        })

        /**
         * @tc.number SUB_Communication_Netmanager_Eap_ErrorCode_0200
         * @tc.name SUB_Communication_Netmanager_Eap_ErrorCode_0200
         * @tc.desc Test eap register api functionality.
         * @tc.size LargeTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_Netmanager_Eap_ErrorCode_0200',TestType.FUNCTION|Size.LARGETEST|Level.LEVEL1, async (done:Function) => {
            let isAccessToken = canIUse("SystemCapability.Communication.NetManager.Eap");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support eap api.");
                expect(isAccessToken).assertFalse();
                done();
                return;
            } 
            try{
                const validNetType=1;
                const invalidEapCode=0;
                const validEapType=1;
                let getEapData=(eapData: eap.EapData):void=>{
                    console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0200 callback eapData : " + JSON.stringify(eapData));
                    setTimeout(()=>{
                        try{
                            console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0200 callback replyCustom");
                            eap.replyCustomEapData(eap.CustomResult.RESULT_NEXT,eapData);
                            console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0200 replyCustomEapData success");
                        }catch(error){
                            console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0200 replyCustomEapData failed :,code is ${error.code}, message is ${error.message}`);
                        }finally{
                            try{
                                eap.unregCustomEapHandler(validNetType,invalidEapCode,validEapType,getEapData);
                                console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0200 unregCustomEapHandler success");
                            }catch(error){
                                console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0200 unregCustomEapHandler failed :,code is ${error.code}, message is ${error.message}`);
                            }
                        }
                    },1*1000);
                }
                console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0200 regCustomEapHandler start");
                eap.regCustomEapHandler(validNetType,invalidEapCode,validEapType,getEapData);
                console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0200 regCustomEapHandler success");
                expect().assertFail();
            }catch(error){
                console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0200 regCustomEapHandler failed,code is ${error.code}, message is ${error.message}`);
                if(error.code==801){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0200 eap register is not support`);
                    expect(true).assertTrue();
                }else if(error.code==201){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0200 eap register permission denied`);
                    expect(true).assertTrue();
                }else if(error.code==33200006){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0200 eap register invalid NetType`);
                    expect().assertFail();
                }else if(error.code==33200007){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0200 eap register invalid EapCode`);
                    expect(true).assertTrue();
                }else if(error.code==33200008){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0200 eap register invalid EapType`);
                    expect().assertFail();
                }else if(error.code==33200009){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0200 eap register netmanager stop`);
                    expect(true).assertTrue();
                }else if(error.code==33200099){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0200 eap register internal error`);
                    expect(true).assertTrue();
                }else {
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0200 eap register undefined errorcode`);
                    expect().assertFail();
                }
            }finally{
                done();
            }
        })

        /**
         * @tc.number SUB_Communication_Netmanager_Eap_ErrorCode_0300
         * @tc.name SUB_Communication_Netmanager_Eap_ErrorCode_0300
         * @tc.desc Test eap register api functionality.
         * @tc.size LargeTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_Netmanager_Eap_ErrorCode_0300',TestType.FUNCTION|Size.LARGETEST|Level.LEVEL1, async (done:Function) => {
            let isAccessToken = canIUse("SystemCapability.Communication.NetManager.Eap");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support eap api.");
                expect(isAccessToken).assertFalse();
                done();
                return;
            } 
            try{
                const validNetType=1;
                const validEapCode=1;
                const invalidEapType=-1;
                let getEapData=(eapData: eap.EapData):void=>{
                    console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0300 callback eapData : " + JSON.stringify(eapData));
                    setTimeout(()=>{
                        try{
                            console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0300 callback replyCustom");
                            eap.replyCustomEapData(eap.CustomResult.RESULT_NEXT,eapData);
                            console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0300 replyCustomEapData success");
                        }catch(error){
                            console.error("SUB_Communication_Netmanager_Eap_ErrorCode_0300 replyCustomEapData failed : ",error);
                        }finally{
                            try{
                                eap.unregCustomEapHandler(validNetType,validEapCode,invalidEapType,getEapData);
                                console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0300 unregCustomEapHandler success");
                            }catch(error){
                                console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0300 unregCustomEapHandler failed :,code is ${error.code}, message is ${error.message}`);
                            }
                        }
                    },1*1000);
                }
                eap.regCustomEapHandler(validNetType,validEapCode,invalidEapType,getEapData);
                console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0300 regCustomEapHandler success");
                //expect().assertFail();
            }catch(error){
                console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0300 regCustomEapHandler failed,code is ${error.code}, message is ${error.message}`);
                if(error.code==801){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0300 eap register is not support`);
                    expect(true).assertTrue();
                }else if(error.code==201){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0300 eap register permission denied`);
                    expect(true).assertTrue();
                }else if(error.code==33200006){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0300 eap register invalid NetType`);
                    expect().assertFail();
                }else if(error.code==33200007){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0300 eap register invalid EapCode`);
                    expect().assertFail();
                }else if(error.code==33200008){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0300 eap register invalid EapType`);
                    expect(true).assertTrue();
                }else if(error.code==33200009){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0300 eap register netmanager stop`);
                    expect(true).assertTrue();
                }else if(error.code==33200099){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0300 eap register internal error`);
                    expect(true).assertTrue();
                }else {
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0300 eap register undefined errorcode`);
                    expect().assertFail();
                }
            }finally{
                done();
            }
        })
        
        /**
         * @tc.number SUB_Communication_Netmanager_Eap_ErrorCode_0400
         * @tc.name SUB_Communication_Netmanager_Eap_ErrorCode_0400
         * @tc.desc Test eap register api functionality.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_Netmanager_Eap_ErrorCode_0400',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
            let isAccessToken = canIUse("SystemCapability.Communication.NetManager.Eap");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support eap api.");
                expect(isAccessToken).assertFalse();
                done();
                return;
            } 
            try{
                const invalidNetType=3;
                const validEapCode=1;
                const validEapType=1;
                let getEapData=(eapData: eap.EapData):void=>{
                    console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0400 callback eapData : " + JSON.stringify(eapData));
                    setTimeout(()=>{
                        try{
                            console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0400 callback replyCustom");
                            eap.replyCustomEapData(eap.CustomResult.RESULT_FINISH,eapData);
                            console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0400 replyCustomEapData success");
                        }catch(error){
                            console.error("SUB_Communication_Netmanager_Eap_ErrorCode_0400 replyCustomEapData failed : ",error);
                        }
                        done();
                    },1*1000);
                }
                eap.unregCustomEapHandler(invalidNetType,validEapCode,validEapType,getEapData)
                console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0400 unregCustomEapHandler success");
                expect().assertFail();
            }catch(error){
                console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0400 unregCustomEapHandler failed,code is ${error.code}, message is ${error.message}`);
                if(error.code==801){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0400 eap unregister is not support`);
                    expect(true).assertTrue();
                }else if(error.code==201){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0400 eap unregister permission denied`);
                    expect(true).assertTrue();
                }else if(error.code==33200006){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0400 eap unregister invalid NetType`);
                    expect(true).assertTrue();
                }else if(error.code==33200007){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0400 eap unregister invalid EapCode`);
                    expect().assertFail();
                }else if(error.code==33200008){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0400 eap unregister invalid EapType`);
                    expect().assertFail();
                }else if(error.code==33200009){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0400 eap unregister netmanager stop`);
                    expect(true).assertTrue();
                }else if(error.code==33200099){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0400 eap unregister internal error`);
                    expect(true).assertTrue();
                }else {
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0400 eap unregister undefined errorcode`);
                    expect().assertFail();
                }
            }finally{
                done();
            }
        })   
         /**
         * @tc.number SUB_Communication_Netmanager_Eap_ErrorCode_0500
         * @tc.name SUB_Communication_Netmanager_Eap_ErrorCode_0500
         * @tc.desc Test eap register api functionality.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_Netmanager_Eap_ErrorCode_0500',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
            let isAccessToken = canIUse("SystemCapability.Communication.NetManager.Eap");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support eap api.");
                expect(isAccessToken).assertFalse();
                done();
                return;
            } 
            try{
                const validNetType=1;
                const invalidEapCode=5;
                const validEapType=1;
                let getEapData=(eapData: eap.EapData):void=>{
                    console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0500 callback eapData : " + JSON.stringify(eapData));
                    setTimeout(()=>{
                        try{
                            console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0500 callback replyCustom");
                            eap.replyCustomEapData(eap.CustomResult.RESULT_FINISH,eapData);
                            console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0500 replyCustomEapData success");
                        }catch(error){
                            console.error("SUB_Communication_Netmanager_Eap_ErrorCode_0500 replyCustomEapData failed : ",error)
                        }
                        done();
                    },1*1000);
                }
                eap.unregCustomEapHandler(validNetType,invalidEapCode,validEapType,getEapData)
                console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0500 unregCustomEapHandler success");
                expect().assertFail();
            }catch(error){
                console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0500 unregCustomEapHandler failed,code is ${error.code}, message is ${error.message}`);
                if(error.code==801){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0500 eap unregister is not support`);
                    expect(true).assertTrue();
                }else if(error.code==201){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0500 eap unregister permission denied`);
                    expect(true).assertTrue();
                }else if(error.code==33200006){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0500 eap unregister invalid NetType`);
                    expect().assertFail();
                }else if(error.code==33200007){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0500 eap unregister invalid EapCode`);
                    expect(true).assertTrue();
                }else if(error.code==33200008){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0500 eap unregister invalid EapType`);
                    expect().assertFail();
                }else if(error.code==33200009){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0500 eap unregister netmanager stop`);
                    expect(true).assertTrue();
                }else if(error.code==33200099){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0500 eap unregister internal error`);
                    expect(true).assertTrue();
                }else {
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0500 eap unregister undefined errorcode`);
                    expect().assertFail();
                }
            }finally{
                done();
            }
        })
         /**
         * @tc.number SUB_Communication_Netmanager_Eap_ErrorCode_0600
         * @tc.name SUB_Communication_Netmanager_Eap_ErrorCode_0600
         * @tc.desc Test eap unregister api functionality.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_Netmanager_Eap_ErrorCode_0600',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
            let isAccessToken = canIUse("SystemCapability.Communication.NetManager.Eap");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support eap api.");
                expect(isAccessToken).assertFalse();
                done();
                return;
            } 
            try{
                const validNetType=1;
                const validEapCode=1;
                const invalidEapType=-1;
                let getEapData=(eapData: eap.EapData):void=>{
                    console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0600 callback eapData : " + JSON.stringify(eapData));
                    setTimeout(()=>{
                        try{
                            console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0600 callback replyCustom");
                            eap.replyCustomEapData(eap.CustomResult.RESULT_FINISH,eapData);
                            console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0600 replyCustomEapData success");
                        }catch(error){
                            console.error("SUB_Communication_Netmanager_Eap_ErrorCode_0600 replyCustomEapData failed : ",error)
                        }
                        done();
                    },1*1000);
                }
                console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0600 unregCustomEapHandler start");
                eap.unregCustomEapHandler(validNetType,validEapCode,invalidEapType,getEapData);
                console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0600 unregCustomEapHandler success");
                expect().assertFail();
            }catch(error){
                console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0600 unregCustomEapHandler failed,code is ${error.code}, message is ${error.message}`);
                if(error.code==801){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0600 eap unregister is not support`);
                    expect(true).assertTrue();
                }else if(error.code==201){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0600 eap unregister permission denied`);
                    expect(true).assertTrue();
                }else if(error.code==33200006){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0600 eap unregister invalid NetType`);
                    expect().assertFail();
                }else if(error.code==33200007){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0600 eap unregister invalid EapCode`);
                    expect().assertFail();
                }else if(error.code==33200008){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0600 eap unregister invalid EapType`);
                    expect(true).assertTrue();
                }else if(error.code==33200009){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0600 eap unregister netmanager stop`);
                    expect(true).assertTrue();
                }else if(error.code==33200099){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0600 eap unregister internal error`);
                    expect(true).assertTrue();
                }else {
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0600 eap unregister undefined errorcode`);
                    expect().assertFail();
                }
            }finally{
                done();
            }
        })
        
        /**
         * @tc.number SUB_Communication_Netmanager_Eap_ErrorCode_0700
         * @tc.name SUB_Communication_Netmanager_Eap_ErrorCode_0700
         * @tc.desc Test eap reply api functionality.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_Netmanager_Eap_ErrorCode_0700',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
            let isAccessToken = canIUse("SystemCapability.Communication.NetManager.Eap");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support eap api.");
                expect(isAccessToken).assertFalse();
                done();
                return;
            } 
            try{                            
                console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0700 replyCustomEapData start");
                eap.replyCustomEapData(3,eapData)
                console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0700 replyCustomEapData success");
                expect().assertFail();
            }catch(error){
                console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0700 replyCustomEapData failed,code is ${error.code}, message is ${error.message}`);
                if(error.code==801){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0700 eap replyCustomEapData is not support`);
                    expect(true).assertTrue();
                }else if(error.code==201){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0700 eap replyCustomEapData permission denied`);
                    expect(true).assertTrue();
                }else if(error.code==33200004){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0700 eap replyCustomEapData invalid result`);
                    expect(true).assertTrue();
                }else if(error.code==33200005){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0700 eap replyCustomEapData invalid size of eap data`);
                    expect().assertFail();
                }else if(error.code==33200009){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0700 eap replyCustomEapData netmanager stop`);
                    expect(true).assertTrue();
                }else if(error.code==33200099){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0700 eap replyCustomEapData internal error`);
                    expect(true).assertTrue();
                }else {
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0700 eap replyCustomEapData undefined errorcode`);
                    expect().assertFail();
                }
            }finally{
                done();
            }
        })
        /**
         * @tc.number SUB_Communication_Netmanager_Eap_ErrorCode_0800
         * @tc.name SUB_Communication_Netmanager_Eap_ErrorCode_0800
         * @tc.desc Test eap reply api functionality.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_Netmanager_Eap_ErrorCode_0800',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
            let isAccessToken = canIUse("SystemCapability.Communication.NetManager.Eap");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support eap api.");
                expect(isAccessToken).assertFalse();
                done();
                return;
            }
            let netId = 100;
            let profile: eap.EthEapProfile = {
              eapMethod: 10,
              phase2Method: 10,
              identity: "identity",
              anonymousIdentity: "anonymousIdentity",
              password: "password",
              caCertAliases: "caCertAliases",
              caPath: "caPath",
              clientCertAliases: "clientCertAliases",
              certEntry: new Uint8Array([5,6,7,8,9,10]),
              certPassword: "certPassword",
              altSubjectMatch: "altSubjectMatch",
              domainSuffixMatch: "domainSuffixMatch",
              realm: "realm",
              plmn: "plmn",
              eapSubId: 1
            };
            try{                            
                console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0800 startEthEap start");
                eap.startEthEap(netId, profile);
                console.info("SUB_Communication_Netmanager_Eap_ErrorCode_0800 startEthEap success");
                expect().assertFail();
            }catch(error){
                console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0800 startEthEap failed,code is ${error.code}, message is ${error.message}`);
                if(error.code==801){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0800 eap startEthEap is not support`);
                    expect(true).assertTrue();
                }else if(error.code==201){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0800 eap startEthEap permission denied`);
                    expect(true).assertTrue();
                }else if(error.code==33200001){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0800 eap startEthEap invalid netId`);
                    expect(true).assertTrue();
                }else if(error.code==33200003){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0800 eap startEthEap invalid profile`);
                    expect(true).assertTrue();
                }else if(error.code==33200009){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0800 eap startEthEap netmanager stop`);
                    expect(true).assertTrue();
                }else if(error.code==33200010){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0800 eap startEthEap invalid eth state.`);
                    expect(true).assertTrue();
                }else if(error.code==33200099){
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0800 eap startEthEap internal error`);
                    expect(true).assertTrue();
                }else {
                    console.error(`SUB_Communication_Netmanager_Eap_ErrorCode_0800 eap startEthEap undefined errorcode`);
                    expect().assertFail();
                }
            }
            done();
        })

    })
}