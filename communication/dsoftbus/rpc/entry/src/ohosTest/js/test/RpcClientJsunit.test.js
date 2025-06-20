/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import fileio from '@ohos.fileio';
import FA from '@ohos.ability.featureAbility';
import { describe, expect, beforeAll, it, TestType, Size, Level } from '@ohos/hypium';
import assertDeepEquals from './assertDeepEquals'
let gIRemoteObject = null;


function assertArrayElementEqual(actual, expected) {
    let result = assertDeepEquals(actual, expected)
    expect(result).assertTrue();
}



export default function ActsRpcClientJsTest() {
    describe('ActsRpcClientJsTest', function () {
        console.info("-----------------------SUB_DSoftbus_IPC_API_MessageParce_Test is starting-----------------------");
        beforeAll(async function () {
            console.info('beforeAll called');
            gIRemoteObject = new Stub("rpcTestAbility");
            return gIRemoteObject;
        });

        beforeEach(async function () {
            console.info('beforeEach called');
        });

        afterEach(async function () {
            console.info('afterEach called');
        });

        afterAll(async function () {
            console.info('afterAll called');
        });

        const K = 1024;
        const M = 1024 * 1024;
        const G = 1024 * 1024 * 1024;
        const CODE_WRITE_BYTEARRAY = 1;
        const CODE_SAME_PROCESS = 1;
        const CODE_WRITE_INTARRAY = 2;
        const CODE_WRITE_FLOATARRAY = 3;
        const CODE_WRITE_SHORT = 4;
        const CODE_WRITE_LONG = 5;
        const CODE_WRITE_DOUBLE = 6;
        const CODE_WRITE_BOOLEAN = 7;
        const CODE_WRITE_CHAR = 8;
        const CODE_WRITE_STRING = 9;
        const CODE_WRITE_BYTE = 10;
        const CODE_WRITE_INT = 11;
        const CODE_WRITE_FLOAT = 12;
        const CODE_WRITE_RAWDATA = 13;
        const CODE_WRITE_REMOTEOBJECT = 14;
        const CODE_WRITE_SEQUENCEABLE = 15;
        const CODE_WRITE_NOEXCEPTION = 16;
        const CODE_WRITE_SEQUENCEABLEARRAY = 17;
        const CODE_WRITE_REMOTEOBJECTARRAY = 18;
        const CODE_ALL_TYPE = 20;
        const CODE_ALL_ARRAY_TYPE = 21;
        const CODE_IPCSKELETON_INT = 22;
        const CODE_WRITESEQUENCEABLE = 23
        const CODE_WRITE_SHORT_MULTI = 24;
        const CODE_WRITE_BYTE_MULTI = 25;
        const CODE_WRITE_INT_MULTI = 26;
        const CODE_WRITE_REMOTEOBJECTARRAY_3 = 27;
        const CODE_IPCSKELETON = 28;
        const CODE_FILESDIR = 29;
        const CODE_WRITE_REMOTEOBJECTARRAY_1 = 30;
        const CODE_WRITE_REMOTEOBJECTARRAY_2 = 31;
        const CODE_ONREMOTEMESSAGE_OR_ONREMOTE = 32;
        const CODE_ONREMOTEMESSAGEREQUEST = 33;
        const CODE_INTERFACETOKEN = 34;
        const CODE_WRITE_SHORTARRAY = 35;
        const CODE_WRITE_LONGARRAY = 36;
        const CODE_WRITE_DOUBLEARRAY = 37;
        const CODE_WRITE_BOOLEANARRAY = 38;
        const CODE_WRITE_CHARARRAY = 39;
        const CODE_WRITE_STRINGARRAY = 40;
        const CODE_WRITE_ARRAYBUFFER = 41;

        function sleep(numberMillis) {
            let now = new Date();
            let exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
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

        class TestProxy {
            remote = rpc.RemoteObject;
            constructor(remote) {
                this.remote = remote;
                console.info("test remote");
            }
            asObject() {
                console.info("server remote");
                return this.remote;
            }
        }

        class MyDeathRecipient {
            constructor(gIRemoteObject, done) {
                this.gIRemoteObject = gIRemoteObject;
                this.done = done;
            }

            onRemoteDied() {
                console.info("server died");
                expect(this.proxy.removeDeathRecipient(this, 0)).assertTrue();
                let _done = this.done;
                _done();
                sleep(1000);
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

        class Stub extends rpc.RemoteObject {
            constructor(descriptor) {
                super(descriptor);
            }
            onRemoteRequest(code, data, reply, option) {
                try {
                    console.info("onRemoteRequest: " + code);
                    if (code === 32) {
                        console.info("case 32 start");
                        let tmp1 = data.readString();
                        let result = reply.writeString("onRemoteRequest invoking");
                        return true;
                    } else if (code === 33) {
                        console.info("case 33 start");
                        let tmp1 = data.readString();
                        let result = reply.writeString(tmp1);
                        return true;
                    } else {
                        console.error("default case " + code);
                        return super.onRemoteRequest(code, data, reply, option);
                    };
                } catch (error) {
                    console.info("onRemoteRequest: " + error);
                }
                return false;
            }
            onRemoteMessageRequest(code, data, reply, option) {
                try {
                    console.info("onRemoteMessageRequest: " + code);
                    switch (code) {
                        case 1:
                            {
                                console.info("case 1 start");
                                let tmp1 = data.readByteArray();
                                let result = reply.writeByteArray(tmp1);
                                return true;
                            }
                        case 2:
                            {
                                console.info("case 2 start");
                                let tmp1 = data.readIntArray();
                                let result = reply.writeIntArray(tmp1);
                                return true;
                            }
                        case 3:
                            {
                                console.info("case 3 start");
                                let tmp1 = data.readFloatArray();
                                let result = reply.writeFloatArray(tmp1);
                                return true;
                            }
                        case 4:
                            {
                                console.info("case 4 start");
                                let tmp1 = data.readShort();
                                let result = reply.writeShort(tmp1);
                                return true;
                            }
                        case 5:
                            {
                                console.info("case 5 start");
                                let tmp1 = data.readLong();
                                let result = reply.writeLong(tmp1);
                                return true;
                            }
                        case 6:
                            {
                                console.info("case 6 start");
                                let tmp1 = data.readDouble();
                                let result = reply.writeDouble(tmp1);
                                return true;
                            }
                        case 7:
                            {
                                console.info("case 7 start");
                                let tmp1 = data.readBoolean();
                                let result = reply.writeBoolean(tmp1);
                                return true;
                            }
                        case 8:
                            {
                                console.info("case 8 start");
                                let tmp1 = data.readChar();
                                let result = reply.writeChar(tmp1);
                                return true;
                            }
                        case 9:
                            {
                                console.info("case 9 start");
                                let tmp1 = data.readString();
                                let result = reply.writeString(tmp1);
                                return true;
                            }
                        case 10:
                            {
                                console.info("case 10 start");
                                let tmp1 = data.readByte();
                                let result = reply.writeByte(tmp1);
                                return true;
                            }
                        case 11:
                            {
                                console.info("case 11 start");
                                let tmp1 = data.readInt();
                                let result = reply.writeInt(tmp1);
                                return true;
                            }
                        case 12:
                            {
                                console.info("case 12 start");
                                let tmp1 = data.readFloat();
                                let result = reply.writeFloat(tmp1);
                                return true;
                            }
                        case 13:
                            {
                                console.info("case 13 start");
                                let size = data.readInt();
                                let tmp = data.readRawData(size);
                                let size1 = reply.writeInt(size);
                                let result = reply.writeRawData(tmp, tmp.length);
                                return true;
                            }
                        case 14:
                            {
                                console.info("case 14 start");
                                let listener = data.readRemoteObject();
                                let num = data.readInt();
                                let str = data.readString();
                                let option2 = new rpc.MessageOption();
                                let data2 = rpc.MessageParcel.create();
                                let reply2 = rpc.MessageParcel.create();
                                data2.writeInt(num);
                                data2.writeString(str);
                                listener.sendRequest(1, data2, reply2, option2)
                                    .then(function (result) {
                                        console.info("14 send request done, error code: " + result.errCode);
                                    })
                                    .catch(function (e) {
                                        console.error("14 send request got exception: " + e);
                                    })
                                    .finally(() => {
                                        data2.reclaim();
                                        reply2.reclaim();
                                        console.info("case 14 test done");
                                    })
                                reply.writeNoException();
                                return true;
                            }
                        case 15:
                            {
                                console.info("case 15 start");
                                let s = new MySequenceable(null, null);
                                let tmp1 = data.readParcelable(s);
                                let result = reply.writeParcelable(s);
                                return true;
                            }
                        case 16:
                            {
                                console.info("case 16 start");
                                data.readException();
                                let tmp = data.readInt();
                                reply.writeNoException();
                                let result = reply.writeInt(tmp);
                                return true;
                            }
                        case 17:
                            {
                                console.info("case 17 start");
                                let s = [new MySequenceable(null, null), new MySequenceable(null, null),
                                new MySequenceable(null, null)];
                                data.readParcelableArray(s);
                                let result = reply.writeParcelableArray(s);
                                return true;
                            }
                        case 18:
                            {
                                console.info("case 18 start");
                                let listeners = data.readRemoteObjectArray();
                                for (let i = 0; i < listeners.length; i++) {
                                    let option2 = new rpc.MessageOption();
                                    let data2 = rpc.MessageParcel.create();
                                    let reply2 = rpc.MessageParcel.create();
                                    listeners[i].sendRequest(1, data2, reply2, option2)
                                        .then(function (result) {
                                            console.info("18 send request done, error code: " + result.errCode + ", index: " + i);
                                        })
                                        .catch(function (e) {
                                            console.error("18 send request got exception: " + e);
                                        })
                                        .finally(() => {
                                            data2.reclaim();
                                            reply2.reclaim();
                                            console.info("case 18 test done");
                                        })
                                }
                                return true;
                            }
                        case 19:
                            {
                                console.info("case 19 start");
                                let tmp1 = data.readDoubleArray();
                                let result = reply.writeDoubleArray(tmp1);
                                return true;
                            }

                        case 20:
                            {
                                console.info("case 20 start");
                                let tmp1 = data.readByte();
                                let tmp2 = data.readShort();
                                let tmp3 = data.readInt();
                                let tmp4 = data.readLong();
                                let tmp5 = data.readFloat();
                                let tmp6 = data.readDouble();
                                let tmp7 = data.readBoolean();
                                let tmp8 = data.readChar();
                                let tmp9 = data.readString();
                                let s = new MySequenceable(null, null);
                                let tmp10 = data.readParcelable(s);
                                let result1 = reply.writeByte(tmp1);
                                let result2 = reply.writeShort(tmp2);
                                let result3 = reply.writeInt(tmp3);
                                let result4 = reply.writeLong(tmp4);
                                let result5 = reply.writeFloat(tmp5);
                                let result6 = reply.writeDouble(tmp6);
                                let result7 = reply.writeBoolean(tmp7);
                                let result8 = reply.writeChar(tmp8);
                                let result9 = reply.writeString(tmp9);
                                let result10 = reply.writeParcelable(s);
                                return true;
                            }
                        case 21:
                            {
                                console.info("case 21 start");
                                let tmp1 = data.readByteArray();
                                let tmp2 = data.readShortArray();
                                let tmp3 = data.readIntArray();
                                let tmp4 = data.readLongArray();
                                let tmp5 = data.readFloatArray();
                                let tmp6 = data.readDoubleArray();
                                let tmp7 = data.readBooleanArray();
                                let tmp8 = data.readCharArray();
                                let tmp9 = data.readStringArray();
                                let s = [new MySequenceable(null, null), new MySequenceable(null, null),
                                new MySequenceable(null, null)];
                                let tmp10 = data.readParcelableArray(s);
                                let result1 = reply.writeByteArray(tmp1);
                                let result2 = reply.writeShortArray(tmp2);
                                let result3 = reply.writeIntArray(tmp3);
                                let result4 = reply.writeLongArray(tmp4);
                                let result5 = reply.writeFloatArray(tmp5);
                                let result6 = reply.writeDoubleArray(tmp6);
                                let result7 = reply.writeBooleanArray(tmp7);
                                let result8 = reply.writeCharArray(tmp8);
                                let result9 = reply.writeStringArray(tmp9);
                                let result10 = reply.writeParcelableArray(s);
                                return true;
                            }
                        case 22:
                            {
                                console.info("case 22 start");
                                let callingPid = rpc.IPCSkeleton.getCallingPid();
                                let callingUid = rpc.IPCSkeleton.getCallingUid();
                                reply.writeNoException();
                                reply.writeInt(callingPid);
                                reply.writeInt(callingUid);
                                reply.writeInt(this.getCallingPid());
                                reply.writeInt(this.getCallingUid());
                                let id = rpc.IPCSkeleton.resetCallingIdentity();
                                rpc.IPCSkeleton.setCallingIdentity(id);
                                reply.writeInt(rpc.IPCSkeleton.getCallingPid());
                                reply.writeInt(rpc.IPCSkeleton.getCallingUid());
                                reply.writeInt(rpc.IPCSkeleton.flushCommands(this));
                                return true;
                            }
                        case 23:
                            {
                                console.info("case 23 start");
                                let s = new MySequenceable(null, null);
                                let tmp1 = data.readParcelable(s);
                                let result = reply.writeParcelable(s);
                                return true;
                            }
                        case 24:
                            {
                                console.info("case 24 start");
                                let tmp1 = data.readShort();
                                let tmp2 = data.readShort();
                                let tmp3 = data.readShort();
                                let tmp4 = data.readShort();
                                let tmp5 = data.readShort();
                                let result1 = reply.writeShort(tmp1);
                                let result2 = reply.writeShort(tmp2);
                                let result3 = reply.writeShort(tmp3);
                                let result4 = reply.writeShort(tmp4);
                                let result5 = reply.writeShort(tmp5);
                                return true;
                            }
                        case 25:
                            {
                                console.info("case 25 start");
                                let tmp1 = data.readByte();
                                let tmp2 = data.readByte();
                                let tmp3 = data.readByte();
                                let tmp4 = data.readByte();
                                let tmp5 = data.readByte();
                                let result1 = reply.writeByte(tmp1);
                                let result2 = reply.writeByte(tmp2);
                                let result3 = reply.writeByte(tmp3);
                                let result4 = reply.writeByte(tmp4);
                                let result5 = reply.writeByte(tmp5);
                                return true;
                            }
                        case 26:
                            {
                                console.info("case 26 start");
                                let tmp1 = data.readInt();
                                let tmp2 = data.readInt();
                                let tmp3 = data.readInt();
                                let tmp4 = data.readInt();
                                let tmp5 = data.readInt();
                                let result1 = reply.writeInt(tmp1);
                                let result2 = reply.writeInt(tmp2);
                                let result3 = reply.writeInt(tmp3);
                                let result4 = reply.writeInt(tmp4);
                                let result5 = reply.writeInt(tmp5);
                                return true;
                            }
                        case 27:
                            {
                              console.info("case 27 starts");
                              let listeners = data.readRemoteObjectArray();
                              reply.writeRemoteObjectArray(listeners);
                              console.info("onRemoteMessageRequest success");
                              return true;
                            }
                        case 28:
                            {
                                console.info("case 28 start");
                                let callingPid = rpc.IPCSkeleton.getCallingPid();
                                let callingUid = rpc.IPCSkeleton.getCallingUid();
                                let callingDeviceID = rpc.IPCSkeleton.getCallingDeviceID();
                                let localDeviceID = rpc.IPCSkeleton.getLocalDeviceID();
                                let isLocalCalling = rpc.IPCSkeleton.isLocalCalling();
                                reply.writeNoException();
                                reply.writeInt(callingPid);
                                reply.writeInt(callingUid);
                                reply.writeString(callingDeviceID);
                                reply.writeString(localDeviceID);
                                reply.writeBoolean(isLocalCalling);
                                reply.writeInt(this.getCallingPid());
                                reply.writeInt(this.getCallingUid());
                                let id = rpc.IPCSkeleton.resetCallingIdentity();
                                rpc.IPCSkeleton.setCallingIdentity(id);
                                reply.writeInt(rpc.IPCSkeleton.getCallingPid());
                                reply.writeInt(rpc.IPCSkeleton.getCallingUid());
                                reply.writeInt(rpc.IPCSkeleton.flushCommands(this));
                                return true;
                            }
                        case 29:
                            {
                                console.info("case 29 starts");
                                let bytesWr = data.readInt();
                                let fd = data.readFileDescriptor();
                                reply.writeFileDescriptor(fd);
                                fileio.writeSync(fd, "HELLO RPC", { position: bytesWr + 1 });
                                reply.writeFileDescriptor(fd);
                                rpc.MessageSequence.closeFileDescriptor(fd)
                                return true;
                            }
                        case 30:
                            {
                                console.info("case 30 start");
                                let listeners = data.readRemoteObjectArray();
                                let num = data.readInt();
                                let str = data.readString();
                                for (let i = 0; i < listeners.length; i++) {
                                    let option2 = new rpc.MessageOption();
                                    let data2 = rpc.MessageParcel.create();
                                    let reply2 = rpc.MessageParcel.create();
                                    data2.writeInt(num);
                                    data2.writeString(str);
                                    listeners[i].sendRequest(1, data2, reply2, option2)
                                        .then(function (result) {
                                            console.info("30 send request done, error code: " + result.errCode + ", index: " + i);
                                        })
                                        .catch(function (e) {
                                            console.error("30 send request got exception: " + e);
                                        })
                                        .finally(() => {
                                            data2.reclaim();
                                            reply2.reclaim();
                                            console.info("case 30 test done");
                                        })
                                }
                                reply.writeNoException();
                                return true;
                            }

                        case 31:
                            {
                                console.info("case 31 start");
                                let listeners = data.readRemoteObjectArray();
                                let num = data.readInt();
                                let str = data.readString();
                                console.info("31 num: " + num);
                                console.info("31 str: " + str);
                                for (let i = 0; i < listeners.length; i++) {
                                    let option2 = new rpc.MessageOption();
                                    let data2 = rpc.MessageParcel.create();
                                    let reply2 = rpc.MessageParcel.create();
                                    data2.writeInt(num);
                                    data2.writeString(str);
                                    listeners[i].sendRequest(1, data2, reply2, option2)
                                        .then(function (result) {
                                            console.info("31 send request done, error code: " + result.errCode + ", index: " + i);
                                        })
                                        .catch(function (e) {
                                            console.error("31 send request got exception: " + e);
                                        })
                                        .finally(() => {
                                            data2.reclaim();
                                            reply2.reclaim();
                                            console.info("case 31 test done");
                                        })
                                }
                                reply.writeNoException();
                                return true;
                            }
                        case 32:
                            {
                                console.info("case 32 start");
                                let tmp1 = data.readString();
                                let result = reply.writeString("onRemoteMessageRequest invoking");
                                return true;
                            }
                        case 34:
                            {
                                console.info("case 34 start");
                                let tmp = data.readInterfaceToken();
                                let result = reply.writeInterfaceToken(tmp);
                                return true;
                            }
                        case 35:
                            {
                                console.info("case 35 start");
                                let tmp1 = data.readShortArray();
                                let result = reply.writeShortArray(tmp1);
                                return true;
                            }
                        case 36:
                            {
                                console.info("case 36 start");
                                let tmp1 = data.readLongArray();
                                let result = reply.writeLongArray(tmp1);
                                return true;
                            }
                        case 37:
                            {
                                console.info("case 37 start");
                                let tmp1 = data.readDoubleArray();
                                let result = reply.writeDoubleArray(tmp1);
                                return true;
                            }
                        case 38:
                            {
                                console.info("case 38 start");
                                let tmp1 = data.readBooleanArray();
                                let result = reply.writeBooleanArray(tmp1);
                                return true;
                            }
                        case 39:
                            {
                                console.info("case 39 start");
                                let tmp1 = data.readCharArray();
                                let result = reply.writeCharArray(tmp1);
                                return true;
                            }
                        case 40:
                            {
                                console.info("case 40 start");
                                let tmp1 = data.readStringArray();
                                let result = reply.writeStringArray(tmp1);
                                return true;
                            }
                        case 41:
                            {
                                console.info("case 41 start");
                                let tmp1 = data.readArrayBuffer(rpc.TypeCode.INT16_ARRAY);
                                let tmp2 = data.readArrayBuffer(rpc.TypeCode.INT8_ARRAY);

                                reply.writeArrayBuffer(tmp2, rpc.TypeCode.INT8_ARRAY);
                                reply.writeArrayBuffer(tmp1, rpc.TypeCode.INT16_ARRAY);
                                return true;
                            }
                        default:
                            this.onRemoteRequest(code, data, reply, option);
                    }
                } catch (error) {
                    console.info("onRemoteMessageRequest: " + error);
                }
                return false;
            }
        }

        class TestAbilityStub extends rpc.RemoteObject {
            constructor(descriptor) {
                super(descriptor);
            }

            onRemoteRequest(code, data, reply, option) {
                console.info("TestAbilityStub: onRemoteRequest called, code: " + code);
                let descriptor = data.readInterfaceToken();
                if (descriptor !== "TestAbilityStub") {
                    console.error("received unknown descriptor: " + descriptor);
                    return false;
                }
                switch (code) {
                    case 1:
                        {
                            let tmp1 = data.readByte();
                            let tmp2 = data.readShort();
                            let tmp3 = data.readInt();
                            let tmp4 = data.readLong();
                            let tmp5 = data.readFloat();
                            let tmp6 = data.readDouble();
                            let tmp7 = data.readBoolean();
                            let tmp8 = data.readChar();
                            let tmp9 = data.readString();
                            let s = new MySequenceable(null, null);
                            data.readSequenceable(s);
                            reply.writeNoException();
                            reply.writeByte(tmp1);
                            reply.writeShort(tmp2);
                            reply.writeInt(tmp3);
                            reply.writeLong(tmp4);
                            reply.writeFloat(tmp5);
                            reply.writeDouble(tmp6);
                            reply.writeBoolean(tmp7);
                            reply.writeChar(tmp8);
                            reply.writeString(tmp9);
                            reply.writeSequenceable(s);
                            return true;
                        }
                    default:
                        {
                            console.error("default case, code: " + code);
                            return false;
                        }
                }
            }
        }

        class TestAbilityMessageStub extends rpc.RemoteObject {
            constructor(descriptor) {
                super(descriptor);
            }
            onRemoteMessageRequest(code, data, reply, option) {
                console.info("TestAbilityMessageStub: onRemoteMessageRequest called, code: " + code);
                let descriptor = data.readInterfaceToken();
                if (descriptor !== "TestAbilityMessageStub") {
                    console.error("received unknown descriptor: " + descriptor);
                    return false;
                }
                switch (code) {
                    case 1:
                        {
                            let tmp1 = data.readByte();
                            let tmp2 = data.readShort();
                            let tmp3 = data.readInt();
                            let tmp4 = data.readLong();
                            let tmp5 = data.readFloat();
                            let tmp6 = data.readDouble();
                            let tmp7 = data.readBoolean();
                            let tmp8 = data.readChar();
                            let tmp9 = data.readString();
                            let s = new MySequenceable(null, null);
                            data.readParcelable(s);
                            reply.writeNoException();
                            reply.writeByte(tmp1);
                            reply.writeShort(tmp2);
                            reply.writeInt(tmp3);
                            reply.writeLong(tmp4);
                            reply.writeFloat(tmp5);
                            reply.writeDouble(tmp6);
                            reply.writeBoolean(tmp7);
                            reply.writeChar(tmp8);
                            reply.writeString(tmp9);
                            reply.writeParcelable(s);
                            return true;
                        }
                    default:
                        {
                            console.error("default case, code: " + code);
                            return false;
                        }
                }
            }
        }

        class TestListener extends rpc.RemoteObject {
            constructor(descriptor, checkResult) {
                super(descriptor);
                this.checkResult = checkResult;
            }
            onRemoteRequest(code, data, reply, option) {
                let result = false;
                if (code == 1) {
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

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0010
         * @tc.name    : test Call the writeinterfacetoken interface, write the interface descriptor, and read interfacetoken
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0010", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0010---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = "hello ruan zong xian";
                data.writeInterfaceToken(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_INTERFACETOKEN, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readInterfaceToken()).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0010---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0020
         * @tc.name    : test The writeInterfaceToken interface is looping, the interface descriptor is written, and the
                        InterfaceToken is read
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0020", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0020---------------------------");
            try {
                for (let i = 0; i < 5; i++) {
                    var data = rpc.MessageSequence.create();
                    var reply = rpc.MessageSequence.create();
                    let option = new rpc.MessageOption();
                    let token = "hello ruan zong xian";
                    data.writeInterfaceToken(token);
                    expect(gIRemoteObject != undefined).assertTrue();
                    await gIRemoteObject.sendMessageRequest(CODE_INTERFACETOKEN, data, reply, option).then((result) => {
                        expect(result.errCode).assertEqual(0);
                        expect(result.reply.readInterfaceToken()).assertEqual(token);
                    });
                };
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0020---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0030
         * @tc.name    : test Call the WriteInterfaceToken interface, write the maximum length interface descriptor, and read
                        the InterfaceToken
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0030", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0030---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = "";
                for (let i = 0; i < (40 * K - 1); i++) {
                    token += 'a';
                };
                data.writeInterfaceToken(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_INTERFACETOKEN, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readInterfaceToken()).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0030---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0040
         * @tc.name    : test The WriteInterfaceToken interface is called, the exceeding-length interface descriptor is written,
                        and the InterfaceToken is read
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0040", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0040---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = "";
                for (let i = 0; i < 40 * K; i++) {
                    token += 'a';
                };
                data.writeInterfaceToken(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0040---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0050
         * @tc.name    : test Call the writeinterfacetoken interface to write a non string interface descriptor
                       and read interfacetoken
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0050", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0050---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = 123;
                data.writeInterfaceToken(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0050---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0060
         * @tc.name    : test Call the writeshortarray interface, write the array to the MessageSequence instance,
         *             and call readshortarray to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0060", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0060---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wShortArryData = [-1, 0, 1];
                data.writeShortArray(wShortArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_SHORTARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readShortArray(), wShortArryData)
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0060---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0070
         * @tc.name    : test Call the writeshortarray interface, write the short integer array to the MessageSequence instance,
         *             and call readshortarray (datain: number []) to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0070", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0070---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wShortArryData = [];
                for (let i = 0; i < (50 * 1024 - 1); i++) {
                    wShortArryData[i] = 1;
                };
                data.writeShortArray(wShortArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_SHORTARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let rShortArryData = [];
                    result.reply.readShortArray(rShortArryData);
                    assertArrayElementEqual(rShortArryData, wShortArryData)
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0070---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0080
         * @tc.name    : test Writeshortarray interface, boundary value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0080", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0080---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wShortArryData = [-32768, 0, 1, 2, 32767];
                data.writeShortArray(wShortArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_SHORTARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readShortArray(), wShortArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0080---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0090
         * @tc.name    : test Writeshortarray interface, illegal value validation
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0090", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0090---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let eShortArryData = [-32769, 32768];
                data.writeShortArray(eShortArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_SHORTARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let erShortArryData = [32767, -32768];
                    assertArrayElementEqual(result.reply.readShortArray(), erShortArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0090---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0100
         * @tc.name    : test Writeshortarray interface, transmission length verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0100", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0100---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let eShortArryData = [];
                for (let i = 0; i < 50 * K; i++) {
                    eShortArryData[i] = 1;
                };
                data.writeShortArray(eShortArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0100---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0110
         * @tc.name    : test Call the writelongarray interface, write the long integer array to the MessageSequence instance,
         *             and call readlongarray to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0110", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0110---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wLongArryData = [3276826, 123456, 9999999];
                data.writeLongArray(wLongArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_LONGARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readLongArray(), wLongArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0110---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0120
         * @tc.name    : test Call the writelongarray interface, write the long integer array to the MessageSequence instance,
         *             and call readlongarray (datain: number []) to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0120", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0120---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wLongArryData = [];
                for (let i = 0; i < (25 * K - 1); i++) {
                    wLongArryData[i] = 11;
                };
                data.writeLongArray(wLongArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_LONGARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let rLongArryData = [];
                    result.reply.readLongArray(rLongArryData);
                    assertArrayElementEqual(rLongArryData, wLongArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0120---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0130
         * @tc.name    : test Writelongarray interface, boundary value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0130", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0130---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wLongArryData = [-9007199254740992, 0, 1, 2, 9007199254740991];
                data.writeLongArray(wLongArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_LONGARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let rLongArryData = [];
                    result.reply.readLongArray(rLongArryData);
                    assertArrayElementEqual(rLongArryData, wLongArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0130---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0140
         * @tc.name    : test Writelongarray interface, long type precision verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0140", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0140---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wLongArryData = [-9999999999999999, 9999999999999999];
                data.writeLongArray(wLongArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_LONGARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let rLongArryData = result.reply.readLongArray();
                    let newlongdata = [-10000000000000000, 10000000000000000];
                    expect(rLongArryData[0]).assertEqual(newlongdata[0]);
                    expect(rLongArryData[1]).assertEqual(newlongdata[1]);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0140---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0150
         * @tc.name    : test Writelongarray Indicates an interface for verifying the input length
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0150", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0150---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let wLongArryData = [];
                for (let i = 0; i < 25 * K; i++) {
                    wLongArryData[i] = 11;
                };
                data.writeLongArray(wLongArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0150---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0160
         * @tc.name    : test Call the writedoublearray interface, write the array to the MessageSequence instance,
         *             and call readdoublearra to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0160", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0160---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wDoubleArryData = [1.2, 235.67, 99.76];
                data.writeDoubleArray(wDoubleArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_DOUBLEARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readDoubleArray(), wDoubleArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0160---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0170
         * @tc.name    : test Call the writedoublearray interface, write the array to the MessageSequence instance,
         *             and call readdoublearra (datain: number []) to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0170", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0170---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wDoubleArryData = [];
                for (let i = 0; i < (25 * K - 1); i++) {
                    wDoubleArryData[i] = 11.1;
                };
                data.writeDoubleArray(wDoubleArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_DOUBLEARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let rDoubleArryData = [];
                    result.reply.readDoubleArray(rDoubleArryData);
                    assertArrayElementEqual(rDoubleArryData, wDoubleArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0170---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0180
         * @tc.name    : test Writedoublearray interface, boundary value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0180", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0180---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wDoubleArryData = [4.9E-324, 235.67, 1.79E+308];
                data.writeDoubleArray(wDoubleArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_DOUBLEARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readDoubleArray(), wDoubleArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0180---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0190
         * @tc.name    : test Writedoublearray interface, illegal value validation
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0190", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0190---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let eDoubleArryData = [(4.9E-324) - 1, (1.79E+308) + 1];
                data.writeDoubleArray(eDoubleArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_DOUBLEARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let rDoubleArryData = result.reply.readDoubleArray();
                    expect(rDoubleArryData[0]).assertEqual(-1);
                    expect(rDoubleArryData[1]).assertEqual(1.79e+308);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0190---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0200
         * @tc.name    : test Writedoublearray interface, Out-of-bounds value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0200", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0200---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let eDoubleArryData = [];
                for (let i = 0; i < 25 * K; i++) {
                    eDoubleArryData[i] = 11.1;
                };
                data.writeDoubleArray(eDoubleArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0200---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0210
         * @tc.name    : test Call the writebooleanarray interface, write the array to the MessageSequence instance,
         *             and call readbooleanarray to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0210", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0210---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wBooleanArryData = [true, false, false];
                data.writeBooleanArray(wBooleanArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_BOOLEANARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readBooleanArray(), wBooleanArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0210---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0220
         * @tc.name    : test Call the writebooleanarray interface, write the array to the MessageSequence instance,
         *             and call readbooleanarray (datain: number []) to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0220", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0220---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wBooleanArryData = [];
                for (let i = 0; i < (50 * K - 1); i++) {
                    if (i % 2 == 0) {
                        wBooleanArryData[i] = false;
                    } else {
                        wBooleanArryData[i] = true;
                    };
                };
                data.writeBooleanArray(wBooleanArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_BOOLEANARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let rBooleanArryData = [];
                    result.reply.readBooleanArray(rBooleanArryData);
                    assertArrayElementEqual(rBooleanArryData, wBooleanArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0220---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0230
         * @tc.name    : test Writebooleanarray interface, illegal value validation
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0230", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0230---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let errorBooleanArryData = [true, 9, false];
                data.writeBooleanArray(errorBooleanArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_BOOLEANARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let eCharArrayData = [true, false, false];
                    assertArrayElementEqual(result.reply.readBooleanArray(), eCharArrayData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0230---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0240
         * @tc.name    : test Writebooleanarray Interface for length verification of input parameters
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0240", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0240---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let wBooleanArryData = [];
                for (let i = 0; i < 50 * K; i++) {
                    if (i % 2 == 0) {
                        wBooleanArryData[i] = false;
                    } else {
                        wBooleanArryData[i] = true;
                    };
                };
                data.writeBooleanArray(wBooleanArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0240---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0250
         * @tc.name    : test Call the writechararray interface, write the array to the MessageSequence instance,
         *             and call readchararray to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0250", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0250---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wCharArryData = [0, 97, 255];
                data.writeCharArray(wCharArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_CHARARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readCharArray(), wCharArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0250---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0260
         * @tc.name    : test Call the writechararray interface, write the array to the MessageSequence instance,
         *             and call readchararray (datain: number []) to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0260", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0260---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wCharArryData = [];
                for (let i = 0; i < (50 * K - 1); i++) {
                    wCharArryData[i] = 96;
                };
                data.writeCharArray(wCharArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_CHARARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let rCharArryData = [];
                    result.reply.readCharArray(rCharArryData);
                    assertArrayElementEqual(rCharArryData, wCharArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0260---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0270
         * @tc.name    : test Writechararray interface, illegal value validation
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0270", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0270---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let errorCharArryData = [96, 'asfgdgdtu', 97];
                data.writeCharArray(errorCharArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_CHARARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let eCharArrayData = [96, 0, 97];
                    let readchardata = result.reply.readCharArray();
                    assertArrayElementEqual(readchardata, eCharArrayData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0270---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0280
         * @tc.name    : test Writechararray Indicates the length of an interface input parameter
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0280", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0280---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let errorCharArryData = [];
                for (let i = 0; i < 50 * K; i++) {
                    errorCharArryData[i] = 96;
                };
                data.writeCharArray(errorCharArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0280---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0290
         * @tc.name    : test Call the writestringarray interface, write the array to the MessageSequence instance,
         *             and call readstringarray (datain: number []) to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0290", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0290---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wStringArryData = ['abc', 'hello', 'beauty'];
                data.writeStringArray(wStringArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRINGARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readStringArray(), wStringArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0290---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0300
         * @tc.name    : test Call the writestringarray interface, write the array to the MessageSequence instance,
         *             and call readstringarray() to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0300", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0300---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let wStringArryData = [];
                for (let i = 0; i < (10 * K - 1); i++) {
                    wStringArryData[i] = "heddSDF";
                };
                data.writeStringArray(wStringArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRINGARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let rStringArryData = [];
                    result.reply.readStringArray(rStringArryData);
                    assertArrayElementEqual(rStringArryData, wStringArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0300---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0310
         * @tc.name    : test Writestringarray interface, illegal value validation
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0310", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0310---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let errorStringArryData = ['abc', 123, 'beauty'];
                data.writeStringArray(errorStringArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0310---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0320
         * @tc.name    : test writeStringArray Interface for length verification of input parameters
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0320", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0320---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let wStringArryData = [];
                for (let i = 0; i < 10 * K; i++) {
                    wStringArryData[i] = "heddSDF";
                };
                data.writeStringArray(wStringArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0320---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0330
         * @tc.name    : test Call the writebytearray interface, write the array to the MessageSequence instance,
         *             and call readbytearray to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0330", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0330---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let ByteArraylet = [1, 2, 3, 4, 5];
                data.writeByteArray(ByteArraylet);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_BYTEARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readByteArray(), ByteArraylet);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0330---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0340
         * @tc.name    : test Call the writebytearray interface, write the array to the MessageSequence instance,
         *             and call readbytearray (datain: number []) to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0340", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0340---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let ByteArraylet = [-128, 0, 1, 2, 127];
                data.writeByteArray(ByteArraylet);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_BYTEARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let newArr = new Array(5);
                    result.reply.readByteArray(newArr);
                    assertArrayElementEqual(newArr, ByteArraylet);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0340---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0350
         * @tc.name    : test Writebytearray interface, boundary value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0350", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0350---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let ByteArraylet = [];
                for (let i = 0; i < (40 * K - 1); i++) {
                    ByteArraylet[i] = 1;
                };
                data.writeByteArray(ByteArraylet);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_BYTEARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let newArr = new Array(5)
                    result.reply.readByteArray(newArr);
                    assertArrayElementEqual(newArr, ByteArraylet);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0350---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0360
         * @tc.name    : test Writebytearray interface, illegal value validation
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0360", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0360---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let ByteArraylet = [-129, 0, 1, 2, 128];
                data.writeByteArray(ByteArraylet);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_BYTEARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let shortArryDataReply = result.reply.readByteArray();
                    expect(shortArryDataReply[0] == 127).assertTrue();
                    expect(shortArryDataReply[1] == ByteArraylet[1]).assertTrue();
                    expect(shortArryDataReply[2] == ByteArraylet[2]).assertTrue();
                    expect(shortArryDataReply[3] == ByteArraylet[3]).assertTrue();
                    expect(shortArryDataReply[4] == -128).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0360---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0370
         * @tc.name    : test Writebytearray Interface，input parameter length verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0370", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0370---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let ByteArraylet = [];
                for (let i = 0; i < 40 * K; i++) {
                    ByteArraylet[i] = 1;
                };
                data.writeByteArray(ByteArraylet);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0370---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0380
         * @tc.name    : test Call the writeintarray interface, write the array to the MessageSequence instance,
         *             and call readintarray to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0380", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0380---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let intArryData = [100, 111, 112];
                data.writeIntArray(intArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readIntArray(), intArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0380---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0390
         * @tc.name    : test Call the writeintarray interface, write the array to the MessageSequence instance,
         *             and call readintarray (datain: number []) to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0390", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0390---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let intArryData = [];
                for (let i = 0; i < (50 * K - 1); i++) {
                    intArryData[i] = 1;
                };
                data.writeIntArray(intArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let newArr = new Array(3);
                    result.reply.readIntArray(newArr);
                    assertArrayElementEqual(newArr, intArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0390---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0400
         * @tc.name    : test Writeintarray interface, boundary value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0400", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0400---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let intArryData = [-2147483648, 0, 1, 2, 2147483647];
                data.writeIntArray(intArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readIntArray(), intArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0400---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0410
         * @tc.name    : test Writeintarray interface, illegal value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0410", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0410---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let intArryData = [-2147483649, 0, 1, 2, 2147483648];
                data.writeIntArray(intArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let shortArryDataReply = result.reply.readIntArray();
                    expect(shortArryDataReply[0] == 2147483647).assertTrue();
                    expect(shortArryDataReply[1] == intArryData[1]).assertTrue();
                    expect(shortArryDataReply[2] == intArryData[2]).assertTrue();
                    expect(shortArryDataReply[3] == intArryData[3]).assertTrue();
                    expect(shortArryDataReply[4] == -2147483648).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0410---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0420
         * @tc.name    : test Writeintarray interface, input parameter length verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0420", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0420---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let intArryData = [];
                for (let i = 0; i < 50 * K; i++) {
                    intArryData[i] = 1;
                };
                data.writeIntArray(intArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0420---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0430
         * @tc.name    : test Call the writefloatarray interface, write the array to the MessageSequence instance,
         *             and call readfloatarray to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0430", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0430---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let floatArryData = [1.2, 1.3, 1.4];
                data.writeFloatArray(floatArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOATARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readFloatArray(), floatArryData)
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0430---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0440
         * @tc.name    : test Call the writefloatarray interface, write the array to the MessageSequence instance,
         *             and call readfloatarray (datain: number []) to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0440", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0440---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let floatArryData = [1.4E-45, 1.3, 3.4028235E38];
                data.writeFloatArray(floatArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOATARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let newArr = new Array(3);
                    result.reply.readFloatArray(newArr);
                    assertArrayElementEqual(newArr, floatArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0440---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0450
         * @tc.name    : test Writefloatarray interface, boundary value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0450", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0450---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let floatArryData = [(1.4E-45) - 1, 1.3, (3.4028235E38) + 1];
                data.writeFloatArray(floatArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOATARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let newArr = result.reply.readFloatArray();
                    expect(newArr[0]).assertEqual(-1);
                    expect(newArr[1]).assertEqual(1.3);
                    expect(newArr[2]).assertEqual(3.4028235e+38);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0450---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0460
         * @tc.name    : test Writefloatarray interface, boundary value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0460", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0460---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let floatArryData = [];
                for (let i = 0; i < (25 * K - 1); i++) {
                    floatArryData[i] = 1.1;
                };
                data.writeFloatArray(floatArryData);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOATARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readFloatArray(), floatArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0460---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0470
         * @tc.name    : test Writefloatarray interface, Longest array verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0470", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0470---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let floatArryData = [];
                for (let i = 0; i < (25 * K); i++) {
                    floatArryData[i] = 1.1;
                };
                data.writeFloatArray(floatArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0470---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0480
         * @tc.name    : test Call the writeShort interface to write the short integer data to the MessageSequence instance,
         *             and call readshort to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0480", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0480---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let short = 8;
                data.writeShort(short);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_SHORT, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readShort(), short);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0480---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0490
         * @tc.name    : test WriteShort interface, boundary value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0490", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0490---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeShort(-32768);
                data.writeShort(0);
                data.writeShort(1);
                data.writeShort(2);
                data.writeShort(32767);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_SHORT_MULTI, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readShort() == -32768).assertTrue();
                    expect(result.reply.readShort() == 0).assertTrue();
                    expect(result.reply.readShort() == 1).assertTrue();
                    expect(result.reply.readShort() == 2).assertTrue();
                    expect(result.reply.readShort() == 32767).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0490---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0500
         * @tc.name    : test WriteShort interface, Boundary value minimum value out of bounds verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0500", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0500---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeShort(-32769);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_SHORT_MULTI, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readShort() == 32767).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0500---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0510
         * @tc.name    : test WriteShort interface, Boundary value maximum value out of bounds verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0510", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0510---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeShort(32768);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_SHORT_MULTI, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readShort() == -32768).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0510---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0520
         * @tc.name    : test Call writelong interface to write long integer data to MessageSequence instance
         *             and call readlong to read data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0520", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0520---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let long = 9007199254740991;
                data.writeLong(long);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_LONG, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readLong()).assertEqual(long);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0520---------------------------");
        });


        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0530
         * @tc.name    : test Writelong interface, Verification of maximum accuracy value
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0530", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0530---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let long = -9007199254740992;
                data.writeLong(long);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_LONG, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readLong() == long).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0530---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0540
         * @tc.name    : test Writelong interface, Minimum loss accuracy verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0540", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0540---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let long = -9223372036854775300;
                data.writeLong(long);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_LONG, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readLong()).assertEqual(-9223372036854776000);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0540---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0550
         * @tc.name    : test Writelong interface, Maximum loss accuracy verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0550", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0550---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let short = 9223372036854775300;
                data.writeLong(short);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_LONG, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let readlong = result.reply.readLong();
                    expect(readlong != 0).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0550---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0560
         * @tc.name    : test Call the parallel interface to read and write data to the double instance
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0560", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0560---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = 4.9E-324;
                data.writeDouble(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_DOUBLE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readDouble()).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0560---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0570
         * @tc.name    : test Writedouble interface, boundary value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0570", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0570---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = 1.79E+308;
                data.writeDouble(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_DOUBLE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readDouble()).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0570---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0580
         * @tc.name    : test Writedouble interface, Minimum boundary value out of bounds verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0580", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0580---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = (4.9E-324) - 1;
                data.writeDouble(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_DOUBLE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readDouble()).assertEqual(-1);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0580---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0590
         * @tc.name    : test Writedouble interface, illegal value validation
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0590", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0590---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = "1.79E+465312156";
                data.writeDouble(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0590---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0600
         * @tc.name    : test Call the writeboolean interface to write the data to the MessageSequence instance,
         *             and call readboolean to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0600", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0600---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = true;
                data.writeBoolean(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_BOOLEAN, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readBoolean()).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0600---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0610
         * @tc.name    : test Call the writeboolean interface to write the data to the MessageSequence instance,
         *             and call readboolean to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0610", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0610---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = false;
                data.writeBoolean(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_BOOLEAN, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readBoolean()).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0610---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0620
         * @tc.name    : test Writeboolean interface, illegal value number type verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0620", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0620---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                data.writeBoolean(9);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0620---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0630
         * @tc.name    : test Writeboolean interface, illegal value string type verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0630", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0630---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = "true";
                data.writeBoolean(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0630---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0640
         * @tc.name    : test Call the writechar interface to write the minimum data to the MessageSequence instance,
         *               and call readchar to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0640", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0640---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = 0;
                data.writeChar(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readChar()).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0640---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0650
         * @tc.name    : test Call the writechar interface to write the maximum data to the MessageSequence instance,
         *              and call readchar to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0650", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0650---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = 255;
                data.writeChar(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readChar()).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0650---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0660
         * @tc.name    : test Call the writechar interface to write the minimum out of range data to the MessageSequence instance,
         *              and call readchar to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0660", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0660---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = -1;
                data.writeChar(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readChar()).assertEqual(255);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0660---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0670
         * @tc.name    : test Call the writechar interface to write the maximum out of range data to the MessageSequence instance,
         *              and call readchar to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0670", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0670---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = 256;
                data.writeChar(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readChar()).assertEqual(0);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0670---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0680
         * @tc.name    : test Writechar interface, illegal value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0680", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0680---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = 'ades';
                data.writeChar(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0680---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0690
         * @tc.name    : test Call the writestring interface to write the data to the MessageSequence instance,
         *             and call readstring() to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0690", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0690---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = '';
                for (let i = 0; i < (40 * K - 1); i++) {
                    token += 'a';
                }
                data.writeString(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0690---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0700
         * @tc.name    : test Writestring interface Maximum data out of range verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0700", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0700---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = '';
                for (let i = 0; i < 40 * K; i++) {
                    token += 'a';
                }
                data.writeString(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0700---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0710
         * @tc.name    : test Writestring interface, illegal value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0710", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0710---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = 123;
                data.writeString(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0710---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0720
         * @tc.name    : test Call the writebyte interface to write data to the MessageSequence instance,
         *             and call readbyte to read data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0720", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0720---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = 2;
                data.writeByte(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_BYTE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readByte()).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0720---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0730
         * @tc.name    : test Writebyte interface, boundary value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0730", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0730---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeByte(128);
                data.writeByte(0);
                data.writeByte(1);
                data.writeByte(2);
                data.writeByte(127);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_BYTE_MULTI, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(reply.readByte()).assertEqual(-128);
                    expect(reply.readByte()).assertEqual(0);
                    expect(reply.readByte()).assertEqual(1);
                    expect(reply.readByte()).assertEqual(2);
                    expect(reply.readByte()).assertEqual(127);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0730---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0740
         * @tc.name    : test Writebyte interface, Maximum boundary value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0740", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0740---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeByte(-129);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_BYTE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readByte()).assertEqual(127);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0740---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0750
         * @tc.name    : test Writebyte interface, Minimum boundary value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0750", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0750---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeByte(128);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_BYTE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readByte()).assertEqual(-128);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0750---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0760
         * @tc.name    : test Writebyte interface, illegal value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0760", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0760---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                data.writeByte("error");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0760---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0770
         * @tc.name    : test Call the writeint interface to write the data to the MessageSequence instance,
         *             and call readint to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0770", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0770---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = 2;
                data.writeInt(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readInt()).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0770---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0780
         * @tc.name    : test Writeint interface, boundary value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0780", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0780---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeInt(-2147483648);
                data.writeInt(0);
                data.writeInt(1);
                data.writeInt(2);
                data.writeInt(2147483647);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT_MULTI, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readInt()).assertEqual(-2147483648);
                    expect(result.reply.readInt()).assertEqual(0);
                    expect(result.reply.readInt()).assertEqual(1);
                    expect(result.reply.readInt()).assertEqual(2);
                    expect(result.reply.readInt()).assertEqual(2147483647);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0780---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0790
         * @tc.name    : test Writeint interface, Verification of minimum boundary overrun value
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0790", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0790---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeInt(-2147483649);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT_MULTI, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readInt()).assertEqual(2147483647);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0790---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0800
         * @tc.name    : test Writeint interface, Verification of maximum boundary overrun value
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0800", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0800---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeInt(2147483648);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT_MULTI, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readInt()).assertEqual(-2147483648);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0800---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0810
         * @tc.name    : test Writeint interface, illegal value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0810", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0810---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                data.writeInt("error");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0810---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0820
         * @tc.name    : test Call the writefloat interface to write data to the MessageSequence instance,
         *             and call readfloat to read data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0820", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0820---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = 2.2;
                data.writeFloat(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readFloat()).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0820---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0830
         * @tc.name    : test Writefloat interface, Minimum boundary value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0830", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0830---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = 1.4E-45;
                data.writeFloat(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readFloat()).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0830---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0840
         * @tc.name    : test Writefloat interface, Maximum boundary value verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0840", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0840---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = 3.4028235E38;
                data.writeFloat(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readFloat()).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0840---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0850
         * @tc.name    : test Writefloat interface, Verification of maximum boundary overrun value
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0850", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0850---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = (3.4028235E38) + 1;
                data.writeFloat(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readFloat()).assertEqual(3.4028235e+38);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0850---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0860
         * @tc.name    : test Writefloat interface, Verification of minimum boundary overrun value
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0860", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0860---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = (1.4E-45) - 1;
                data.writeFloat(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readFloat()).assertEqual(-1);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0860---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0870
         * @tc.name    : test Writefloat interface, illegal value validation
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0870", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0870---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = 'a';
                data.writeFloat(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0870---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0880
         * @tc.name    : test Call the getRawDataCapacity interface to get the maximum amount of raw data that a MessageSequence
                         can hold
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0880", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0880---------------------------");
            try {
                var parcel = new rpc.MessageSequence();
                var reply = new rpc.MessageSequence();
                let option = new rpc.MessageOption();
                expect(parcel.getRawDataCapacity()).assertEqual(128 * M);
                let arr = [1, 2, 3, 4, 5];
                parcel.writeIntArray(arr);
                expect(parcel.getRawDataCapacity()).assertEqual(128 * M);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INTARRAY, parcel, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.getRawDataCapacity()).assertEqual(128 * M);
                    let newReadResult = result.reply.readIntArray();
                    expect(newReadResult[0]).assertEqual(arr[0]);
                    expect(newReadResult[1]).assertEqual(arr[1]);
                    expect(newReadResult[2]).assertEqual(arr[2]);
                    expect(newReadResult[3]).assertEqual(arr[3]);
                    expect(newReadResult[4]).assertEqual(arr[4]);
                    expect(result.reply.getRawDataCapacity()).assertEqual(128 * M);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                parcel.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0880---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0890
         * @tc.name    : test Test MessageSequence to deliver rawdata data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0890", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0890---------------------------");
            try {
                var parcel = new rpc.MessageSequence();
                var reply = new rpc.MessageSequence();
                let option = new rpc.MessageOption();
                let arr = [1, 2, 3, 4, 5];
                parcel.writeInt(arr.length);
                parcel.writeRawData(arr, arr.length);
                expect(parcel.getRawDataCapacity()).assertEqual(128 * M);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_RAWDATA, parcel, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let size = result.reply.readInt();
                    expect(size).assertEqual(arr.length);
                    expect(result.reply.getRawDataCapacity()).assertEqual(128 * M);
                    let newReadResult = result.reply.readRawData(size);
                    expect(newReadResult[0]).assertEqual(arr[0]);
                    expect(newReadResult[1]).assertEqual(arr[1]);
                    expect(newReadResult[2]).assertEqual(arr[2]);
                    expect(newReadResult[3]).assertEqual(arr[3]);
                    expect(newReadResult[4]).assertEqual(arr[4]);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                parcel.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0890---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0900
         * @tc.name    : test Test MessageSequence to pass abnormal rawdata data, and expand the capacity for verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0900", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0900---------------------------");
            try {
                var parcel = new rpc.MessageSequence();
                var reply = new rpc.MessageSequence();
                let option = new rpc.MessageOption();
                let arr = [1, 2, 3, 4, 5];
                parcel.writeInt(arr.length + 1);
                parcel.writeRawData(arr, (arr.length + 1));
                expect(parcel.getRawDataCapacity()).assertEqual(128 * M);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_RAWDATA, parcel, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let size = result.reply.readInt();
                    expect(size).assertEqual(arr.length + 1);
                    expect(result.reply.getRawDataCapacity()).assertEqual(128 * M);
                    let newReadResult = result.reply.readRawData(size);
                    expect(newReadResult[0]).assertEqual(arr[0]);
                    expect(newReadResult[1]).assertEqual(arr[1]);
                    expect(newReadResult[2]).assertEqual(arr[2]);
                    expect(newReadResult[3]).assertEqual(arr[3]);
                    expect(newReadResult[4]).assertEqual(arr[4]);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                parcel.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0900---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0910
         * @tc.name    : test Test MessageSequence to pass exception rawdata data data interception verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0910", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0910---------------------------");
            try {
                var parcel = new rpc.MessageSequence();
                var reply = new rpc.MessageSequence();
                let option = new rpc.MessageOption();
                let arr = [1, 2, 3, 4, 5];
                parcel.writeInt(arr.length - 1);
                parcel.writeRawData(arr, (arr.length - 1));
                expect(parcel.getRawDataCapacity()).assertEqual(128 * M);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_RAWDATA, parcel, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let size = result.reply.readInt();
                    expect(size).assertEqual(arr.length - 1);
                    expect(result.reply.getRawDataCapacity()).assertEqual(128 * M);
                    let newReadResult = result.reply.readRawData(size);
                    expect(newReadResult[0]).assertEqual(arr[0]);
                    expect(newReadResult[1]).assertEqual(arr[1]);
                    expect(newReadResult[2]).assertEqual(arr[2]);
                    expect(newReadResult[3]).assertEqual(arr[3]);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                parcel.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0910---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0920
         * @tc.name    : test Test MessageSequence to deliver out-of-bounds RawData data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0920", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0920---------------------------");
            try {
                var parcel = new rpc.MessageSequence();
                var reply = new rpc.MessageSequence();
                let option = new rpc.MessageOption();
                let arr = [-129, 2, 3, 4, 128];
                parcel.writeInt(arr.length);
                parcel.writeRawData(arr, arr.length);
                expect(parcel.getRawDataCapacity()).assertEqual(128 * M);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_RAWDATA, parcel, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let size = result.reply.readInt();
                    expect(size).assertEqual(arr.length);
                    expect(result.reply.getRawDataCapacity()).assertEqual(128 * M);
                    let newReadResult = result.reply.readRawData(size);
                    expect(newReadResult[0]).assertEqual(arr[0]);
                    expect(newReadResult[1]).assertEqual(arr[1]);
                    expect(newReadResult[2]).assertEqual(arr[2]);
                    expect(newReadResult[3]).assertEqual(arr[3]);
                    expect(newReadResult[4]).assertEqual(arr[4]);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                parcel.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0920---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0930
         * @tc.name    : test Test MessageSequence to deliver illegal RawData data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0930", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0930---------------------------");
            try {
                var parcel = new rpc.MessageSequence();
                let arr = ["aaa", 1, 2, 3];
                parcel.writeInt(arr.length);
                parcel.writeRawData(arr, arr.length);
                expect(parcel.getRawDataCapacity()).assertEqual(128 * M);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                parcel.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0930---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0940
         * @tc.name    : test Call the writeremoteobject interface to serialize the remote object
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0940", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0940---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let testRemoteObject = new TestRemoteObject("testObject");
                data.writeRemoteObject(testRemoteObject);
                expect(data.readRemoteObject() != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0940---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0950
         * @tc.name    : test Call the writeremoteobject interface to serialize the remote object and pass in the empty object
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0950", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0950---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = new TestRemoteObject(null);
                data.writeRemoteObject(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0950---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0960
         * @tc.name    : test Call the writeremoteobject interface to serialize the remote object and pass in the empty object
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3   
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0960", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0960---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = {};
                data.writeRemoteObject(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error.code == 1900008).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0960---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0970
         * @tc.name    : test Call the writeParcelable interface to write the custom serialized
         *             object to the MessageSequence instance
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0970", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0970---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let sequenceable = new MySequenceable(1, "aaa");
                data.writeParcelable(sequenceable);
                let ret = new MySequenceable(0, "");
                data.readParcelable(ret);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error).assertEqual(null);
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0970---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0980
         * @tc.name    : test Call the writeParcelable interface to write the custom serialized
         *             object to the MessageSequence instance, Migration to read
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0980", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0980---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let sequenceable = new MySequenceable(1, "aaa");
                data.writeParcelable(sequenceable);
                let ret = new MySequenceable(1, "");
                data.readParcelable(ret);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0980---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_0990
         * @tc.name    : test After the server finishes processing, write noexception first before writing the result,
         *             and the client calls readexception to judge whether the server is abnormal
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_0990", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_0990---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeNoException();
                data.writeInt(6);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_NOEXCEPTION, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    result.reply.readException();
                    expect(result.reply.readInt()).assertEqual(6);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_0990---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1000
         * @tc.name    : test If the data on the server is abnormal, the client calls readexception
         *             to judge whether the server is abnormal
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1000", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1000---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeNoException();
                data.writeInt(1232222223444);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_NOEXCEPTION, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    result.reply.readException();
                    expect(result.reply.readInt() != 1232222223444).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1000---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1010
         * @tc.name    : test Serializable object marshaling and unmarshalling test
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1010", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1010---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let sequenceable = new MySequenceable(1, "aaa");
                data.writeParcelable(sequenceable);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_SEQUENCEABLE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let s = new MySequenceable(null, null);
                    result.reply.readParcelable(s);
                    expect(s.str).assertEqual(sequenceable.str);
                    expect(s.num).assertEqual(sequenceable.num);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1010---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1020
         * @tc.name    : test Non serializable object marshaling test
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1020", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1020---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let sequenceable = new MySequenceable(1, 1);
                data.writeParcelable(sequenceable);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1020---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1030
         * @tc.name    : test The server did not send a serializable object, and the client was ungrouped
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1030", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1030---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let sequenceable = 10;
                data.writeInt(sequenceable);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let s = new MySequenceable(0, null);
                    result.reply.readParcelable(s);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1030---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1040
         * @tc.name    : test Call the writeParcelable interface to write the custom serialized object to the
         *             MessageSequence instance, and call readParcelable to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1040", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1040---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let sequenceable = new MySequenceable(2, "abc");
                data.writeParcelable(sequenceable);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_SEQUENCEABLE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let s = new MySequenceable(null, null);
                    result.reply.readParcelable(s);
                    expect(s.str).assertEqual(sequenceable.str);
                    expect(s.num).assertEqual(sequenceable.num);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1040---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1050
         * @tc.name    : test Call the writeParcelablearray interface to write the custom serialized object array (1, 2, 3) to
         *              the MessageSequence instance, and call readParcelablearray to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1050", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1050---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let sequenceable = [new MySequenceable(1, "aaa"),
                new MySequenceable(2, "bbb"), new MySequenceable(3, "ccc")];
                data.writeParcelableArray(sequenceable);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_SEQUENCEABLEARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let s = [new MySequenceable(null, null), new MySequenceable(null, null),
                    new MySequenceable(null, null)];
                    result.reply.readParcelableArray(s);
                    for (let i = 0; i < s.length; i++) {
                        expect(s[i].str).assertEqual(sequenceable[i].str);
                        expect(s[i].num).assertEqual(sequenceable[i].num);
                    };
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1050---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1060
         * @tc.name    : test Call the writeParcelablearray interface to write the custom serialized object to the
         *             MessageSequence instance, and call readParcelablearray to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1060", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1060---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let sequenceable = [new MySequenceable(4, "abc"),
                new MySequenceable(5, "bcd"), new MySequenceable(6, "cef")];
                data.writeParcelableArray(sequenceable);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_SEQUENCEABLEARRAY, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let s = [new MySequenceable(null, null),
                    new MySequenceable(null, null), new MySequenceable(null, null)];
                    result.reply.readParcelableArray(s);
                    for (let i = 0; i < s.length; i++) {
                        expect(s[i].str).assertEqual(sequenceable[i].str);
                        expect(s[i].num).assertEqual(sequenceable[i].num);
                    };
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1060---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1070
         * @tc.name    : test Call the writeParcelablearray interface to write the custom
         *             serialized object to the MessageSequence instance
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1070", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1070---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let sequenceable = 1;
                data.writeParcelableArray(sequenceable);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1070---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1080
         * @tc.name    : test Call the writeremoteobjectarray interface to write the object array to the MessageSequence
         *             instance, and call readremoteobjectarray to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1080", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1080---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                var option = new rpc.MessageOption();
                var listeners = [new TestRemoteObject("rpcListener"),
                new TestRemoteObject("rpcListener2"),
                new TestRemoteObject("rpcListener3")];
                data.writeRemoteObjectArray(listeners);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_REMOTEOBJECTARRAY, data, reply, option).then((result) => {
                    console.info("SUB_DSoftbus_IPC_API_MessageSequence_1080: sendMessageRequest is " + result.errCode);
                    expect(result.errCode).assertEqual(0);
                    expect(result.code).assertEqual(CODE_WRITE_REMOTEOBJECTARRAY);
                    expect(result.data).assertEqual(data);
                    expect(result.reply).assertEqual(reply);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1080---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1100
         * @tc.name    : test Test MessageSequence to deliver the reply message received in promise across processes
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1100", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1100---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeByte(2);
                data.writeShort(3);
                data.writeInt(4);
                data.writeLong(5);
                data.writeFloat(1.2);
                data.writeDouble(10.2);
                data.writeBoolean(true);
                data.writeChar(97);
                data.writeString("HelloWorld");
                data.writeParcelable(new MySequenceable(1, "aaa"));
                await gIRemoteObject.sendMessageRequest(CODE_ALL_TYPE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readByte()).assertEqual(2);
                    expect(result.reply.readShort()).assertEqual(3);
                    expect(result.reply.readInt()).assertEqual(4);
                    expect(result.reply.readLong()).assertEqual(5);
                    expect(result.reply.readFloat()).assertEqual(1.2);
                    expect(result.reply.readDouble()).assertEqual(10.2);
                    expect(result.reply.readBoolean()).assertTrue();
                    expect(result.reply.readChar()).assertEqual(97)
                    expect(result.reply.readString()).assertEqual("HelloWorld");
                    let s = new MySequenceable(null, null);
                    result.reply.readParcelable(s);
                    expect(s.num).assertEqual(1);
                    expect(s.str).assertEqual("aaa");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1100---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1110
         * @tc.name    : test Test the cross process delivery of MessageSequence and receive the reply message
         *             in the callback function
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1110", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1110---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeByte(2);
                data.writeShort(3);
                data.writeInt(4);
                data.writeLong(5);
                data.writeFloat(1.2);
                data.writeDouble(10.2);
                data.writeBoolean(true);
                data.writeChar(97);
                data.writeString("HelloWorld");
                data.writeParcelable(new MySequenceable(1, "aaa"));
                function sendMessageRequestCallback(result) {
                    try {
                        console.info("sendMessageRequest Callback");
                        expect(result.errCode).assertEqual(0);
                        expect(result.reply.readByte()).assertEqual(2);
                        expect(result.reply.readShort()).assertEqual(3);
                        expect(result.reply.readInt()).assertEqual(4);
                        expect(result.reply.readLong()).assertEqual(5);
                        expect(result.reply.readFloat()).assertEqual(1.2);
                        expect(result.reply.readDouble()).assertEqual(10.2);
                        expect(result.reply.readBoolean()).assertTrue();
                        expect(result.reply.readChar()).assertEqual(97);
                        expect(result.reply.readString()).assertEqual("HelloWorld");
                        let s = new MySequenceable(null, null);
                        result.reply.readParcelable(s);
                        expect(s.num).assertEqual(1);
                        expect(s.str).assertEqual("aaa");
                    } finally {
                        data.reclaim();
                        reply.reclaim();
                        done();
                    }
                }
                console.info("start send request");
                await gIRemoteObject.sendMessageRequest(CODE_ALL_TYPE, data, reply, option, sendMessageRequestCallback);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("--------------------end SUB_DSoftbus_IPC_API_MessageSequence_1110--------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1120
         * @tc.name    : test Test the cross process transmission of MessageSequence.
         *             After receiving the reply message in promise, read letious types of arrays in order
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1120", 0, async function (done) {
            console.info("--------------------start SUB_DSoftbus_IPC_API_MessageSequence_1120--------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeByteArray([1, 2, 3]);
                data.writeShortArray([4, 5, 6]);
                data.writeIntArray([7, 8, 9]);
                data.writeLongArray([10, 11, 12]);
                data.writeFloatArray([1.1, 1.2, 1.3]);
                data.writeDoubleArray([2.1, 2.2, 2.3]);
                data.writeBooleanArray([true, true, false]);
                data.writeCharArray([65, 97, 122]);
                data.writeStringArray(['abc', 'seggg']);
                let a = [new MySequenceable(1, "aaa"), new MySequenceable(2, "bbb"),
                new MySequenceable(3, "ccc")]
                data.writeParcelableArray(a);
                await gIRemoteObject.sendMessageRequest(CODE_ALL_ARRAY_TYPE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readByteArray(), [1, 2, 3]);
                    assertArrayElementEqual(result.reply.readShortArray(), [4, 5, 6]);
                    assertArrayElementEqual(result.reply.readIntArray(), [7, 8, 9]);
                    assertArrayElementEqual(result.reply.readLongArray(), [10, 11, 12]);
                    assertArrayElementEqual(result.reply.readFloatArray(), [1.1, 1.2, 1.3]);
                    assertArrayElementEqual(result.reply.readDoubleArray(), [2.1, 2.2, 2.3]);
                    assertArrayElementEqual(result.reply.readBooleanArray(), [true, true, false]);
                    assertArrayElementEqual(result.reply.readCharArray(), [65, 97, 122]);
                    assertArrayElementEqual(result.reply.readStringArray(), ['abc', 'seggg']);
                    let b = [new MySequenceable(null, null), new MySequenceable(null, null),
                    new MySequenceable(null, null)];
                    result.reply.readParcelableArray(b);
                    for (let i = 0; i < b.length; i++) {
                        expect(b[i].str).assertEqual(a[i].str);
                        expect(b[i].num).assertEqual(a[i].num);
                    };
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1120---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1130
         * @tc.name    : test Test MessageSequence cross process delivery. After receiving the reply message in promise,
         *             the client constructs an empty array in sequence and reads the data from the reply message
         *             into the corresponding array
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1130", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1130---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeByteArray([1, 2, 3]);
                data.writeShortArray([4, 5, 6]);
                data.writeIntArray([7, 8, 9]);
                data.writeLongArray([10, 11, 12]);
                data.writeFloatArray([1.1, 1.2, 1.3]);
                data.writeDoubleArray([2.1, 2.2, 2.3]);
                data.writeBooleanArray([true, true, false]);
                data.writeCharArray([65, 97, 122]);
                data.writeStringArray(['abc', 'seggg']);
                let a = [new MySequenceable(1, "aaa"), new MySequenceable(2, "bbb"),
                new MySequenceable(3, "ccc")]
                data.writeParcelableArray(a);
                await gIRemoteObject.sendMessageRequest(CODE_ALL_ARRAY_TYPE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let ByteArray = new Array();
                    result.reply.readByteArray(ByteArray);
                    assertArrayElementEqual(ByteArray, [1, 2, 3]);
                    let ShortArray = new Array();
                    result.reply.readShortArray(ShortArray);
                    assertArrayElementEqual(ShortArray, [4, 5, 6]);
                    let IntArray = new Array();
                    result.reply.readIntArray(IntArray);
                    assertArrayElementEqual(IntArray, [7, 8, 9]);
                    let LongArray = new Array();
                    result.reply.readLongArray(LongArray);
                    assertArrayElementEqual(LongArray, [10, 11, 12]);
                    let FloatArray = new Array();
                    result.reply.readFloatArray(FloatArray);
                    assertArrayElementEqual(FloatArray,[1.1, 1.2, 1.3]);
                    let DoubleArray = new Array();
                    result.reply.readDoubleArray(DoubleArray);
                    assertArrayElementEqual(DoubleArray,[2.1, 2.2, 2.3]);
                    let BooleanArray = new Array();
                    result.reply.readBooleanArray(BooleanArray);
                     assertArrayElementEqual(BooleanArray,[true, true, false]);
                    let CharArray = new Array();
                    result.reply.readCharArray(CharArray);
                     assertArrayElementEqual(CharArray,[65, 97, 122]);
                    let StringArray = new Array();
                    result.reply.readStringArray(StringArray);
                     assertArrayElementEqual(StringArray,['abc', 'seggg']);
                    let b = [new MySequenceable(null, null), new MySequenceable(null, null),
                    new MySequenceable(null, null)];
                    result.reply.readParcelableArray(b);
                    for (let i = 0; i < b.length; i++) {
                        expect(b[i].str).assertEqual(a[i].str);
                        expect(b[i].num).assertEqual(a[i].num);
                    };
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1130---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1140
         * @tc.name    : test Test MessageSequence to pass an object of type iremoteobject across processes
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it('SUB_DSoftbus_IPC_API_MessageSequence_1140', 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1140---------------------------");
            function checkResult(num, str) {
                expect(num).assertEqual(123);
                expect(str).assertEqual("rpcListenerTest");
                done();
            };
            try {
                var option = new rpc.MessageOption();
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let listener = new TestListener("rpcListener", checkResult);
                data.writeRemoteObject(listener);
                data.writeInt(123);
                data.writeString("rpcListenerTest");
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_REMOTEOBJECT, data, reply, option).then((result) => {
                    console.info("SUB_DSoftbus_IPC_API_MessageSequence_1140: sendMessageRequest is " + result.errCode);
                    expect(result.errCode).assertEqual(0);
                    result.reply.readException();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1140---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1150
         * @tc.name    : test Test MessageSequence to pass an array of iremoteobject objects across processes
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it('SUB_DSoftbus_IPC_API_MessageSequence_1150', 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1150---------------------------");
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
            try {
                let option = new rpc.MessageOption();
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let listeners = [new TestListener("rpcListener", checkResult),
                new TestListener("rpcListener2", checkResult),
                new TestListener("rpcListener3", checkResult)];
                data.writeRemoteObjectArray(listeners);
                data.writeInt(123);
                data.writeString("rpcListenerTest");
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_REMOTEOBJECTARRAY_1, data, reply, option)
                    .then((result) => {
                        expect(result.errCode).assertEqual(0);
                        result.reply.readException();
                    });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1150---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1160
         * @tc.name    : test Test MessageSequence to pass the array of iremoteobject objects across processes. The server
         *             constructs an empty array in onremoterequest and reads it from MessageSequence
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it('SUB_DSoftbus_IPC_API_MessageSequence_1160', 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1160---------------------------");
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
            try {
                let option = new rpc.MessageOption();
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let listeners = [new TestListener("rpcListener", checkResult),
                new TestListener("rpcListener2", checkResult),
                new TestListener("rpcListener3", checkResult)];
                data.writeRemoteObjectArray(listeners);
                data.writeInt(123);
                data.writeString("rpcListenerTest");
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_REMOTEOBJECTARRAY_2, data, reply, option)
                    .then((result) => {
                        console.info("SUB_DSoftbus_IPC_API_MessageSequence_1160: sendMessageRequest is " + result.errCode);
                        expect(result.errCode).assertEqual(0);
                        result.reply.readException();
                    })
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1160---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1170
         * @tc.name    : test Invoke the rewindRead interface,Set 0-bit offset and read the data after offset
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1170", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1170---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                data.writeInt(12);
                data.writeString("parcel");
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readInt()).assertEqual(12);
                    result.reply.rewindRead(0);
                    expect(result.reply.readInt()).assertEqual(12);
                    expect(result.reply.readString()).assertEqual("");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1170---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1180
         * @tc.name    : test Invoke the rewindRead interface,Set 1-bit offset and read the data after offset
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1180", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1170---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                data.writeInt(12);
                data.writeString("parcel");
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    expect(result.reply.readInt()).assertEqual(12);
                    result.reply.rewindRead(1);
                    expect(result.reply.readInt()).assertEqual(0);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1180---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1190
         * @tc.name    : test Invoke the rewindWrite interface, Set 0-bit offset and write the data after offset
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1190", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1180---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                data.writeInt(4);
                data.rewindWrite(0);
                data.writeInt(5);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    expect(result.reply.readInt()).assertEqual(5);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1190---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1200
         * @tc.name    : test Invoke the rewindWrite interface, Set 1-bit offset and write the data after offset
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1200", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1200---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                data.writeInt(4);
                data.rewindWrite(1);
                data.writeInt(5);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readInt() != 5).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1200---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1210
         * @tc.name    : test setCapacity Sets the storage capacity of the null MessageSequence instance. The getCapacity
                       obtains the current MessageSequence capacity
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1210", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1210---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                expect(data.getCapacity()).assertEqual(0);
                data.setCapacity(100);
                data.writeString("constant");
                expect(data.getCapacity()).assertEqual(100);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.getCapacity()).assertEqual("constant".length * 8);
                    expect(result.reply.readString()).assertEqual("constant");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1210---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1220
         * @tc.name    : test setCapacity Sets the storage capacity of the MessageSequence instance. The getCapacity
                       obtains the current MessageSequence capacity
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1220", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1220---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                data.writeString("constant");
                data.setCapacity(100);
                expect(data.getCapacity()).assertEqual(100);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual("constant");
                    expect(result.reply.getCapacity()).assertEqual("constant".length * 8);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1220---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1230
         * @tc.name    : test Setcapacity test: size limit verification of MessageSequence instance
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1230", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1230---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                expect(data.getCapacity()).assertEqual(0);
                data.writeString("constant");
                let getSizedata = data.getSize();
                data.setCapacity(getSizedata + 1);
                data.setCapacity(getSizedata);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.PARCEL_MEMORY_ALLOC_ERROR}`;
                expect(error.message != null).assertTrue();
                expect(error.code == errCode).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1230---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1240
         * @tc.name    : test SetCapacity Tests the storage capacity threshold of the MessageSequence instance
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1240", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1240---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                data.writeString("constant");
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let getSizeresult = result.reply.getSize();
                    expect(result.reply.getCapacity()).assertEqual("constant".length * 8);
                    result.reply.setCapacity(getSizeresult + 1);
                    result.reply.setCapacity(getSizeresult);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.PARCEL_MEMORY_ALLOC_ERROR}`;
                expect(error.message != null).assertTrue();
                expect(error.code == errCode).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1240---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1250
         * @tc.name    : test Setcapacity test storage capacity boundary value verification of MessageSequence instance
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1250", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1250---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                expect(data.getSize()).assertEqual(0);
                data.setCapacity(M);
                expect(data.getCapacity()).assertEqual(M);
                data.setCapacity(2 * G);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.PARCEL_MEMORY_ALLOC_ERROR}`;
                expect(error.message != null).assertTrue();
                expect(error.code == errCode).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1250---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1260
         * @tc.name    : test setSize Sets the size of the data contained in the MessageSequence instance. The getSize command
                        reads the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1260", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1260---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                expect(data.getSize()).assertEqual(0);
                data.setSize(0);
                data.writeString("constant");
                expect(data.getSize()).assertEqual(("constant".length * 2) + 8);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.getSize()).assertEqual(("constant".length * 2) + 8);
                    expect(result.reply.readString()).assertEqual("constant");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1260---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1270
         * @tc.name    : test SetSize: Increases the value of the data contained in the MessageSequence instance by 1,
                        Write setSize
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1270", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1270---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                data.writeString("constant");
                expect(data.getSize()).assertEqual(("constant".length * 2) + 8);
                data.setSize(0);
                expect(data.getSize()).assertEqual(0);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.getSize()).assertEqual(8);
                    expect(result.reply.readString()).assertEqual("");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1270---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1280
         * @tc.name    : test Verify the MessageSequence instance SetSize setting and the instance capacitydata qualification verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1280", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1280---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                expect(data.getSize()).assertEqual(0);
                data.writeString("constant");
                expect(data.getSize()).assertEqual(("constant".length * 2) + 8);
                let getCapacitydata = data.getCapacity();
                expect(getCapacitydata).assertEqual(64);
                data.setSize(getCapacitydata);
                expect(data.getSize()).assertEqual(getCapacitydata);
                data.setSize(getCapacitydata + 1);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1280---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1290
         * @tc.name    : test setSize Sets the storage capacity of the MessageSequence instance to decrease by one.
                       The getSize obtains the current MessageSequence capacity
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1290", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1290---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                data.writeString("constant");
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual("constant");
                    expect(result.reply.getSize()).assertEqual(("constant".length * 2) + 8);
                    let getCapacityresult = result.reply.getCapacity();
                    result.reply.setSize(getCapacityresult);
                    expect(result.reply.getSize()).assertEqual(getCapacityresult);
                    result.reply.setSize(getCapacityresult + 1);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1290---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1300
         * @tc.name    : test Validate the setSize boundary value in the MessageSequence instance
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1300", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1300---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                expect(data.getCapacity()).assertEqual(0);
                data.setSize(4 * G);
                expect(data.getSize()).assertEqual(0);
                data.setSize(4 * G - 1);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1300---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1310
         * @tc.name    : test Verify that setSize is out of bounds in a MessageSequence instance
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1310", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1310---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                data.setSize(0);
                expect(data.getSize()).assertEqual(0);
                data.setSize(2 * 4 * G);
                expect(data.getSize()).assertEqual(0);
                data.setSize(2 * G);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1310---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1320
         * @tc.name    : test Obtains the write and read positions of the MessageSequence
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1320", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1320---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                expect(data.getWritePosition()).assertEqual(0);
                data.writeInt(10);
                expect(data.getWritePosition()).assertEqual(4);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.getReadPosition()).assertEqual(0);
                    expect(result.reply.readInt()).assertEqual(10);
                    expect(result.reply.getReadPosition()).assertEqual(4);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1320---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1330
         * @tc.name    : test Obtaining the Writable and Readable Byte Spaces of MessageSequence
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1330", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1330---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                expect(data.getWritableBytes()).assertEqual(0);
                data.writeInt(10);
                expect(data.getWritableBytes()).assertEqual(60);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readInt()).assertEqual(10);
                    expect(result.reply.getReadableBytes()).assertEqual(0);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1330---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1340
         * @tc.name    : test Obtains the writeable and readable byte space and read position of the MessageSequence
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1340", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1340---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                data.writeInt(10);
                expect(data.getWritePosition()).assertEqual(4);
                expect(data.getWritableBytes()).assertEqual(60);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.getReadableBytes()).assertEqual(4);
                    expect(result.reply.getReadPosition()).assertEqual(0);
                    expect(result.reply.readInt()).assertEqual(10);
                    expect(result.reply.getReadableBytes()).assertEqual(0);
                    expect(result.reply.getReadPosition()).assertEqual(4);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1340---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1350
         * @tc.name    : test Get the space size of MessageSequence to pass rawdata data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1350", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1350---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                data.writeInt(10);
                expect(data.getWritePosition()).assertEqual(4);
                expect(data.getWritableBytes()).assertEqual(60);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.getReadPosition()).assertEqual(0);
                    expect(result.reply.getReadableBytes()).assertEqual(4);
                    expect(result.reply.readInt()).assertEqual(10);
                    expect(result.reply.getReadPosition()).assertEqual(4);
                    expect(result.reply.getReadableBytes()).assertEqual(0);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1350---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1360
         * @tc.name    : test Test fixed MessageSequence space size to pass rawData data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1360", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1360---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                expect(data.getRawDataCapacity()).assertEqual(128 * M);
                let rawdata = [1, 2, 3];
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                data.writeInt(rawdata.length);
                data.writeRawData(rawdata, rawdata.length);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_RAWDATA, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let size = result.reply.readInt();
                    expect(result.reply.readRawData(size) != rawdata).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1360---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1370
         * @tc.name    : test Test MessageSequence delivery file descriptor object
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1370", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1370---------------------------");
            try {
                let testab = new TestProxy(gIRemoteObject).asObject();
                expect(testab != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1370---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1380
         * @tc.name    : test Test that the asObject interface is called by a RemoteObject and returns itself
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1380", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1380---------------------------");
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                expect(testRemoteObject.asObject() != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1380---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1390
         * @tc.name    : test MessageSequence sendMessageRequest API test
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1390", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1390---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let rawdata = [1, 2, 3];
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                data.getRawDataCapacity();
                data.writeInt(rawdata.length);
                data.writeRawData(rawdata, rawdata.length);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_RAWDATA, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readInt()).assertEqual(rawdata.length);
                    expect(result.reply.readRawData(rawdata.length) != rawdata).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1390---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1400
         * @tc.name    : test Invoke the writestring interface to write data to the MessageSequence instance. sendMessageRequest asynchronously
         *               verifies the priority processing levels of onRemoteMessageRequest and onRemoteRequest
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1400", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1400---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = "onRemoteRequest or onRemoteMessageRequest invoking";
                data.writeString(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_ONREMOTEMESSAGE_OR_ONREMOTE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual("onRemoteMessageRequest invoking");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1400---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1410
         * @tc.name    : test writeRemoteObject is proxy or remote object is invalid Error message verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0   
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1410", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1410---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = {};
                data.writeRemoteObject(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                expect(error.code == 1900008).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1410---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1420
         * @tc.name    : test readParcelable is Call JS callback function failedv Error message verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1420", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1420---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let sequenceable = new MySequenceable(1, "aaa");
                data.writeParcelable(sequenceable);
                data.setCapacity(0);
                data.setSize(0);
                let ret = new MySequenceable(1, "");
                data.readParcelable(ret);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.CALL_JS_METHOD_ERROR}`;
                expect(error.message != null).assertTrue();
                expect(error.code != errCode).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1420---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1430
         * @tc.name    : test Call the writeinterfacetoken interface, write the interface descriptor, and read interfacetoken
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1430", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1430---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = "hello ruan zong xian";
                data.writeInterfaceToken(token);
                data.setCapacity(0);
                data.setSize(0);
                data.readInterfaceToken();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.message != null).assertTrue();
                expect(error.code != errCode).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1430---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1440
         * @tc.name    : test writeString check param error Error message verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1440", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1440---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = '';
                for (let i = 0; i < 40 * K; i++) {
                    token += 'a';
                };
                data.writeString(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1440---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1450
         * @tc.name    : test writeInterfaceToken Sequence memory alloc failed Error message verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1450", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1450---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                data.setSize(0);
                data.setCapacity(0);
                let token = "hello ruan zong xian";
                data.writeInterfaceToken(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.PARCEL_MEMORY_ALLOC_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1450---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1460
         * @tc.name    : test writeInterfaceToken Write data to message sequence failed Error message verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1460", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1460---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                data.setSize(true);
                data.setCapacity(true);
                let token = "hello ruan zong xian";
                data.writeInterfaceToken(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1460---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1470
         * @tc.name    : test readParcelable Sequence memory alloc failed Error message verification
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1470", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1470---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let sequenceable = new MySequenceable(1, "aaa");
                data.writeParcelable(sequenceable);
                let ret = new MySequenceable(0, "");
                data.setCapacity(0);
                data.readParcelable(ret);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_testcase error is:" + error);
                let errCode = `${rpc.ErrorCode.PARCEL_MEMORY_ALLOC_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1470---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1480
         * @tc.name    : test Test messageparcel delivery file descriptor object
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1480", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1480---------------------------");
            let context = FA.getContext();
            await context.getFilesDir()
                .then(async function (path) {
                    expect(path != null).assertTrue();
                    let basePath = path;
                    let filePath = basePath + "/test1.txt";
                    let fd = fileio.openSync(filePath, 0o2 | 0o100 | 0o2000, 0o666);
                    expect(fd >= 0).assertTrue();
                    let str = "HELLO RPC";
                    let bytesWr = fileio.writeSync(fd, str);
                    let option = new rpc.MessageOption();
                    var data = rpc.MessageSequence.create();
                    var reply = rpc.MessageSequence.create();
                    data.containFileDescriptors();
                    data.writeInt(bytesWr);
                    data.writeFileDescriptor(fd);
                    data.containFileDescriptors();
                    data.containFileDescriptors();
                    await gIRemoteObject.sendMessageRequest(CODE_FILESDIR, data, reply, option)
                        .then(function (result) {
                            expect(result.errCode).assertEqual(0);
                            let buf = new ArrayBuffer(str.length * 2);
                            let bytesRd = fileio.readSync(fd, buf, { position: 0, });
                            expect(bytesRd == (bytesWr + bytesWr)).assertTrue();
                            let fdResult = result.reply.readFileDescriptor();
                            expect(fdResult >= fd).assertTrue();
                            let content = String.fromCharCode.apply(null, new Uint8Array(buf));
                            expect(content).assertEqual(str + str);
                            let dupFd = rpc.MessageSequence.dupFileDescriptor(fd);
                            expect(dupFd >= fd).assertTrue();
                            let buf2 = new ArrayBuffer(str.length * 2);
                            let byteRd2 = fileio.readSync(dupFd, buf2, { position: 0, });
                            expect(byteRd2 == (bytesWr + bytesWr)).assertTrue();
                            let content2 = String.fromCharCode.apply(null, new Uint8Array(buf2));
                            expect(content2).assertEqual(str + str);
                            rpc.MessageSequence.closeFileDescriptor(fd);
                            rpc.MessageSequence.closeFileDescriptor(dupFd);
                        })
                    try {
                        console.info("after close fd, write again");
                        fileio.writeSync(fd, str);
                        expect(0).assertEqual(1);
                    } catch (e) {
                        console.error("got exception: " + e);
                    } finally {
                        data.reclaim();
                        reply.reclaim();
                        done();
                    }
                })
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1480---------------------------");
        });

                /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1480
         * @tc.name    : test Test messageparcel delivery file descriptor object
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1480", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1480---------------------------");
            let context = FA.getContext();
            await context.getFilesDir()
                .then(async function (path) {
                    expect(path != null).assertTrue();
                    let basePath = path;
                    let filePath = basePath + "/test1.txt";
                    let fd = fileio.openSync(filePath, 0o2 | 0o100 | 0o2000, 0o666);
                    expect(fd >= 0).assertTrue();
                    let str = "HELLO RPC";
                    let bytesWr = fileio.writeSync(fd, str);
                    let option = new rpc.MessageOption();
                    var data = rpc.MessageSequence.create();
                    var reply = rpc.MessageSequence.create();
                    data.containFileDescriptors();
                    data.writeInt(bytesWr);
                    data.writeFileDescriptor(fd);
                    data.containFileDescriptors();
                    data.containFileDescriptors();
                    await gIRemoteObject.sendMessageRequest(CODE_FILESDIR, data, reply, option)
                        .then(function (result) {
                            expect(result.errCode).assertEqual(0);
                            let buf = new ArrayBuffer(str.length * 2);
                            let bytesRd = fileio.readSync(fd, buf, { position: 0, });
                            expect(bytesRd == (bytesWr + bytesWr)).assertTrue();
                            let fdResult = result.reply.readFileDescriptor();
                            expect(fdResult >= fd).assertTrue();
                            let content = String.fromCharCode.apply(null, new Uint8Array(buf));
                            expect(content).assertEqual(str + str);
                            let dupFd = rpc.MessageSequence.dupFileDescriptor(fd);
                            expect(dupFd >= fd).assertTrue();
                            let buf2 = new ArrayBuffer(str.length * 2);
                            let byteRd2 = fileio.readSync(dupFd, buf2, { position: 0, });
                            expect(byteRd2 == (bytesWr + bytesWr)).assertTrue();
                            let content2 = String.fromCharCode.apply(null, new Uint8Array(buf2));
                            expect(content2).assertEqual(str + str);
                            rpc.MessageSequence.closeFileDescriptor(fd);
                            rpc.MessageSequence.closeFileDescriptor(dupFd);
                        })
                    try {
                        console.info("after close fd, write again");
                        fileio.writeSync(fd, str);
                        expect(0).assertEqual(1);
                    } catch (e) {
                        console.error("got exception: " + e);
                    } finally {
                        data.reclaim();
                        reply.reclaim();
                        done();
                    }
                })
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1480---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1490
         * @tc.name    : test Test MessageSequence write and read ArrayBuffer int8array
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1490", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1490---------------------------");
            var data = rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(5);
            let int8View = new Int8Array(buffer);
            for (let i = 0; i < int8View.length; i++) {
                int8View[i] = i + 1;
            };
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1490 int8View is:" + int8View);
            try {
                data.writeArrayBuffer(buffer, rpc.TypeCode.INT8_ARRAY);
                let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.INT8_ARRAY);
                let int8Array = new Int8Array(arrayBuffer);
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1490 int8Array is:" + int8Array);
                 assertArrayElementEqual(int8View,int8Array);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1490 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1490---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1500
         * @tc.name    : test Test MessageSequence write and read ArrayBuffer uint8array
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1500", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1500---------------------------");
            var data = rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(12);
            let uInt8View = new Uint8Array(buffer);
            for (let i = 0; i < uInt8View.length; i++) {
                uInt8View[i] = i + 10;
            };
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1500 uInt8View is:" + uInt8View);
            try {
                data.writeArrayBuffer(buffer, rpc.TypeCode.UINT8_ARRAY);
                let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.UINT8_ARRAY);
                let uInt8Array = new Uint8Array(arrayBuffer);
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1500 uInt8Array is:" + uInt8Array);
                 assertArrayElementEqual(uInt8View,uInt8Array);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1500 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1500---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1510
         * @tc.name    : test Test MessageSequence write and read ArrayBuffer int16array
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1510", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1510---------------------------");
            var data = rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(10);
            let int16View = new Int16Array(buffer);
            for (let i = 0; i < int16View.length; i++) {
                int16View[i] = i + 20;
            };
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1510 int16View is:" + int16View);
            try {
                data.writeArrayBuffer(buffer, rpc.TypeCode.INT16_ARRAY);
                let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.INT16_ARRAY);
                let int16Array = new Int16Array(arrayBuffer);
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1510 int16Array is:" + int16Array);
                assertArrayElementEqual(int16View,int16Array);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1510 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1510---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1520
         * @tc.name    : test Test MessageSequence write and read ArrayBuffer uint16array
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1520", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1520---------------------------");
            var data = rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(12);
            let uInt16View = new Uint16Array(buffer);
            for (let i = 0; i < uInt16View.length; i++) {
                uInt16View[i] = i + 20;
            };
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1520 uInt16View is:" + uInt16View);
            try {
                data.writeArrayBuffer(buffer, rpc.TypeCode.UINT16_ARRAY);
                let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.UINT16_ARRAY);
                let uInt16Array = new Uint16Array(arrayBuffer);
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1520 uInt16Array is:" + uInt16Array);
                assertArrayElementEqual(uInt16View,uInt16Array);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1520 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1520---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1530
         * @tc.name    : test Test MessageSequence write and read ArrayBuffer int32array
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1530", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1530---------------------------");
            var data = rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(20);
            let int32View = new Int32Array(buffer);
            for (let i = 0; i < int32View.length; i++) {
                int32View[i] = 2 * i + 1;
            };
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1530 int32View is:" + int32View);
            try {
                data.writeArrayBuffer(buffer, rpc.TypeCode.INT32_ARRAY);
                let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.INT32_ARRAY);
                let int32Array = new Int32Array(arrayBuffer);
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1530 Int32Array is:" + int32Array);
                assertArrayElementEqual(int32View,int32Array);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1530 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1530---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1540
         * @tc.name    : test Test MessageSequence write and read ArrayBuffer uint32array
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1540", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1540---------------------------");
            var data = rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(12);
            let uInt32View = new Uint32Array(buffer);
            for (let i = 0; i < uInt32View.length; i++) {
                uInt32View[i] = i + 30;
            };
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1540 Uint32Array is:" + uInt32View);
            try {
                data.writeArrayBuffer(buffer, rpc.TypeCode.UINT32_ARRAY);
                let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.UINT32_ARRAY);
                let uInt32Array = new Uint32Array(arrayBuffer);
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1540 Uint32Array is:" + uInt32Array);
                assertArrayElementEqual(uInt32View,uInt32Array);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1540 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1540---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1550
         * @tc.name    : test Test MessageSequence write and read ArrayBuffer float32array
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1550", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1550---------------------------");
            var data = rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(12);
            let float32View = new Float32Array(buffer);
            for (let i = 0; i < float32View.length; i++) {
                float32View[i] = i + 100;
            };
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1550 float32View is:" + float32View);
            try {
                data.writeArrayBuffer(buffer, rpc.TypeCode.FLOAT32_ARRAY);
                let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.FLOAT32_ARRAY);
                let float32Array = new Float32Array(arrayBuffer);
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1550 float32Array is:" + float32Array);
                assertArrayElementEqual(float32View,float32Array);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1550 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1550---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1560
         * @tc.name    : test Test MessageSequence write and read ArrayBuffer float64array
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1560", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1560---------------------------");
            var data = rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(24);
            let float64View = new Float64Array(buffer);
            for (let i = 0; i < float64View.length; i++) {
                float64View[i] = i + 200;
            };
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1560 float64View is:" + float64View);
            try {
                data.writeArrayBuffer(buffer, rpc.TypeCode.FLOAT64_ARRAY);
                let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.FLOAT64_ARRAY);
                let float64Array = new Float64Array(arrayBuffer);
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1560 float64Array is:" + float64Array);
                assertArrayElementEqual(float64View,float64Array);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1560 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
               data.reclaim();
               done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1560---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1570
         * @tc.name    : test Test MessageSequence write and read ArrayBuffer bigint64array
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1570", 0, async function (done) {
        console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1570---------------------------");
        var data = rpc.MessageSequence.create();
        let buffer = new ArrayBuffer(24);
        let int64View = new BigInt64Array(buffer);
        for (let i = 0; i < int64View.length; i++) {
            int64View[i] = BigInt(1110 + i);
        };
        console.info("SUB_DSoftbus_IPC_API_MessageSequence_1570 int64View is:" + int64View);
        try {
            data.writeArrayBuffer(buffer, rpc.TypeCode.BIGINT64_ARRAY);
            let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.BIGINT64_ARRAY);
            let int64Array = new BigInt64Array(arrayBuffer);
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1570 int64Array is:" + int64Array);
            assertArrayElementEqual(int64View, int64Array);
        } catch (error) {
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1570 error is:" + error);
            expect(error == null).assertTrue();
        } finally {
           data.reclaim();
           done();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1570---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1580
         * @tc.name    : test Test MessageSequence write and read ArrayBuffer bigUint64array
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1580", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1580---------------------------");
            var data = rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(24);
            let uInt64View = new BigUint64Array(buffer);
            for (let i = 0; i < uInt64View.length; i++) {
                uInt64View[i] = BigInt(i + 40);
            };
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1580 uInt64View is:" + uInt64View);
            try {
                data.writeArrayBuffer(buffer, rpc.TypeCode.BIGUINT64_ARRAY);
                let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.BIGUINT64_ARRAY);
                let uInt64Array = new BigUint64Array(arrayBuffer);
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1580 uInt64Array is:" + uInt64Array);
                assertArrayElementEqual(uInt64View, uInt64Array);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1580 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
               data.reclaim();
               done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1580---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1590
         * @tc.name    : test Test MessageSequence writeArrayBuffer Beyond the maximum
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1590", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1590---------------------------");
            var data = rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(24);
            let uInt64View = new BigUint64Array(buffer);
            for (let i = 0; i < uInt64View.length; i++) {
                uInt64View[i] = BigInt(i + 400);
            };
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1590 uInt64View is:" + uInt64View);
            try {
                data.writeArrayBuffer(buffer, 12);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1590 error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
               data.reclaim();
               done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1590---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1600
         * @tc.name    : test Test MessageSequence writeArrayBuffer Less than the minimum
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1600", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1600---------------------------");
            var data = rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(24);
            let uInt64View = new BigUint64Array(buffer);
            for (let i = 0; i < uInt64View.length; i++) {
                uInt64View[i] = BigInt(i + 40);
            };
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1600 uInt64View is:" + uInt64View);
            try {
                data.writeArrayBuffer(buffer, -2);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1600 error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
               data.reclaim();
               done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1600---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1610
         * @tc.name    : test Test MessageSequence readArrayBuffer Beyond the maximum
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1610", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1610---------------------------");
            var data = rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(10);
            let int16View = new Int16Array(buffer);
            for (let i = 0; i < int16View.length; i++) {
                int16View[i] = i + 20;
            };
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1610 int16View is:" + int16View);
            try {
                data.writeArrayBuffer(buffer, rpc.TypeCode.INT16_ARRAY);
                data.readArrayBuffer(13);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1610 error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
               data.reclaim();
               done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1610---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1620
         * @tc.name    : test Test MessageSequence readArrayBuffer Less than the minimum
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1620", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1620---------------------------");
            var data = rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(10);
            let int16View = new Int16Array(buffer);
            for (let i = 0; i < int16View.length; i++) {
                int16View[i] = i + 20;
            };
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1620 int16View is:" + int16View);
            try {
                data.writeArrayBuffer(buffer, rpc.TypeCode.INT16_ARRAY);
                data.readArrayBuffer(-5);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1620 error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
               data.reclaim();
               done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1620---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1630
         * @tc.name    : test Test MessageSequence writeArrayBuffer after reclaim
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1630", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1630---------------------------");
            var data = rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(10);
            let int16View = new Int16Array(buffer);
            for (let i = 0; i < int16View.length; i++) {
                int16View[i] = i + 20;
            };
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1630 int16View is:" + int16View);
            try {
                data.reclaim();
                data.writeArrayBuffer(buffer, rpc.TypeCode.INT16_ARRAY);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1630 error is:" + error);
                expect(error.code == 1900009).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                done();
             }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1630---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1640
         * @tc.name    : test Test MessageSequence readArrayBuffer after reclaim
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1640", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1640---------------------------");
            var data = rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(200);
            let int16View = new Int16Array(buffer);
            for (let i = 0; i < int16View.length; i++) {
                int16View[i] = i + 20;
            };
            console.info("SUB_DSoftbus_IPC_API_MessageSequence_1640 int16View is:" + int16View);
            try {
                data.writeArrayBuffer(buffer, rpc.TypeCode.INT16_ARRAY);
                let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.INT16_ARRAY);
                let int16Array = new Int16Array(arrayBuffer);
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1640 int16Array is:" + int16Array);
                assertArrayElementEqual(int16View,int16Array);
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1640 readArrayBuffer second time");
                data.rewindRead(0);
                data.reclaim();
                data.readArrayBuffer(rpc.TypeCode.INT16_ARRAY);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1640 error is:" + error);
                expect(error.code == 1900010).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                done();
             }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1640---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1650
         * @tc.name    : test Test MessageSequence readArrayBuffer after reclaim
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1650", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1650---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                var option = rpc.MessageOption();
                let buffer1 = new ArrayBuffer(200);
                let int16View = new Int16Array(buffer1);
                for (let i = 0; i < int16View.length; i++) {
                    int16View[i] = i + 20;
                };
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1650 int16View is:" + int16View);
                let buffer2 = new ArrayBuffer(200);
                let int8View = new Int8Array(buffer2);
                for (let i = 0; i < int8View.length; i++) {
                    int8View[i] = i * 2;
                };
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1650 int8View is:" + int8View);

                data.writeArrayBuffer(buffer1, rpc.TypeCode.INT16_ARRAY);
                data.writeArrayBuffer(buffer2, rpc.TypeCode.INT8_ARRAY);
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_ARRAYBUFFER, data, reply, option).then((result) => {
                    let reply1 = result.reply.readArrayBuffer(rpc.TypeCode.INT8_ARRAY);
                    let reply2 = result.reply.readArrayBuffer(rpc.TypeCode.INT16_ARRAY);
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(new Int8Array(reply1),int8View);
                    assertArrayElementEqual(new Int16Array(reply2),int16View);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1650 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
             }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1650---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1660
         * @tc.name    : test Call the writeRemoteObjectArray interface, write the array to the MessageSequence instance,
         *               and call readRemoteObjectArray (datain: string []) to read the data
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1660", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1660---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                var option = rpc.MessageOption();
                let listeners = [new TestRemoteObject("rpcListener"), 
                    new TestRemoteObject("rpcListener2"), new TestRemoteObject("rpcListener3")];
                data.writeRemoteObjectArray(listeners);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_REMOTEOBJECTARRAY_3, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let rlisteners = new Array(3);
                    result.reply.readRemoteObjectArray(rlisteners);
                    for(let index = 0; index < rlisteners.length; index++){
                        expect(rlisteners[index] != null).assertTrue();
                        console.info(" readRemoteObjectArray is success");
                    }
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1660 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
             }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1660---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1670
        * @tc.name    : test The readRemoteObjectArray interface directly reads parameters
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1670", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1670---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let listeners = [new TestRemoteObject("rpcListener"),
                new TestRemoteObject("rpcListener2"),
                new TestRemoteObject("rpcListener3")];
                data.writeRemoteObjectArray(listeners);
                let rlisteners = data.readRemoteObjectArray();
                expect(rlisteners != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1670 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1670---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageSequence_1680
        * @tc.name    : test The readRemoteObjectArray interface reads parameters to an empty array
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageSequence_1680", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageSequence_1680---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let listeners = [new TestRemoteObject("rpcListener"),
                new TestRemoteObject("rpcListener2"),
                new TestRemoteObject("rpcListener3")];
                data.writeRemoteObjectArray(listeners);
                let rlisteners = new Array(3);
                data.readRemoteObjectArray(rlisteners);
                expect(rlisteners != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageSequence_1680 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageSequence_1680---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0010
        * @tc.name    : test Call the writeinterfacetoken interface, write the interface descriptor, and read interfacetoken
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0010", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0010---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let token = "hello ruan zong xian";
                let result = data.writeInterfaceToken(token);
                expect(result).assertTrue();
                let resultToken = data.readInterfaceToken();
                expect(resultToken).assertEqual(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel_testcase error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0010---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0020
        * @tc.name    : test Call the writeinterfacetoken interface, write the interface descriptor, and read interfacetoken
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0020", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0020---------------------------");
            try {
                for (let i = 0; i < 5; i++) {
                    var data = rpc.MessageParcel.create();
                    let token = "hello ruan zong xian";
                    let result = data.writeInterfaceToken(token);
                    expect(result).assertTrue();
                    let resultToken = data.readInterfaceToken();
                    expect(resultToken).assertEqual(token);
                }
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0020---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0030
        * @tc.name    : test Call the writeinterfacetoken interface to write a non string interface descriptor 
        *             and read interfacetoken
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0030", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0030---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let token = "";
                for (let i = 0; i < (40 * K - 1); i++) {
                    token += 'a';
                };
                let result = data.writeInterfaceToken(token);
                expect(result).assertTrue();
                let resultToken = data.readInterfaceToken();
                expect(resultToken).assertEqual(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0030---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0040
        * @tc.name    : test The WriteInterfaceToken interface is called, the exceeding-length interface descriptor is written,
        *               and the InterfaceToken is read
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0040", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0040---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let token = "";
                for (let i = 0; i < 40 * K; i++) {
                    token += 'a';
                };
                let result = data.writeInterfaceToken(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0040---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0050
        * @tc.name    : test Call the writeinterfacetoken interface to write a non string interface descriptor 
        *               and read interfacetoken
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0050", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0050---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let token = 123;
                let result = data.writeInterfaceToken(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0050---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0060
        * @tc.name    : test The data size of the messageparcel obtained by calling the getSize interface
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0060", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0060---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let size = data.getSize();
                expect(size).assertEqual(0);
                let addData = 1;
                let result = data.writeInt(addData);
                expect(result).assertTrue();
                size = data.getSize();
                expect(size).assertEqual(4);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0060---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0070
        * @tc.name    : test The capacity of the messageparcel obtained by calling the getcapacity interface
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0070", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0070---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let size = data.getCapacity();
                expect(size).assertEqual(0);
                let addData = 1;
                let result = data.writeInt(addData);
                expect(result).assertTrue();
                size = data.getCapacity();
                expect(size).assertEqual(64);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0070---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0080
        * @tc.name    : test Call the SetSize interface to set the data size of messageparcel
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0080", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0080---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let addData = 1;
                let result = data.writeInt(addData);
                expect(result).assertTrue();
                let size = 6;
                let setResult = data.setSize(size);
                expect(setResult).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0080---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0090
        * @tc.name    : test Call the SetSize interface to set the data size of messageparcel
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0090", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0090---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let addData = 1;
                let result = data.writeInt(addData);
                expect(result).assertTrue();
                let size = 4 * G;
                let setResult = data.setSize(size);
                expect(setResult).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0090---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0100
        * @tc.name    : test Call the SetSize interface to set the data size of messageparcel
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0100", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0100---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let addData = 1;
                let result = data.writeInt(addData);
                expect(result).assertTrue();
                let size = 4 * G - 4;
                let setResult = data.setSize(size);
                expect(setResult).assertEqual(false);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0100---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0110
        * @tc.name    : test Call the SetSize interface to set the data size of messageparcel. The write data size 
        *             does not match the set value
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0110", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0110---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let capacity = 64;
                let setResult = data.setCapacity(capacity);
                expect(setResult).assertTrue();
                let size = 4;
                setResult = data.setSize(size);
                expect(setResult).assertTrue();
                let addData = 2;
                let result = data.writeLong(addData);
                expect(result).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0110---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0120
        * @tc.name    : test Call the setcapacity interface to set the capacity of messageparcel
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0120", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0120---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let size = 64;
                let setResult = data.setCapacity(size);
                expect(setResult).assertTrue();
                let addData = 1;
                let result = data.writeInt(addData);
                expect(result).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0120---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0130
        * @tc.name    : test Call the setcapacity interface to set the capacity of messageparcel
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0130", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0130---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let size = M;
                let setResult = data.setCapacity(size);
                expect(setResult).assertTrue();
                let addData = 1;
                let result = data.writeInt(addData);
                expect(result).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0130---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0140
        * @tc.name    : test Call the setcapacity interface to set the capacity of messageparcel
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0140", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0140---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let size = 4 * G;
                let setResult = data.setCapacity(size);
                expect(setResult).assertEqual(false);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0140---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0150
        * @tc.name    : test Call the setcapacity interface to set the capacity of messageparcel.
        *             The write data capacity is inconsistent with the set value
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0150", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0150---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let size = 4;
                let setResult = data.setCapacity(size);
                expect(setResult).assertTrue();
                let addData = [1, 2, 3, 4, 5, 6, 7, 8];
                let result = data.writeIntArray(addData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0150---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0160
        * @tc.name    : test Empty object to obtain the readable byte space, read location,
        *             writable byte space and write location information of messageparcel
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0160", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0160---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let result1 = data.getWritableBytes();
                expect(result1).assertEqual(0);
                let result2 = data.getReadableBytes();
                expect(result2).assertEqual(0);
                let result3 = data.getReadPosition();
                expect(result3).assertEqual(0);
                let result4 = data.getWritePosition();
                expect(result4).assertEqual(0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0160---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0170
        * @tc.name    : test Create an object and write data to obtain the readable byte space, read location,
        *             writable byte space and write location information of messageparcel
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0170", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0170---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let dataInt = 1;
                let resultInt = data.writeInt(dataInt);
                expect(resultInt).assertTrue();
                let dataLong = 2;
                let resultLong = data.writeLong(dataLong);
                expect(resultLong).assertTrue();
                let result1 = data.getWritableBytes();
                expect(result1).assertEqual(52);
                let result2 = data.getReadableBytes();
                expect(result2).assertEqual(12);
                let result3 = data.getReadPosition();
                expect(result3).assertEqual(0);
                let result4 = data.getWritePosition();
                expect(result4).assertEqual(12);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0170---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0180
        * @tc.name    : test Call rewindread interface to offset the read position to the specified position
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0180", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0180---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                expect(data.getWritableBytes()).assertEqual(0);
                expect(data.getReadableBytes()).assertEqual(0);
                expect(data.getReadPosition()).assertEqual(0);
                expect(data.getWritePosition()).assertEqual(0);
                let dataInt = 1;
                let resultInt = data.writeInt(dataInt);
                let dataLong = 2;
                let resultLong = data.writeLong(dataLong);
                expect(resultLong).assertTrue();
                expect(data.getWritableBytes()).assertEqual(52);
                expect(data.getReadableBytes()).assertEqual(12);
                expect(data.getReadPosition()).assertEqual(0);
                expect(data.getWritePosition()).assertEqual(12);
                let readIntData = data.readInt();
                expect(readIntData).assertEqual(dataInt);
                let writePosition = 0;
                let writeResult = data.rewindWrite(writePosition);
                expect(writeResult).assertTrue();
                expect(data.getWritePosition()).assertEqual(0);
                dataInt = 3;
                resultInt = data.writeInt(dataInt);
                let readPosition = 0;
                let readResult = data.rewindRead(readPosition);
                expect(readResult).assertTrue();
                readIntData = data.readInt();
                expect(readIntData).assertEqual(dataInt);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0180---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0190
        * @tc.name    : test The rewindread interface is called to re offset the read position to the specified position.
        *               The specified position is out of range
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0190", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0190---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let result1 = data.getWritableBytes();
                expect(result1 == 0).assertTrue();
                let result2 = data.getReadableBytes();
                expect(result2 == 0).assertTrue();
                let result3 = data.getReadPosition();
                expect(result3 == 0).assertTrue();
                let result4 = data.getWritePosition();
                expect(result4 == 0).assertTrue();
                let dataInt = 1;
                let resultInt = data.writeInt(dataInt);
                expect(resultInt).assertTrue();
                let dataLong = 2;
                let resultLong = data.writeLong(dataLong);
                expect(resultLong).assertTrue();
                result1 = data.getWritableBytes();
                expect(result1 == 52).assertTrue();
                result2 = data.getReadableBytes();
                expect(result2 == 12).assertTrue();
                result3 = data.getReadPosition();
                expect(result3 == 0).assertTrue();
                result4 = data.getWritePosition();
                expect(result4 == 12).assertTrue();
                let readPosition = 100;
                let readResult = data.rewindRead(readPosition);
                expect(readResult == false).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0190---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0200
        * @tc.name    : test Call rewindwrite and the interface offsets the write position to the specified position
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0200", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0200---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let dataInt = 1;
                let resultInt = data.writeInt(dataInt);
                expect(resultInt).assertTrue();
                let readIntData = data.readInt();
                expect(readIntData).assertEqual(dataInt);
                let writePosition = 0;
                let rewindWriteResult = data.rewindWrite(writePosition);
                expect(rewindWriteResult).assertTrue();
                dataInt = 3;
                resultInt = data.writeInt(dataInt);
                expect(resultInt).assertTrue();
                let readPosition = 0;
                let rewindReadResult = data.rewindRead(readPosition);
                expect(rewindReadResult);
                readIntData = data.readInt();
                expect(readIntData).assertEqual(dataInt);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0200---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0210
        * @tc.name    : test Call rewindwrite and the interface offsets the write position to the specified position.
        *               The specified position is out of range
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0210", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0210---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let dataInt = 1;
                let resultInt = data.writeInt(dataInt);
                expect(resultInt).assertTrue();
                let readIntData = data.readInt();
                expect(readIntData == dataInt).assertTrue();
                let writePosition = 99;
                let rewindWriteResult = data.rewindWrite(writePosition);
                expect(rewindWriteResult).assertEqual(false);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0210---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0220
        * @tc.name    : test Call the writeshortarray interface, write the array to the messageparcel instance,
        *             and call readshortarray to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0220", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0220---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wShortArryData = [3, 5, 9];
                let writeShortArrayResult = data.writeShortArray(wShortArryData);
                expect(writeShortArrayResult).assertTrue();
                let rShortArryData = data.readShortArray();
                assertArrayElementEqual(rShortArryData,wShortArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0220---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0230
        * @tc.name    : test Call the writeshortarray interface, write the short integer array to the messageparcel instance,
        *             and call readshortarray (datain: number []) to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0230", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0230---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wShortArryData = [];
                for (let i = 0; i < (50 * K - 1); i++) {
                    wShortArryData[i] = 1;
                };
                let writeShortArrayResult = data.writeShortArray(wShortArryData);
                expect(writeShortArrayResult).assertTrue();
                let rShortArryData = [];
                data.readShortArray(rShortArryData);
                 assertArrayElementEqual(rShortArryData,wShortArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0230---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0240
        * @tc.name    : test Writeshortarray interface, boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0240", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0240---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wShortArryData = [-32768, 0, 1, 2, 32767];
                let writeShortArrayResult = data.writeShortArray(wShortArryData);
                expect(writeShortArrayResult).assertTrue();
                let rShortArryData = [];
                data.readShortArray(rShortArryData);
                assertArrayElementEqual(rShortArryData,wShortArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0240---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0250
        * @tc.name    : test Writeshortarray interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0250", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0250---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wShortArryData = [-32769, 0, 1, 2];
                let writeShortArrayResult = data.writeShortArray(wShortArryData);
                expect(writeShortArrayResult).assertTrue();
                let rShotrArrayData = data.readShortArray();
                expect(32767).assertEqual(rShotrArrayData[0]);
                expect(wShortArryData[1]).assertEqual(rShotrArrayData[1]);
                expect(wShortArryData[2]).assertEqual(rShotrArrayData[2]);
                expect(wShortArryData[3]).assertEqual(rShotrArrayData[3]);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0250---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0260
        * @tc.name    : test Writeshortarray interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0260", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0260---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wShortArryData = [0, 1, 2, 32768];
                let writeShortArrayResult = data.writeShortArray(wShortArryData);
                expect(writeShortArrayResult).assertTrue();
                let rShotrArrayData = data.readShortArray();
                expect(wShortArryData[0]).assertEqual(rShotrArrayData[0]);
                expect(wShortArryData[1]).assertEqual(rShotrArrayData[1]);
                expect(wShortArryData[2]).assertEqual(rShotrArrayData[2]);
                expect(-32768).assertEqual(rShotrArrayData[3]);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0260---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0270
        * @tc.name    : test Writeshortarray interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0270", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0270---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wShortArryData = [];
                for (let i = 0; i < 50 * K; i++) {
                    wShortArryData[i] = 11111;
                };
                let writeShortArrayResult = data.writeShortArray(wShortArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0270---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0280
        * @tc.name    : test Call the writelongarray interface, write the long integer array to the messageparcel instance,
        *             and call readlongarray to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0280", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0280---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let LongArryData = [];
                for (let i = 0; i < (25 * K - 1); i++) {
                    LongArryData[i] = 11;
                };
                let WriteLongArray = data.writeLongArray(LongArryData);
                expect(WriteLongArray).assertTrue();
                let rLongArryData = data.readLongArray();
                assertArrayElementEqual(rLongArryData,LongArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0280---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0290
        * @tc.name    : test Writelongarray interface, boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0290", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0290---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wLongArryData = [-2147483648, 0, 1, 2, 2147483647];
                let writeLongArrayResult = data.writeLongArray(wLongArryData);
                expect(writeLongArrayResult).assertTrue();
                let rLongArryData = data.readLongArray();
                assertArrayElementEqual(rLongArryData,wLongArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0290---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0300
        * @tc.name    : test Writelongarray interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0300", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0300---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let errorLongArryData = [-2147483649, 0, 1, 2, 3];
                let erWriteLongArray = data.writeLongArray(errorLongArryData);
                expect(erWriteLongArray).assertTrue();
                let erLongArryData = data.readLongArray();
                assertArrayElementEqual(erLongArryData,errorLongArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0300---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0310
        * @tc.name    : test Writelongarray interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0310", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0310---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let errorLongArryData = [0, 1, 2, 3, 2147483648];
                let erWriteLongArray = data.writeLongArray(errorLongArryData);
                expect(erWriteLongArray).assertTrue();
                let erLongArryData = data.readLongArray();
                assertArrayElementEqual(erLongArryData,errorLongArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0310---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0320
        * @tc.name    : test Writelongarray interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0320", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0320---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let errorLongArryData = [];
                for (let i = 0; i < 25 * K; i++) {
                    errorLongArryData[i] = 11;
                };
                let erWriteLongArray = data.writeLongArray(errorLongArryData);
                expect(erWriteLongArray).assertEqual(false);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0320---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0330
        * @tc.name    : test Call the writedoublearray interface, write the array to the messageparcel instance,
        *             and call readdoublearra to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0330", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0330---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wDoubleArryData = [1.2, 235.67, 99.76];
                let writeDoubleArrayResult = data.writeDoubleArray(wDoubleArryData);
                expect(writeDoubleArrayResult).assertTrue();
                let rDoubleArryData = data.readDoubleArray();
                assertArrayElementEqual(rDoubleArryData,wDoubleArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0330---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0340
        * @tc.name    : test Call the writedoublearray interface, write the array to the messageparcel instance,
        *             and call readdoublearra (datain: number []) to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0340", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0340---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wDoubleArryData = [];
                for (let i = 0; i < (25 * K - 1); i++) {
                    wDoubleArryData[i] = 11.1;
                };
                let writeDoubleArrayResult = data.writeDoubleArray(wDoubleArryData);
                expect(writeDoubleArrayResult).assertTrue();
                let rDoubleArryData = [];
                data.readDoubleArray(rDoubleArryData);
                assertArrayElementEqual(rDoubleArryData,wDoubleArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0340---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0350
        * @tc.name    : test Writedoublearray interface, boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0350", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0350---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wDoubleArryData = [-1235453.2, 235.67, 9987659.76];
                let writeDoubleArrayResult = data.writeDoubleArray(wDoubleArryData);
                expect(writeDoubleArrayResult).assertTrue();
                let rDoubleArryData = data.readDoubleArray();
                assertArrayElementEqual(rDoubleArryData,wDoubleArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0350---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0360
        * @tc.name    : test Writedoublearray interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0360", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0360---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let DoubleArryData = [-12354883737337373873853.2, 235.67, 99999999999999993737373773987659.76];
                let WriteDoubleArrayResult = data.writeDoubleArray(DoubleArryData);
                expect(WriteDoubleArrayResult).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0360---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0370
        * @tc.name    : test Writedoublearray interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0370", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0370---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let errorDoubleArryData = [];
                for (let i = 0; i < 25 * K; i++) {
                    errorDoubleArryData[i] = 11.1;
                };
                data.writeDoubleArray(errorDoubleArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0370---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0380
        * @tc.name    : test Call the writeboolean array interface, write the array to the messageparcel instance,
        *             and call readboolean array to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0380", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0380---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wBooleanArryData = [true, false, false];
                let writeBooleanArrayResult = data.writeBooleanArray(wBooleanArryData);
                expect(writeBooleanArrayResult).assertTrue();
                let rBooleanArryData = data.readBooleanArray();
                assertArrayElementEqual(rBooleanArryData,wBooleanArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0380---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0390
        * @tc.name    : test Call the writeboolean array interface, write the array to the messageparcel instance,
        *             and call readboolean array (datain: number []) to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0390", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0390---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wBooleanArryData = [];
                for (let i = 0; i < (50 * K - 1); i++) {
                    if (i % 2 == 0) {
                        wBooleanArryData[i] = false;
                    } else {
                        wBooleanArryData[i] = true;
                    };
                };
                let writeBooleanArrayResult = data.writeBooleanArray(wBooleanArryData);
                expect(writeBooleanArrayResult).assertTrue();
                let rBooleanArryData = [];
                data.readBooleanArray(rBooleanArryData);
                assertArrayElementEqual(wBooleanArryData,rBooleanArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0390---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0400
        * @tc.name    : test Writeboolean array interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0400", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0400---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let BooleanArryData = [true, 'abc', false];
                let WriteBooleanArrayResult = data.writeBooleanArray(BooleanArryData);
                expect(WriteBooleanArrayResult).assertTrue();
                let rBooleanArryData = data.readBooleanArray();
                let newboolean = [true, false, false];
                assertArrayElementEqual(rBooleanArryData,newboolean);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0400---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0410
        * @tc.name    : test Writeboolean array interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0410", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0410---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let errorBooleanArryData = [];
                for (let i = 0; i < 50 * K; i++) {
                    if (i % 2 == 0) {
                        errorBooleanArryData[i] = false;
                    } else {
                        errorBooleanArryData[i] = true;
                    };
                }
                data.writeBooleanArray(errorBooleanArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0410---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0420
        * @tc.name    : test Call the writechararray interface, write the array to the messageparcel instance,
        *             and call readchararray to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0420", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0420---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wCharArryData = [];
                for (let i = 0; i < (50 * K - 1); i++) {
                    wCharArryData[i] = 96;
                }
                let writeCharArrayResult = data.writeCharArray(wCharArryData);
                expect(writeCharArrayResult).assertTrue();
                let rCharArryData = data.readCharArray();
                assertArrayElementEqual(wCharArryData,rCharArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0420---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0430
        * @tc.name    : test Call the writechararray interface, write the array to the messageparcel instance,
        *             and call readchararray (datain: number []) to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0430", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0430---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wCharArryData = [];
                for (let i = 0; i < (50 * K - 1); i++) {
                    wCharArryData[i] = 96;
                }
                let writeCharArrayResult = data.writeCharArray(wCharArryData);
                expect(writeCharArrayResult).assertTrue();
                let rCharArryData = [];
                data.readCharArray(rCharArryData);
                assertArrayElementEqual(wCharArryData,rCharArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0430---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0440
        * @tc.name    : test Writechararray interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0440", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0440---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let errorCharArryData = [10, 'asfgdgdtu', 20];
                let WriteCharArrayResult = data.writeCharArray(errorCharArryData);
                expect(WriteCharArrayResult).assertTrue();
                let rCharArryData = data.readCharArray();
                let xresult = [10, 0, 20];
                assertArrayElementEqual(rCharArryData,xresult);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0440---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0450
        * @tc.name    : test Call the writestringarray interface, write the array to the messageparcel instance,
        *             and call readstringarray (datain: number []) to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0450", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0450---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wStringArryData = ['abc', 'hello', 'beauty'];
                let writeStringArrayResult = data.writeStringArray(wStringArryData);
                expect(writeStringArrayResult).assertTrue();
                let rStringArryData = data.readStringArray();
                assertArrayElementEqual(rStringArryData,wStringArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0450---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0460
        * @tc.name    : test Call the writestringarray interface, write the array to the messageparcel instance,
        *             and call readstringarray() to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0460", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0460---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let wStringArryData = ['abc', 'hello', 'beauty'];
                let writeStringArrayResult = data.writeStringArray(wStringArryData);
                expect(writeStringArrayResult).assertTrue();
                let rStringArryData = [];
                data.readStringArray(rStringArryData);
                 assertArrayElementEqual(rStringArryData,wStringArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0460---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0470
        * @tc.name    : test Writestringarray interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0470", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0470---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let errorStringArryData = ['abc', 123, 'beauty'];
                data.writeStringArray(errorStringArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0470---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0480
        * @tc.name    : test Writestringarray interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0480", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0480---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let errorStringArryData = [];
                for (let i = 0; i < (10 * K - 1); i++) {
                    errorStringArryData[i] = "heddSDF";
                }
                let WriteStringArrayResult = data.writeStringArray(errorStringArryData);
                expect(WriteStringArrayResult).assertTrue();
                let errorStringArray = data.readStringArray();
                assertArrayElementEqual(errorStringArray,errorStringArryData);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0480---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0490
        * @tc.name    : test Call the writebytearray interface, write the array to the messageparcel instance,
        *             and call readbytearray to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0490", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0490---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let ByteArraylet = [1, 2, 3, 4, 5];
                let writeShortArrayResult = data.writeByteArray(ByteArraylet);
                expect(writeShortArrayResult == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_BYTEARRAY, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let shortArryDataReply = result.reply.readByteArray();
                    assertArrayElementEqual(shortArryDataReply,ByteArraylet);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0490---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0500
        * @tc.name    : test Call the writebytearray interface, write the array to the messageparcel instance,
        *             and call readbytearray (datain: number []) to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0500", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0500---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let ByteArraylet = [1, 2, 3, 4, 5];
                let writeShortArrayResult = data.writeByteArray(ByteArraylet);
                expect(writeShortArrayResult == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_BYTEARRAY, data, reply, option).then((result) => {
                    let newArr = new Array(5);
                    result.reply.readByteArray(newArr);
                     assertArrayElementEqual(newArr,ByteArraylet);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0500---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0510
        * @tc.name    : test Writebytearray interface, boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0510", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0510---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let teArraylet = [-128, 0, 1, 2, 127];
                let writeShortArrayResult = data.writeByteArray(teArraylet);
                expect(writeShortArrayResult == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_BYTEARRAY, data, reply, option).then((result) => {
                    let newArr = new Array(5)
                    result.reply.readByteArray(newArr);
                    assertArrayElementEqual(newArr,teArraylet);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0510---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0520
        * @tc.name    : test Writebytearray interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0520", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0520---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let teArraylet = [-128, 0, 1, 2, 128];
                let writeShortArrayResult = data.writeByteArray(teArraylet);
                expect(writeShortArrayResult == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_BYTEARRAY, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let shortArryDataReply = result.reply.readByteArray();
                    expect(shortArryDataReply[0] == teArraylet[0]).assertTrue();
                    expect(shortArryDataReply[1] == teArraylet[1]).assertTrue();
                    expect(shortArryDataReply[2] == teArraylet[2]).assertTrue();
                    expect(shortArryDataReply[3] == teArraylet[3]).assertTrue();
                    expect(shortArryDataReply[4] == -128).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0520---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0530
        * @tc.name    : test Writebytearray interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0530", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0530---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let ByteArraylet = [-129, 0, 1, 2, 127];
                let writeShortArrayResult = data.writeByteArray(ByteArraylet);
                expect(writeShortArrayResult == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_BYTEARRAY, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let shortArryDataReply = result.reply.readByteArray();
                    expect(shortArryDataReply[0] == 127).assertTrue();
                    expect(shortArryDataReply[1] == ByteArraylet[1]).assertTrue();
                    expect(shortArryDataReply[2] == ByteArraylet[2]).assertTrue();
                    expect(shortArryDataReply[3] == ByteArraylet[3]).assertTrue();
                    expect(shortArryDataReply[4] == ByteArraylet[4]).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0530---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0540
        * @tc.name    : test Call the writeintarray interface, write the array to the messageparcel instance,
        *             and call readintarray to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0540", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0540---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let intArryData = [100, 111, 112];
                let writeShortArrayResult = data.writeIntArray(intArryData);
                expect(writeShortArrayResult == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let shortArryDataReply = result.reply.readIntArray();
                     assertArrayElementEqual(shortArryDataReply,intArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0540---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0550
        * @tc.name    : test Call the writeintarray interface, write the array to the messageparcel instance,
        *             and call readintarray (datain: number []) to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0550", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0550---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let intArryData = [100, 111, 112];
                let writeShortArrayResult = data.writeIntArray(intArryData);
                expect(writeShortArrayResult == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let newArr = [];
                    result.reply.readIntArray(newArr);
                    assertArrayElementEqual(newArr,intArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0550---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0560
        * @tc.name    : test Writeintarray interface, boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0560", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0560---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let intArryData = [-2147483648, 0, 1, 2, 2147483647];
                let writeIntArrayResult = data.writeIntArray(intArryData);
                expect(writeIntArrayResult == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let shortArryDataReply = result.reply.readIntArray();
                    assertArrayElementEqual(shortArryDataReply,intArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0560---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0570
        * @tc.name    : test Writeintarray interface, illegal value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0570", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0570---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let intArryData = [-2147483649, 0, 1, 2, 2147483647];
                let writeIntArrayResult = data.writeIntArray(intArryData);
                expect(writeIntArrayResult == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let shortArryDataReply = result.reply.readIntArray();
                    expect(shortArryDataReply[0] == 2147483647).assertTrue();
                    expect(shortArryDataReply[1] == intArryData[1]).assertTrue();
                    expect(shortArryDataReply[2] == intArryData[2]).assertTrue();
                    expect(shortArryDataReply[3] == intArryData[3]).assertTrue();
                    expect(shortArryDataReply[4] == intArryData[4]).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0570---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0580
        * @tc.name    : test Writeintarray interface, illegal value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0580", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0580---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let intArryData = [0, 1, 2, 3, 2147483648];
                let writeIntArrayResult = data.writeIntArray(intArryData);
                expect(writeIntArrayResult == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let shortArryDataReply = result.reply.readIntArray();
                    let newintArryData = [0, 1, 2, 3, -2147483648];
                    assertArrayElementEqual(shortArryDataReply,newintArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0580---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0590
        * @tc.name    : test Call the writefloatarray interface, write the array to the messageparcel instance,
        *             and call readfloatarray to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0590", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0590---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let floatArryData = [1.2, 1.3, 1.4];
                let writeShortArrayResult = data.writeFloatArray(floatArryData);
                expect(writeShortArrayResult == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_FLOATARRAY, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let floatArryDataReply = result.reply.readFloatArray();
                     assertArrayElementEqual(floatArryDataReply,floatArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0590---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0600
        * @tc.name    : test Call the writefloatarray interface, write the array to the messageparcel instance,
        *             and call readfloatarray (datain: number []) to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0600", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0600---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let floatArryData = [1.2, 1.3, 1.4]
                let writeShortArrayResult = data.writeFloatArray(floatArryData);
                expect(writeShortArrayResult == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_FLOATARRAY, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let newArr = []
                    result.reply.readFloatArray(newArr);
                     assertArrayElementEqual(newArr,floatArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0600---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0610
        * @tc.name    : test Writefloatarray interface, boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0610", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0610---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let floatArryData = [-3.40E+38, 1.3, 3.40E+38];
                let writeShortArrayResult = data.writeFloatArray(floatArryData);
                expect(writeShortArrayResult == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_FLOATARRAY, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let newArr = result.reply.readFloatArray();
                    assertArrayElementEqual(newArr,floatArryData);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0610---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0620
        * @tc.name    : test Writefloatarray interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0620", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0620---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let floatArryData = [-4.40E+38, 1.3, 3.40E+38];
                let writeShortArrayResult = data.writeFloatArray(floatArryData);
                expect(writeShortArrayResult == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_FLOATARRAY, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let newArr = result.reply.readFloatArray();
                    expect(newArr[0] == floatArryData[0]).assertTrue();
                    expect(newArr[1] == floatArryData[1]).assertTrue();
                    expect(newArr[2] == floatArryData[2]).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0620---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0630
        * @tc.name    : test Call the writeShort interface to write the short integer data to the messageparcel instance,
        *             and call readshort to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0630", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0630---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let short = 8;
                let writeShor = data.writeShort(short);
                expect(writeShor == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_SHORT, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let readShort = result.reply.readShort();
                    expect(readShort == short).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0630---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0640
        * @tc.name    : test WriteShort interface, boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0640", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0640---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                expect(data.writeShort(-32768) == true).assertTrue();
                expect(data.writeShort(0) == true).assertTrue();
                expect(data.writeShort(1) == true).assertTrue();
                expect(data.writeShort(2) == true).assertTrue();
                expect(data.writeShort(32767) == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_SHORT_MULTI, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    expect(result.reply.readShort() == -32768).assertTrue();
                    expect(result.reply.readShort() == 0).assertTrue();
                    expect(result.reply.readShort() == 1).assertTrue();
                    expect(result.reply.readShort() == 2).assertTrue();
                    expect(result.reply.readShort() == 32767).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0640---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0650
        * @tc.name    : test WriteShort interface, illegal value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0650", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0650---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                expect(data.writeShort(32768) == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_SHORT_MULTI, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    expect(result.reply.readShort() == -32768).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0650---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0660
        * @tc.name    : test Call the writeShort interface to write the short integer data to the messageparcel instance,
        *             and call readshort to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0660", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0660---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let short = -32769;
                let writeShor = data.writeShort(short);
                expect(writeShor == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_SHORT, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let readShort = result.reply.readShort();
                    expect(readShort == 32767).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0660---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0670
        * @tc.name    : test Call the writeShort interface to write the short integer data to the messageparcel instance,
        *             and call readshort to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0670", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0670---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let short = 32768;
                let writeShor = data.writeShort(short);
                expect(writeShor == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_SHORT, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let readShort = result.reply.readShort();
                    expect(readShort == -32768).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0670---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0680
        * @tc.name    : test Call writelong interface to write long integer data to messageparcel instance
        *             and call readlong to read data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0680", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0680---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let short = 10000;
                let writelong = data.writeLong(short);
                expect(writelong == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_LONG, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let readlong = result.reply.readLong();
                    expect(readlong == short).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0680---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0690
        * @tc.name    : test Writelong interface, boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0690", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0690---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let short = 2147483647;
                let writelong = data.writeLong(short);
                expect(writelong == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_LONG, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let readlong = result.reply.readLong();
                    expect(readlong == short).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0690---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0700
        * @tc.name    : test Writelong interface, illegal value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0700", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0700---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let short = 214748364887;
                let writelong = data.writeLong(short);
                expect(writelong == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_LONG, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let readlong = result.reply.readLong();
                    expect(readlong == short).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0700---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0710
        * @tc.name    : test Writelong interface, illegal value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0710", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0710---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let short = 2147483649;
                let writelong = data.writeLong(short);
                expect(writelong == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_LONG, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let readlong = result.reply.readLong();
                    expect(readlong == short).assertTrue();
                })
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0710---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0720
        * @tc.name    : test Call the parallel interface to read and write data to the double instance
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0720", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0720---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 10.2;
                let result = data.writeDouble(token);
                expect(result).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_DOUBLE, data, reply, option).then((result) => {
                    let replyReadResult = reply.readDouble();
                    expect(replyReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0720---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0730
        * @tc.name    : test Writedouble interface, boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0730", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0730---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 1.79E+308;
                let result = data.writeDouble(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_DOUBLE, data, reply, option).then((result) => {
                    let replyReadResult = reply.readDouble();
                    expect(replyReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0730---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0740
        * @tc.name    : test Writedouble interface, boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0740", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0740---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 4.9000000e-32;
                let result = data.writeDouble(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_DOUBLE, data, reply, option).then((result) => {
                    let replyReadResult = reply.readDouble();
                    expect(replyReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0740---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0750
        * @tc.name    : test Writedouble interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0750", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0750---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let token = "1.79E+465312156";
                data.writeDouble(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0750---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0760
        * @tc.name    : test Call the writeboolean interface to write the data to the messageparcel instance,
        *             and call readboolean to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0760", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0760---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = true;
                let result = data.writeBoolean(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_BOOLEAN, data, reply, option).then((result) => {
                    let replyReadResult = result.reply.readBoolean();
                    expect(replyReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0760---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0770
        * @tc.name    : test Call the writeboolean interface to write the data to the messageparcel instance,
        *             and call readboolean to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0770", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0770---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = false;
                let result = data.writeBoolean(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_BOOLEAN, data, reply, option).then((result) => {
                    let replyReadResult = result.reply.readBoolean();
                    expect(replyReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0770---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0780
        * @tc.name    : test Writeboolean interface, illegal value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0780", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0780---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let token = 9;
                data.writeBoolean(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0780---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0790
        * @tc.name    : test Writeboolean interface, illegal value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0790", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0790---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let token = "aaa";
                data.writeBoolean(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0790---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0800
        * @tc.name    : test Call the writechar interface to write the data to the messageparcel instance,
        *             and call readchar to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0800", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0800---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 65;
                let result = data.writeChar(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
                    let replyReadResult = result.reply.readChar();
                    expect(replyReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0800---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0810
        * @tc.name    : test Call the writechar interface to write the data to the messageparcel instance,
        *             and call readchar to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0810", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0810---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 122;
                let result = data.writeChar(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
                    let replyReadResult = result.reply.readChar();
                    expect(replyReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0810---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0820
        * @tc.name    : test Call the writechar interface to write the data to the messageparcel instance,
        *             and call readchar to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0820", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0820---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 64;
                let result = data.writeChar(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
                    let replyReadResult = result.reply.readChar();
                    expect(replyReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0820---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0830
        * @tc.name    : test Call the writechar interface to write the data to the messageparcel instance,
        *             and call readchar to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0830", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0830---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 123;
                let result = data.writeChar(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
                    let replyReadResult = result.reply.readChar();
                    expect(replyReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0830---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0840
        * @tc.name    : test Call the writechar interface to write the data to the messageparcel instance,
        *             and call readchar to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0840", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0840---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 65;
                let result = data.writeChar(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
                    let replyReadResult = result.reply.readChar();
                    expect(replyReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0840---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0850
        * @tc.name    : test Writechar interface, illegal value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0850", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0850---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let token = 'ades';
                data.writeChar(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0850---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0860
        * @tc.name    : test Call the writestring interface to write the data to the messageparcel instance,
        *             and call readstring() to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0860", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0860---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = '';
                for (let i = 0; i < (40 * K - 1); i++) {
                    token += 'a';
                };
                let result = data.writeString(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    let replyReadResult = result.reply.readString();
                    expect(replyReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0860---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0870
        * @tc.name    : test Call the writestring interface to write the data to the messageparcel instance,
        *             and call readstring() to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0870", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0870---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let token = '';
                for (let i = 0; i < 40 * K; i++) {
                    token += 'a';
                };
                data.writeString(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0870---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0880
        * @tc.name    : test Writestring interface, illegal value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0880", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0880---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let token = 123;
                data.writeString(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0880---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0890
        * @tc.name    : test Call the writebyte interface to write data to the messageparcel instance,
        *             and call readbyte to read data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0890", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0890---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 2;
                let result = data.writeByte(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_BYTE, data, reply, option).then((result) => {
                    let replyReadResult = result.reply.readByte();
                    expect(replyReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0890---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0900
        * @tc.name    : test Writebyte interface, boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0900", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0900---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                expect(data.writeByte(-128) == true).assertTrue();
                expect(data.writeByte(0) == true).assertTrue();
                expect(data.writeByte(1) == true).assertTrue();
                expect(data.writeByte(2) == true).assertTrue();
                expect(data.writeByte(127) == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_BYTE_MULTI, data, reply, option).then((result) => {
                    expect(reply.readByte() == -128).assertTrue();
                    expect(reply.readByte() == 0).assertTrue();
                    expect(reply.readByte() == 1).assertTrue();
                    expect(reply.readByte() == 2).assertTrue();
                    expect(reply.readByte() == 127).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0900---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0910
        * @tc.name    : test Writebyte interface, illegal value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0910", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0910---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                expect(data.writeByte(-129) == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_BYTE_MULTI, data, reply, option).then((result) => {
                    expect(reply.readByte() == 127).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0910---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0920
        * @tc.name    : test Writebyte interface, illegal value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0920", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0920---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                expect(data.writeByte(128) == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_BYTE_MULTI, data, reply, option).then((result) => {
                    expect(reply.readByte() == -128).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0920---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0930
        * @tc.name    : test Writebyte interface, illegal value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0930", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0930---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let writeby = data.writeByte("error");
                expect(writeby).assertEqual(false);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0930---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0940
        * @tc.name    : test Call the writeint interface to write the data to the messageparcel instance,
        *             and call readint to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0940", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0940---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 2;
                let result = data.writeInt(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    let replyReadResult = result.reply.readInt();
                    expect(replyReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0940---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0950
        * @tc.name    : test Writeint interface, boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0950", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0950---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                expect(data.writeInt(-2147483648) == true).assertTrue();
                expect(data.writeInt(0) == true).assertTrue();
                expect(data.writeInt(1) == true).assertTrue();
                expect(data.writeInt(2) == true).assertTrue();
                expect(data.writeInt(2147483647) == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INT_MULTI, data, reply, option).then((result) => {
                    expect(result.reply.readInt() == -2147483648).assertTrue();
                    expect(result.reply.readInt() == 0).assertTrue();
                    expect(result.reply.readInt() == 1).assertTrue();
                    expect(result.reply.readInt() == 2).assertTrue();
                    expect(result.reply.readInt() == 2147483647).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0950---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0960
        * @tc.name    : test Writeint interface, illegal value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0960", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0960---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                expect(data.writeInt(2147483648) == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INT_MULTI, data, reply, option).then((result) => {
                    expect(result.reply.readInt() == -2147483648).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0960---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0970
        * @tc.name    : test Writeint interface, illegal value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0970", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0970---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                expect(data.writeInt(-2147483649) == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INT_MULTI, data, reply, option).then((result) => {
                    expect(result.reply.readInt() == 2147483647).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0970---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0980
        * @tc.name    : test Call the writefloat interface to write data to the messageparcel instance,
        *             and call readfloat to read data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0980", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0980---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 2.2;
                let result = data.writeFloat(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
                    let replyReadResult = result.reply.readFloat();
                    expect(replyReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0980---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_0990
        * @tc.name    : test Writefloat interface, boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_0990", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_0990---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 3.4E+38;
                let result = data.writeFloat(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
                    let newReadResult = result.reply.readFloat();
                    expect(newReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_0990---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1000
        * @tc.name    : test Writefloat interface, boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1000", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1000---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 1.4E-45;
                let result = data.writeFloat(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
                    let newReadResult = result.reply.readFloat();
                    expect(newReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1000---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1010
        * @tc.name    : test Writefloat interface, boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1010", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1010---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 4.4E+38;
                let result = data.writeFloat(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
                    let newReadResult = result.reply.readFloat();
                    expect(newReadResult == token).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1010---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1020
        * @tc.name    : test Writefloat interface, illegal value validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1020", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1020---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let token = 'a';
                let result = data.writeFloat(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1020---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1030
        * @tc.name    : test Test messageparcel to deliver rawdata data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1030", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1030---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let Capacity = data.getRawDataCapacity();
                expect(Capacity).assertEqual(128 * M);
                let rawdata = [1, 2, 3]
                let result = data.writeRawData(rawdata, rawdata.length);
                expect(result == true).assertTrue();
                let newReadResult = data.readRawData(rawdata.length);
                assertArrayElementEqual(newReadResult,rawdata);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1030---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1040
        * @tc.name    : test Illegal value passed in from writerawdata interface
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1040", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1040---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let Capacity = data.getRawDataCapacity();
                expect(Capacity).assertEqual(128 * M);
                let token = [2, 1, 4, 3, 129];
                let result = data.writeRawData(token, 149000000);
                expect(result == false).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1040---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1050
        * @tc.name    : test Illegal value passed in from writerawdata interface
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1050", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1050---------------------------");
            try {
                var parcel = new rpc.MessageParcel();
                var reply = new rpc.MessageParcel();
                let option = new rpc.MessageOption();
                let arr = [1, 2, 3, 4, 5];
                expect(parcel.writeInt(arr.length)).assertTrue();
                let isWriteSuccess = parcel.writeRawData(arr, arr.length);
                expect(isWriteSuccess).assertTrue();
                let Capacity = parcel.getRawDataCapacity()
                expect(Capacity).assertEqual(128 * M);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_RAWDATA, parcel, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let size = result.reply.readInt();
                    expect(size).assertEqual(arr.length);
                    let reCapacity = parcel.getRawDataCapacity();
                    expect(reCapacity).assertEqual(128 * M);
                    let newReadResult = result.reply.readRawData(size);
                    assertArrayElementEqual(newReadResult,arr);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                parcel.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1050---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1060
        * @tc.name    : test Test messageParcel to deliver abnormal RawData data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1060", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1060---------------------------");
            try {
                var parcel = new rpc.MessageParcel();
                var reply = new rpc.MessageParcel();
                let option = new rpc.MessageOption();
                let arr = [1, 2, 3, 4, 5];
                expect(parcel.writeInt(arr.length + 1)).assertTrue();
                let isWriteSuccess = parcel.writeRawData(arr, (arr.length + 1));
                expect(isWriteSuccess).assertTrue();
                let Capacity = parcel.getRawDataCapacity();
                expect(Capacity).assertEqual(128 * M);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_RAWDATA, parcel, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let size = result.reply.readInt();
                    expect(size).assertEqual(arr.length + 1);
                    let reCapacity = parcel.getRawDataCapacity();
                    expect(reCapacity).assertEqual(128 * M);
                    let newReadResult = result.reply.readRawData(size);
                    expect(arr[0]).assertEqual(newReadResult[0]);
                    expect(arr[1]).assertEqual(newReadResult[1]);
                    expect(arr[2]).assertEqual(newReadResult[2]);
                    expect(arr[3]).assertEqual(newReadResult[3]);
                    expect(arr[4]).assertEqual(newReadResult[4]);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                parcel.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1060---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1070
        * @tc.name    : test Test messageParcel to deliver abnormal RawData data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1070", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1070---------------------------");
            try {
                var parcel = new rpc.MessageParcel();
                var reply = new rpc.MessageParcel();
                let option = new rpc.MessageOption();
                let arr = [1, 2, 3, 4, 5];
                expect(parcel.writeInt(arr.length - 1)).assertTrue();
                let isWriteSuccess = parcel.writeRawData(arr, (arr.length - 1));
                expect(isWriteSuccess).assertTrue();
                let Capacity = parcel.getRawDataCapacity();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_RAWDATA, parcel, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let size = result.reply.readInt();
                    expect(size).assertEqual(arr.length - 1);
                    let reCapacity = parcel.getRawDataCapacity();
                    expect(reCapacity).assertEqual(128 * M);
                    let newReadResult = result.reply.readRawData(size);
                    expect(arr[0]).assertEqual(newReadResult[0]);
                    expect(arr[1]).assertEqual(newReadResult[1]);
                    expect(arr[2]).assertEqual(newReadResult[2]);
                    expect(arr[3]).assertEqual(newReadResult[3]);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                parcel.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1070---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1080
        * @tc.name    : test Test messageParcel to deliver out-of-bounds RawData data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1080", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1080---------------------------");
            try {
                var parcel = new rpc.MessageParcel();
                var reply = new rpc.MessageParcel();
                let option = new rpc.MessageOption();
                let arr = [-129, 2, 3, 4, 128];
                expect(parcel.writeInt(arr.length)).assertTrue();
                let isWriteSuccess = parcel.writeRawData(arr, arr.length);
                expect(isWriteSuccess).assertTrue();
                let Capacity = parcel.getRawDataCapacity();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_RAWDATA, parcel, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let size = result.reply.readInt();
                    expect(size).assertEqual(arr.length);
                    let reCapacity = parcel.getRawDataCapacity();
                    expect(reCapacity).assertEqual(128 * M);
                    let newReadResult = result.reply.readRawData(size);
                     assertArrayElementEqual(newReadResult,arr);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                parcel.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1080---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1090
        * @tc.name    : test Test messageParcel to deliver illegal RawData data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1090", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1090---------------------------");
            try {
                var parcel = new rpc.MessageParcel();
                let arr = ["aaa", 1, 2, 3];
                expect(parcel.writeInt(arr.length)).assertTrue();
                let isWriteSuccess = parcel.writeRawData(arr, arr.length);
                expect(isWriteSuccess).assertTrue();
                let reCapacity = parcel.getRawDataCapacity()
                expect(reCapacity).assertEqual(128 * M);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                parcel.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1090---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1100
        * @tc.name    : test Call the writeremoteobject interface to serialize the remote object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1100", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1100---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let testRemoteObject = new TestRemoteObject("testObject");
                let result = data.writeRemoteObject(testRemoteObject);
                expect(result == true).assertTrue();
                data.readRemoteObject()
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1100---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1110
        * @tc.name    : test Call the writeremoteobject interface to serialize the remote object and pass in the empty object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1110", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1110---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let token = {}
                let result = data.writeRemoteObject(token);
                expect(result == false).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1110---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1120
        * @tc.name    : test Call the writeSequenceable interface to write the custom serialized
        *             object to the messageparcel instance
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1120", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1120---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let sequenceable = new MySequenceable(1, "aaa");
                let result = data.writeSequenceable(sequenceable);
                expect(result == true).assertTrue();
                let ret = new MySequenceable(0, "");
                let result2 = data.readSequenceable(ret);
                expect(result2 == true).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1120---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1130
        * @tc.name    : test After the server finishes processing, write noexception first before writing the result,
        *             and the client calls readexception to judge whether the server is abnormal
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1130", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1130---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                data.writeNoException();
                expect(data.writeInt(6) == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_NOEXCEPTION, data, reply, option).then((result) => {
                    result.reply.readException()
                    let replyData = result.reply.readInt();
                    expect(replyData == 6).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1130---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1140
        * @tc.name    : test If the data on the server is abnormal, the client calls readexception
        *             to judge whether the server is abnormal
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1140", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1140---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                data.writeNoException();
                expect(data.writeInt(1232222223444) == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_NOEXCEPTION, data, reply, option).then((result) => {
                    result.reply.readException()
                    let replyData = result.reply.readInt();
                    console.info("SUB_DSoftbus_IPC_API_MessageParcel_1140: readResult is " + replyData);
                    expect(replyData != 1232222223444).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1140---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1150
        * @tc.name    : test Serializable object marshaling and unmarshalling test
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1150", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1150---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let sequenceable = new MySequenceable(1, "aaa");
                let result = data.writeSequenceable(sequenceable);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_SEQUENCEABLE, data, reply, option).then((result) => {
                    let s = new MySequenceable(null, null)
                    let resultReply = result.reply.readSequenceable(s);
                    expect(resultReply == true).assertTrue();
                    expect(s.str == sequenceable.str).assertTrue();
                    expect(s.num == sequenceable.num).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1150---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1160
        * @tc.name    : test Non serializable object marshaling test
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1160", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1160---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let sequenceable = new MySequenceable(1, "aaa");
                let result = data.writeSequenceable(sequenceable);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_SEQUENCEABLE, data, reply, option).then((result) => {
                    let s = new MySequenceable(null, null)
                    let replyReadResult = reply.readSequenceable(s);
                    expect(replyReadResult == true).assertTrue();
                    expect(s.str == sequenceable.str).assertTrue();
                    expect(s.num == sequenceable.num).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1160---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1170
        * @tc.name    : test The server did not send a serializable object, and the client was ungrouped
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1170", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1170---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let sequenceable = 10;
                let result = data.writeInt(sequenceable);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    let s = new MySequenceable(0, null)
                    expect(result.reply.readSequenceable(s)).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1170---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1180
        * @tc.name    : test Call the writeSequenceable interface to write the custom serialized object to the
        *             messageparcel instance, and call readSequenceable to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1180", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1180---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let sequenceable = new MySequenceable(2, "abc");
                let result = data.writeSequenceable(sequenceable);
                console.info("RpcClient: writeSequenceable is " + result);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_SEQUENCEABLE, data, reply, option).then((result) => {
                    let s = new MySequenceable(null, null)
                    result.reply.readSequenceable(s);
                    expect(s.str == sequenceable.str).assertTrue();
                    expect(s.num == sequenceable.num).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1180---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1190
        * @tc.name    : test Call the writeSequenceablearray interface to write the custom serialized object to the
        *             messageparcel instance, and call readSequenceablearray to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1190", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1190---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let sequenceable = [new MySequenceable(1, "aaa"),
                new MySequenceable(2, "bbb"), new MySequenceable(3, "ccc")];
                let result = data.writeSequenceableArray(sequenceable);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_SEQUENCEABLEARRAY, data, reply, option).then((result) => {
                    let s = [new MySequenceable(null, null), new MySequenceable(null, null),
                    new MySequenceable(null, null)];
                    result.reply.readSequenceableArray(s);
                    for (let i = 0; i < s.length; i++) {
                        expect(s[i].str).assertEqual(sequenceable[i].str)
                        expect(s[i].num).assertEqual(sequenceable[i].num)
                    }
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1190---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1200
        * @tc.name    : test Call the writeSequenceablearray interface to write the custom serialized object to the
        *             messageparcel instance, and call readSequenceablearray to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1200", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1200---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let sequenceable = [new MySequenceable(4, "abc"),
                new MySequenceable(5, "bcd"), new MySequenceable(6, "cef")];
                let result = data.writeSequenceableArray(sequenceable);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_SEQUENCEABLEARRAY, data, reply, option).then((result) => {
                    let s = [new MySequenceable(null, null),
                    new MySequenceable(null, null), new MySequenceable(null, null)]
                    result.reply.readSequenceableArray(s);
                    for (let i = 0; i < s.length; i++) {
                        expect(s[i].str).assertEqual(sequenceable[i].str)
                        expect(s[i].num).assertEqual(sequenceable[i].num)
                    }
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1200---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1210
        * @tc.name    : test Call the writeSequenceablearray interface to write the custom
        *             serialized object to the messageparcel instance
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1210", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1210---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let sequenceable = 1;
                let result = data.writeSequenceableArray(sequenceable);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1210---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1220
        * @tc.name    : test Call the writeremoteobjectarray interface to write the object array to the messageparcel
        *             instance, and call readremoteobjectarray to read the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1220", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1220---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                var option = new rpc.MessageOption();
                var listeners = [new TestRemoteObject("rpcListener"),
                new TestRemoteObject("rpcListener2"),
                new TestRemoteObject("rpcListener3")];
                let result = data.writeRemoteObjectArray(listeners);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_REMOTEOBJECTARRAY, data, reply, option).then((result) => {
                    console.info("SUB_DSoftbus_IPC_API_MessageParcel_1220: sendMessageRequest is " + result.errCode);
                    expect(result.errCode).assertEqual(0);
                    expect(result.code).assertEqual(CODE_WRITE_REMOTEOBJECTARRAY);
                    expect(result.data).assertEqual(data);
                    expect(result.reply).assertEqual(reply);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1220---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1240
        * @tc.name    : test Test messageparcel delivery file descriptor object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1240", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1240---------------------------");
            let context = FA.getContext();
            await context.getFilesDir()
                .then(async function (path) {
                    expect(path != null).assertTrue();
                    let basePath = path;
                    let filePath = basePath + "/test1.txt";
                    let fd = fileio.openSync(filePath, 0o2 | 0o100 | 0o2000, 0o666);
                    expect(fd >= 0).assertTrue();
                    let str = "HELLO RPC";
                    let bytesWr = fileio.writeSync(fd, str);
                    let option = new rpc.MessageOption();
                    var data = rpc.MessageParcel.create();
                    var reply = rpc.MessageParcel.create();
                    let result = data.containFileDescriptors();
                    let writeInt = data.writeInt(bytesWr);
                    expect(writeInt == true).assertTrue();
                    let writeFileDescriptor = data.writeFileDescriptor(fd)
                    expect(writeFileDescriptor == true).assertTrue();
                    let result1 = data.containFileDescriptors();
                    expect(data.containFileDescriptors()).assertTrue();
                    await gIRemoteObject.sendRequest(CODE_FILESDIR, data, reply, option)
                        .then(function (result) {
                            expect(result.errCode).assertEqual(0);
                            let buf = new ArrayBuffer(str.length * 2);
                            let bytesRd = fileio.readSync(fd, buf, { position: 0, });
                            let fdResult = reply.readFileDescriptor();
                            let content = String.fromCharCode.apply(null, new Uint8Array(buf));
                            expect(content).assertEqual(str + str);
                            let dupFd = rpc.MessageParcel.dupFileDescriptor(fd);
                            let buf2 = new ArrayBuffer(str.length * 2);
                            let byteRd2 = fileio.readSync(dupFd, buf2, { position: 0, });
                            let content2 = String.fromCharCode.apply(null, new Uint8Array(buf2));
                            console.info("dupFd bytes read: " + byteRd2 + ", content2: " + content2);
                            expect(content2).assertEqual(str + str);
                            rpc.MessageParcel.closeFileDescriptor(fd);
                            rpc.MessageParcel.closeFileDescriptor(dupFd);
                        })
                    try {
                        console.info("after close fd, write again");
                        fileio.writeSync(fd, str);
                        expect(0).assertEqual(1);
                    } catch (e) {
                        console.error("got exception: " + e);
                    } finally {
                        data.reclaim();
                        reply.reclaim();
                        done();
                    }
                })
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1240---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1250
        * @tc.name    : test Test messageparcel to deliver the reply message received in promise across processes
        * @tc.desc    : Function test
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1250", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1250---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                console.info("SUB_DSoftbus_IPC_API_MessageParcel_1250: create object successfully.");
                var reply = rpc.MessageParcel.create();
                var option = new rpc.MessageOption();
                expect(data.writeByte(2)).assertTrue();
                expect(data.writeShort(3)).assertTrue();
                expect(data.writeInt(4)).assertTrue();
                expect(data.writeLong(5)).assertTrue();
                expect(data.writeFloat(1.2)).assertTrue();
                expect(data.writeDouble(10.2)).assertTrue();
                expect(data.writeBoolean(true)).assertTrue();
                expect(data.writeChar(5)).assertTrue();
                expect(data.writeString("HelloWorld")).assertTrue();
                expect(data.writeSequenceable(new MySequenceable(1, "aaa"))).assertTrue();

                await gIRemoteObject.sendRequest(CODE_ALL_TYPE, data, reply, option).then((result) => {
                    console.info("sendRequest done, error code: " + result.errCode);
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readByte()).assertEqual(2);
                    expect(result.reply.readShort()).assertEqual(3);
                    expect(result.reply.readInt()).assertEqual(4);
                    expect(result.reply.readLong()).assertEqual(5);
                    expect(result.reply.readFloat()).assertEqual(1.2);
                    expect(result.reply.readDouble()).assertEqual(10.2);
                    expect(result.reply.readBoolean()).assertTrue();
                    expect(result.reply.readChar()).assertEqual(5);
                    expect(result.reply.readString()).assertEqual("HelloWorld");
                    let s = new MySequenceable(null, null);
                    expect(result.reply.readSequenceable(s)).assertTrue();
                    expect(s.num).assertEqual(1);
                    expect(s.str).assertEqual("aaa");
                });
                data.reclaim();
                reply.reclaim();
                done();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel_1250:error = " + error);
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1250---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1260
        * @tc.name    : test Test the cross process delivery of messageparcel and receive the reply message
        *             in the callback function
        * @tc.desc    : Function test
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1260", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1260---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                console.info("SUB_DSoftbus_IPC_API_MessageParcel_1260: create object successfully.");
                var reply = rpc.MessageParcel.create();
                var option = new rpc.MessageOption();

                expect(data.writeByte(2)).assertTrue();
                expect(data.writeShort(3)).assertTrue();
                expect(data.writeInt(4)).assertTrue();
                expect(data.writeLong(5)).assertTrue();
                expect(data.writeFloat(1.2)).assertTrue();
                expect(data.writeDouble(10.2)).assertTrue();
                expect(data.writeBoolean(true)).assertTrue();
                expect(data.writeChar(5)).assertTrue();
                expect(data.writeString("HelloWorld")).assertTrue();
                expect(data.writeSequenceable(new MySequenceable(1, "aaa"))).assertTrue();

                function sendRequestCallback(result) {
                    try {
                        console.info("sendRequest Callback");
                        console.info("sendRequest done, error code: " + result.errCode);
                        expect(result.errCode).assertEqual(0);
                        expect(result.reply.readByte()).assertEqual(2);
                        expect(result.reply.readShort()).assertEqual(3);
                        expect(result.reply.readInt()).assertEqual(4);
                        expect(result.reply.readLong()).assertEqual(5);
                        expect(result.reply.readFloat()).assertEqual(1.2);
                        expect(result.reply.readDouble()).assertEqual(10.2);
                        expect(result.reply.readBoolean()).assertTrue();
                        expect(result.reply.readChar()).assertEqual(5);
                        expect(result.reply.readString()).assertEqual("HelloWorld");
                        let s = new MySequenceable(null, null);
                        expect(result.reply.readSequenceable(s)).assertTrue();
                        expect(s.num).assertEqual(1);
                        expect(s.str).assertEqual("aaa");
                    } finally {
                        result.data.reclaim();
                        result.reply.reclaim();
                        console.info("test done");
                        done();
                    }
                }

                console.info("start send request");
                await gIRemoteObject.sendRequest(CODE_ALL_TYPE, data, reply, option, sendRequestCallback);

            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel_1260:error = " + error);
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1260---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1270
        * @tc.name    : test Test the cross process transmission of messageparcel.
        *             After receiving the reply message in promise, read various types of arrays in order
        * @tc.desc    : Function test
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1270", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1270---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                console.info("SUB_DSoftbus_IPC_API_MessageParcel_1270: create object successfully.");
                var reply = rpc.MessageParcel.create();
                var option = new rpc.MessageOption();
                expect(data.writeByteArray([1, 2, 3])).assertTrue();
                expect(data.writeShortArray([4, 5, 6])).assertTrue();
                expect(data.writeIntArray([7, 8, 9])).assertTrue();
                expect(data.writeLongArray([10, 11, 12])).assertTrue();
                expect(data.writeFloatArray([1.1, 1.2, 1.3])).assertTrue();
                expect(data.writeDoubleArray([2.1, 2.2, 2.3])).assertTrue();
                expect(data.writeBooleanArray([true, true, false])).assertTrue();
                expect(data.writeCharArray([10, 20, 30])).assertTrue();
                expect(data.writeStringArray(['abc', 'seggg'])).assertTrue();
                let a = [new MySequenceable(1, "aaa"), new MySequenceable(2, "bbb"),
                new MySequenceable(3, "ccc")];
                expect(data.writeSequenceableArray(a)).assertTrue();
                gIRemoteObject.sendRequest(CODE_ALL_ARRAY_TYPE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    assertArrayElementEqual(result.reply.readByteArray(),[1, 2, 3]);
                    assertArrayElementEqual(result.reply.readShortArray(),[4, 5, 6]);
                    assertArrayElementEqual(result.reply.readIntArray(),[7, 8, 9]);
                    assertArrayElementEqual(result.reply.readLongArray(),[10, 11, 12]);
                    assertArrayElementEqual(result.reply.readFloatArray(),[1.1, 1.2, 1.3]);
                    assertArrayElementEqual(result.reply.readDoubleArray(),[2.1, 2.2, 2.3]);
                    assertArrayElementEqual(result.reply.readBooleanArray(),[true, true, false]);
                    assertArrayElementEqual(result.reply.readCharArray(),[65, 97, 122]);
                    assertArrayElementEqual(result.reply.readStringArray(),['abc', 'seggg']);
                    let b = [new MySequenceable(null, null), new MySequenceable(null, null),
                    new MySequenceable(null, null)];
                    result.reply.readSequenceableArray(b);
                    for (let i = 0; i < b.length; i++) {
                        expect(b[i].str).assertEqual(a[i].str);
                        expect(b[i].num).assertEqual(a[i].num);
                    }
                });
                data.reclaim();
                reply.reclaim();
                done();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel_1270:error = " + error);
            }
            sleep(2000);
            data.reclaim();
            reply.reclaim();
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1270---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1280
        * @tc.name    : test Test messageparcel cross process delivery. After receiving the reply message in promise,
        *             the client constructs an empty array in sequence and reads the data from the reply message
        *             into the corresponding array
        * @tc.desc    : Function test
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1280", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1280---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                console.info("SUB_DSoftbus_IPC_API_MessageParcel_1280: create object successfully.");
                var reply = rpc.MessageParcel.create();
                var option = new rpc.MessageOption();
                expect(data.writeByteArray([1, 2, 3])).assertTrue();
                expect(data.writeShortArray([4, 5, 6])).assertTrue();
                expect(data.writeIntArray([7, 8, 9])).assertTrue();
                expect(data.writeLongArray([10, 11, 12])).assertTrue();
                expect(data.writeFloatArray([1.1, 1.2, 1.3])).assertTrue();
                expect(data.writeDoubleArray([2.1, 2.2, 2.3])).assertTrue();
                expect(data.writeBooleanArray([true, true, false])).assertTrue();
                expect(data.writeCharArray([10, 20, 30])).assertTrue();
                expect(data.writeStringArray(['abc', 'seggg'])).assertTrue();
                let a = [new MySequenceable(1, "aaa"), new MySequenceable(2, "bbb"),
                new MySequenceable(3, "ccc")];
                expect(data.writeSequenceableArray(a)).assertTrue();
                gIRemoteObject.sendRequest(CODE_ALL_ARRAY_TYPE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let ByteArray = new Array();
                    result.reply.readByteArray(ByteArray);
                    assertArrayElementEqual(ByteArray,[1, 2, 3]);
                    let ShortArray = new Array();
                    result.reply.readShortArray(ShortArray);
                    assertArrayElementEqual(ShortArray,[4, 5, 6]);
                    let IntArray = new Array();
                    result.reply.readIntArray(IntArray);
                     assertArrayElementEqual(IntArray,[7, 8, 9]);
                    let LongArray = new Array();
                    result.reply.readLongArray(LongArray);
                     assertArrayElementEqual(LongArray,[10, 11, 12]);
                    let FloatArray = new Array();
                    result.reply.readFloatArray(FloatArray);
                    assertArrayElementEqual(FloatArray,[1.1, 1.2, 1.3]);
                    let DoubleArray = new Array();
                    result.reply.readDoubleArray(DoubleArray);
                    assertArrayElementEqual(DoubleArray,[2.1, 2.2, 2.3]);
                    let BooleanArray = new Array();
                    result.reply.readBooleanArray(BooleanArray);
                    assertArrayElementEqual(BooleanArray,[true, true, false]);
                    let CharArray = new Array();
                    result.reply.readCharArray(CharArray);
                    assertArrayElementEqual(CharArray,[65, 97, 122]);
                    let StringArray = new Array();
                    result.reply.readStringArray(StringArray);
                    assertArrayElementEqual(StringArray,['abc', 'seggg']);
                    let b = [new MySequenceable(null, null), new MySequenceable(null, null),
                    new MySequenceable(null, null)];
                    result.reply.readSequenceableArray(b);
                    for (let i = 0; i < b.length; i++) {
                        expect(b[i].str).assertEqual(a[i].str);
                        expect(b[i].num).assertEqual(a[i].num);
                    };
                });
                data.reclaim();
                reply.reclaim();
                done();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel_1280:error = " + error);
            }
            sleep(2000);
            data.reclaim();
            reply.reclaim();
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1280---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1290
        * @tc.name    : test Test messageparcel to pass an object of type iremoteobject across processes
        * @tc.desc    : Function test
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1290", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1290---------------------------");
            function checkResult(num, str) {
                expect(num).assertEqual(123);
                expect(str).assertEqual("rpcListenerTest");
                done();
            }
            try {
                let option = new rpc.MessageOption();
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let listener = new TestListener("rpcListener", checkResult);
                let result = data.writeRemoteObject(listener);
                expect(result == true).assertTrue();
                expect(data.writeInt(123)).assertTrue();
                expect(data.writeString("rpcListenerTest")).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_REMOTEOBJECT, data, reply, option)
                    .then((result) => {
                        expect(result.errCode).assertEqual(0);
                        result.reply.readException();
                    })
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1290---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1300
        * @tc.name    : test Test messageparcel to pass an array of iremoteobject objects across processes
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1300", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1300---------------------------");

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
            try {
                let option = new rpc.MessageOption();
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let listeners = [new TestListener("rpcListener", checkResult),
                new TestListener("rpcListener2", checkResult),
                new TestListener("rpcListener3", checkResult)];
                let result = data.writeRemoteObjectArray(listeners);
                expect(result == true).assertTrue();
                expect(data.writeInt(123)).assertTrue();
                expect(data.writeString("rpcListenerTest")).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_REMOTEOBJECTARRAY_1, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    result.reply.readException();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error = null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1300---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1310
        * @tc.name    : test Test messageparcel to pass the array of iremoteobject objects across processes. The server
        *             constructs an empty array in onremoterequest and reads it from messageparcel
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1310", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1310---------------------------");
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
            try {
                let option = new rpc.MessageOption();
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let listeners = [new TestListener("rpcListener", checkResult),
                new TestListener("rpcListener2", checkResult),
                new TestListener("rpcListener3", checkResult)];
                let result = data.writeRemoteObjectArray(listeners);
                expect(result == true).assertTrue();
                expect(data.writeInt(123)).assertTrue();
                expect(data.writeString("rpcListenerTest")).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_REMOTEOBJECTARRAY_2, data, reply, option)
                    .then((result) => {
                        console.info("SUB_DSoftbus_IPC_API_MessageParcel_1310 sendRequest done, error code: " + result.errCode);
                        expect(result.errCode).assertEqual(0);
                        result.reply.readException();
                    })
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1310---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1320
        * @tc.name    : test Invoke the rewindRead interface, write the POS, and read the offset value
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1320", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1320---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageParcel.create();
                data.writeInt(12);
                data.writeString("parcel");
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let number1 = result.reply.readInt();
                    expect(number1).assertEqual(12);
                    expect(result.reply.rewindRead(0)).assertTrue();
                    let number2 = result.reply.readInt();
                    expect(number2).assertEqual(12);
                    let reString = result.reply.readString();
                    expect(reString).assertEqual("");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1320---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1330
        * @tc.name    : test Invoke the rewindRead interface, write the POS, and read the offset value
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1330", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1330---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageParcel.create();
                data.writeInt(12);
                data.writeString("parcel");
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let number1 = result.reply.readInt();
                    expect(result.reply.rewindRead(1)).assertTrue();
                    let number2 = result.reply.readInt();
                    expect(number1).assertEqual(12);
                    expect(number2).assertEqual(0);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1330---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1340
        * @tc.name    : test Invoke the rewindWrite interface, write the POS, and read the offset value
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1340", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1180---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageParcel.create();
                data.writeInt(4);
                data.rewindWrite(0);
                data.writeInt(5);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let number = result.reply.readInt();
                    expect(number).assertEqual(5);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1340---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1350
        * @tc.name    : test Invoke the rewindWrite interface, write the POS, and read the offset value
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1350", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1350---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageParcel.create();
                data.writeInt(4);
                data.rewindWrite(1);
                data.writeInt(5);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let number = result.reply.readInt();
                    expect(number != 5).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1350---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1360
        * @tc.name    : test setCapacity Sets the storage capacity of the MessageParcel instance. The getCapacity 
        *               obtains the current MessageParcel capacity
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1360", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1360---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageParcel.create();
                expect(data.getCapacity()).assertEqual(0);
                let setMePaCapacity = data.setCapacity(100);
                expect(setMePaCapacity).assertTrue();
                expect(data.writeString("constant")).assertTrue();
                expect(data.getCapacity()).assertEqual(100);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let getMePaCapacity = result.reply.getCapacity();
                    expect(getMePaCapacity).assertEqual("constant".length * 8);
                    expect(result.reply.readString()).assertEqual("constant");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1360---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1370
        * @tc.name    : test setCapacity Sets the storage capacity of the MessageParcel instance. The getCapacity
        *              obtains the current MessageParcel capacity
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1370", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1370---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageParcel.create();
                expect(data.writeString("constant")).assertTrue();
                expect(data.setCapacity(100)).assertTrue();
                expect(data.getCapacity()).assertEqual(100);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    expect(result.reply.readString()).assertEqual("constant");
                    let getMeCa = result.reply.getCapacity();
                    expect(getMeCa).assertEqual("constant".length * 8);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1370---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1380
        * @tc.name    : test SetCapacity Tests the storage capacity threshold of the MessageParcel instance
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1380", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1380---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let getCapacitydata0 = data.getCapacity();
                expect(data.writeString("constant")).assertTrue();
                let getSizedata = data.getSize();
                let getCapacitydata = data.getCapacity();
                let setCapacitydata1 = data.setCapacity(getSizedata + 1);
                expect(setCapacitydata1).assertTrue();
                expect(data.getCapacity()).assertEqual((getSizedata + 1));
                let setCapacitydata2 = data.setCapacity(getSizedata);
                expect(setCapacitydata2).assertEqual(false);
                expect(data.getCapacity()).assertEqual((getSizedata + 1));
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1380---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1390
        * @tc.name    : test SetCapacity Tests the storage capacity threshold of the MessageParcel instance
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1390", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1390---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageParcel.create();
                expect(data.writeString("constant")).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let getSizeresult = result.reply.getSize();
                    let setCapacityresult = result.reply.getCapacity();
                    expect(setCapacityresult).assertEqual("constant".length * 8);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1390---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1400
        * @tc.name    : test SetCapacity Tests the storage capacity threshold of the MessageParcel instance
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1400", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1400---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let getSizedata = data.getSize();
                expect(getSizedata).assertEqual(0);
                let setMeCapacity = data.setCapacity(M);
                expect(setMeCapacity).assertTrue();
                let getCapacitydata = data.getCapacity();
                expect(getCapacitydata).assertEqual(M);
                let setMeCapacity1 = data.setCapacity(4 * G);
                expect(setMeCapacity1).assertEqual(false);
                let getCapacitydata1 = data.getCapacity();
                expect(getCapacitydata1).assertEqual(M);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1400---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1410
        * @tc.name    : test setCapacity Sets the storage capacity of the MessageParcel instance to decrease by one.
        *               The getCapacity obtains the current MessageParcel capacity
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1410", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1410---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageParcel.create();
                expect(data.getSize()).assertEqual(0);
                let setSizedata = data.setSize(0);
                expect(setSizedata).assertTrue();
                expect(data.writeString("constant")).assertTrue();
                let getSizedata = data.getSize();
                expect(getSizedata).assertEqual(("constant".length * 2) + 8);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let getSizeresult = result.reply.getSize();
                    expect(getSizeresult).assertEqual(("constant".length * 2) + 8);
                    expect(result.reply.readString()).assertEqual("constant");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1410---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1420
        * @tc.name    : test setSize Sets the size of the data contained in the MessageParcel instance. The getSize command
        *              reads the data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1420", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1420---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageParcel.create();
                expect(data.writeString("constant")).assertTrue();
                expect(data.getSize()).assertEqual(("constant".length * 2) + 8);
                expect(data.setSize(0)).assertTrue();
                let getSizedata = data.getSize();
                expect(getSizedata).assertEqual(0);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let getSizeresult = result.reply.getSize();
                    expect(getSizeresult).assertEqual(8);
                    let writeresult = result.reply.readString();
                    expect(writeresult).assertEqual("");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1420---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1430
        * @tc.name    : test SetSize: Increases the value of the data contained in the MessageParcel instance by 1,Write setSize
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1430", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1430---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                expect(data.getSize()).assertEqual(0);
                expect(data.writeString("constant")).assertTrue();
                expect(data.getSize()).assertEqual(("constant".length * 2) + 8);
                let getCapacitydata = data.getCapacity();
                let setSizedata1 = data.setSize(getCapacitydata);
                expect(setSizedata1).assertTrue();
                expect(data.getSize()).assertEqual(getCapacitydata);
                let setSizedata2 = data.setSize(getCapacitydata + 1);
                expect(setSizedata2).assertEqual(false);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1430---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1440
        * @tc.name    : test SetSize: Increases the value of the data contained in the MessageParcel instance by 1,
        *               Write the setSize boundary value
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1440", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1440---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageParcel.create();
                expect(data.writeString("constant")).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    expect(result.reply.readString()).assertEqual("constant");
                    expect(result.reply.getSize()).assertEqual(("constant".length * 2) + 8);
                    let getCapacityresult = result.reply.getCapacity();
                    let setSizeresult1 = result.reply.setSize(getCapacityresult);
                    expect(setSizeresult1).assertTrue();
                    expect(result.reply.getSize()).assertEqual(getCapacityresult);
                    let setSizeresult2 = result.reply.setSize(getCapacityresult + 1);
                    expect(setSizeresult2).assertEqual(false);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1440---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1450
        * @tc.name    : test Validate the setSize boundary value in the MessageParcel instance
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1450", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1450---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let getCapacitydata = data.getCapacity();
                expect(getCapacitydata).assertEqual(0);
                let setSizedata1 = data.setSize(4 * G);
                expect(setSizedata1).assertTrue();
                let getSizedata1 = data.getSize();
                expect(getSizedata1).assertEqual(0);
                let setSizedata = data.setSize(4 * G - 1);
                expect(setSizedata).assertEqual(false);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1450---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1460
        * @tc.name    : test Verify that setSize is out of bounds in a MessageParcel instance
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1460", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1460---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let setSizedata = data.setSize(0);
                expect(setSizedata).assertTrue();
                expect(data.getSize()).assertEqual(0);
                let setSizedata1 = data.setSize(2 * 4 * G);
                expect(setSizedata1).assertTrue();
                expect(data.getSize()).assertEqual(0);
                let setSizedata2 = data.setSize(2 * G);
                expect(setSizedata2).assertEqual(false);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1460---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1470
        * @tc.name    : test Obtaining the Writable and Readable Byte Spaces of MessageParcel
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1470", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1470---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageParcel.create();
                expect(data.getWritableBytes()).assertEqual(0);
                data.writeInt(10);
                expect(data.getWritableBytes()).assertEqual(60);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    expect(result.reply.getReadableBytes()).assertEqual(4);
                    let readint = result.reply.readInt();
                    expect(readint).assertEqual(10);
                    let getrbyte2 = result.reply.getReadableBytes();
                    expect(getrbyte2).assertEqual(0);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1470---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1480
        * @tc.name    : test Obtains the writeable and readable byte space and read position of the MessageParcel
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1480", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1480---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageParcel.create();
                data.writeInt(10);
                let getwPos = data.getWritePosition();
                let getwbyte = data.getWritableBytes();
                expect(getwbyte).assertEqual(60);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let getrbyte = result.reply.getReadableBytes();
                    expect(getrbyte).assertEqual(4);
                    let readint = result.reply.readInt();
                    expect(readint).assertEqual(10);
                    let getrPos = result.reply.getReadPosition();
                    expect(getrPos).assertEqual(getwPos);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1480---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1490
        * @tc.name    : test Obtains the writeable and readable byte space and read position of the MessageParcel
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1490", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1490---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageParcel.create();
                data.writeInt(10);
                let getwPos = data.getWritePosition();
                let getwbyte = data.getWritableBytes();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let readint = result.reply.readInt();
                    expect(readint).assertEqual(10);
                    let getrPos = result.reply.getReadPosition();
                    expect(getrPos).assertEqual(4);
                    let getrbyte = result.reply.getReadableBytes();
                    expect(getrbyte).assertEqual(0);
                    let getrPos1 = result.reply.getReadPosition();
                    expect(getrPos1).assertEqual(getwPos);
                    let getrbyte1 = result.reply.getReadableBytes();
                    expect(getrbyte1).assertEqual(0);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1490---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1500
        * @tc.name    : test Test fixed MessageParcel space size to pass rawData data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1500", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1500---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let rawdata = [1, 2, 3];
                let option = new rpc.MessageOption();
                var reply = rpc.MessageParcel.create();
                expect(data.writeInt(rawdata.length)).assertTrue();
                let result = data.writeRawData(rawdata, rawdata.length);
                expect(result).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_RAWDATA, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let size = result.reply.readInt();
                    let newReadResult = result.reply.readRawData(size);
                    expect(newReadResult != rawdata).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1500---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1510
        * @tc.name    : test Obtains the write and read positions of the MessageParcel
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1510", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1510---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                var reply = rpc.MessageParcel.create();
                let getwPos1 = data.getWritePosition();
                expect(data.writeInt(10)).assertTrue();
                let getwPos2 = data.getWritePosition();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let getrPos1 = result.reply.getReadPosition();
                    let readint = result.reply.readInt();
                    expect(readint).assertEqual(10);
                    let getrPos2 = result.reply.getReadPosition();
                    expect(getwPos1).assertEqual(getrPos1);
                    expect(getwPos2).assertEqual(getrPos2);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1510---------------------------");
        });


        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1520
        * @tc.name    : test Test messageparcel delivery file descriptor object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1520", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1520---------------------------");
            try {
                let testab = new TestProxy(gIRemoteObject).asObject();
                expect(testab != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1520---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1530
        * @tc.name    : test Test messageparcel delivery file descriptor object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1530", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1530---------------------------");
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                expect(testRemoteObject != null).assertTrue();
                let testab = testRemoteObject.asObject();
                expect(testab != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1530---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1540
        * @tc.name    : test MessageParcel sendMessageRequest API test
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1540", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1540---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let Capacity = data.getRawDataCapacity()
                let rawdata = [1, 2, 3];
                let option = new rpc.MessageOption();
                var reply = rpc.MessageSequence.create();
                data.writeInt(rawdata.length);
                data.writeRawData(rawdata, rawdata.length);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_RAWDATA, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let size = result.reply.readInt();
                    let newReadResult = result.reply.readRawData(size);
                    expect(newReadResult != rawdata).assertTrue();
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1540---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1550
        * @tc.name    : test Invoke the writestring interface to write data to the messageparcel instance SendRequest Asynchronous
        *               Authentication onRemoteMessageRequest Server Processing
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1550", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1550---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 'onRemoteMessageRequest invoking';
                let result = data.writeString(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    var replyReadResult = result.reply.readString();
                    expect(replyReadResult).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1550---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1560
        * @tc.name    : test Invoke the writestring interface to write data to the messageparcel instance sendMessageRequest Asynchronous
        *               Authentication onRemoteMessageRequest Server Processing
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1560", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1560---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = 'onRemoteMessageRequest invoking';
                data.writeString(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    var replyReadResult = result.reply.readString();
                    expect(replyReadResult).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1560---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1570
        * @tc.name    : test Invoke the writestring interface to write data to the messageparcel instance. SendRequest asynchronously
        *               verifies the priority processing levels of onRemoteMessageRequest and onRemoteRequest
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1570", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1570---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = "onRemoteRequest or onRemoteMessageRequest invoking";
                let result = data.writeString(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_ONREMOTEMESSAGE_OR_ONREMOTE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    var replyReadResult = result.reply.readString();
                    expect(replyReadResult).assertEqual("onRemoteMessageRequest invoking");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1570---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1580
        * @tc.name   Invoke the writestring interface to write data to the messageparcel instance. sendMessageRequest asynchronously verifies
        *               the priority processing levels of onRemoteMessageRequest and onRemoteRequest
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1580", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1580---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = 'onRemoteRequest or onRemoteMessageRequest invoking';
                data.writeString(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_ONREMOTEMESSAGE_OR_ONREMOTE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    var replyReadResult = result.reply.readString();
                    expect(replyReadResult).assertEqual("onRemoteMessageRequest invoking");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1580---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1590
        * @tc.name    : test Call the 401 interface to set the writeString of MessageSequence
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1590", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1590---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = '';
                for (let i = 0; i < 40 * K; i++) {
                    token += 'a';
                };
                let result = data.writeString(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1590---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1600
        * @tc.name    : test Call the 1900011 interface, write the interface descriptor, and read interfacetoken
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1600", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1600---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                data.setSize(0);
                data.setCapacity(0);
                let token = "hello ruan zong xian";
                data.writeInterfaceToken(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error.code == 1900011).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1600---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1610
        * @tc.name    : test Call the 1900009 interface, write the interface descriptor, and read interfacetoken
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1610", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1610---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                data.setSize(true);
                data.setCapacity(true);
                let token = "hello ruan zong xian";
                data.writeInterfaceToken(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                let errCode = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1610---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1620
        * @tc.name    : test Call the setcapacity interface to set the capacity of messageparcel
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1620", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1620---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let sequenceable = new MySequenceable(1, "aaa");
                data.writeParcelable(sequenceable);
                let ret = new MySequenceable(0, "");
                data.setCapacity(0);
                data.readParcelable(ret);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                let errCode = `${rpc.ErrorCode.PARCEL_MEMORY_ALLOC_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1620---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1630
        * @tc.name    : test Call the 1900008 interface to serialize the remote object and pass in the empty object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3   
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1630", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1630---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                console.info("SUB_DSoftbus_IPC_API_MessageParcel_1630: create object successfully.");
                let token = {}
                data.writeRemoteObject(token);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error.code == 1900008).assertTrue();
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1630---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1640
        * @tc.name    : test Call the writeparcelable 1900012 interface to write the custom serialized
        *             object to the MessageSequence instance
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1640", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1640---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let sequenceable = new MySequenceable(1, "aaa");
                data.writeParcelable(sequenceable);
                data.setCapacity(0);
                data.setSize(0);
                let ret = new MySequenceable(1, "");
                data.readParcelable(ret);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                let errCode = `${rpc.ErrorCode.CALL_JS_METHOD_ERROR}`;
                expect(error.message != null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1640---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1650
        * @tc.name    : test Call the writeinterfacetoken interface, write the interface descriptor, and read interfacetoken
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1650", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1650---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                let token = "hello ruan zong xian";
                data.writeInterfaceToken(token);
                data.setCapacity(0);
                data.setSize(0);
                data.readInterfaceToken();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                let errCode = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(error.message != null).assertTrue();
                expect(error.code != errCode).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1650---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1660
        * @tc.name    : test Test 1900013 messageparcel delivery file descriptor object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1660", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1660---------------------------");
            try {
                let filePath = "path/to/file";
                let fd = fileio.openSync(filePath, null);
                rpc.MessageSequence.dupFileDescriptor(fd);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                let errCode = `${rpc.ErrorCode.OS_DUP_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            done();
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1660---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1670
        * @tc.name    : test The readRemoteObjectArray interface directly reads parameters
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1670", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1670---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let listeners = [new TestRemoteObject("rpcListener"),
                new TestRemoteObject("rpcListener2"),
                new TestRemoteObject("rpcListener3")];
                let result = data.writeRemoteObjectArray(listeners);
                expect(result == true).assertTrue();
                let rlisteners = data.readRemoteObjectArray();
                expect(rlisteners != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1670---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageParcel_1680
        * @tc.name    : test The readRemoteObjectArray interface reads parameters to an empty array
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageParcel_1680", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageParcel_1680---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                let listeners = [new TestRemoteObject("rpcListener"),
                new TestRemoteObject("rpcListener2"),
                new TestRemoteObject("rpcListener3")];
                let result = data.writeRemoteObjectArray(listeners);
                expect(result == true).assertTrue();
                let rlisteners = new Array(3);
                data.readRemoteObjectArray(rlisteners);
                expect(rlisteners != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageParcel error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageParcel_1680---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0010
        * @tc.name    : test Basic method of testing messageoption
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageOption_0010", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0010---------------------------");
            try {
                let option = new rpc.MessageOption();
                let time = option.getWaitTime();
                expect(time).assertEqual(rpc.MessageOption.TF_WAIT_TIME);
                option.setWaitTime(16);
                let time2 = option.getWaitTime();
                expect(time2).assertEqual(16);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0010---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0020
        * @tc.name    : test Basic method of testing messageoption
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageOption_0020", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0020---------------------------");
            try {
                let option = new rpc.MessageOption();
                let time = option.getWaitTime();
                expect(time).assertEqual(rpc.MessageOption.TF_WAIT_TIME);
                option.setWaitTime(0);
                let time2 = option.getWaitTime();
                expect(time2).assertEqual(rpc.MessageOption.TF_WAIT_TIME);
                option.setWaitTime(60);
                let time3 = option.getWaitTime();
                expect(time3).assertEqual(60);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0020---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0030
        * @tc.name    : test Basic method of testing messageoption
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageOption_0030", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0030---------------------------");
            try {
                let option = new rpc.MessageOption();
                let time = option.getWaitTime();
                expect(time).assertEqual(rpc.MessageOption.TF_WAIT_TIME);
                option.setWaitTime(-1);
                let time2 = option.getWaitTime();
                expect(time2).assertEqual(rpc.MessageOption.TF_WAIT_TIME);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0030---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0040
        * @tc.name    : test Basic method of testing messageoption
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageOption_0040", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0040---------------------------");
            try {
                let option = new rpc.MessageOption();
                let time = option.getWaitTime();
                expect(time).assertEqual(rpc.MessageOption.TF_WAIT_TIME);
                option.setWaitTime(61);
                let time2 = option.getWaitTime();
                expect(time2).assertEqual(61);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0040---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0050
        * @tc.name    : test Basic method of testing messageoption
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageOption_0050", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0050---------------------------");
            try {
                let option = new rpc.MessageOption();
                let flog = option.getFlags();
                expect(flog).assertEqual(rpc.MessageOption.TF_SYNC);
                option.setFlags(1);
                let flog2 = option.getFlags();
                expect(flog2).assertEqual(rpc.MessageOption.TF_ASYNC);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0050---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0060
        * @tc.name    : test Basic method of testing messageoption
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageOption_0060", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0060---------------------------");
            try {
                let option = new rpc.MessageOption();
                let flog = option.getFlags();
                expect(flog).assertEqual(rpc.MessageOption.TF_SYNC);
                option.setFlags(1);
                let flog2 = option.getFlags();
                expect(flog2).assertEqual(rpc.MessageOption.TF_ASYNC);
                option.setFlags(0);
                let flog3 = option.getFlags();
                expect(flog3).assertEqual(rpc.MessageOption.TF_ASYNC);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0060---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0070
        * @tc.name    : test Basic method of testing messageoption
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageOption_0070", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0070---------------------------");
            try {
                let option = new rpc.MessageOption();
                let flog = option.getFlags();
                expect(flog).assertEqual(rpc.MessageOption.TF_SYNC);
                option.setFlags(-1);
                let flog2 = option.getFlags();
                expect(flog2).assertEqual(-1);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0070---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0080
        * @tc.name    : test Basic method of testing messageoption
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageOption_0080", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0080---------------------------");
            try {
                let option = new rpc.MessageOption();
                let flog = option.getFlags();
                expect(flog).assertEqual(rpc.MessageOption.TF_SYNC);
                option.setFlags(3);
                let flog2 = option.getFlags();
                expect(flog2).assertEqual(3);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0080---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0090
        * @tc.name    : test Basic method of testing messageoption
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageOption_0090", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0090---------------------------");
            try {
                expect(rpc.MessageOption.TF_SYNC).assertEqual(0);
                expect(rpc.MessageOption.TF_ASYNC).assertEqual(1);
                expect(rpc.MessageOption.TF_WAIT_TIME).assertEqual(8);
                expect(rpc.MessageOption.TF_ACCEPT_FDS).assertEqual(0x10);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0090---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0100
        * @tc.name    : test Basic method of testing messageoption
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageOption_0100", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0100---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                option.setWaitTime(20);
                option.setFlags(0);
                let token = "option";
                let result = data.writeString(token);
                expect(result).assertTrue();
                expect(option.getFlags()).assertEqual(0);
                expect(option.getWaitTime()).assertEqual(20);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    let replyReadResult = result.reply.readString();
                    expect(replyReadResult).assertEqual(token);
                    expect(option.getFlags()).assertEqual(0);
                    expect(option.getWaitTime()).assertEqual(20);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0100---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0110
        * @tc.name    : test Basic method of testing messageoption
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageOption_0110", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0110---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                option.setFlags(1);
                let token = "option";
                let result = data.writeString(token);
                expect(result).assertTrue();
                expect(option.getFlags()).assertEqual(1);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    let replyReadResult = result.reply.readString();
                    expect(replyReadResult).assertEqual("option");
                    expect(option.getFlags()).assertEqual(1);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0110---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0120
        * @tc.name    : test Basic method of testing messageoption
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageOption_0120", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0120---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                option.setFlags(3);
                let token = "option";
                let result = data.writeString(token);
                expect(result).assertTrue();
                expect(option.getFlags()).assertEqual(3);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    let replyReadResult = result.reply.readString();
                    expect(replyReadResult).assertEqual("option");
                    expect(option.getFlags()).assertEqual(3);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0120---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0130
        * @tc.name    : test MessageOption sendMessageRequest test
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageOption_0130", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0130---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                option.setFlags(1);
                let token = "option";
                data.writeString(token);
                expect(option.getFlags()).assertEqual(1);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    let replyReadResult = result.reply.readString();
                    expect(replyReadResult).assertEqual("option");
                    expect(option.getFlags()).assertEqual(1);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0130---------------------------");
        })

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0140
         * @tc.name    : test MessageOption sendMessageRequest test
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 0
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageOption_0140", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0140---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = "option";
                data.writeString(token);
                let isAsyncData0 = option.isAsync();
                expect(isAsyncData0).assertEqual(false);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let isAsyncData = option.isAsync();
                    expect(isAsyncData).assertEqual(false);
                    let replyReadResult = result.reply.readString();
                    expect(replyReadResult).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0140---------------------------");
        })

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0150
         * @tc.name    : test MessageOption setAsync is true test
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_MessageOption_0150", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0150---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                option.setAsync(true);
                let token = "option";
                data.writeString(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let isAsyncData = option.isAsync();
                    expect(isAsyncData).assertTrue();
                    let replyReadResult = result.reply.readString();
                    expect(replyReadResult).assertEqual("option");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0150---------------------------");
        })


        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0160
        * @tc.name    : test setAsync is false sendMessageRequest test
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageOption_0160", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0160---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                option.setAsync(false);
                let token = "option";
                data.writeString(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    let isAsyncData = option.isAsync();
                    expect(isAsyncData).assertEqual(false);
                    let replyReadResult = result.reply.readString();
                    expect(replyReadResult).assertEqual(token);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0160---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_MessageOption_0170
        * @tc.name    : test setAsync sendMessageRequest test
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_MessageOption_0170", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_MessageOption_0170---------------------------");
            try {
                let option = new rpc.MessageOption();
                option.setAsync(3);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_MessageOption error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_MessageOption_0170---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0010
        * @tc.name    : test Exception parameter validation of the created anonymous shared memory object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0010", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0010---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", -1);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0010: ashmem " + ashmem);
                let ashmem2 = rpc.Ashmem.createAshmem(null, K);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0010: ashmem2 " + ashmem2);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0010---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0020
        * @tc.name    : test Call the getashmemsize interface to get the size of the shared memory object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0020", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0020---------------------------");
            try {
                let mapSize = 2 * G - 1;
                let jsash = "";
                for (let i = 0; i < (256 - 1); i++) {
                    jsash += "a";
                };
                let ashmem = rpc.Ashmem.createAshmem(jsash, mapSize);
                expect(ashmem != null).assertTrue();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0020---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0030
        * @tc.name    : test Call the getashmemsize interface to get the size of the shared memory object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0030", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0030---------------------------");
            try {
                let mapSize = 2 * G - 1;
                let jsash = '';
                for (let i = 0; i < 256; i++) {
                    jsash += 'a';
                }
                let ashmem = rpc.Ashmem.createAshmem(jsash, mapSize);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0030---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0040
        * @tc.name    : test Call the getashmemsize interface to get the size of the shared memory object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0040", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0040---------------------------");
            try {
                let mapSize = 2 * G - 1;
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", mapSize);
                let size = ashmem.getAshmemSize();
                expect(size).assertEqual(mapSize);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0040---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0050
        * @tc.name    : test Call the getashmemsize interface to get the size of the shared memory object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0050", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0050---------------------------");
            try {
                let mapSize = 2 * G;
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest ", mapSize);
                ashmem.getAshmemSize();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0050---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0060
        * @tc.name    : test Writeashmem exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0060", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0060---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                var data = rpc.MessageParcel.create();
                let writeAshmem = data.writeAshmem(ashmem);
                expect(writeAshmem).assertEqual(false);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0060---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0070
        * @tc.name    : test Readfromashmem exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0070", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0070---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096);
                ashmem.unmapAshmem();
                let bytes = [1, 2, 3, 4, 5];
                let ret = ashmem.readFromAshmem(bytes.length, 0);
                expect(ret == null).assertTrue();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0070---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0080
        * @tc.name    : test Mapashmem interface creates shared file mappings
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0080", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0080---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096);
                let result = ashmem.mapAshmem(rpc.Ashmem.PROT_READ);
                expect(result).assertTrue();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0080---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0090
        * @tc.name    : test Mapashmem exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0090", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0090---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", (2 * G - 1))
                let result = ashmem.mapAshmem(999);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0090---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0100
        * @tc.name    : test Mapreadandwriteashmem interface creates a shared file map with the protection level of read-write
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0100", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0100---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", K);
                let result = ashmem.mapReadAndWriteAshmem();
                expect(result).assertTrue();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0100---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0110
        * @tc.name    : test Mapreadandwriteashmem exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0110", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0110---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096);
                let result = ashmem.mapAshmem(rpc.Ashmem.PROT_READ);
                expect(result).assertTrue();
                ashmem.unmapAshmem();
                let result2 = ashmem.mapReadAndWriteAshmem();
                expect(result2).assertTrue();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0110---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0120
        * @tc.name    : test Mapreadonlyashmem interface creates a shared file map with the protection level of read-write
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0120", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0120---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096);
                let result = ashmem.mapReadOnlyAshmem();
                expect(result).assertTrue();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0120---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0130
        * @tc.name    : test Mapreadonlyashmem exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0130", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0130---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", K);
                let result = ashmem.mapAshmem(rpc.Ashmem.PROT_WRITE);
                expect(result).assertTrue();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                let result2 = ashmem.mapReadOnlyAshmem();
                expect(result2).assertEqual(false);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0130---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0140
        * @tc.name    : test Mapreadonlyashmem exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0140", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0140---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", K);
                let resultwrite = ashmem.setProtection(rpc.Ashmem.PROT_WRITE);
                expect(resultwrite).assertTrue();
                let resultread = ashmem.setProtection(rpc.Ashmem.PROT_READ);
                expect(resultread).assertEqual(false);
                let resultreadAndwrite = ashmem.mapReadAndWriteAshmem();
                expect(resultreadAndwrite).assertEqual(false);
                let resultnone = ashmem.setProtection(rpc.Ashmem.PROT_NONE);
                expect(resultnone).assertTrue();
                let resultread2 = ashmem.setProtection(rpc.Ashmem.PROT_READ);
                expect(resultread2).assertEqual(false);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0140---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0150
        * @tc.name    : test Setprotection exception input parameter verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0150", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0150---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", K);
                let result = ashmem.setProtection(3);
                expect(result).assertTrue();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0150---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0160
        * @tc.name    : test The writetoashmem interface writes the shared file associated with the object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0160", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0160---------------------------");
            try {
                let mapSize = 4096;
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", mapSize);
                let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
                expect(resultMapRAndW).assertTrue();
                let bytes = [1, 2, 3, 4, 5];
                let result = ashmem.writeToAshmem(bytes, bytes.length, 0);
                expect(result).assertTrue();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0160---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0170
        * @tc.name    : test The writetoashmem interface writes the shared file associated with the object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0170", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0170---------------------------");
            try {
                let mapSize = 4096;
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", mapSize);
                let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
                expect(resultMapRAndW).assertTrue();
                let bytes = [-2147483648, 2147483647];
                let result = ashmem.writeToAshmem(bytes, bytes.length, 0);
                expect(result).assertTrue();
                let reresult = ashmem.readFromAshmem(bytes.length, 0);
                for (let i = 0; i < reresult.length; i++) {
                    expect(reresult[i]).assertEqual(bytes[i]);
                }
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0170---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0180
        * @tc.name    : test The writetoashmem interface writes the shared file associated with the object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0180", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0180---------------------------");
            try {
                let mapSize = 4096;
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", mapSize);
                let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
                expect(resultMapRAndW).assertTrue();
                let bytes = [-2147483649, 2147483647];
                let result = ashmem.writeToAshmem(bytes, bytes.length, 0);
                expect(result).assertTrue();
                let readresult = ashmem.readFromAshmem(bytes.length, 0);
                expect(readresult[0]).assertEqual(2147483647);
                expect(readresult[1]).assertEqual(bytes[1]);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0180---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0190
        * @tc.name    : test The writetoashmem interface writes the shared file associated with the object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0190", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0190---------------------------");
            try {
                let mapSize = 4096;
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", mapSize);
                let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
                expect(resultMapRAndW).assertTrue();
                let bytes = [-2147483648, 2147483648];
                let result = ashmem.writeToAshmem(bytes, bytes.length, 0);
                expect(result).assertTrue();
                let reresult = ashmem.readFromAshmem(bytes.length, 0);
                expect(reresult[0]).assertEqual(bytes[0]);
                expect(reresult[1]).assertEqual(-2147483648);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0190---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0200
        * @tc.name    : test The writetoashmem interface writes the shared file associated with the object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0200", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0200---------------------------");
            try {
                let mapSize = 2 * M;
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", mapSize);
                let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
                expect(resultMapRAndW).assertTrue();
                let bytes = [0, 1];
                let result = ashmem.writeToAshmem(bytes, bytes.length, 2147483647 / 4);
                expect(result).assertEqual(false);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0200---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0210
        * @tc.name    : test The writetoashmem interface writes the shared file associated with the object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0210", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0210---------------------------");
            try {
                let mapSize = 2 * M;
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", mapSize);
                let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
                expect(resultMapRAndW).assertTrue();
                let bytes = [0, 1];
                let result = ashmem.writeToAshmem(bytes, bytes.length, 2147483648 / 4);
                expect(result).assertEqual(false);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0210---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0220
        * @tc.name    : test The writetoashmem interface writes the shared file associated with the object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0220", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0220---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096);
                let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
                expect(resultMapRAndW).assertTrue();
                let bytes = [1, 2, 3, 4, 5];
                let result = ashmem.writeToAshmem(bytes, bytes.length, 0);
                expect(result).assertTrue();
                let resultread = ashmem.setProtection(rpc.Ashmem.PROT_READ);
                expect(resultread).assertTrue();
                let result2 = ashmem.writeToAshmem(bytes, bytes.length, 0);
                expect(result2).assertEqual(false);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0220---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0230
        * @tc.name    : test Writetoashmem exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0230", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0230---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096);
                let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
                expect(resultMapRAndW).assertTrue();
                let bytes = [1, 2, 3, 4, 5];
                let size = bytes.length + 10;
                let result = ashmem.writeToAshmem(bytes, 3, 0);
                expect(result).assertTrue();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0230---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0240
        * @tc.name    : test Read data from the shared file associated with readfromashmem
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0240", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0240---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096);
                let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
                expect(resultMapRAndW).assertTrue();
                let bytes = [1, 2, 3, 4, 5];
                let result = ashmem.writeToAshmem(bytes, bytes.length, 0);
                expect(result).assertTrue();
                let resultRead = ashmem.readFromAshmem(bytes.length, 0);
                for (let i = 0; i < resultRead.length; i++) {
                    expect(resultRead[i]).assertEqual(bytes[i]);
                }
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0240---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0250
        * @tc.name    : test Readfromashmem exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0250", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0250---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096);
                let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
                expect(resultMapRAndW).assertTrue();
                let bytes = [1, 2, 3, 4, 5];
                let result = ashmem.writeToAshmem(bytes, bytes.length, 1);
                expect(result).assertTrue();
                let result2 = ashmem.readFromAshmem(bytes.length, 3);
                expect(bytes[2]).assertEqual(result2[0]);
                expect(bytes[3]).assertEqual(result2[1]);
                expect(bytes[4]).assertEqual(result2[2]);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0250---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0260
        * @tc.name    : test Createashmemfromexisting copies the ashmem object description and creates a new object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0260", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0260---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096);
                let resultWriteAndRead = ashmem.mapReadAndWriteAshmem();
                expect(resultWriteAndRead).assertTrue();
                let bytes = [1, 2, 3];
                let result = ashmem.writeToAshmem(bytes, bytes.length, 1);
                expect(result).assertTrue()
                let newashmem = rpc.Ashmem.createAshmemFromExisting(ashmem);
                let resultWriteAndRead2 = newashmem.mapReadAndWriteAshmem();
                expect(resultWriteAndRead2).assertTrue();
                let result2 = newashmem.readFromAshmem(bytes.length, 1);
                expect(result).assertTrue();
                for (let i = 0; i < result2.length; i++) {
                    expect(result2[i]).assertEqual(bytes[i]);
                }
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                newashmem.unmapAshmem();
                newashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0260---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0270
        * @tc.name    : test Create a shared memory object and call writeashmem to write the shared anonymous
        object into the messageparcel object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0270", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0270---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", K);
                var data = rpc.MessageParcel.create();
                let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
                expect(resultMapRAndW).assertTrue();
                let bytes = [1, 2, 3];
                let result = ashmem.writeToAshmem(bytes, bytes.length, 1);
                expect(result).assertTrue();
                let result2 = data.writeAshmem(ashmem);
                expect(result2).assertTrue();
                let retReadAshmem = data.readAshmem();
                let retBytes = retReadAshmem.readFromAshmem(bytes.length, 1);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0270: run readFromAshmem result is " + retBytes);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0270---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0280
        * @tc.name    : test Create a non shared memory object and call writeashmem to write the messageparcel object
        object into the messageparcel object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0280", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0280---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var data2 = rpc.MessageParcel.create();
                data.writeAshmem(data2);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
                data2.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0280---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0290
        * @tc.name    : test Create a non shared memory object and call writeashmem to write the messageparcel object
        object into the messageparcel object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0290", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0290---------------------------");
            try {
                let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", K);
                let resultwrite = ashmem.setProtection(rpc.Ashmem.PROT_EXEC);
                expect(resultwrite).assertTrue();
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0290---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0300
        * @tc.name    : test mapTypedAshmem interface creates shared file mappings
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0300", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0300---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("JsAshmemTest", 4 * K);
                let result = ashmem.mapTypedAshmem(ashmem.PROT_READ | ashmem.PROT_WRITE);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0300: run mapTypedAshmem is success" + result);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0300---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0310
        * @tc.name    : test mapTypedAshmem exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0310", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0310---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("JsAshmemTest", (2 * G - 1))
                ashmem.mapTypedAshmem(999);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0310: run mapTypedAshmem is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error.code == 401).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0310---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0320
        * @tc.name    : test mapTypedAshmem exception errorcode validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0320", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0320---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("JsAshmemTest", (2 * G))
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0320: ashmem " + ashmem);
                let result = ashmem.mapTypedAshmem(ashmem.PROT_READ | ashmem.PROT_WRITE);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0320: run mapTypedAshmem is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0320---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0330
        * @tc.name    : test mapReadWriteAshmem interface creates a shared file map with the protection level of read-write
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0330", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0330---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("JsAshmemTest", K);
                ashmem.mapReadWriteAshmem();
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0330: run mapReadWriteAshmem is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0330---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0340
        * @tc.name    : test mapReadWriteAshmem exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0340", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0340---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("JsAshmemTest", 4096);
                ashmem.mapTypedAshmem(rpc.Ashmem.PROT_READ);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0340: run mapTypedAshmem is success");
                ashmem.unmapAshmem();
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0340: run unmapAshmem success");
                ashmem.mapReadWriteAshmem();
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0340: run mapReadWriteAshmem is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0340---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0350
        * @tc.name    : test Mapreadonlyashmem interface creates a shared file map with the protection level of read-write
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0350", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0350---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("JsAshmemTest", 4096);
                ashmem.mapReadonlyAshmem();
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0350: run mapReadonlyAshmem is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0350---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0360
        * @tc.name    : test mapReadWriteAshmem exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0360", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0360---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("JsAshmemTest", K);
                ashmem.setProtectionType(rpc.Ashmem.PROT_WRITE);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0360: run setProtectionType is success");
                ashmem.setProtectionType(rpc.Ashmem.PROT_READ);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0360: run setProtectionType is success");
                ashmem.mapReadWriteAshmem();
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0360: run mapReadWriteAshmem success");
                ashmem.setProtectionType(rpc.Ashmem.PROT_NONE);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0360: run setProtectionType is success");
                ashmem.setProtectionType(rpc.Ashmem.PROT_READ);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0360: run setProtectionType is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0360---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0370
        * @tc.name    : test setProtectionType exception input parameter verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0370", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0370---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("JsAshmemTest", K);
                ashmem.setProtectionType(3);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0370: run setProtectionType is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0370---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0380
        * @tc.name    : test The writetoashmem interface writes the shared file associated with the object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0380", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0380---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("JsAshmemTest", 4096);
                ashmem.mapReadWriteAshmem();
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0380: run mapReadWriteAshmem is success");
                let bytes = [1, 2, 3, 4, 5];
                let result = ashmem.writeToAshmem(bytes, bytes.length, 0);
                expect(result).assertTrue();
                ashmem.setProtectionType(rpc.Ashmem.PROT_READ);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0380: run setProtectionType is success");
                let result2 = ashmem.writeToAshmem(bytes, bytes.length, 0);
                expect(result2).assertEqual(false);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0380---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0390
        * @tc.name    : test Create a non shared memory object and call setProtectionType to write the messageparcel object
        *               object into the messageparcel object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0390", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0390---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("JsAshmemTest", K);
                ashmem.setProtectionType(rpc.Ashmem.PROT_EXEC);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0390: run setProtectioniswrite is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0390---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0400
        * @tc.name    : test Mapreadonlyashmem exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0400", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0400---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("JsAshmemTest", K);
                ashmem.mapTypedAshmem(rpc.Ashmem.PROT_WRITE);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0400: run mapTypedAshmem is success");
                ashmem.unmapAshmem();
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0400: run unmapAshmem success");
                ashmem.closeAshmem();
                ashmem.mapReadonlyAshmem();
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0400: run mapReadonlyAshmem is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_040---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0410
        * @tc.name    : test create is errorcode 401 exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0410", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0410---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("ashmem", (2 * G + 1));
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0410: ashmem " + ashmem);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0410---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0420
        * @tc.name    : test mapReadWriteAshmem exception validation 1900001
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0420", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0420---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("ashmem", (4 * G - 1));
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0420: ashmem " + ashmem);
                ashmem.mapReadWriteAshmem();
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0420: run mapReadWriteAshmem is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                let errCode = `${rpc.ErrorCode.OS_MMAP_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0420---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0430
        * @tc.name    : test create 401  exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0430", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0430---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("ashmem", 0);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0430: ashmem " + ashmem);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0430---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0440
        * @tc.name    : test setProtectionType exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0440", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0440---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
                ashmem.setProtectionType(0);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0440: run setProtectionType is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error == null).assertTrue();
                expect(error).assertEqual(null);
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0440---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0450
        * @tc.name    : test 401 exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0450", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0450---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
                ashmem.setProtectionType(rpc.Ashmem.PROT_WRITE, rpc.Ashmem.PROT_READ);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0450: run setProtectionType is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0450---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0460
        * @tc.name    : test setProtectionType is 1900002 exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0460", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0460---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
                ashmem.setProtectionType(null);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0460: run setProtectionType is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                let errCode = `${rpc.ErrorCode.OS_IOCTL_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0460---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0470
        * @tc.name    : test writeAshmem errCode 1900003 exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0470", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0470---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var data2 = rpc.MessageSequence.create();
                data.writeAshmem(data2);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0470: run writeAshmemis is ");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error.code != 1900003).assertTrue();
                expect(error != null).assertTrue();
            } finally {
                data.reclaim();
                data2.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0470---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0480
        * @tc.name    : test readAshmem exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0480", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0480---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("ashmem", 1024);
                ashmem.mapReadWriteAshmem();
                let ByteArraylet = [1, 2, 3, 4, 5];
                ashmem.writeAshmem(ByteArraylet, 5, 0);
                let readResult = ashmem.readAshmem(5, 0);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                expect(error.code != 1900004).assertEqual(null);
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0480---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0490
        * @tc.name    : test Call the getashmemsize interface to get the size of the shared memory object
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3 
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0490", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0490---------------------------");
            try {
                let mapSize = 2 * G;
                let ashmem = rpc.Ashmem.create("JsAshmemTest ", mapSize);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0490: run  create success " + ashmem);
                let size = ashmem.getAshmemSize();
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0490: run getAshmemSize success, size is " + size);
                expect(size).assertEqual(mapSize);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0490---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0500
        * @tc.name    : test mapTypedAshmem errorcode 401 exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0500", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0500---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("JsAshmemTest", (2 * G - 1));
                let result = ashmem.mapTypedAshmem(999);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0500: run mapAshmemis is " + result);
                expect(result).assertEqual(false);
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
                expect(error.code == errCode).assertTrue();
                expect(error != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0500---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0510
        * @tc.name    : test mapTypedAshmem exception validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3 
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0510", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0510---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("JsAshmemTest", (2 * G - 1));
                let result = ashmem.mapTypedAshmem(999);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0510: run mapTypedAshmem is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                let errCode = `${rpc.ErrorCode.OS_MMAP_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0510---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_Ashmem_0520
        * @tc.name    : test mapTypedAshmem exception errorcode validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_Ashmem_0520", 0, function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_Ashmem_0520---------------------------");
            try {
                let ashmem = rpc.Ashmem.create("JsAshmemTest", (2 * G - 1));
                let result = ashmem.mapTypedAshmem(ashmem.PROT_READ | ashmem.PROT_WRITE);
                console.info("SUB_DSoftbus_IPC_API_Ashmem_0520: run mapTypedAshmem is success");
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
                let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_Ashmem_0520---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IRemoteObject_0010
        * @tc.name    : test Call sendrequestresult interface to send data
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IRemoteObject_0010", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IRemoteObject_0010---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let sequenceable = new MySequenceable(1, "aaa");
                let result = data.writeSequenceable(sequenceable);
                expect(result).assertTrue();
                await gIRemoteObject.sendRequest(CODE_WRITESEQUENCEABLE, data, reply, option).then((result) => {
                    expect(result.errCode == 0).assertTrue();
                    let ret = new MySequenceable(0, "");
                    let shortArryDataReply = result.reply.readSequenceable(ret);
                    expect(shortArryDataReply == true).assertTrue();
                    expect(ret.num).assertEqual(1);
                    expect(ret.str).assertEqual("aaa");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IRemoteObject_0010---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IRemoteObject_0020
        * @tc.name    : test Test that messageparcel passes through the same process, and the client
        *             receives the reply message in promise
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IRemoteObject_0020", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IRemoteObject_0020---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                expect(data.writeByte(1)).assertTrue();
                expect(data.writeShort(2)).assertTrue();
                expect(data.writeInt(3)).assertTrue();
                expect(data.writeLong(10000)).assertTrue();
                expect(data.writeFloat(1.2)).assertTrue();
                expect(data.writeDouble(10.2)).assertTrue();
                expect(data.writeBoolean(true)).assertTrue();
                expect(data.writeChar(5)).assertTrue();
                expect(data.writeString("HelloWorld")).assertTrue();
                expect(data.writeSequenceable(new MySequenceable(1, "aaa"))).assertTrue();
                await gIRemoteObject.sendRequest(CODE_ALL_TYPE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readByte()).assertEqual(1);
                    expect(result.reply.readShort()).assertEqual(2);
                    expect(result.reply.readInt()).assertEqual(3);
                    expect(result.reply.readLong()).assertEqual(10000);
                    expect(result.reply.readFloat()).assertEqual(1.2);
                    expect(result.reply.readDouble()).assertEqual(10.2);
                    expect(result.reply.readBoolean()).assertTrue();
                    expect(result.reply.readChar()).assertEqual(5);
                    expect(result.reply.readString()).assertEqual("HelloWorld");
                    let s = new MySequenceable(0, '');
                    expect(result.reply.readSequenceable(s)).assertTrue();
                    expect(s.num).assertEqual(1);
                    expect(s.str).assertEqual("aaa");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IRemoteObject_0020---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IRemoteObject_0030
        * @tc.name    : test Test that messageparcel passes through the same process, and the client
        *             receives the reply message in the callback function
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IRemoteObject_0030", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IRemoteObject_0030---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                expect(data.writeByte(2)).assertTrue();
                expect(data.writeShort(3)).assertTrue();
                expect(data.writeInt(4)).assertTrue();
                expect(data.writeLong(5)).assertTrue();
                expect(data.writeFloat(1.2)).assertTrue();
                expect(data.writeDouble(10.2)).assertTrue();
                expect(data.writeBoolean(true)).assertTrue();
                expect(data.writeChar(5)).assertTrue();
                expect(data.writeString("HelloWorld")).assertTrue();
                expect(data.writeSequenceable(new MySequenceable(1, "aaa"))).assertTrue();
                function sendRequestCallback(result) {
                    try {
                        console.info("sendRequest Callback");
                        console.info("sendRequest done, error code: " + result.errCode);
                        expect(result.errCode).assertEqual(0);
                        expect(result.reply.readByte()).assertEqual(2);
                        expect(result.reply.readShort()).assertEqual(3);
                        expect(result.reply.readInt()).assertEqual(4);
                        expect(result.reply.readLong()).assertEqual(5);
                        expect(result.reply.readFloat()).assertEqual(1.2);
                        expect(result.reply.readDouble()).assertEqual(10.2);
                        expect(result.reply.readBoolean()).assertTrue();
                        expect(result.reply.readChar()).assertEqual(5);
                        expect(result.reply.readString()).assertEqual("HelloWorld");
                        let s = new MySequenceable(null, null);
                        expect(result.reply.readSequenceable(s)).assertTrue();
                        expect(s.num).assertEqual(1);
                        expect(s.str).assertEqual("aaa");
                    } finally {
                        data.reclaim();
                        reply.reclaim();
                        console.info("test done");
                        done();
                    }
                }
                console.info("start send request");
                await gIRemoteObject.sendRequest(CODE_ALL_TYPE, data, reply, option, sendRequestCallback);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IRemoteObject_0030---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IRemoteObject_0040
        * @tc.name    : test Iremoteobject, register death notification verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IRemoteObject_0040", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IRemoteObject_0040---------------------------");
            try {
                let object = new TestAbilityStub("Test1");
                let resultAdd1 = object.addDeathRecipient(null, 0);
                expect(resultAdd1 == false).assertTrue();
                let resultRemove1 = object.removeDeathRecipient(null, 0);
                expect(resultRemove1 == false).assertTrue();
                let isDead = object.isObjectDead();
                expect(isDead == false).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IRemoteObject_0040---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IRemoteObject_0050
        * @tc.name    : test Do not get the server agent, do not create a remoteobject instance, and directly getcallingpid,
        *             getcallingpid, getcallingdeviceid, getlocaldeviceid
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IRemoteObject_0050", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IRemoteObject_0050---------------------------");
            try {
                let callingPid = rpc.IPCSkeleton.getCallingPid();
                expect(callingPid != null).assertTrue();
                let callingUid = rpc.IPCSkeleton.getCallingUid();
                expect(callingUid != null).assertTrue();
                let callingDeviceID = rpc.IPCSkeleton.getCallingDeviceID();
                expect(callingDeviceID == "").assertTrue();
                let localDeviceID = rpc.IPCSkeleton.getLocalDeviceID();
                expect(localDeviceID == "").assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IRemoteObject_0050---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IRemoteObject_0060
        * @tc.name    : test Querylocalinterface searches for objects based on descriptors
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IRemoteObject_0060", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IRemoteObject_0060---------------------------");
            try {
                let object = new TestAbilityStub("Test1");
                let result = object.isObjectDead();
                expect(result == false).assertTrue();
                let callingPid = object.getCallingPid();
                expect(callingPid != null).assertTrue();
                let callingUid = object.getCallingUid();
                expect(callingUid != null).assertTrue();
                object.attachLocalInterface(object, "Test1");
                let res = object.queryLocalInterface("Test1");
                expect(res != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IRemoteObject_0060---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IRemoteObject_0070
        * @tc.name    : test Getinterfacedescriptor to get the interface description
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IRemoteObject_0070", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IRemoteObject_0070---------------------------");
            try {
                let object = new TestAbilityStub("Test1223");
                let result = object.isObjectDead();
                expect(result == false).assertTrue();
                let callingPid = object.getCallingPid();
                expect(callingPid != null).assertTrue();
                let callingUid = object.getCallingUid();
                expect(callingUid != null).assertTrue();
                object.attachLocalInterface(object, "test1");
                let result2 = object.getInterfaceDescriptor();
                expect(result2 != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IRemoteObject_0070---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IRemoteObject_0080
        * @tc.name    : test Test that messageparcel passes through the same process, and the client
        *             receives the reply message in the callback function
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IRemoteObject_0080", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IRemoteObject_0080---------------------------");
            try {
                let object = new TestAbilityStub("TestAbilityStub");
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                expect(data.writeInterfaceToken("TestAbilityStub")).assertTrue();
                expect(data.writeByte(2)).assertTrue();
                expect(data.writeShort(3)).assertTrue();
                expect(data.writeInt(4)).assertTrue();
                expect(data.writeLong(5)).assertTrue();
                expect(data.writeFloat(1.2)).assertTrue();
                expect(data.writeDouble(10.2)).assertTrue();
                expect(data.writeBoolean(true)).assertTrue();
                expect(data.writeChar(5)).assertTrue();
                expect(data.writeString("HelloWorld")).assertTrue();
                expect(data.writeSequenceable(new MySequenceable(1, "aaa"))).assertTrue();
                function sendRequestCallback(result) {
                    try {
                        console.info("sendRequest Callback");
                        console.info("sendRequest done, error code: " + result.errCode);
                        expect(result.errCode).assertEqual(0);
                        result.reply.readException();
                        expect(result.reply.readByte()).assertEqual(2);
                        expect(result.reply.readShort()).assertEqual(3);
                        expect(result.reply.readInt()).assertEqual(4);
                        expect(result.reply.readLong()).assertEqual(5);
                        expect(result.reply.readFloat()).assertEqual(1.2);
                        expect(result.reply.readDouble()).assertEqual(10.2);
                        expect(result.reply.readBoolean()).assertTrue();
                        expect(result.reply.readChar()).assertEqual(5);
                        expect(result.reply.readString()).assertEqual("HelloWorld");
                        let s = new MySequenceable(null, null);
                        expect(result.reply.readSequenceable(s)).assertTrue();
                        expect(s.num).assertEqual(1);
                        expect(s.str).assertEqual("aaa");
                    } finally {
                        data.reclaim();
                        reply.reclaim();
                        console.info("test done");
                        done();
                    }
                }
                console.info("start send request");
                object.sendRequest(CODE_SAME_PROCESS, data, reply, option, sendRequestCallback);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IRemoteObject_0080---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IRemoteObject_0090
        * @tc.name    : test IRemoteObject sendMessageRequest API Test
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IRemoteObject_0090", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IRemoteObject_0090---------------------------");
            try {
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeByte(1);
                data.writeShort(2);
                data.writeInt(3);
                data.writeLong(10000);
                data.writeFloat(1.2);
                data.writeDouble(10.2);
                data.writeBoolean(true);
                data.writeChar(96);
                data.writeString("HelloWorld");
                data.writeParcelable(new MySequenceable(1, "aaa"));
                await gIRemoteObject.sendMessageRequest(CODE_ALL_TYPE, data, reply, option).then((result) => {
                    console.info("SUB_DSoftbus_IPC_API_IRemoteObject_0090 errorcode: " + result.errCode);
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readByte()).assertEqual(1);
                    expect(result.reply.readShort()).assertEqual(2);
                    expect(result.reply.readInt()).assertEqual(3);
                    expect(result.reply.readLong()).assertEqual(10000);
                    expect(result.reply.readFloat()).assertEqual(1.2);
                    expect(result.reply.readDouble()).assertEqual(10.2);
                    expect(result.reply.readBoolean()).assertTrue();
                    expect(result.reply.readChar()).assertEqual(96);
                    expect(result.reply.readString()).assertEqual("HelloWorld");
                    let s = new MySequenceable(0, '');
                    expect(result.reply.readParcelable(s)).assertTrue();
                    expect(s.num).assertEqual(1);
                    expect(s.str).assertEqual("aaa");
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IRemoteObject_0090---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IRemoteObject_0100
        * @tc.name    : test getDescriptor to get the interface description
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IRemoteObject_0100", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IRemoteObject_0100---------------------------");
            try {
                let object = new TestAbilityMessageStub("Test1223");
                let result = object.isObjectDead();
                expect(result == false).assertTrue();
                let callingPid = object.getCallingPid();
                expect(callingPid != null).assertTrue();
                let callingUid = object.getCallingUid();
                expect(callingUid != null).assertTrue();
                object.modifyLocalInterface(object, "test1");
                let result2 = object.getDescriptor();
                expect(result2 != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IRemoteObject_0100---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IRemoteObject_0110
        * @tc.name    : test Test that MessageSequence passes through the same process, and the client
        *             receives the reply message in the callback function
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IRemoteObject_0110", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IRemoteObject_0110---------------------------");
            try {
                let object = new TestAbilityMessageStub("TestAbilityMessageStub");
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeInterfaceToken("TestAbilityMessageStub");
                data.writeByte(2);
                data.writeShort(3);
                data.writeInt(4);
                data.writeLong(5);
                data.writeFloat(1.2);
                data.writeDouble(10.2);
                data.writeBoolean(true);
                data.writeChar(5);
                data.writeString("HelloWorld");
                data.writeParcelable(new MySequenceable(1, "aaa"));
                console.info("data is success");
                function sendRequestCallback(result) {
                    try {
                        console.info("sendRequest Callback");
                        console.info("sendRequest done, error code: " + result.errCode);
                        expect(result.errCode).assertEqual(0);
                        result.reply.readException();
                        expect(result.reply.readByte()).assertEqual(2);
                        expect(result.reply.readShort()).assertEqual(3);
                        expect(result.reply.readInt()).assertEqual(4);
                        expect(result.reply.readLong()).assertEqual(5);
                        expect(result.reply.readFloat()).assertEqual(1.2);
                        expect(result.reply.readDouble()).assertEqual(10.2);
                        expect(result.reply.readBoolean()).assertTrue();
                        expect(result.reply.readChar()).assertEqual(5);
                        expect(result.reply.readString()).assertEqual("HelloWorld");
                        let s = new MySequenceable(null, null);
                        expect(result.reply.readParcelable(s)).assertTrue();
                        expect(s.num).assertEqual(1);
                        expect(s.str).assertEqual("aaa");
                    } finally {
                        data.reclaim();
                        reply.reclaim();
                        console.info("test done");
                        done();
                    };
                };
                console.info("start send request");
                object.sendMessageRequest(CODE_SAME_PROCESS, data, reply, option, sendRequestCallback);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IRemoteObject_0110---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IRemoteObject_0120
        * @tc.name    : test Iremoteobject, register death notification verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IRemoteObject_0120", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IRemoteObject_0120---------------------------");
            try {
                let recipient = new MyregisterDeathRecipient(gIRemoteObject, null);
                gIRemoteObject.registerDeathRecipient(recipient, 0)
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject_0120:run registerDeathRecipient is done");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject error is:" + error);
                expect(error != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IRemoteObject_0120---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IRemoteObject_0130
        * @tc.name    : test Iremoteobject, register death notification verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IRemoteObject_0130", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IRemoteObject_0130---------------------------");
            try {
                let recipient = new MyregisterDeathRecipient(gIRemoteObject, null);
                gIRemoteObject.registerDeathRecipient(recipient, 0);
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject_0130:run registerDeathRecipient is done");
                gIRemoteObject.unregisterDeathRecipient(recipient, 0);
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject_0130:run unregisterDeathRecipient is done");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IRemoteObject error is:" + error);
                expect(error != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IRemoteObject_0130---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_0100
        * @tc.name    : test Call adddeathrecipient to register the death notification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_0100", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_0100---------------------------");
            try {
                let recipient = new MyDeathRecipient(gIRemoteObject, null);
                let resultAdd1 = gIRemoteObject.addDeathRecipient(recipient, 0);
                expect(resultAdd1 == false).assertTrue();
                let resultAdd2 = gIRemoteObject.addDeathRecipient(recipient, 0);
                expect(resultAdd2 == false).assertTrue();
                let resultRemove1 = gIRemoteObject.removeDeathRecipient(recipient, 0);
                expect(resultRemove1 == false).assertTrue();
                let resultRemove2 = gIRemoteObject.removeDeathRecipient(recipient, 0);
                expect(resultRemove2 == false).assertTrue();
                let resultRemove3 = gIRemoteObject.removeDeathRecipient(recipient, 0);
                expect(resultRemove3 == false).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_0100---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_0200
        * @tc.name    : test AddDeathRecipient Validates the interface flags input parameter boundary value
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_0200", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_0200---------------------------");
            try {
                let recipient = new MyDeathRecipient(gIRemoteObject, null);
                let resultAdd = gIRemoteObject.addDeathRecipient(recipient, -(2 * G));
                expect(resultAdd == false).assertTrue();
                let resultRemove = gIRemoteObject.removeDeathRecipient(recipient, -(2 * G));
                expect(resultRemove == false).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_0200---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_0300
        * @tc.name    : test AddDeathRecipient Validates the interface flags input parameter boundary value
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_0300", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_0300---------------------------");
            try {
                let recipient = new MyDeathRecipient(gIRemoteObject, null);
                let resultAdd = gIRemoteObject.addDeathRecipient(recipient, (2 * G - 1));
                expect(resultAdd == false).assertTrue();
                let resultRemove = gIRemoteObject.removeDeathRecipient(recipient, (2 * G - 1));
                expect(resultRemove == false).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_0300---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_0400
        * @tc.name    : test AddDeathRecipient Validates the interface flags input parameter boundary value
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_0400", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_0400---------------------------");
            try {
                let recipient = new MyDeathRecipient(gIRemoteObject, null);
                let resultAdd = gIRemoteObject.addDeathRecipient(recipient, 2 * G);
                expect(resultAdd == false).assertTrue();
                let resultRemove = gIRemoteObject.removeDeathRecipient(recipient, 2 * G);
                expect(resultRemove == false).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_0400---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_0500
        * @tc.name    : test AddDeathRecipient Validates the interface flags input parameter boundary value
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_0500", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_0500---------------------------");
            try {
                let recipient = new MyDeathRecipient(gIRemoteObject, null);
                let resultAdd = gIRemoteObject.addDeathRecipient(recipient, -(2 * G + 1));
                expect(resultAdd == false).assertTrue();
                let resultRemove = gIRemoteObject.removeDeathRecipient(recipient, -(2 * G + 1));
                expect(resultRemove == false).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_0500---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_0600
        * @tc.name    : test Call isobjectdead to check whether the object is dead
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_0600", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_0600---------------------------");
            try {
                let recipient = new MyDeathRecipient(gIRemoteObject, null);
                let isDead = gIRemoteObject.isObjectDead();
                expect(isDead == false).assertTrue();
                let resultAdd1 = gIRemoteObject.addDeathRecipient(recipient, 0);
                expect(resultAdd1 == false).assertTrue();
                let isDead1 = gIRemoteObject.isObjectDead();
                expect(isDead1 == false).assertTrue();
                let resultRemove1 = gIRemoteObject.removeDeathRecipient(recipient, 0);
                expect(resultRemove1 == false).assertTrue();
                let resultAdd2 = gIRemoteObject.addDeathRecipient(recipient, 0);
                expect(resultAdd2 == false).assertTrue();
                let resultRemove2 = gIRemoteObject.removeDeathRecipient(recipient, 0);
                expect(resultRemove2 == false).assertTrue();
                let resultRemove3 = gIRemoteObject.removeDeathRecipient(recipient, 0);
                expect(resultRemove3 == false).assertTrue();
                let isDead2 = gIRemoteObject.isObjectDead();
                expect(isDead2 == false).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_0600---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_0700
        * @tc.name    : test Getinterfacedescriptor to get the object interface description
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_0700", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_0700---------------------------");
            try {
                let object = new TestAbilityStub("Test030");
                let result = object.getInterfaceDescriptor();
                expect(result).assertEqual("Test030");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_0700---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_0800
        * @tc.name    : test Querylocalinterface searches for objects based on descriptors
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_0800", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_0800---------------------------");
            try {
                let object = new TestAbilityStub("Test040");
                let result = object.isObjectDead();
                expect(result).assertEqual(false);
                object.attachLocalInterface(object, "Test2");
                let res2 = object.queryLocalInterface('Test2');
                expect(res2 != null).assertTrue();
                let resultDescrip = object.getInterfaceDescriptor();
                expect(resultDescrip != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_0800---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_0900
        * @tc.name    : test Transaction constant validation
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_0900", 0, async function () {
            console.info("---------------------SUB_DSoftbus_IPC_API_RemoteProxy_0900 is starting-----------------");
            try {
                expect(rpc.RemoteProxy.PING_TRANSACTION).assertEqual(1599098439);
                expect(rpc.RemoteProxy.DUMP_TRANSACTION).assertEqual(1598311760);
                expect(rpc.RemoteProxy.INTERFACE_TRANSACTION).assertEqual(1598968902);
                expect(rpc.RemoteProxy.MIN_TRANSACTION_ID).assertEqual(0x1);
                expect(rpc.RemoteProxy.MAX_TRANSACTION_ID).assertEqual(0x00FFFFFF);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_0090---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_1000
        * @tc.name    : test Call isobjectdead to check whether the object is dead
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_1000", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_1000---------------------------");
            try {
                let recipient = new MyregisterDeathRecipient(gIRemoteObject, null);
                let isDead = gIRemoteObject.isObjectDead();
                expect(isDead == false).assertTrue();
                gIRemoteObject.registerDeathRecipient(recipient, 0);
                let isDead1 = gIRemoteObject.isObjectDead();
                expect(isDead1 == false).assertTrue();
                gIRemoteObject.unregisterDeathRecipient(recipient, 0);
                gIRemoteObject.registerDeathRecipient(recipient, 0);
                gIRemoteObject.unregisterDeathRecipient(recipient, 0);
                gIRemoteObject.unregisterDeathRecipient(recipient, 0);
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy_1000: unregisterDeathRecipient is success");
                let isDead2 = gIRemoteObject.isObjectDead();
                expect(isDead2 == false).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_1000---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_1100
        * @tc.name    : test getDescriptor to get the object interface description
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_1100", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_1100---------------------------");
            try {
                let object = new TestAbilityStub("Test0300");
                let result = object.getDescriptor();
                expect(result).assertEqual("Test0300");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_1100---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_1200
        * @tc.name    : test getLocalInterface searches for objects based on descriptors
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_1200", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_1200---------------------------");
            try {
                let object = new TestAbilityStub("Test0400");
                let result = object.isObjectDead();
                expect(result).assertEqual(false);
                object.modifyLocalInterface(object, "Test2");
                let res2 = object.getLocalInterface('Test2');
                expect(res2 != null).assertTrue();
                let resultDescrip = object.getDescriptor();
                expect(resultDescrip != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_1200---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_1300
        * @tc.name    : test Call registerDeathRecipient to register the death notification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_1300", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_1300---------------------------");
            try {
                let recipient = new MyregisterDeathRecipient(gIRemoteObject, null);
                gIRemoteObject.registerDeathRecipient(recipient, 0);
                gIRemoteObject.registerDeathRecipient(recipient, 0);
                gIRemoteObject.unregisterDeathRecipient(recipient, 0);
                gIRemoteObject.unregisterDeathRecipient(recipient, 0);
                gIRemoteObject.unregisterDeathRecipient(recipient, 0);
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy_1300: unregisterDeathRecipient is success");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_1300---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_1400
        * @tc.name    : test registerDeathRecipient Validates the interface flags input parameter boundary value
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_1400", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_1400---------------------------");
            try {
                let recipient = new MyregisterDeathRecipient(gIRemoteObject, null);
                gIRemoteObject.registerDeathRecipient(recipient, -(2 * G));
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy_1400: registerDeathRecipient is success");
                gIRemoteObject.unregisterDeathRecipient(recipient, -(2 * G));
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy_1400: unregisterDeathRecipient is success");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_1400---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_1500
        * @tc.name    : test registerDeathRecipient Validates the interface flags input parameter boundary value
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_1500", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_1500---------------------------");
            try {
                let recipient = new MyregisterDeathRecipient(gIRemoteObject, null);
                gIRemoteObject.registerDeathRecipient(recipient, (2 * G - 1));
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy_1500: registerDeathRecipient is success");
                gIRemoteObject.unregisterDeathRecipient(recipient, (2 * G - 1));
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy_1500: unregisterDeathRecipient is success");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_1500---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_1600
        * @tc.name    : test registerDeathRecipient Validates the interface flags input parameter boundary value
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_1600", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_1600---------------------------");
            try {
                let recipient = new MyregisterDeathRecipient(gIRemoteObject, null);
                gIRemoteObject.registerDeathRecipient(recipient, 2 * G);
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy_1600: registerDeathRecipient is success");
                gIRemoteObject.unregisterDeathRecipient(recipient, 2 * G);
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy_1600: unregisterDeathRecipient is success");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_1600---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_1700
        * @tc.name    : test registerDeathRecipient Validates the interface flags input parameter boundary value
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_1700", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_1700---------------------------");
            try {
                let recipient = new MyregisterDeathRecipient(gIRemoteObject, null);
                gIRemoteObject.registerDeathRecipient(recipient, -(2 * G + 1));
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy_1700: registerDeathRecipient is success");
                gIRemoteObject.unregisterDeathRecipient(recipient, -(2 * G + 1));
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy_1700: unregisterDeathRecipient is success");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_1700---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_1800
        * @tc.name    : test getLocalInterface 1900005 searches for objects based on descriptors
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_1800", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_1800---------------------------");
            try {
                let object = new TestAbilityStub("Test040");
                let result = object.isObjectDead();
                expect(result).assertEqual(false);
                object.modifyLocalInterface(object, "Test2");
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy_1800: run modifyLocalInterface success");
                object.getLocalInterface(null);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                let errCode = `${rpc.ErrorCode.ONLY_PROXY_OBJECT_PERMITTED_ERROR}`;
                expect(error.code != errCode).assertTrue();
                expect(error.message != null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_1800---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_1900
        * @tc.name    : test Querylocalinterface searches for objects based on descriptors
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_1900", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_1900---------------------------");
            try {
                let res = gIRemoteObject.queryLocalInterface("testRpc");
                expect(res == null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_1900---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_2000
        * @tc.name    : test getLocalInterface searches for objects based on descriptors
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_2000", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_2000---------------------------");
            try {
                let res = gIRemoteObject.getLocalInterface("testRpc");
                expect(res == null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_2000---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_2100
        * @tc.name    : test Getinterfacedescriptor to get the object interface description
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_2100", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_2100---------------------------");
            try {
                let result = gIRemoteObject.getInterfaceDescriptor();
                expect(result).assertEqual("rpcTestAbility");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_2100---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_2200
        * @tc.name    : test getDescriptor to get the object interface description
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_2200", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_2200---------------------------");
            try {
                let result = gIRemoteObject.getDescriptor();
                expect(result).assertEqual("rpcTestAbility");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_2200---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RemoteProxy_2300
        * @tc.name    : test sendRequest to get the object interface description
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RemoteProxy_2300", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RemoteProxy_2300---------------------------");
            try {
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let result = data.writeString('sendRequest');
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                let resultSendRequest = gIRemoteObject.sendRequest(CODE_WRITE_STRING, data, reply, option);
                expect(resultSendRequest != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RemoteProxy error is:" + error);
                expect(error == null).assertTrue();
            } finally{
                data.reclaim();
                reply.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RemoteProxy_2300---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0010
        * @tc.name    : test Create an empty object and verify the function of the flushcommands interface
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0010", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0010---------------------------");
            try {
                let remoteObject = new TestRemoteObject("aaa");
                let ret = rpc.IPCSkeleton.flushCommands(remoteObject);
                expect(ret != null).assertTrue();
            }
            catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0010---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0020
        * @tc.name    : test Create an empty object and verify the function of the flushcommands interface
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0020", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0020---------------------------");
            try {
                let remoteObject = {};
                let ret = rpc.IPCSkeleton.flushCommands(remoteObject);
                expect(ret != null).assertTrue();
            }
            catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0020---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0030
        * @tc.name    : test Create an empty object and verify the function of the flushcommands interface
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0030", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0030---------------------------");
            try {
                let samgr = rpc.IPCSkeleton.getContextObject();
                expect(samgr != null).assertTrue();
            }
            catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0030---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0040
        * @tc.name    : test Create an empty object and verify the function of the flushcommands interface
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0040", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0040---------------------------");
            try {
                let getCallingPid = rpc.IPCSkeleton.getCallingPid();
                expect(getCallingPid != null).assertTrue();
                let getCallingUid = rpc.IPCSkeleton.getCallingUid();
                expect(getCallingUid != null).assertTrue();
            }
            catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0040---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0050
        * @tc.name    : test Create an empty object and verify the function of the flushcommands interface
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0050", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0050---------------------------");
            try {
                let getCallingPid = rpc.IPCSkeleton.getLocalDeviceID();
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton_0050 getCallingPid result: " + getCallingPid);
                expect(getCallingPid != null).assertTrue();
                let getCallingUid = rpc.IPCSkeleton.getCallingDeviceID();
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton_0050 getCallingUid result: " + getCallingUid);
                expect(getCallingUid != null).assertTrue();
            }
            catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0050---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0060
        * @tc.name    : test Do not get the server agent, do not create a remoteobject instance, and directly getcallingpid,
        *             getcallingpid, getcallingdeviceid, getlocaldeviceid
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0060", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0060---------------------------");
            try {
                let getCallingPid = rpc.IPCSkeleton.getCallingPid();
                expect(getCallingPid != null).assertTrue();
                let getCallingUid = rpc.IPCSkeleton.getCallingUid();
                expect(getCallingUid != null).assertTrue();
                let getCallingToKenId = rpc.IPCSkeleton.getCallingTokenId();
                expect(getCallingToKenId != null).assertTrue();
                let getLocalDeviceID = rpc.IPCSkeleton.getLocalDeviceID();
                expect(getLocalDeviceID != null).assertTrue();
                let getCallingDeviceID = rpc.IPCSkeleton.getCallingDeviceID();
                expect(getCallingDeviceID != null).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0060---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0070
        * @tc.name    : test Basic method of testing ipcskeleton
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0070", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0070---------------------------");
            try {
                let callingPid = rpc.IPCSkeleton.getCallingPid();
                let callingUid = rpc.IPCSkeleton.getCallingUid();
                let option = new rpc.MessageOption();
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                expect(data.writeInterfaceToken("rpcTestAbility")).assertTrue();
                expect(callingUid != null).assertTrue();
                expect(callingPid != null).assertTrue();
                await gIRemoteObject.sendRequest(CODE_IPCSKELETON, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    result.reply.readException();
                    let rescallingPid = result.reply.readInt();
                    let rescallingUid = result.reply.readInt();
                    expect(rescallingPid).assertEqual(callingPid);
                    expect(rescallingUid).assertEqual(callingUid);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0070---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0080
        * @tc.name    : test Basic method of testing ipcskeleton
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0080", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0080---------------------------");
            try {
                let callingPid = rpc.IPCSkeleton.getCallingPid();
                let callingUid = rpc.IPCSkeleton.getCallingUid();
                let option = new rpc.MessageOption();
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                expect(data.writeInterfaceToken("rpcTestAbility")).assertTrue();
                expect(callingUid != null).assertTrue();
                expect(callingPid != null).assertTrue();
                await gIRemoteObject.sendRequest(CODE_IPCSKELETON_INT, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    result.reply.readException();
                    let rescallingPid = result.reply.readInt();
                    let rescallingUid = result.reply.readInt();
                    let restcallingPid = result.reply.readInt();
                    let restcallingUid = result.reply.readInt();
                    let resicallingPid = result.reply.readInt();
                    let resicallingUid = result.reply.readInt();
                    let resflushCommands = result.reply.readInt();
                    expect(rescallingPid).assertEqual(callingPid);
                    expect(rescallingUid).assertEqual(callingUid);
                    expect(restcallingPid).assertEqual(callingPid);
                    expect(restcallingUid).assertEqual(callingUid);
                    expect(resicallingPid).assertEqual(callingPid);
                    expect(resicallingUid).assertEqual(callingUid);
                    expect(resflushCommands).assertEqual(101);
                })
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0080---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0090
        * @tc.name    : test SetCallingIdentity Interface flags input parameter boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0090", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0090---------------------------");
            try {
                let id = "";
                let ret = rpc.IPCSkeleton.setCallingIdentity(id);
                expect(ret).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0090---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0100
        * @tc.name    : test SetCallingIdentity Interface flags input parameter boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0100", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0100---------------------------");
            try {
                let id = 0;
                let ret = rpc.IPCSkeleton.setCallingIdentity(id);
                expect(ret).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0100---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0110
        * @tc.name    : test SetCallingIdentity Interface flags input parameter boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0110", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0110---------------------------");
            try {
                let id = "";
                for (let i = 0; i < (40 * K - 1); i++) {
                    id += "a";
                };
                let ret = rpc.IPCSkeleton.setCallingIdentity(id);
                expect(ret).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0110---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0120
        * @tc.name    : test Basic method of testing ipcskeleton
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0120", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0120---------------------------");
            try {
                let object = rpc.IPCSkeleton.getContextObject();
                let callingPid = rpc.IPCSkeleton.getCallingPid();
                let callingUid = rpc.IPCSkeleton.getCallingUid();
                let callingDeviceID = rpc.IPCSkeleton.getCallingDeviceID();
                let localDeviceID = rpc.IPCSkeleton.getLocalDeviceID();
                let isLocalCalling = rpc.IPCSkeleton.isLocalCalling();
                let id = rpc.IPCSkeleton.resetCallingIdentity();
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton_0120：" + id);
                let ret = rpc.IPCSkeleton.setCallingIdentity(id);
                expect(callingDeviceID).assertEqual("");
                expect(localDeviceID).assertEqual("");
                expect(isLocalCalling).assertTrue();
                expect(id).assertEqual("");
                expect(ret).assertTrue();
                expect(rpc.IPCSkeleton.flushCommands(gIRemoteObject)).assertEqual(101);
                let option = new rpc.MessageOption();
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                expect(data.writeInterfaceToken("rpcTestAbility")).assertTrue();
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton_0120： start send request");
                await gIRemoteObject.sendRequest(CODE_IPCSKELETON, data, reply, option).then(function (result) {
                    expect(result.errCode).assertEqual(0);
                    result.reply.readException();
                    expect(result.reply.readInt()).assertEqual(callingPid);
                    expect(result.reply.readInt()).assertEqual(callingUid);
                    expect(result.reply.readString()).assertEqual("");
                    expect(result.reply.readString()).assertEqual("");
                    expect(result.reply.readBoolean()).assertTrue();
                    expect(result.reply.readInt()).assertEqual(callingPid);
                    expect(result.reply.readInt()).assertEqual(callingUid);
                    expect(result.reply.readInt()).assertEqual(callingPid);
                    expect(result.reply.readInt()).assertEqual(callingUid);
                    expect(result.reply.readInt()).assertEqual(101);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0120---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0130
        * @tc.name    : test IPCSkeleton sendMessageRequest API test
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 0
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0130", 0, async function (done) {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0130---------------------------");
            try {
                let callingPid = rpc.IPCSkeleton.getCallingPid();
                let callingUid = rpc.IPCSkeleton.getCallingUid();
                let option = new rpc.MessageOption();
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                data.writeInterfaceToken("rpcTestAbility");
                expect(callingUid != null).assertTrue();
                expect(callingPid != null).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_IPCSKELETON, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    result.reply.readException();
                    let rescallingPid = result.reply.readInt();
                    let rescallingUid = result.reply.readInt();
                    expect(rescallingPid).assertEqual(callingPid);
                    expect(rescallingUid).assertEqual(callingUid);
                });
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0130---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0140
        * @tc.name    : test Create an empty object and verify the function of the flushCmdBuffer interface
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0140", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0140---------------------------");
            try {
                let remoteObject = new TestRemoteObject("aaa");
                rpc.IPCSkeleton.flushCmdBuffer(remoteObject);
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton_0140 RpcServer: flushCmdBuffer is success");
            }
            catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0140---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0150
        * @tc.name    : test Create an empty object and verify the function of the flushCmdBuffer interface
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0150", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0150---------------------------");
            try {
                let remoteObject = {};
                rpc.IPCSkeleton.flushCmdBuffer(remoteObject);
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton_0150 RpcServer: flushCmdBuffer is success");
            }
            catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0150---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0160
        * @tc.name    : test Basic method of testing ipcskeleton 1900007
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0160", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0160---------------------------");
            try {
                let object = rpc.IPCSkeleton.getContextObject();
                object.getDescriptor();
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton_0160: is success");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                let errCode = `${rpc.ErrorCode.COMMUNICATION_ERROR}`;
                expect(error.message != null).assertTrue();
                expect(error.code == errCode).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0160---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0170
        * @tc.name    : test Create an empty object and verify the function of the flushCmdBuffer interface 1900006
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0170", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0170---------------------------");
            try {
                let remoteObject = null;
                rpc.IPCSkeleton.flushCmdBuffer(remoteObject);
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton_0170 RpcServer: flushCmdBuffer is success");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                let errCode = `${rpc.ErrorCode.ONLY_REMOTE_OBJECT_PERMITTED_ERROR}`;
                expect(error.message != null).assertTrue();
                expect(error.code != errCode).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0170---------------------------");
        })

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0180
        * @tc.name    : test restoreCallingIdentity Interface flags input parameter boundary value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0180", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0180---------------------------");
            try {
                let id = "";
                rpc.IPCSkeleton.restoreCallingIdentity(id);
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton_0180 restoreCallingIdentity is success");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0180---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0190
        * @tc.name    : test restoreCallingIdentity Interface flags input parameter 0 value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0190", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0190---------------------------");
            try {
                let id = 0;
                rpc.IPCSkeleton.restoreCallingIdentity(id);
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton_0190 restoreCallingIdentity is success");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0190---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_IPCSkeleton_0200
        * @tc.name    : test restoreCallingIdentity Interface flags input parameter null value verification
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_IPCSkeleton_0200", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_IPCSkeleton_0200---------------------------");
            try {
                let id = "";
                for (let i = 0; i < (40 * K - 1); i++) {
                    id += "a";
                };
                rpc.IPCSkeleton.restoreCallingIdentity(id);
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton_0200 restoreCallingIdentity is success");
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_IPCSkeleton error is:" + error);
                expect(error == null).assertTrue();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_IPCSkeleton_0200---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RawDataBuffer_0100
        * @tc.name    : test writeRawDataBuffer input parameter is a normal data less than 32KB 
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RawDataBuffer_0100", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RawDataBuffer_0100---------------------------");
            let TEST_LEN_32K = 32 * 1024;
            let data = new rpc.MessageSequence();
            try {
                let buffer = new ArrayBuffer(TEST_LEN_32K);
                let size = buffer.byteLength;
                let int32View = new Int32Array(buffer);
                int32View.fill(1);
                data.writeRawDataBuffer(buffer, size);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RawDataBuffer_0100 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RawDataBuffer_0100---------------------------");
        });

        /*
         * @tc.number  : SUB_DSoftbus_IPC_API_RawDataBuffer_0200
         * @tc.name    : test writeRawDataBuffer input parameter is a normal data greater than 32KB and less than 128MB 
         * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
         * @tc.level   : 3
         * @tc.type    : Compatibility
         * @tc.size    : MediumTest
         */
        it("SUB_DSoftbus_IPC_API_RawDataBuffer_0200", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RawDataBuffer_0200---------------------------");
            let TEST_LEN_128M = 128 * 1024 * 1024;
            let data = new rpc.MessageSequence();
            try {
                let buffer = new ArrayBuffer(TEST_LEN_128M);
                let size = buffer.byteLength;
                let int32View = new Int32Array(buffer);
                int32View.fill(1);
                data.writeRawDataBuffer(buffer, size);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RawDataBuffer_0200 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RawDataBuffer_0200---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RawDataBuffer_0300
        * @tc.name    : test writeRawDataBuffer input parameter is a normal size = 0
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RawDataBuffer_0300", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RawDataBuffer_0300---------------------------");
            let TEST_LEN_32K = 32 * 1024;
            let data = new rpc.MessageSequence();
            try {
                let buffer = new ArrayBuffer(TEST_LEN_32K);
                let size = buffer.byteLength;
                let int32View = new Int32Array(buffer);
                int32View.fill(1);
                let errSize = 0;
                data.writeRawDataBuffer(buffer, 0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RawDataBuffer_0300 error is:" + error);
                expect(error.code == 401).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RawDataBuffer_0300---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RawDataBuffer_0400
        * @tc.name    : test writeRawDataBuffer input parameter is a normal size less than 0
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RawDataBuffer_0400", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RawDataBuffer_0400---------------------------");
            let TEST_LEN_32K = 32 * 1024;
            let data = new rpc.MessageSequence();
            try {
                let buffer = new ArrayBuffer(TEST_LEN_32K);
                let size = buffer.byteLength;
                let int32View = new Int32Array(buffer);
                int32View.fill(1);
                let errSize = -1;
                data.writeRawDataBuffer(buffer, errSize);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RawDataBuffer_0400 error is:" + error);
                expect(error.code == 401).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RawDataBuffer_0400---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RawDataBuffer_0500
        * @tc.name    : test writeRawDataBuffer input parameter is a normal data greater than 128MB
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RawDataBuffer_0500", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RawDataBuffer_0500---------------------------");
            let TEST_LEN_128M = 128 * 1024 * 1024;
            let data = new rpc.MessageSequence();
            try {
                let buffer = new ArrayBuffer(TEST_LEN_128M + 4);
                let size = buffer.byteLength;
                let int32View = new Int32Array(buffer);
                int32View.fill(1);
                data.writeRawDataBuffer(buffer, size);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RawDataBuffer_0500 error is:" + error);
                expect(error.code == 1900009).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RawDataBuffer_0500---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RawDataBuffer_0600
        * @tc.name    : test readRawDataBuffer input parameter is a normal data less than 32KB
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RawDataBuffer_0600", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RawDataBuffer_0600---------------------------");
            let TEST_LEN_32K = 32 * 1024;
            let data = new rpc.MessageSequence();
            try {
                let buffer = new ArrayBuffer(TEST_LEN_32K);
                let size = buffer.byteLength;
                let int32View = new Int32Array(buffer);
                int32View.fill(1);
                data.writeRawDataBuffer(buffer, size);
                let readBuffer = data.readRawDataBuffer(size);
                let readInt32Arr = new Int32Array(readBuffer);
                expect(readInt32Arr.length == int32View.length).assertTrue();
                for (let i = 0; i < readInt32Arr.length; i++) {
                    expect(readInt32Arr[i]).assertEqual(int32View[i]);
                }
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RawDataBuffer_0600 error is:" + error);
                expect(error== null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RawDataBuffer_0600---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RawDataBuffer_0700
        * @tc.name    : test readRawDataBuffer input parameter is a normal data less than 128MB
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RawDataBuffer_0700", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RawDataBuffer_0700---------------------------");
            let TEST_LEN_64K = 64 * 1024;
            let data = new rpc.MessageSequence();
            try {
                let buffer = new ArrayBuffer(TEST_LEN_64K + 4);
                let size = buffer.byteLength;
                let int32View = new Int32Array(buffer);
                int32View.fill(1);
                data.writeRawDataBuffer(buffer, size);
                let readBuffer = data.readRawDataBuffer(size);
                let readInt32Arr = new Int32Array(readBuffer);
                expect(readInt32Arr.length == int32View.length).assertTrue();
                for (let i = 0; i < readInt32Arr.length; i++) {
                    expect(readInt32Arr[i]).assertEqual(int32View[i]);
                }
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RawDataBuffer_0700 error is:" + error);
                expect(error== null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RawDataBuffer_0700---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RawDataBuffer_0800
        * @tc.name    : test readRawDataBuffer input parameter is a normal data greater than 128MB
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RawDataBuffer_0800", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RawDataBuffer_0800---------------------------");
            let TEST_LEN_128M = 128 * 1024 * 1024;
            let data = new rpc.MessageSequence();
            try {
                let buffer = new ArrayBuffer(TEST_LEN_128M);
                let size = buffer.byteLength;
                let int32View = new Int32Array(buffer);
                int32View.fill(1);
                data.writeRawDataBuffer(buffer, size);
                let readBuffer = data.readRawDataBuffer(TEST_LEN_128M + 1);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RawDataBuffer_0800 error is:" + error);
                expect(error.code == 1900010).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RawDataBuffer_0800---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RawDataBuffer_0900
        * @tc.name    : test readRawDataBuffer input parameter is a normal size = 0
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RawDataBuffer_0900", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RawDataBuffer_0900---------------------------");
            let TEST_LEN_32K = 32 * 1024;
            let data = new rpc.MessageSequence();
            try {
                let buffer = new ArrayBuffer(TEST_LEN_32K);
                let size = buffer.byteLength;
                let int32View = new Int32Array(buffer);
                int32View.fill(1);
                data.writeRawDataBuffer(buffer, size);
                let readBuffer = data.readRawDataBuffer(0);
                let readInt32Arr = new Int32Array(readBuffer);
                expect(readInt32Arr.length == 0).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RawDataBuffer_0900 error is:" + error);
                expect(error== null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RawDataBuffer_0900---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RawDataBuffer_1000
        * @tc.name    : test readRawDataBuffer input parameter is a normal size less than 0
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RawDataBuffer_1000", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RawDataBuffer_1000---------------------------");
            let TEST_LEN_32K = 32 * 1024;
            let data = new rpc.MessageSequence();
            try {
                let buffer = new ArrayBuffer(TEST_LEN_32K);
                let size = buffer.byteLength;
                let int32View = new Int32Array(buffer);
                int32View.fill(1);
                data.writeRawDataBuffer(buffer, size);
                let readBuffer = data.readRawDataBuffer(-1);
                let readInt32Arr = new Int32Array(readBuffer);
                expect(readInt32Arr.length == 0).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RawDataBuffer_1000 error is:" + error);
                expect(error== null).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RawDataBuffer_1000---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_RawDataBuffer_1100
        * @tc.name    : test readRawDataBuffer input parameter is a normal size not match write
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_RawDataBuffer_1100", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_RawDataBuffer_1100---------------------------");
            let TEST_LEN_32K = 32 * 1024;
            let data = new rpc.MessageSequence();
            try {
                let buffer = new ArrayBuffer(TEST_LEN_32K);
                let size = buffer.byteLength;
                let int32View = new Int32Array(buffer);
                int32View.fill(1);
                data.writeRawDataBuffer(buffer, size);
                let readBuffer = data.readRawDataBuffer(TEST_LEN_32K - 1);
                let readInt32Arr = new Int32Array(readBuffer);
                expect(readInt32Arr.length == 0).assertTrue();
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_RawDataBuffer_1100 error is:" + error);
                expect(error.code == 1900010).assertTrue();
            } finally {
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_RawDataBuffer_1100---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_0100
        * @tc.name    : test writeDataToAshmem input parameter is a normal data less than 32KB 
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_NewAshmen_0100", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_0100---------------------------");
            let TEST_LEN_32 = 32;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_32);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_32);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);
                ashnenInt32Arr.fill(1);
                ashmem.writeDataToAshmem(buffer, size, 0);
                data.writeAshmem(ashmem);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_0100 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_0100---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_0200
        * @tc.name    : test writeDataToAshmem input parameter is a normal data greater than 32KB 
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_NewAshmen_0200", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_0200---------------------------");
            let TEST_LEN_M = 1024 * 1024;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_M);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_M);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);

                ashmem.writeDataToAshmem(buffer, size, 0);
                data.writeAshmem(ashmem);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_0200 error is:" + error);
                expect(error == null).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_0200---------------------------");
        });

        /*
       * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_0300
       * @tc.name    : test writeDataToAshmem input parameter is a normal data size = 0
       * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
       * @tc.level   : 3
       * @tc.type    : Compatibility
       * @tc.size    : MediumTest
       */
        it("SUB_DSoftbus_IPC_API_NewAshmen_0300", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_0300---------------------------");
            let TEST_LEN_128M = 128 * 1024 * 1024;
            let TEST_LEN_M = 1024 * 1024;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_128M);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_M);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);

                ashmem.writeDataToAshmem(buffer, 0, 0);
                data.writeAshmem(ashmem);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_0300 error is:" + error);
                expect(error.code == 1900003).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_0300---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_0400
        * @tc.name    : test writeDataToAshmem input parameter is a normal  size less than 0
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_NewAshmen_0400", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_0400---------------------------");
            let TEST_LEN_128M = 128 * 1024 * 1024;
            let TEST_LEN_M = 1024 * 1024;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_128M);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_M);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);

                ashmem.writeDataToAshmem(buffer, -1, 0);
                data.writeAshmem(ashmem);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_0400 error is:" + error);
                expect(error.code == 1900003).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_0400---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_0500
        * @tc.name    : test writeDataToAshmem input parameter is a normal  offset less than 0
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_NewAshmen_0500", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_0500---------------------------");
            let TEST_LEN_128M = 128 * 1024 * 1024;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_128M);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_128M);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);

                ashmem.writeDataToAshmem(buffer, size, -1);
                data.writeAshmem(ashmem);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_0500 error is:" + error);
                expect(error.code == 1900003).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_0500---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_0600
        * @tc.name    : test writeDataToAshmem input parameter is a normal  lenth and offset greater than create
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_NewAshmen_0600", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_0600---------------------------");
            let TEST_LEN_32 = 32;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_32);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_32);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);

                ashmem.writeDataToAshmem(buffer, TEST_LEN_32, 1);
                data.writeAshmem(ashmem);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_0600 error is:" + error);
                expect(error.code == 1900003).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_0600---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_0700
        * @tc.name    : test writeDataToAshmem input parameter is a normal lenth is normal offset greater than create
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_NewAshmen_0700", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_0700---------------------------");
            let TEST_LEN_32 = 32;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_32);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_32);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);

                ashmem.writeDataToAshmem(buffer, TEST_LEN_32 + 1, 0);
                data.writeAshmem(ashmem);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_0700 error is:" + error);
                expect(error.code == 1900003).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_0700---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_0800
        * @tc.name    : test writeDataToAshmem input parameter is a normal lenth greater than create offset is normal
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_NewAshmen_0800", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_0800---------------------------");
            let TEST_LEN_32 = 32;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_32);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_32);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);

                ashmem.writeDataToAshmem(buffer, size, TEST_LEN_32 + 1);
                data.writeAshmem(ashmem);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_0800 error is:" + error);
                expect(error.code == 1900003).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_0800---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_0900
        * @tc.name    : test readDataFromAshmem input parameter is a normal lenth greater than create offset is normal
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_NewAshmen_0900", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_0900---------------------------");
            let TEST_LEN_32 = 32;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', 1024 * 1024);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_32);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);
                ashnenInt32Arr.fill(1);
                ashmem.writeDataToAshmem(buffer, size, 0);
                data.writeAshmem(ashmem);
                let readBuffuer = ashmem.readDataFromAshmem(size, 0);
                let readInt32Arr = new Int32Array(readBuffuer);
                expect(readInt32Arr.length == ashnenInt32Arr.length).assertTrue();
                for (let i = 0; i < readInt32Arr.length; i++) {
                    expect(readInt32Arr[i]).assertEqual(ashnenInt32Arr[i]);
                }
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_0900 error is:" + error);
                expect(error== null).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_0900---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_1000
        * @tc.name    : test readDataFromAshmem input parameter is a normal lenth is normal create offset is normal
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_NewAshmen_1000", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_1000---------------------------");
            let TEST_LEN_64K = 64 * 1024;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_64K);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_64K);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);
                ashnenInt32Arr.fill(1);
                ashmem.writeDataToAshmem(buffer, size, 0);
                data.writeAshmem(ashmem);
                let readBuffuer = ashmem.readDataFromAshmem(size, 0);
                let readInt32Arr = new Int32Array(readBuffuer);
                expect(readInt32Arr.length == ashnenInt32Arr.length).assertTrue();
                for (let i = 0; i < readInt32Arr.length; i++) {
                    expect(readInt32Arr[i]).assertEqual(ashnenInt32Arr[i]);
                }
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_1000 error is:" + error);
                expect(error== null).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_1000---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_1100
        * @tc.name    : test readDataFromAshmem input parameter is a normal lenth is 0 create offset is normal
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_NewAshmen_1100", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_1100---------------------------");
            let TEST_LEN_64K = 64 * 1024;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_64K);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_64K);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);
                ashnenInt32Arr.fill(1);
                ashmem.writeDataToAshmem(buffer, size, 0);
                data.writeAshmem(ashmem);
                let readBuffuer = ashmem.readDataFromAshmem(0, 0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_1100 error is:" + error);
                expect(error.code == 1900004).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_1100---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_1200
        * @tc.name    : test readDataFromAshmem input parameter is a normal lenth less than 0 create offset is normal
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_NewAshmen_1200", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_1200---------------------------");
            let TEST_LEN_64K = 64 * 1024;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_64K);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_64K);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);
                ashnenInt32Arr.fill(1);
                ashmem.writeDataToAshmem(buffer, size, 0);
                data.writeAshmem(ashmem);
                let readBuffuer = ashmem.readDataFromAshmem(-1, 0);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_1200 error is:" + error);
                expect(error.code == 1900004).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_1200---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_1300
        * @tc.name    : test readDataFromAshmem input parameter is a normal lenth is normal offset less than 0
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_NewAshmen_1300", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_1300---------------------------");
            let TEST_LEN_64K = 64 * 1024;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_64K);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_64K);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);
                ashnenInt32Arr.fill(1);
                ashmem.writeDataToAshmem(buffer, size, 0);
                data.writeAshmem(ashmem);
                let readBuffuer = ashmem.readDataFromAshmem(size, -1);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_1300 error is:" + error);
                expect(error.code == 1900004).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_1300---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_1400
        * @tc.name    : test readDataFromAshmem input parameter is a normal lenth is normal offset greater than create
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_NewAshmen_1400", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_1400---------------------------");
            let TEST_LEN_32 = 32;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_32);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_32);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);
                ashnenInt32Arr.fill(1);
                ashmem.writeDataToAshmem(buffer, size, 0);
                data.writeAshmem(ashmem);
                let readBuffuer = ashmem.readDataFromAshmem(size, TEST_LEN_32 + 1);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_1400 error is:" + error);
                expect(error.code == 1900004).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_1400---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_1500
        * @tc.name    : test readDataFromAshmem input parameter is a normal lenth greater than create offset is normal
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_NewAshmen_1500", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_1500---------------------------");
            let TEST_LEN_32 = 32;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_32);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_32);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);
                ashnenInt32Arr.fill(1);
                ashmem.writeDataToAshmem(buffer, size, 0);
                data.writeAshmem(ashmem);
                let readBuffuer = ashmem.readDataFromAshmem(TEST_LEN_32 + 1, 0)
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_1500 error is:" + error);
                expect(error.code == 1900004).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_1500---------------------------");
        });

        /*
        * @tc.number  : SUB_DSoftbus_IPC_API_NewAshmen_1600
        * @tc.name    : test readDataFromAshmem input parameter is a normal lenth and offset greater than create
        * @tc.desc    : [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   : 3
        * @tc.type    : Compatibility
        * @tc.size    : MediumTest
        */
        it("SUB_DSoftbus_IPC_API_NewAshmen_1600", 0, async function () {
            console.info("---------------------start SUB_DSoftbus_IPC_API_NewAshmen_1600---------------------------");
            let TEST_LEN_32 = 32;
            let data = new rpc.MessageSequence();
            let ashmem = rpc.Ashmem.create('ashmem', TEST_LEN_32);
            try {
                ashmem.mapReadWriteAshmem();
                let buffer = new ArrayBuffer(TEST_LEN_32);
                let size = buffer.byteLength;
                let ashnenInt32Arr = new Int32Array(buffer);
                ashnenInt32Arr.fill(1);
                ashmem.writeDataToAshmem(buffer, size, 0);
                data.writeAshmem(ashmem);
                let readBuffuer = ashmem.readDataFromAshmem(TEST_LEN_32 + 1, 1);
            } catch (error) {
                console.info("SUB_DSoftbus_IPC_API_NewAshmen_1600 error is:" + error);
                expect(error.code == 1900004).assertTrue();
            } finally {
                ashmem.unmapAshmem();
                ashmem.closeAshmem();
                data.reclaim();
            }
            console.info("---------------------end SUB_DSoftbus_IPC_API_NewAshmen_1600---------------------------");
        });
        console.info("-----------------------SUB_DSoftbus_IPC_API_MessageParce_Test is end-----------------------");
    });
}
