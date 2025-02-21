/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import rpc from '@ohos.rpc';
import {describe, expect, beforeAll, it} from '@ohos/hypium';
import fileio from '@ohos.fileio';
import FA from '@ohos.ability.featureAbility';
var gIRemoteObject = null;
export default function ActsRpcRequestJsTest() {
    describe('ActsRpcRequestJsTest', function(){
        console.info("-----------------------SUB_DSoftbus_IPC_API_onRemoteMessageRequest_Test is starting-----------------------");
        beforeAll(async function () {
            console.info('beforeAll called');
            gIRemoteObject = new Stub("rpcTestAbility");
            return gIRemoteObject;
        });

        beforeEach(async function (){
            console.info('beforeEach called');
        });

        afterEach(async function (){
            console.info('afterEach called');
        });

        afterAll(async function (){
            console.info('afterAll called');
        });

        const CODE_ASYNC_ONREMOTEMESSAGE = 1;
        const CODE_ONREMOTE_ASYNC_ONREMOTEMESSAGE = 2;
        const CODE_ASHMEMDATA = 3;
        
        function sleep(numberMillis)
        {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
            }
        }       

        class MyregisterDeathRecipient {
            constructor(gIRemoteObject, done) {
                this.gIRemoteObject = gIRemoteObject;
                this.done = done;
            }
 
            onRemoteDied() {
                console.info("server died");
                expect(this.proxy.unregisterDeathRecipient(this, 0)).assertTrue();
                let _done = this.done;
                _done();
                sleep(1000);
            }
        }

        class MySequenceable {
            constructor(num, string) {
                this.num = num;
                this.str = string;
            }
            marshalling(messageParcel) {
                messageParcel.writeInt(this.num);
                messageParcel.writeString(this.str);
                return true;
            }
            unmarshalling(messageParcel) {
                this.num = messageParcel.readInt();
                this.str = messageParcel.readString();
                return true;
            }
        }

        class TestListener extends rpc.RemoteObject {
            constructor(descriptor, checkResult) {
                super(descriptor);
                this.checkResult = checkResult;
            }
            onRemoteRequest(code, data, reply, option) {
                let result = false;
                if (code  == 1) {
                    console.info("onRemoteRequest called, descriptor: " + this.getInterfaceDescriptor());
                    result = true;
                } else {
                    console.info("unknown code: " + code);
                }
                let _checkResult = this.checkResult
                let _num = data.readInt();
                let _str = data.readString();
               
                _checkResult(_num, _str);
                sleep(2000);
                return result;
            }
        }        

        class TestRemoteObject extends rpc.RemoteObject {
            constructor(descriptor) {
                super(descriptor);
            }
        }        

        class Stub extends rpc.RemoteObject {
            constructor(descriptor) {
                super(descriptor);
            }
            onRemoteRequest(code, data, reply, option) {
                try{
                    console.info("onRemoteRequest: " + code);
                    if (code === 2){
                        console.info("case 1 start");
                        let tmp1 = data.readString();
                        let result =  reply.writeString("onRemoteRequest invoking");
                        return true;
                    } else {
                        console.error("onRemoteRequest default case " + code);
                        return super.onRemoteRequest(code, data, reply, option);
                    }
                } catch (error) {
                    console.info("onRemoteRequest error: " + error);
                }
                return false
            }
            async onRemoteMessageRequest(code, data, reply, option) {
                try{
                    if (code === 1){
                        console.info("case 1 start");
                        let tmp1 = data.readString();
                        reply.writeString("async onRemoteMessageRequest invoking");
                    } else if (code === 2){
                        console.info("case 2 start");
                        let tmp1 = data.readString();
                        reply.writeString("async onRemoteMessageRequest invoking");
                    }else if (code === 3){
                        console.info("case 3 start");
                        let tmp1 = data.readAshmem();
                        console.error("async onRemoteMessageRequest default case " + tmp1);
                        reply.writeAshmem(tmp1);
                    }else {
                        console.error("async onRemoteMessageRequest default case " + code);
                        return super.onRemoteMessageRequest(code, data, reply, option);
                    }
                    await new Promise((resolve)=>{
                        console.info("new promise")
                        setTimeout(resolve,100);
                    })
                    return true;
                } catch (error) {
                    console.info("async onRemoteMessageRequest: " + error);
                }
                return false
            }
        }        

        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0100
        * @tc.name    Verifying the processing of the MessageSequence synchronous callback information of the async_onRemoteMessageRequest interface
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */       
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0100", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0100--------------------");
            try{
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = "async onRemoteMessageRequest invoking";
                data.writeString(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0100--------------------");
        });       

        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0200
        * @tc.name    Verifying the processing of the MessageSequence Asynchronous callback information of the async_onRemoteMessageRequest interface
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0200", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0200--------------------");
            try{
                var data = new rpc.MessageSequence();
                var reply = new rpc.MessageSequence();
                var option = new rpc.MessageOption(1);
                let token = "async onRemoteMessageRequest invoking";
                data.writeString(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then(function(result){
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0200--------------------");
        });      

        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0300
        * @tc.name    To test the processing priority of the MessageSequence interface for synchronously invoking 
        *               onRemoteRequest and async_onRemoteMessageRequest callback information
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0300", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0300--------------------");
            try{
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = "onRemoteRequest or async onRemoteMessageRequest invoking";
                data.writeString(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_ONREMOTE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0300--------------------");
        });

        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0400
        * @tc.name    To test the processing priority of the MessageSequence interface for Asynchronously invoking 
        *               onRemoteRequest and async_onRemoteMessageRequest callback information
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0400", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0400--------------------");
            try{
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption(1);
                let token = "onRemoteRequest or async onRemoteMessageRequest invoking";
                data.writeString(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_ONREMOTE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result!=null).assertTrue();
                    expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0400--------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0500
        * @tc.name    Verifying the processing of the MessageParcel synchronous callback information of the async_onRemoteMessageRequest interface
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0500", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0500--------------------");
            try{
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = "async onRemoteMessageRequest invoking";
                var result = data.writeString(token);
                expect(result == true).assertTrue();
                if (gIRemoteObject == undefined)
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0500--------------------");
        });

        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0600
        * @tc.name    Verifying the processing of the MessageParcel Asynchronous callback information of the async_onRemoteMessageRequest interface
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0600", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0600--------------------");
            try{
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption(1);
                let token = 'async onRemoteMessageRequest invoking';
                var result = data.writeString(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0600--------------------");
        });  
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0700
        * @tc.name    To test the processing priority of the MessageParcel interface for synchronously invoking 
        *               onRemoteRequest and async_onRemoteMessageRequest callback information
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0700", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0700--------------------");
            try{
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 'onRemoteRequest or async onRemoteMessageRequest invoking';
                var result = data.writeString(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_ONREMOTE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    var replyReadResult = result.reply.readString();
                    expect(replyReadResult).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0700--------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0800
        * @tc.name    To test the processing priority of the MessageParcel interface for Asynchronously invoking 
        *               onRemoteRequest and async_onRemoteMessageRequest callback information
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0800", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0800--------------------");
            try{
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption(1);
                let token = 'onRemoteRequest or async onRemoteMessageRequest invoking';
                var result = data.writeString(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_ONREMOTE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0800--------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0900
        * @tc.name    Invoke async_onRemoteMessageRequest to process information in synchronization mode and call back in AsyncCallback mode
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0900", 0, function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0900--------------------");
            try{
                function sendMessageRequestCallback(result) {
                    try{
                        expect(result.errCode).assertEqual(0);
                        expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                    } catch(e) {
                        expect(e == null).assertTrue();
                    }finally{
                        data.reclaim();
                        reply.reclaim();
                        done();
                    }
                }
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = "onRemoteRequest or async onRemoteMessageRequest invoking";
                data.writeString(token);
                console.info("start sendMessageRequestCallback");
                gIRemoteObject.sendMessageRequest(CODE_ASYNC_ONREMOTEMESSAGE, data, reply, option, sendMessageRequestCallback);
            } catch (error) {
                expect(error == null).assertTrue();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_0900--------------------");
        });

        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1000
        * @tc.name    Invoke async_onRemoteMessageRequest to process information in asynchronous mode and call back in AsyncCallback mode
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1000", 0, function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1000--------------------");
            try{
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption(1);
                let token = "onRemoteRequest or async onRemoteMessageRequest invoking";
                data.writeString(token);
                function sendMessageRequestCallback(result) {
                    try{
                        expect(result.errCode).assertEqual(0);
                        expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                    } catch(e) {
                        expect(e == null).assertTrue();
                    }finally{
                        data.reclaim();
                        reply.reclaim();
                        done();
                    }
                }
                console.info("start sendMessageRequestCallback");
                gIRemoteObject.sendMessageRequest(CODE_ASYNC_ONREMOTEMESSAGE, data, reply, option,sendMessageRequestCallback);
            } catch (error) {
                expect(error == null).assertTrue();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1000--------------------");
        });

        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1100
        * @tc.name    Test the function of serializing the writeAshmem interface in MessageSequence mode
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1100", 0, function(){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1100--------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ashmem = rpc.Ashmem.create("ashmem", 1024);
                data.writeAshmem(ashmem);
                let ashmemdata = data.readAshmem();
                expect(ashmemdata != null).assertTrue();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1100--------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1200
        * @tc.name    Test the function of serializing the readAshmem interface in MessageSequence mode
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1200", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1200--------------------");
            try{
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let ashmem = rpc.Ashmem.create("ashmem", 1024);
                data.writeAshmem(ashmem);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_ASHMEMDATA, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let replyReadResult = result.reply.readAshmem();
                    expect(replyReadResult != null).assertTrue();
                });
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1200--------------------");
        });  
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1300
        * @tc.name    Test the function of serializing the writeAshmem interface in MessageParcel mode
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1300", 0, function(){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1300--------------------");
            try{
                var data = rpc.MessageParcel.create();
                let ashmem = rpc.Ashmem.create("ashmem", 1024);
                let weitedata = data.writeAshmem(ashmem);
                expect(weitedata).assertTrue();
                let ashmemdata = data.readAshmem();
                expect(ashmemdata != null).assertTrue();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1300--------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1400
        * @tc.name    Test the function of serializing the readAshmem interface in MessageParcel mode
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1400", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1400--------------------");
            try{
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let ashmem = rpc.Ashmem.create("ashmem", 1024);
                let weitedata = data.writeAshmem(ashmem);
                expect(weitedata).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_ASHMEMDATA, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let replyReadResult = result.reply.readAshmem();
                    expect(replyReadResult != null).assertTrue();
                });
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1400--------------------");
        });  
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1500
        * @tc.name    To test the function of handling the exception of the writeAshmem interface in MessageSequence mode
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1500", 0, function(){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1500--------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ashmem = "";
                data.writeAshmem(ashmem);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }finally{
                data.reclaim();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1500--------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1600
        * @tc.name    To test the function of handling the exception of the writeAshmem interface in MessageParcel mode
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1600", 0, function(){
            console.info("--------------------start SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1600--------------------");
            try{
                var data = rpc.MessageParcel.create();
                let weitedata = data.writeAshmem();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                expect(error != null).assertTrue();
            }finally{
                data.reclaim();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_onRemoteMessageRequest_1600--------------------");
        });         

        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_00100
        * @tc.name    writeRemoteObject is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let testRemoteObject = new TestRemoteObject("testObject");
                data.reclaim();
                data.writeRemoteObject(testRemoteObject);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0100---------------------------");
        });        
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_0200
        * @tc.name    readRemoteObject is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0200---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let testRemoteObject = new TestRemoteObject("testObject");
                data.writeRemoteObject(testRemoteObject);
                data.reclaim();
                data.readRemoteObject();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } 
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0200---------------------------");
        });         
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_0300
        * @tc.name    readRemoteObject is proxy or remote object is invalid Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.readRemoteObject();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.PROXY_OR_REMOTE_OBJECT_INVALID_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally{
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0300---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_0400
        * @tc.name    writeInterfaceToken is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeInterfaceToken("rpctest");
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0400---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_0500
        * @tc.name    readInterfaceToken is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeInterfaceToken("rpctest");
                data.reclaim();
                data.readInterfaceToken();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0500---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_0600
        * @tc.name    setSize is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.setSize(0);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0600---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_0700
        * @tc.name    setCapacity is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.setCapacity(64);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0700---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_0800
        * @tc.name    rewindRead is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.rewindRead(0);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0800---------------------------");
        });  
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_0900
        * @tc.name    rewindWrite is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.rewindWrite(0);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0900---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_1000
        * @tc.name    writeByte is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeByte(2);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1000---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_1100
        * @tc.name    readByte is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.readByte();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1100---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_1200
        * @tc.name    writeShort is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1200---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeShort(0);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1200---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_1300
        * @tc.name    readShort is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeShort(0);
                data.reclaim();
                data.readShort();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1300---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_1400
        * @tc.name    writeInt is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeInt(0);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1400---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_1500
        * @tc.name    readInt is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeInt(0);
                data.reclaim();
                data.readInt();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1500---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_1600
        * @tc.name    writeLong is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeLong(0);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1600---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_1700
        * @tc.name    readLong is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeLong(0);
                data.reclaim();
                data.readLong();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1700---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_1800
        * @tc.name    writeFloat is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeFloat(1.0);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1800---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_1900
        * @tc.name    readFloat is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeFloat(1.0);
                data.reclaim();
                data.readFloat();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1900---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_2000
        * @tc.name    writeDouble is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeDouble(1.0);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2000---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_2100
        * @tc.name    readDouble is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeDouble(1.0);
                data.reclaim();
                data.readDouble();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2100---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_2200
        * @tc.name    writeBoolean is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2200---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeBoolean(true);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2200---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_2300
        * @tc.name    readBoolean is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeBoolean(true);
                data.reclaim();
                data.readBoolean();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2300---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_2400
        * @tc.name    writeChar is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeChar(56);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2400---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_2500
        * @tc.name    readChar is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeChar(56);
                data.reclaim();
                data.readChar();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2500---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_2600
        * @tc.name    writeString is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeString("rpc");
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2600---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_2700
        * @tc.name    readString is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeString("rpc");
                data.reclaim();
                data.readString();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2700---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_2800
        * @tc.name    writeParcelable is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let sequenceable = new MySequenceable(1, "aaa");
                data.reclaim();
                data.writeParcelable(sequenceable);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2800---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_2900
        * @tc.name    writeParcelable is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let sequenceable = new MySequenceable(1, "aaa");
                data.writeParcelable(sequenceable);
                let ret = new MySequenceable(0, "");
                data.reclaim();
                data.readParcelable(ret);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2900---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_3000
        * @tc.name    writeByteArray is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [1, 2, 3, 4, 5];
                data.reclaim();
                data.writeByteArray(ByteArrayVar);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3000---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_3100
        * @tc.name    readByteArray is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [1, 2, 3, 4, 5];
                data.writeByteArray(ByteArrayVar);
                data.reclaim();
                data.readByteArray();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3100---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_3200
        * @tc.name    writeShortArray is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3200---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [1, 2, 3, 4, 5];
                data.reclaim();
                data.writeShortArray(ByteArrayVar);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3200---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_3300
        * @tc.name    readShortArray is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [1, 2, 3, 4, 5];
                data.writeShortArray(ByteArrayVar);
                data.reclaim();
                data.readShortArray();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3300---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_3400
        * @tc.name    writeIntArray is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [1, 2, 3, 4, 5];
                data.reclaim();
                data.writeIntArray(ByteArrayVar);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3400---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_3500
        * @tc.name    readIntArray is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [1, 2, 3, 4, 5];
                data.writeIntArray(ByteArrayVar);
                data.reclaim();
                data.readIntArray();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3500---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_3600
        * @tc.name    writeLongArray is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [1, 2, 3, 4, 5];
                data.reclaim();
                data.writeLongArray(ByteArrayVar);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3600---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_3700
        * @tc.name    readLongArray is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [1, 2, 3, 4, 5];
                data.writeLongArray(ByteArrayVar);
                data.reclaim();
                data.readLongArray();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3700---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_3800
        * @tc.name    writeFloatArray is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [1.1, 2.2, 3.3];
                data.reclaim();
                data.writeFloatArray(ByteArrayVar);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3800---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_3900
        * @tc.name    readFloatArray is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [1.1, 2.2, 3.3];
                data.writeFloatArray(ByteArrayVar);
                data.reclaim();
                data.readFloatArray();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3900---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_4000
        * @tc.name    writeDoubleArray is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [11.1, 22.2, 33.3];
                data.reclaim();
                data.writeDoubleArray(ByteArrayVar);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4000---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_4100
        * @tc.name    readDoubleArray is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [11.1, 22.2, 33.3];
                data.writeDoubleArray(ByteArrayVar);
                data.reclaim();
                data.readDoubleArray();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4100---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_4200
        * @tc.name    writeBooleanArray is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4200---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [false, true, false];
                data.reclaim();
                data.writeBooleanArray(ByteArrayVar);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4200---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_4300
        * @tc.name    readBooleanArray is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [false, true, false];
                data.writeBooleanArray(ByteArrayVar);
                data.reclaim();
                data.readBooleanArray();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4300---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_4400
        * @tc.name    writeCharArray is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [97, 98, 88];
                data.reclaim();
                data.writeCharArray(ByteArrayVar);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4400---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_4500
        * @tc.name    readCharArray is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = [97, 98, 88];
                data.writeCharArray(ByteArrayVar);
                data.reclaim();
                data.readCharArray();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4500---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_4600
        * @tc.name    writeStringArray is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = ["abc", "def"];
                data.reclaim();
                data.writeStringArray(ByteArrayVar);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4600---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_4700
        * @tc.name    readStringArray is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ByteArrayVar = ["abc", "def"];
                data.writeStringArray(ByteArrayVar);
                data.reclaim();
                data.readStringArray();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4700---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_4800
        * @tc.name    writeNoException is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeNoException();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4800---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_4900
        * @tc.name    readException is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.readException();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4900 ---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_5000
        * @tc.name    writeParcelableArray is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_5000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_5000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let a = [new MySequenceable(1, "aaa"), new MySequenceable(2, "bbb"),
                new MySequenceable(3, "ccc")];
                data.reclaim();
                data.writeParcelableArray(a);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5000---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_5100
        * @tc.name    readParcelableArray is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_5100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_5100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let a = [new MySequenceable(1, "aaa"), new MySequenceable(2, "bbb"),
                new MySequenceable(3, "ccc")];
                let b = [new MySequenceable(0, ""), new MySequenceable(0, ""), new MySequenceable(0, "")];
                data.writeParcelableArray(a);
                data.reclaim();
                data.readParcelableArray(b);                
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5100 ---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_5200
        * @tc.name    writeRemoteObjectArray is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_5200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_5200---------------------------");
            try{
                let count = 0;
                function checkResult(num, str) {
                    expect(num).assertEqual(123);
                    expect(str).assertEqual("rpcListenerTest");
                    count++;
                    console.info("check result done, count: " + count);
                    if (count == 3) {
                        done();
                    }
                }
                var data = rpc.MessageSequence.create();
                let listeners = [new TestListener("rpcListener", checkResult),
                    new TestListener("rpcListener2", checkResult),
                    new TestListener("rpcListener3", checkResult)];
                data.reclaim();
                data.writeRemoteObjectArray(listeners);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5200---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_5300
        * @tc.name    readRemoteObjectArray is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_5300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_5300---------------------------");
            try{
                let count = 0;
                function checkResult(num, str) {
                    expect(num).assertEqual(123);
                    expect(str).assertEqual("rpcListenerTest");
                    count++;
                    console.info("check result done, count: " + count);
                    if (count == 3) {
                        done();
                    }
                }
                var data = rpc.MessageSequence.create();
                let listeners = [new TestListener("rpcListener", checkResult),
                    new TestListener("rpcListener2", checkResult),
                    new TestListener("rpcListener3", checkResult)];
                data.writeRemoteObjectArray(listeners);
                data.reclaim();
                data.readRemoteObjectArray();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5300 ---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_5400
        * @tc.name    dupFileDescriptor is call os dup function failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_5400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_5400---------------------------");
            try{
                rpc.MessageSequence.dupFileDescriptor(-1);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.OS_DUP_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5400 ---------------------------");
        });         
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_5500
        * @tc.name    writeFileDescriptor is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_5500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_5500---------------------------");
            try{
                let context = FA.getContext();
                await context.getFilesDir().then(async function(path) {
                    expect(path != null).assertTrue();
                    let basePath = path;
                    let filePath = basePath + "/test1.txt";
                    let fd = fileio.openSync(filePath, 0o2| 0o100 | 0o2000, 0o666);
                    var data = rpc.MessageSequence.create();
                    data.reclaim();
                    data.writeFileDescriptor(fd);
                })
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5500 ---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_5600
        * @tc.name    readFileDescriptor is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_5600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_5600---------------------------");
            try{
                let context = FA.getContext();
                await context.getFilesDir().then(async function(path) {
                    expect(path != null).assertTrue();
                    let basePath = path;
                    let filePath = basePath + "/test1.txt";
                    let fd = fileio.openSync(filePath, 0o2| 0o100 | 0o2000, 0o666);
                    var data = rpc.MessageSequence.create();
                    data.writeFileDescriptor(fd);
                    data.reclaim();
                    data.readFileDescriptor();
                })
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5600 ---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_5700
        * @tc.name    writeAshmem is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_5700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_5700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ashmem = rpc.Ashmem.create("JsAshmemTest", 1024);
                data.reclaim();
                data.writeAshmem(ashmem);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5700 ---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_5800
        * @tc.name     readAshmem is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_5800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_5800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ashmem = rpc.Ashmem.create("JsAshmemTest", 1024);
                data.writeAshmem(ashmem);
                data.reclaim();
                data.readAshmem();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5800 ---------------------------");
        }); 
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_5900
        * @tc.name    writeRawData is write data to message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_5900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_5900---------------------------");
            try{
                var data = new rpc.MessageSequence();
                let arr = ["aaa", 1, 2, 3];
                data.reclaim();
                data.writeRawData(arr, arr.length);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5900 ---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_6000
        * @tc.name    readRawData is read data from message sequence failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_6000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_6000---------------------------");
            try{
                var data = new rpc.MessageSequence();
                let rawdata = [1, 2, 3]
                data.writeRawData(rawdata, rawdata.length);
                data.reclaim();
                data.readRawData(rawdata.length);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_6000 ---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_6100
        * @tc.name    registerDeathRecipient is only proxy object permitted Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_6100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_6100---------------------------");
            try{
                let recipient = new MyregisterDeathRecipient(gIRemoteObject, null);
                gIRemoteObject.registerDeathRecipient(recipient, 0)
            } catch (error) {
                let errCode = `${rpc.ErrorCode.ONLY_PROXY_OBJECT_PERMITTED_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_6100 ---------------------------");
        });
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_6200
        * @tc.name    unregisterDeathRecipient is only proxy object permitted Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_6200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_6200---------------------------");
            try{
                let recipient = new MyregisterDeathRecipient(gIRemoteObject, null);
                gIRemoteObject.unregisterDeathRecipient(recipient, 0);
            } catch (error) {
                let errCode = `${rpc.ErrorCode.ONLY_PROXY_OBJECT_PERMITTED_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_6200 ---------------------------");
        });      
        
        /*
        * @tc.number  SUB_DSoftbus_IPC_API_Errorcode_6300
        * @tc.name    writeAshmem is write to ashmem failed Error verification
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3   
        * @tc.type    Compatibility
        * @tc.size    MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_6300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_6300---------------------------");
            try{
                let ashmem = rpc.Ashmem.create("ashmem", 4);
                ashmem.mapReadWriteAshmem();
                let ByteArrayVar = [1, 2, 3, 4, 5];
                ashmem.writeAshmem(ByteArrayVar, 5, 0);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                let errCode = `${rpc.ErrorCode.WRITE_TO_ASHMEM_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_6300 ---------------------------");
        });        
        console.info("-----------------------SUB_DSoftbus_IPC_API_onRemoteMessageRequest_Test is end-----------------------");
    });
}
