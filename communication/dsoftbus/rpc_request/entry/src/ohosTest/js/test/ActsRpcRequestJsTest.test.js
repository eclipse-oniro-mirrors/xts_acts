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
        console.info("-----------------------SUB_DSoftbus_IPC_API_OnRemoteRequest_Test is starting-----------------------");
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
            constructor(gIRemoteObject) {
                this.gIRemoteObject = gIRemoteObject;
            }
            onRemoteDied() {
                console.info("server died");
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
                this.modifyLocalInterface(this, descriptor);
            }
            asObject() {
                return this;
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
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_0100
        * @tc.name   : Verifying the processing of the MessageSequence synchronous callback information of the async_onRemoteMessageRequest interface
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */       
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_0100", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_0100--------------------");
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_0100--------------------");
        });       

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_0200
        * @tc.name   : Verifying the processing of the MessageSequence Asynchronous callback information of the async_onRemoteMessageRequest interface
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_0200", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_0200--------------------");
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_0200--------------------");
        });      

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_0300
        * @tc.name   : To test the processing priority of the MessageSequence interface for synchronously invoking 
        *               onRemoteRequest and async_onRemoteMessageRequest callback information
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_0300", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_0300--------------------");
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_0300--------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_0400
        * @tc.name   : To test the processing priority of the MessageSequence interface for Asynchronously invoking 
        *               onRemoteRequest and async_onRemoteMessageRequest callback information
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_0400", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_0400--------------------");
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_0400--------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_0500
        * @tc.name   : Verifying the processing of the MessageParcel synchronous callback information of the async_onRemoteMessageRequest interface
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_0500", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_0500--------------------");
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_0500--------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_0600
        * @tc.name   : Verifying the processing of the MessageParcel Asynchronous callback information of the async_onRemoteMessageRequest interface
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_0600", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_0600--------------------");
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_0600--------------------");
        });  
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_0700
        * @tc.name   : To test the processing priority of the MessageParcel interface for synchronously invoking 
        *               onRemoteRequest and async_onRemoteMessageRequest callback information
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_0700", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_0700--------------------");
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_0700--------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_0800
        * @tc.name   : To test the processing priority of the MessageParcel interface for Asynchronously invoking 
        *               onRemoteRequest and async_onRemoteMessageRequest callback information
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_0800", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_0800--------------------");
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_0800--------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_0900
        * @tc.name   : Invoke async_onRemoteMessageRequest to process information in synchronization mode and call back in AsyncCallback mode
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_0900", 0, function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_0900--------------------");
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_0900--------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_1000
        * @tc.name   : Invoke async_onRemoteMessageRequest to process information in asynchronous mode and call back in AsyncCallback mode
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_1000", 0, function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_1000--------------------");
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_1000--------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_1100
        * @tc.name   : Test the function of serializing the writeAshmem interface in MessageSequence mode
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_1100", 0, function(){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_1100--------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ashmem = rpc.Ashmem.create("ashmem", 1024);
                data.writeAshmem(ashmem);
                let ashmemdata = data.readAshmem();
                expect(ashmemdata != null).assertTrue();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_1100--------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_1200
        * @tc.name   : Test the function of serializing the readAshmem interface in MessageSequence mode
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_1200", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_1200--------------------");
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_1200--------------------");
        });  
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_1300
        * @tc.name   : Test the function of serializing the writeAshmem interface in MessageParcel mode
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_1300", 0, function(){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_1300--------------------");
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_1300--------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_1400
        * @tc.name   : Test the function of serializing the readAshmem interface in MessageParcel mode
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_1400", 0, async function(done){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_1400--------------------");
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_1400--------------------");
        });  
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_1500
        * @tc.name   : To test the function of handling the exception of the writeAshmem interface in MessageSequence mode
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_1500", 0, function(){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_1500--------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ashmem = "";
                data.writeAshmem(ashmem);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }finally{
                data.reclaim();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_1500--------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_OnRemoteRequest_1600
        * @tc.name   : To test the function of handling the exception of the writeAshmem interface in MessageParcel mode
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_OnRemoteRequest_1600", 0, function(){
            console.info("--------------------start SUB_DSoftbus_IPC_API_OnRemoteRequest_1600--------------------");
            try{
                var data = rpc.MessageParcel.create();
                let weitedata = data.writeAshmem();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error != null).assertTrue();
            }finally{
                data.reclaim();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_OnRemoteRequest_1600--------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_0000
        * @tc.name   : test errorcode data verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0000---------------------------");
            try{
                let errCode401 = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
                expect(errCode401).assertEqual("401");
                let errCode1900001 = `${rpc.ErrorCode.OS_MMAP_ERROR}`;
                expect(errCode1900001).assertEqual("1900001");
                let errCode1900002 = `${rpc.ErrorCode.OS_IOCTL_ERROR}`;
                expect(errCode1900002).assertEqual("1900002");
                let errCode1900003 = `${rpc.ErrorCode.WRITE_TO_ASHMEM_ERROR}`;
                expect(errCode1900003).assertEqual("1900003");
                let errCode1900004 = `${rpc.ErrorCode.READ_FROM_ASHMEM_ERROR}`;
                expect(errCode1900004).assertEqual("1900004");
                let errCode1900005 = `${rpc.ErrorCode.ONLY_PROXY_OBJECT_PERMITTED_ERROR}`;
                expect(errCode1900005).assertEqual("1900005");
                let errCode1900006 = `${rpc.ErrorCode.ONLY_REMOTE_OBJECT_PERMITTED_ERROR}`;
                expect(errCode1900006).assertEqual("1900006");
                let errCode1900007 = `${rpc.ErrorCode.COMMUNICATION_ERROR}`;
                expect(errCode1900007).assertEqual("1900007");
                let errCode1900008 = `${rpc.ErrorCode.PROXY_OR_REMOTE_OBJECT_INVALID_ERROR}`;
                expect(errCode1900008).assertEqual("1900008");
                let errCode1900009 = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(errCode1900009).assertEqual("1900009");
                let errCode1900010 = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(errCode1900010).assertEqual("1900010");
                let errCode1900011 = `${rpc.ErrorCode.PARCEL_MEMORY_ALLOC_ERROR}`;
                expect(errCode1900011).assertEqual("1900011");
                let errCode1900012 = `${rpc.ErrorCode.CALL_JS_METHOD_ERROR}`;
                expect(errCode1900012).assertEqual("1900012");
                let errCode1900013 = `${rpc.ErrorCode.OS_DUP_ERROR}`;
                expect(errCode1900013).assertEqual("1900013");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.message == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0000---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_0100
        * @tc.name   : writeRemoteObject is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let testRemoteObject = new TestRemoteObject("testObject");
                data.reclaim();
                data.writeRemoteObject(testRemoteObject);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0100---------------------------");
        });        
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_0200
        * @tc.name   : readRemoteObject is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            } 
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0200---------------------------");
        });         
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_0300
        * @tc.name   : readRemoteObject is proxy or remote object is invalid Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.readRemoteObject();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900008).assertTrue();
                expect(error.message != null).assertTrue();
            } finally{
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0300---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_0400
        * @tc.name   : writeInterfaceToken is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeInterfaceToken("rpctest");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0400---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_0500
        * @tc.name   : readInterfaceToken is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeInterfaceToken("rpctest");
                data.reclaim();
                data.readInterfaceToken();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0500---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_0600
        * @tc.name   : setSize is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.setSize(0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0600---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_0700
        * @tc.name   : setCapacity is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.setCapacity(64);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0700---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_0800
        * @tc.name   : rewindRead is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.rewindRead(0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0800---------------------------");
        });  
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_0900
        * @tc.name   : rewindWrite is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_0900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_0900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.rewindWrite(0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_0900---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_1000
        * @tc.name   : writeByte is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeByte(2);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1000---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_1100
        * @tc.name   : readByte is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.readByte();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1100---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_1200
        * @tc.name   : writeShort is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1200---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeShort(0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1200---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_1300
        * @tc.name   : readShort is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeShort(0);
                data.reclaim();
                data.readShort();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1300---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_1400
        * @tc.name   : writeInt is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeInt(0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1400---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_1500
        * @tc.name   : readInt is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeInt(0);
                data.reclaim();
                data.readInt();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1500---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_1600
        * @tc.name   : writeLong is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeLong(0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1600---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_1700
        * @tc.name   : readLong is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeLong(0);
                data.reclaim();
                data.readLong();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1700---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_1800
        * @tc.name   : writeFloat is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeFloat(1.0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1800---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_1900
        * @tc.name   : readFloat is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_1900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_1900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeFloat(1.0);
                data.reclaim();
                data.readFloat();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_1900---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_2000
        * @tc.name   : writeDouble is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeDouble(1.0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2000---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_2100
        * @tc.name   : readDouble is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeDouble(1.0);
                data.reclaim();
                data.readDouble();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2100---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_2200
        * @tc.name   : writeBoolean is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2200---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeBoolean(true);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2200---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_2300
        * @tc.name   : readBoolean is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeBoolean(true);
                data.reclaim();
                data.readBoolean();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2300---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_2400
        * @tc.name   : writeChar is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeChar(56);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2400---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_2500
        * @tc.name   : readChar is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeChar(56);
                data.reclaim();
                data.readChar();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2500---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_2600
        * @tc.name   : writeString is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeString("rpc");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2600---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_2700
        * @tc.name   : readString is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeString("rpc");
                data.reclaim();
                data.readString();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2700---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_2800
        * @tc.name   : writeParcelable is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_2800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_2800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let sequenceable = new MySequenceable(1, "aaa");
                data.reclaim();
                data.writeParcelable(sequenceable);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2800---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_2900
        * @tc.name   : writeParcelable is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_2900---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_3000
        * @tc.name   : writeByteArray is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [1, 2, 3, 4, 5];
                data.reclaim();
                data.writeByteArray(ArrayVar);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3000---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_3100
        * @tc.name   : readByteArray is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [1, 2, 3, 4, 5];
                data.writeByteArray(ArrayVar);
                data.reclaim();
                data.readByteArray();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3100---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_3200
        * @tc.name   : writeShortArray is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3200---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [1, 2, 3, 4, 5];
                data.reclaim();
                data.writeShortArray(ArrayVar);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3200---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_3300
        * @tc.name   : readShortArray is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [1, 2, 3, 4, 5];
                data.writeShortArray(ArrayVar);
                data.reclaim();
                data.readShortArray();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3300---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_3400
        * @tc.name   : writeIntArray is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [1, 2, 3, 4, 5];
                data.reclaim();
                data.writeIntArray(ArrayVar);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3400---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_3500
        * @tc.name   : readIntArray is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [1, 2, 3, 4, 5];
                data.writeIntArray(ArrayVar);
                data.reclaim();
                data.readIntArray();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3500---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_3600
        * @tc.name   : writeLongArray is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [1, 2, 3, 4, 5];
                data.reclaim();
                data.writeLongArray(ArrayVar);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3600---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_3700
        * @tc.name   : readLongArray is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [1, 2, 3, 4, 5];
                data.writeLongArray(ArrayVar);
                data.reclaim();
                data.readLongArray();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3700---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_3800
        * @tc.name   : writeFloatArray is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [1.1, 2.2, 3.3];
                data.reclaim();
                data.writeFloatArray(ArrayVar);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3800---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_3900
        * @tc.name   : readFloatArray is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_3900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_3900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [1.1, 2.2, 3.3];
                data.writeFloatArray(ArrayVar);
                data.reclaim();
                data.readFloatArray();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_3900---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_4000
        * @tc.name   : writeDoubleArray is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [11.1, 22.2, 33.3];
                data.reclaim();
                data.writeDoubleArray(ArrayVar);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4000---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_4100
        * @tc.name   : readDoubleArray is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [11.1, 22.2, 33.3];
                data.writeDoubleArray(ArrayVar);
                data.reclaim();
                data.readDoubleArray();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4100---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_4200
        * @tc.name   : writeBooleanArray is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4200---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [false, true, false];
                data.reclaim();
                data.writeBooleanArray(ArrayVar);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4200---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_4300
        * @tc.name   : readBooleanArray is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [false, true, false];
                data.writeBooleanArray(ArrayVar);
                data.reclaim();
                data.readBooleanArray();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4300---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_4400
        * @tc.name   : writeCharArray is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [97, 98, 88];
                data.reclaim();
                data.writeCharArray(ArrayVar);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4400---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_4500
        * @tc.name   : readCharArray is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = [97, 98, 88];
                data.writeCharArray(ArrayVar);
                data.reclaim();
                data.readCharArray();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4500---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_4600
        * @tc.name   : writeStringArray is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = ["abc", "def"];
                data.reclaim();
                data.writeStringArray(ArrayVar);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4600---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_4700
        * @tc.name   : readStringArray is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ArrayVar = ["abc", "def"];
                data.writeStringArray(ArrayVar);
                data.reclaim();
                data.readStringArray();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4700---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_4800
        * @tc.name   : writeNoException is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeNoException();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4800---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_4900
        * @tc.name   : readException is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_4900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_4900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                data.readException();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_4900 ---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_5000
        * @tc.name   : writeParcelableArray is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5000---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_5100
        * @tc.name   : readParcelableArray is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5100 ---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_5200
        * @tc.name   : writeRemoteObjectArray is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5200---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_5300
        * @tc.name   : readRemoteObjectArray is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5300 ---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_5400
        * @tc.name   : dupFileDescriptor is call os dup function failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_5400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_5400---------------------------");
            try{
                rpc.MessageSequence.dupFileDescriptor(-1);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900013).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5400 ---------------------------");
        });         
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_5500
        * @tc.name   : writeFileDescriptor is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5500 ---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_5600
        * @tc.name   : readFileDescriptor is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5600 ---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_5700
        * @tc.name   : writeAshmem is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5700 ---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_5800
        * @tc.name   :  readAshmem is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5800 ---------------------------");
        }); 
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_5900
        * @tc.name   : writeRawData is write data to message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_5900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_5900---------------------------");
            try{
                var data = new rpc.MessageSequence();
                let arr = ["aaa", 1, 2, 3];
                data.reclaim();
                data.writeRawData(arr, arr.length);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_5900 ---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_6000
        * @tc.name   : readRawData is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
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
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_6000 ---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_6100
        * @tc.name   : registerDeathRecipient is only proxy object permitted Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_6100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_6100---------------------------");
            try{
                let recipient = new MyregisterDeathRecipient(gIRemoteObject, null);
                gIRemoteObject.registerDeathRecipient(recipient, 0)
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900005).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_6100 ---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_6200
        * @tc.name   : unregisterDeathRecipient is only proxy object permitted Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_6200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_6200---------------------------");
            try{
                let recipient = new MyregisterDeathRecipient(gIRemoteObject, null);
                gIRemoteObject.unregisterDeathRecipient(recipient, 0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900005).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_6200 ---------------------------");
        });      
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_6300
        * @tc.name   : writeAshmem is write to ashmem failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_6300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_6300---------------------------");
            try{
                let ashmem = rpc.Ashmem.create("ashmem", 4);
                ashmem.mapReadWriteAshmem();
                let ArrayVar = [1, 2, 3, 4, 5];
                ashmem.writeAshmem(ArrayVar, 5, 0);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900003).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_6300 ---------------------------");
        });
        
        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_6400
        * @tc.name   : test The input parameter type of the writeRemoteObject interface is incorrect
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_6400", 0, async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_6400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeRemoteObject(rpc.RemoteObject);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_6400 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_6500
        * @tc.name   : test writeRemoteObject interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_6500", 0, async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_6500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeRemoteObject();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_6500 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_6600
        * @tc.name   : test writeInterfaceToken interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_6600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_6600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let token = 123;
                data.writeInterfaceToken(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_6600 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_6700
        * @tc.name   : test writeInterfaceToken interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_6700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_6700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeInterfaceToken("token","error");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_6700 ---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_Errorcode_6800
         * @tc.name    : test writeInterfaceToken interface, string length too large
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_Errorcode_6800", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_6800---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = "";
                for (let i = 0; i < 40 * 1024; i++) {
                    token += 'a';
                };
                data.writeInterfaceToken(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_6800---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_6900
        * @tc.name   : test setSize interface, type mismatch for parameter value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_6900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_6900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let token = true;
                data.setSize(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_6900 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_7000
        * @tc.name   : test setSize interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_7000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_7000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.setSize();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_7000 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_7100
        * @tc.name   : test setCapacity interface, type mismatch for parameter value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_7100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_7100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let token = true;
                data.setCapacity(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_7100 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_7200
        * @tc.name   : test setCapacity interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_7200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_7200---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.setCapacity();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_7200 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_7300
        * @tc.name   : test rewindRead interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_7300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_7300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let token = true;
                data.rewindRead(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_7300 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_7400
        * @tc.name   : test rewindRead interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_7400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_7400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.rewindRead();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_7400 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_7500
        * @tc.name   : test rewindWrite interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_7500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_7500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let token = true;
                data.rewindWrite(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_7500 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_7600
        * @tc.name   : test rewindWrite interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_7600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_7600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.rewindWrite();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_7600 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_7700
        * @tc.name   : test writeByte interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_7700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_7700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeByte("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_7700 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_7800
        * @tc.name   : test writeByte interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_7800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_7800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeByte();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_7800 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_7900
        * @tc.name   : test writeShort interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_7900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_7900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let token = "The type does not match";
                data.writeShort(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_7900 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_8000
        * @tc.name   : test writeShort interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_8000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_8000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeShort();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_8000 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_8100
        * @tc.name   : test writeInt interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_8100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_8100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let token = "The type does not match";
                data.writeInt(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_8100 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_8200
        * @tc.name   : test writeInt interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_8200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_8200---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeInt();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_8200 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_8300
        * @tc.name   : test writeLong interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_8300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_8300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let token = "The type does not match";
                data.writeLong(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_8300 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_8400
        * @tc.name   : test writeLong interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_8400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_8400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeLong();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_8400 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_8500
        * @tc.name   : test writeFloat interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_8500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_8500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let token = "The type does not match";
                data.writeFloat(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_8500 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_8600
        * @tc.name   : test writeFloat interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_8600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_8600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeFloat();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_8600 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_8700
        * @tc.name   : test writeDouble interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_8700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_8700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let token = "The type does not match";
                data.writeDouble(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_8700 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_8800
        * @tc.name   : test writeDouble interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_8800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_8800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeDouble();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_8800 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_8900
        * @tc.name   : test writeBoolean interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_8900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_8900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let token = "The type does not match";
                data.writeBoolean(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_8900 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_9000
        * @tc.name   : test writeBoolean interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_9000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_9000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeBoolean();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_9000 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_9100
        * @tc.name   : test writeChar interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_9100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_9100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let token = "The type does not match";
                data.writeChar(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_9100 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_9200
        * @tc.name   : test writeChar interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_9200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_9200---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeChar();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_9200 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_9300
        * @tc.name   : test writeString interface, type mismatch for parameter value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_9300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_9300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let token = 123;
                data.writeString(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_9300 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_9400
        * @tc.name   : test writeString interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_9400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_9400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeString();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_9400 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_9500
        * @tc.name   : test writeString interface, string length too large value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_9500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_9500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let token = "";
                for (let i = 0; i < 40 * 1024; i++) {
                    token += 'a';
                };
                data.writeString(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_9500 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_9600
        * @tc.name   : test writeParcelable interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_9600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_9600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeParcelable();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_9600 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_9700
        * @tc.name   : test writeParcelable interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_9700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_9700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let sequenceable = new MySequenceable(1, "aaa");
                data.writeParcelable(sequenceable,0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_9700 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_9800
        * @tc.name   : test readParcelable interface, null value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_9800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_9800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.readParcelable();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_9800 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_9900
        * @tc.name   : test readParcelable is Call JS callback function failedv Error message verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_9900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_9900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                let ret = new MySequenceable(1, "");
                data.readParcelable(ret);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900012).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_9900 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_10000
        * @tc.name   : test writeByteArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_10000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_10000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeByteArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_10000 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_10100
        * @tc.name   : test readByteArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_10100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_10100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.readByteArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_10100 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_10200
        * @tc.name   : test readByteArray interface, requires 1 parameters value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_10200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_10200---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeStringArray(["a","b","c"]);
                data.readByteArray();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_10200 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_10300
        * @tc.name   : readByteArray newArr is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_10300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_10300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                let newArr = new Array(5);
                data.readByteArray(newArr);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_10300---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_10400
        * @tc.name   : test writeShortArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_10400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_10400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeShortArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_10400 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_10500
        * @tc.name   : test readShortArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_10500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_10500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.readShortArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_10500 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_10600
        * @tc.name   : test readShortArray interface, requires 1 parameters value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_10600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_10600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeStringArray(["a","b","c"]);
                data.readShortArray();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_10600 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_10700
        * @tc.name   : readShortArray newArr is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_10700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_10700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                let newArr = new Array(5);
                data.readShortArray(newArr);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_10700---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_10800
        * @tc.name   : test writeIntArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_10800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_10800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeIntArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_10800 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_10900
        * @tc.name   : test readIntArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_10900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_10900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.readIntArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_10900 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_11000
        * @tc.name   : test readIntArray interface, requires 1 parameters value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_11000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_11000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeStringArray(["a","b","c"]);
                data.readIntArray();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_11000 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_11100
        * @tc.name   : readIntArray newArr is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_11100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_11100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                let newArr = new Array(5);
                data.readIntArray(newArr);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_11100---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_11200
        * @tc.name   : test writeLongArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_11200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_12000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeLongArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_11200 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_11300
        * @tc.name   : test readLongArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_11300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_11300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.readLongArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_11300 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_11400
        * @tc.name   : test readLongArray interface, requires 1 parameters value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_11400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_11400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeStringArray(["a","b","c"]);
                data.readLongArray();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_11400 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_11500
        * @tc.name   : readLongArray newArr is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_11500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_11500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                let newArr = new Array(5);
                data.readLongArray(newArr);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_11500---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_11600
        * @tc.name   : test writeFloatArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_11600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_11600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeFloatArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_11600 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_11700
        * @tc.name   : test readFloatArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_11700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_11700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.readFloatArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_11700 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_11800
        * @tc.name   : readFloatArray newArr is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_11800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_10300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                let newArr = new Array(5);
                data.readFloatArray(newArr);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_11800---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_11900
        * @tc.name   : test writeDoubleArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_11900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_11900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeDoubleArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_11900 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_12000
        * @tc.name   : test readDoubleArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_12000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_12000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.readDoubleArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_12000 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_12000
        * @tc.name   : readDoubleArray newArr is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_12000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_12000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                let newArr = new Array(5);
                data.readDoubleArray(newArr);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_12000---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_12100
        * @tc.name   : test writeBooleanArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_12100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_12100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeBooleanArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_12100 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_12200
        * @tc.name   : test readBooleanArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_12200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_12200---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.readBooleanArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_12200 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_12300
        * @tc.name   : readBooleanArray newArr is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_12300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_12300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                let newArr = new Array(5);
                data.readBooleanArray(newArr);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_12300---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_12400
        * @tc.name   : test writeCharArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_12400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_12400---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeCharArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_12400 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_12500
        * @tc.name   : test readCharArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_12500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_12500---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.readCharArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_12500 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_12600
        * @tc.name   : readCharArray newArr is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_12600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_12600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                let newArr = new Array(5);
                data.readCharArray(newArr);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_12600---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_12700
        * @tc.name   : test writeStringArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_12700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_12700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeStringArray(3);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_12700 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_12800
        * @tc.name   : test readStringArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_12800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_12800---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.readStringArray(123);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_12800 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_12900
        * @tc.name   : readStringArray newArr is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_12900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_12900---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                let newArr = new Array(5);
                data.readStringArray(newArr);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_12900---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_13000
        * @tc.name   : test writeParcelableArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_13000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_13000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeParcelableArray(123);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_13000 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_13100
        * @tc.name   : test readParcelableArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_13100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_13100---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.readParcelableArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_13100 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_13200
        * @tc.name   : test writeRemoteObjectArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_13200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_13200---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeRemoteObjectArray(123);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_13200 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_13300
        * @tc.name   : test readRemoteObjectArray interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_13300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_13300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.readRemoteObjectArray("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_13300 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_13300
        * @tc.name   : readRemoteObjectArray newArr is read data from message sequence failed Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_13300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_13300---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.reclaim();
                let newArr = new Array(5);
                data.readRemoteObjectArray(newArr);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_13300---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_13400
        * @tc.name   : test closeFileDescriptor interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_13400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_13400---------------------------");
            try{
                rpc.MessageSequence.closeFileDescriptor("error");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_13400 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_13500
        * @tc.name   : test dupFileDescriptor interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_13500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_13500---------------------------");
            try{
                rpc.MessageSequence.dupFileDescriptor("error");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_13500 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_13600
        * @tc.name   : test writeFileDescriptor interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_13600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_13600---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeFileDescriptor("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_13600 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_13700
        * @tc.name   : test writeAshmem interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_13700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_13700---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                data.writeAshmem("The type does not match");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_13700 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_13800
        * @tc.name   : test writeRawData interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_13800", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_13800---------------------------");
            try{
                var data = new rpc.MessageSequence();
                let rawdata = [1, 2, 3];
                data.writeRawData(rawdata, "error");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_13800 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_13900
        * @tc.name   : test readRawData interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_13900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_13900---------------------------");
            try{
                var data = new rpc.MessageSequence();
                data.readRawData("error");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_13900 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_14000
        * @tc.name   : test readRawDataBuffer interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_14000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_14000---------------------------");
            try{
                var data = new rpc.MessageSequence();
                data.readRawDataBuffer("error");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_14000 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_14100
        * @tc.name   : test sendMessageRequest interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_14100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_14100---------------------------");
            try{
                gIRemoteObject.sendMessageRequest(1);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } 
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_14100 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_14200
        * @tc.name   : test sendMessageRequestCallback interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_14200", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_14200---------------------------");
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
                    }
                }
                console.info("start sendMessageRequestCallback");
                gIRemoteObject.sendMessageRequest(CODE_ASYNC_ONREMOTEMESSAGE, option,sendMessageRequestCallback);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally{
                data.reclaim();
                reply.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_14200 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_14300
        * @tc.name   : test getLocalInterface interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_14300", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_14300---------------------------");
            try{
                let object = new Stub("Test0400");
                let result = object.isObjectDead();
                expect(result).assertEqual(false);
                object.modifyLocalInterface(object, "Test2");
                let res2 = object.getLocalInterface(123);
                console.info("getLocalInterface success: " + res2);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_14300 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_14400
        * @tc.name   : getLocalInterface is only proxy object permitted Error verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_14400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_14400---------------------------");
            try{
                let object = rpc.IPCSkeleton.getContextObject();
                object.getLocalInterface("test");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900006).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_14400 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_14500
        * @tc.name   : test registerDeathRecipient interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_14500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_14500---------------------------");
            try{
                let object = rpc.IPCSkeleton.getContextObject();
                object.registerDeathRecipient(0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_14500 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_14600
        * @tc.name   : test unregisterDeathRecipient interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_14600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_14600---------------------------");
            try{
                let object = rpc.IPCSkeleton.getContextObject();
                object.unregisterDeathRecipient();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } 
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_14600 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_14700
        * @tc.name   : test getDescriptor interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_14700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_14700---------------------------");
            try{
                let object = rpc.IPCSkeleton.getContextObject();
                object.getDescriptor();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 1900007).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_14700 ---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Errorcode_14800
        * @tc.name    : test flushCmdBuffer interface, illegal value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_14800", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_14800---------------------------");
            try {
                let remoteObject = null;
                rpc.IPCSkeleton.flushCmdBuffer(remoteObject);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_14800---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_14900
        * @tc.name   : test sendMessageRequest interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_14900", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_14900---------------------------");
            try{
                let testRemoteObject = new TestRemoteObject("testObject");
                testRemoteObject.sendMessageRequest(1);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } 
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_14900 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_15000
        * @tc.name   : test sendMessageRequestCallback interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_15000", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_15000---------------------------");
            try{
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption(1);
                let testRemoteObject = new TestRemoteObject("testObject");
                let token = "onRemoteRequest or async onRemoteMessageRequest invoking";
                data.writeString(token);
                function sendMessageRequestCallback(result) {
                    try{
                        expect(result.errCode).assertEqual(0);
                        expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                    } catch(e) {
                        expect(e == null).assertTrue();
                    }
                }
                console.info("start sendMessageRequestCallback");
                testRemoteObject.sendMessageRequest(CODE_ASYNC_ONREMOTEMESSAGE, option,sendMessageRequestCallback);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally{
                data.reclaim();
                reply.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_15000 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_15100
        * @tc.name   : test modifyLocalInterface interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_15100", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_15100---------------------------");
            try{
                let testRemoteObject = new TestRemoteObject("testObject");
                testRemoteObject.modifyLocalInterface();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_15100 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_15200
        * @tc.name   : Test the function of serializing the writeAshmem interface in MessageSequence mode
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_Errorcode_15200", 0, function(){
            console.info("--------------------start SUB_DSoftbus_IPC_API_Errorcode_15200--------------------");
            try{
                let ashmem = rpc.Ashmem.create(1, 1024);
                data.writeAshmem(ashmem);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_Errorcode_15200--------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_15300
        * @tc.name   : Test the function of serializing the writeAshmem interface in MessageSequence mode
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */   
        it("SUB_DSoftbus_IPC_API_Errorcode_15300", 0, function(){
            console.info("--------------------start SUB_DSoftbus_IPC_API_Errorcode_15300--------------------");
            try{
                let ashmem = rpc.Ashmem.create("ashmem", 1024*1024);
                let ashmem2 = rpc.Ashmem.create(ashmem,1);
                console.info("SUB_DSoftbus_IPC_API_Errorcode_15300 ashmem" + ashmem2);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_Errorcode_15300--------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_15400
        * @tc.name   : test writeDataToAshmem interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
         it("SUB_DSoftbus_IPC_API_Errorcode_15400", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_15400---------------------------");
            try{
                let TEST_LEN_M = 1024 * 1024;
                let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_M);
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_M);
                ashmem.writeDataToAshmem(buffer, 0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_15400 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_15500
        * @tc.name   : test readDataFromAshmem interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_15500", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_15500---------------------------");
            try{
                let TEST_LEN_M = 1024 * 1024;
                let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_M);
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_M);
                ashmem.writeDataToAshmem(buffer, 0);
                ashmem.readDataFromAshmem(0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_15500 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_15600
        * @tc.name   : test readAshmem interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_15600", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_15600---------------------------");
            try{
                let ashmem = rpc.Ashmem.create("ashmem", 1024*1024);
                ashmem.mapReadWriteAshmem();
                let ByteArrayVar = [1, 2, 3, 4, 5];
                ashmem.writeAshmem(ByteArrayVar, 5, 0);
                ashmem.readAshmem(0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_15600 ---------------------------");
        });

        /*
        * @tc.number : SUB_DSoftbus_IPC_API_Errorcode_15700
        * @tc.name   : test readAshmem interface, illegal value verification
        * @tc.desc   : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level  : 3   
        * @tc.type   : Compatibility
        * @tc.size   : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Errorcode_15700", 0,async function(){
            console.info("---------------------start SUB_DSoftbus_IPC_API_Errorcode_15700---------------------------");
            try{
                let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
                ashmem.setProtectionType(rpc.Ashmem.PROT_WRITE, rpc.Ashmem.PROT_READ);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0450: run setProtectionType is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_OnRemoteRequest_testcase error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Errorcode_15700 ---------------------------");
        });
        console.info("-----------------------SUB_DSoftbus_IPC_API_OnRemoteRequest_Test is end-----------------------");
    });
}
