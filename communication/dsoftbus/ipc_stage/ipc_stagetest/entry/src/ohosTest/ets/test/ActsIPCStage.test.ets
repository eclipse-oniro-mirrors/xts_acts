/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { rpc } from '@kit.IPCKit';
import TestService from "./testService";
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';

let logTag = "[IpcClient_log:]";
let gIRemoteObject: rpc.IRemoteObject;
let testFlag: boolean = true;
let strlen: number = 40960;

function checkResult(num:number, str:string) {
  console.info(logTag + "checkResult is success");
  expect(num).assertEqual(123);
  expect(str).assertEqual("rpcListenerTest");
};

function sendMessageRequestCallback(err: BusinessError | null, result: rpc.RequestResult | undefined) {
  try {
    if (result != null) {
      console.info(logTag + '%{public}s', 'sendMessageRequest Callback');
      expect(result.errCode).assertEqual(0);
      let res = result.reply.readString();
      console.info(logTag + 'sendMessageRequest Callback read result ' + res);
      expect(res).assertEqual("a");
    }
  } catch(error) {
    console.info(logTag + '%{public}s', 'sendMessageRequest Callback err is ' + error);
  }
}

function sendRequestCallback(err: BusinessError | null, result: rpc.SendRequestResult | undefined) {
  try {
    if (result != null) {
      console.info(logTag + '%{public}s', 'sendRequest Callback');
      expect(result.errCode).assertEqual(0);
      let res = result.reply.readString();
      console.info(logTag + 'sendRequest Callback read result ' + res);
      expect(res).assertEqual("a");
    }
  } catch(error) {
    console.info(logTag + '%{public}s', 'sendRequest Callback err is ' + error);
  }
}

async function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

class TestListener extends rpc.RemoteObject {
  checkResult:Function;
  constructor(descriptor: string, checkResult: Function) {
    super(descriptor);
    this.checkResult = checkResult;
  }
  onRemoteMessageRequest(code: number, data: rpc.MessageSequence, reply: rpc.MessageSequence, option: rpc.MessageOption): boolean | Promise<boolean> {
    let result = false;
    if (code === 1) {
      console.info(logTag + "onRemoteRequest called, descriptor: " + this.getDescriptor());
      result = true;
    } else {
      console.info(logTag + "unknown code: " + code);
    }
    let _checkResult: Function = this.checkResult;
    let _num: number = data.readInt();
    let _str: string = data.readString();
    _checkResult(_num, _str);
    console.info(logTag + "result:" + result);
    return result;
  }
}

class TestAbilityStub extends rpc.RemoteObject {
  constructor(descriptor: string) {
    super(descriptor);
  }

  onRemoteMessageRequest(code: number, data: rpc.MessageSequence, reply: rpc.MessageSequence, option: rpc.MessageOption): boolean {
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
        reply.writeByte(tmp1);
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

class TestRemoteObject extends rpc.RemoteObject {
  constructor(descriptor: string) {
    super(descriptor);
    this.modifyLocalInterface(this, descriptor);
  }
  asObject(): rpc.IRemoteObject {
    return this;
  }
}

class MySequenceable implements rpc.Parcelable {
  num: number = 0;
  str: string = '';
  constructor(num: number, str: string) {
    this.num = num;
    this.str = str;
  }
  marshalling(messageSequence: rpc.MessageSequence): boolean {
    messageSequence.writeInt(this.num);
    messageSequence.writeString(this.str);
    return true;
  }
  unmarshalling(messageSequence: rpc.MessageSequence): boolean {
    this.num = messageSequence.readInt();
    this.str = messageSequence.readString();
    return true;
  }
}

function isEqualArray(arr1: number[] | boolean[] | string[], arr2: number[] | boolean[] | string[]){
  return Array.isArray(arr1) &&
  Array.isArray(arr2) &&
    arr1.length === arr2.length &&
    JSON.stringify(arr1) === JSON.stringify(arr2)
}

function isEqualArrayBuffer(
    arr1: Int8Array | Uint8Array | Int16Array | Uint16Array | Int32Array | Uint32Array | Float32Array | Float64Array,
    arr2: Int8Array | Uint8Array | Int16Array | Uint16Array | Int32Array | Uint32Array | Float32Array | Float64Array
): boolean {
    // 检查两个参数是否都是 TypedArray
    if (!ArrayBuffer.isView(arr1) || !ArrayBuffer.isView(arr2)) {
        return false;
    }

    // 检查长度是否相同
    if (arr1.length !== arr2.length) {
        return false;
    }

    // 直接比较底层字节数据
    const view1 = new Uint8Array(arr1.buffer, arr1.byteOffset, arr1.byteLength);
    const view2 = new Uint8Array(arr2.buffer, arr2.byteOffset, arr2.byteLength);

    // 逐个字节比较
    for (let i = 0; i < view1.length; i++) {
        if (view1[i] !== view2[i]) {
            return false;
        }
    }
    return true;
}

class TestProxy {
  remote: rpc.IRemoteObject;
  constructor(remote: rpc.IRemoteObject) {
    this.remote = remote;
  }
  asObject() {
    return this.remote;
  }
}

class MyregisterDeathRecipient implements rpc.DeathRecipient {
  onRemoteDied() {
    console.info("server died");
  }
}

class TestCallerInfo extends rpc.RemoteObject {
  constructor(descriptor: string) {
    super(descriptor);
  }

  onRemoteMessageRequest(code: number, data: rpc.MessageSequence, reply: rpc.MessageSequence, option: rpc.MessageOption,
    callingInfo?: rpc.CallingInfo): boolean {
    console.info(logTag + "TestCallerInfo onRemoteMessageRequest in code is: " + code);
    if (code === 1) {
      try {
        let callingPid = rpc.IPCSkeleton.getCallingPid();
        expect(callingPid).assertEqual(callingInfo?.callerPid);
        let callingUid = rpc.IPCSkeleton.getCallingUid();
        expect(callingUid).assertEqual(callingInfo?.callerUid);
        let callingTokenId = rpc.IPCSkeleton.getCallingTokenId();
        expect(callingTokenId).assertEqual(callingInfo?.callerTokenId);
        let remoteDeviceId = rpc.IPCSkeleton.getCallingDeviceID();
        expect(remoteDeviceId).assertEqual(callingInfo?.remoteDeviceId);
        let localDeviceId = rpc.IPCSkeleton.getLocalDeviceID();
        expect(localDeviceId).assertEqual(callingInfo?.localDeviceId);
        let isLocalCalling = rpc.IPCSkeleton.isLocalCalling();
        expect(isLocalCalling).assertEqual(callingInfo?.isLocalCalling);
      } catch (error) {
        error = error as BusinessError;
        console.info(logTag + "TestCallerInfo onRemoteMessageRequest error is:" + error);
        testFlag = false;
        return false;
      }
      return true;
    }
    if (code === 2) {
      try {
         let callingIdentity = rpc.IPCSkeleton.resetCallingIdentity();
         let des ="";
         const targetLength = strlen;
        for (let i = 0; i < targetLength; i++) {
          des += 'a';
        }
        rpc.IPCSkeleton.restoreCallingIdentity(des)
        console.info(logTag + "TestCallerInfo onRemoteMessageRequest callingIdentity is done");
      } catch (error) {
        error = error as BusinessError;
        console.info(logTag + "TestCallerInfo onRemoteMessageRequest error is:" + error);
        console.info(logTag + "TestCallerInfo onRemoteMessageRequest errorcode is:" + error.code);
        testFlag = false;
        if (error.code == 401) {
          return true;
        } else {
          return false;
        }
      }
      return true;
    } else {
     console.info(logTag + "unknown code: " + code);
      return false;
    }
  }
}

export default function ActsRpcClientEtsTest() {
  describe('ActsRpcClientEtsTest', () => {
    console.info("-----------------------SUB_DSoftbus_IPC_API_Stage_MessageSequence_Test is starting-----------------------");
    const K = 1024;
    const M = 1024 * 1024;
    const G = 1024 * 1024 * 1024;
    const CODE_INTERFACETOKEN = 1;
    const CODE_WRITE_STRING = 2;
    const CODE_WRITE_INT = 3;
    const CODE_ALL_TYPE = 4;
    const CODE_WRITE_BYTE = 5;
    const CODE_WRITE_BYTE_MULTI = 6;
    const CODE_WRITE_SHORT = 7;
    const CODE_WRITE_SHORT_MULTI = 8;
    const CODE_WRITE_INT_MULTI = 9;
    const CODE_WRITE_LONG = 10;
    const CODE_WRITE_FLOAT = 11;
    const CODE_WRITE_DOUBLE = 12;
    const CODE_WRITE_BOOLEAN = 13;
    const CODE_WRITE_CHAR = 14;
    const CODE_WRITE_SEQUENCEABLE = 15;
    const CODE_WRITE_BYTEARRAY = 16;
    const CODE_WRITE_SHORTARRAY = 17;
    const CODE_WRITE_INTARRAY = 18;
    const CODE_WRITE_LONGARRAY = 20;
    const CODE_WRITE_FLOATARRAY = 21;
    const CODE_WRITE_DOUBLEARRAY = 22;
    const CODE_WRITE_BOOLEANARRAY = 23
    const CODE_WRITE_CHARARRAY = 24;
    const CODE_WRITE_STRINGARRAY = 25;
    const CODE_WRITE_NOEXCEPTION= 26;
    const CODE_WRITE_SEQUENCEABLEARRAY = 27;
    const CODE_ALL_ARRAY_TYPE = 28;
    const CODE_WRITE_REMOTEOBJECTARRAY = 29;
    const CODE_WRITE_REMOTEOBJECTARRAY_1 = 30;
    const CODE_WRITE_REMOTEOBJECTARRAY_2 = 31;
    const CODE_FILESDIR = 32;
    const CODE_WRITE_ARRAYBUFFER = 33;
    const CODE_TESTCALLERINFO = 100;
    const CODE_TESTCALLERINFO_1 = 101;
    const CODE_MAX = 16777215;
    const CODE_MIN = 0;

    beforeAll(async () => {
      console.info(logTag + 'beforeAll called');
      let testservice = new TestService();
      await testservice.toConnectAbility();
      gIRemoteObject = testservice.getRemoteproxy();
      console.info(logTag + 'toConnectAbility is getRemoteproxy success' + gIRemoteObject);
    })
    beforeEach(() => {
      console.info(logTag + 'beforeEach called');
    })
    afterEach(() => {
      console.info(logTag + 'afterEach called');
      testFlag = true;
    })
    afterAll(() => {
      console.info(logTag + 'afterAll called');
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0010
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0010
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0010---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      expect(data != undefined).assertTrue();
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        data.writeRemoteObject(testRemoteObject);
        expect(data.readRemoteObject() != null).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0010---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0020
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0020
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0020---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestRemoteObject("");
        data.writeRemoteObject(testRemoteObject);
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_0020 is:" + data.readRemoteObject());
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0020---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0030
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0030
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0030---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeRemoteObject(undefined);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0030---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0040
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0040
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0040---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        data.writeRemoteObject(testRemoteObject);
        data.reclaim();
        data.readRemoteObject();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0040---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0050
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0050
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0050---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        data.reclaim();
        data.writeRemoteObject(testRemoteObject);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0050---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0060
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0060
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0060---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = "hello ruan zong xian";
        data.writeInterfaceToken(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_INTERFACETOKEN, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readInterfaceToken()).assertEqual(token);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0060---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0070
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0070
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0070---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = "";
        for (let i = 0; i < (40 * K - 1); i++) {
          token += "a";
        }
        data.writeInterfaceToken(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_INTERFACETOKEN, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readInterfaceToken()).assertEqual(token);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0070---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0080
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0080
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0080---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let token = "";
        for (let i = 0; i < 40 * K; i++) {
          token += "a";
        }
        data.writeInterfaceToken(token);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0080---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0090
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0090
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0090---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeInterfaceToken(null);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0090---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0100
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0100
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0100---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeInterfaceToken("rpctest");
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0100---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0110
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0110
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0110---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeInterfaceToken("rpctest");
        data.reclaim();
        data.readInterfaceToken();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0110---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0120
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0120
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0120---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
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
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error: " + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0120---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0130
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0130
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0130---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
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
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error: " + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0130---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0140
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0140
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0140---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        expect(data.getSize()).assertEqual(0);
        data.writeString("constant");
        expect(data.getSize()).assertEqual(("constant".length * 2) + 8);
        let getCapacitydata = data.getCapacity();
        expect(getCapacitydata).assertEqual(64);
        data.setSize(getCapacitydata);
        expect(data.getSize()).assertEqual(getCapacitydata);
        data.setSize(getCapacitydata - 1);
        expect(data.getSize()).assertEqual(getCapacitydata-1);
        console.info(logTag + "getSize or getCapacityresult");
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error: " + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0140---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0150
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0150
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0150---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeString("constant");
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readString()).assertEqual("constant");
          expect(result.reply.getSize()).assertEqual(("constant".length * 2) + 8);
          let getCapacityresult = result.reply.getCapacity();
          result.reply.setSize(getCapacityresult);
          expect(result.reply.getSize()).assertEqual(getCapacityresult);
          result.reply.setSize(getCapacityresult - 1);
          expect(result.reply.getSize()).assertEqual(getCapacityresult-1);
          console.info(logTag + "getSize or getCapacityresult");
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error: " + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0150---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0160
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0160
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0160---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        expect(data.getCapacity()).assertEqual(0);
        data.setSize(4 * G);
        expect(data.getSize()).assertEqual(0);
        data.setSize(4 * G - 1);
        expect(data.getSize()).assertEqual(0);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0160---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0170
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0170
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0170---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.setSize(0);
        expect(data.getSize()).assertEqual(0);
        data.setSize(2 * 4 * G);
        expect(data.getSize()).assertEqual(0);
        data.setSize(2 * G + 1);
        expect(data.getSize()).assertEqual(0);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0170---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0180
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0180
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0180---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        expect(data.getCapacity()).assertEqual(0);
        data.setCapacity(100);
        data.writeString("constant");
        expect(data.getCapacity()).assertEqual(100);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.getCapacity()).assertEqual(("constant".length * 2) + 8);
          expect(result.reply.readString()).assertEqual("constant");
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error: " + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0180---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0190
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0190
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0190---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        expect(data.getCapacity()).assertEqual(0);
        data.setCapacity(100);
        data.writeString("constant");
        expect(data.getCapacity()).assertEqual(100);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.getCapacity()).assertEqual(("constant".length * 2) + 8);
          expect(result.reply.readString()).assertEqual("constant");
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error: " + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0190---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0200
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0200
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0200---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        expect(data.getCapacity()).assertEqual(0);
        data.writeString("constant");
        let getSizedata = data.getSize();
        data.setCapacity(getSizedata + 1);
        console.info(logTag + "setCapacity is getSizeresult+1 success");
        data.setCapacity(getSizedata);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.PARCEL_MEMORY_ALLOC_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0200---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0210
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0210
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0210---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeString("constant");
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let getSizeresult: number = result.reply.getSize();
          let dataLength = ("constant".length * 2) + 8;
          expect(result.reply.getCapacity()).assertEqual(dataLength);
          result.reply.setCapacity(getSizeresult - 1);
          console.info(logTag + "setCapacity is getSizeresult success");
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode = `${rpc.ErrorCode.PARCEL_MEMORY_ALLOC_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0210---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0220
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0220
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0220---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        expect(data.getSize()).assertEqual(0);
        data.setCapacity(M);
        expect(data.getCapacity()).assertEqual(M);
        data.setCapacity(2 * G);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.PARCEL_MEMORY_ALLOC_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0220---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0230
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0230
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0230---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let sequenceable = new MySequenceable(1, "aaa");
        data.writeParcelable(sequenceable);
        data.setCapacity(0);
        data.setSize(0);
        let ret = new MySequenceable(1, "");
        data.readParcelable(ret);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.CALL_JS_METHOD_ERROR}`;
        expect("e.code" != errCode).assertTrue();
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0230---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0240
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0200
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0240", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0240---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let token = "hello ruan zong xian";
        data.writeInterfaceToken(token);
        data.setCapacity(0);
        data.setSize(0);
        data.readInterfaceToken();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.PARCEL_MEMORY_ALLOC_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0240---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0250
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0250
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0250---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.setSize(0);
        data.setCapacity(0);
        let token = "hello ruan zong xian";
        data.writeInterfaceToken(token);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.PARCEL_MEMORY_ALLOC_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0250---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0260
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0260
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0260", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0260---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.setSize(null);
        data.setCapacity(null);
        let token = "hello ruan zong xian";
        data.writeInterfaceToken(token);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0260---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0270
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0270
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0270", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0270---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.setSize(0);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0270---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0280
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0280
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0280", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0280---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let sequenceable = new MySequenceable(1, "aaa");
        data.writeParcelable(sequenceable);
        let ret = new MySequenceable(0, "");
        data.setCapacity(0);
        data.readParcelable(ret);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.PARCEL_MEMORY_ALLOC_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0280---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0290
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0290
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0290", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0290---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
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
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0290---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0300
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0300
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0300---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
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
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0300---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0310
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0310
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0310", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0310---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
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
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0310---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0320
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0320
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0320", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0320---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
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
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0320---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0330
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0330
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0330", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0330---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        expect(data.getWritePosition()).assertEqual(0);
        data.writeInt(4);
        expect(data.getWritePosition()).assertEqual(4);
        data.rewindWrite(0);
        expect(data.getWritePosition()).assertEqual(0);
        data.writeInt(5);
        expect(data.getWritePosition()).assertEqual(4);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
          expect(result.errCode == 0).assertTrue();
          expect(result.reply.getReadPosition()).assertEqual(0);
          expect(result.reply.readInt()).assertEqual(5);
          expect(result.reply.getReadPosition()).assertEqual(4);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0330---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0340
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0340
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0340", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0340---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        expect(data.getWritePosition()).assertEqual(0);
        data.writeInt(4);
        expect(data.getWritePosition()).assertEqual(4);
        data.rewindWrite(3);
        expect(data.getWritePosition()).assertEqual(3);
        data.writeInt(5);
        expect(data.getWritePosition()).assertEqual(3 + 4);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
          expect(result.errCode == 0).assertTrue();
          expect(result.reply.readInt() != 5).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0340---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0350
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0350
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0350---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let token = "";
        for (let i = 0; i < (40 * K - 1); i++) {
          token += "a";
        }
        expect(data.getWritePosition()).assertEqual(0);
        data.writeString(token);
        expect(data.getWritePosition()).assertEqual(token.length * 2 + 6);
        data.rewindWrite((token.length * 2 + 6) - 1);
        expect(data.getWritePosition()).assertEqual((token.length * 2 + 6) - 1);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0350---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0360
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0360
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0360", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0360---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let token = "";
        for (let i = 0; i < (40 * K - 1); i++) {
          token += "a";
        }
        expect(data.getWritePosition()).assertEqual(0);
        data.writeString(token);
        expect(data.getWritePosition()).assertEqual(token.length * 2 + 6);
        data.rewindWrite((token.length * 2 + 6) + 1);
        expect(data.getWritePosition()).assertEqual(token.length * 2 + 6);
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase getWritePosition is:");
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0360---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0370
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0370
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0370", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0370---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeByte(2);
        expect(data.getWritePosition()).assertEqual(4);
        data.writeShort(3);
        expect(data.getWritePosition()).assertEqual(4 + 4);
        data.writeInt(4);
        expect(data.getWritePosition()).assertEqual((4 + 4) + 4);
        data.writeLong(5);
        expect(data.getWritePosition()).assertEqual(((4 + 4) + 4) + 8);
        data.writeFloat(1.2);
        expect(data.getWritePosition()).assertEqual((((4 + 4) + 4) + 8) + 8);
        data.writeDouble(10.2);
        expect(data.getWritePosition()).assertEqual(((((4 + 4) + 4) + 8) + 8) + 8);
        data.writeBoolean(true);
        expect(data.getWritePosition()).assertEqual((((((4 + 4) + 4) + 8) + 8) + 8) + 4);
        data.writeChar(97);
        expect(data.getWritePosition()).assertEqual(((((((4 + 4) + 4) + 8) + 8) + 8) + 4) + 4);
        data.writeString("");
        expect(data.getWritePosition()).assertEqual((((((((4 + 4) + 4) + 8) + 8) + 8) + 4) + 4) + 8);
        data.writeParcelable(new MySequenceable(1, "aaa"));
        expect(data.getWritePosition()).assertEqual(((((((((4 + 4) + 4) + 8) + 8) + 8) + 4) + 4) + 8) + (12 + 8));
        await gIRemoteObject.sendMessageRequest(CODE_ALL_TYPE, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readByte()).assertEqual(2);
          expect(result.reply.readShort()).assertEqual(3);
          expect(result.reply.readInt()).assertEqual(4);
          expect(result.reply.readLong()).assertEqual(5);
          expect(result.reply.readFloat()).assertEqual(1.2);
          expect(result.reply.readDouble()).assertEqual(10.2);
          expect(result.reply.readBoolean()).assertTrue();
          expect(result.reply.readChar()).assertEqual(97);
          expect(result.reply.readString()).assertEqual("");
          let s = new MySequenceable(0, "");
          result.reply.readParcelable(s);
          expect(s.num).assertEqual(1);
          expect(s.str).assertEqual("aaa");
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0370---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0380
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0380
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0380", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0380---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeString("");
        expect(data.getWritePosition()).assertEqual(8);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0380---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0390
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0390
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0390", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0390---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeInt(4);
        data.rewindWrite(0);
        data.writeInt(5);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
          expect(result.errCode == 0).assertTrue();
          expect(result.reply.readInt()).assertEqual(5);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0390---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0400
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0400
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0400---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeInt(4);
        data.rewindWrite(1);
        data.writeInt(5);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readInt() != 5).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0400---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0410
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0410
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0410", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0410---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.rewindWrite(0);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0410---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0420
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0420
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0420", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0420---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
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
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0420---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0430
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0430
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0430", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0430---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
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
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0430---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0440
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0440
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0440", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0440---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeInt(12);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
          expect(result.errCode == 0).assertTrue();
          expect(result.reply.getReadPosition()).assertEqual(0);
          expect(result.reply.readInt()).assertEqual(12);
          expect(result.reply.getReadPosition()).assertEqual(4);
          result.reply.rewindRead(1);
          expect(result.reply.getReadPosition()).assertEqual(1);
          expect(result.reply.readInt() != 12).assertTrue();
          expect(result.reply.getReadPosition()).assertEqual(1);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0440---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0450
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0450
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0450", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0450---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeInt(16);
        data.writeString("sequence");
        expect(data.getReadPosition()).assertEqual(0);
        expect(data.readInt()).assertEqual(16);
        expect(data.getReadPosition()).assertEqual(4);
        expect(data.readString()).assertEqual("sequence");
        expect(data.getReadPosition()).assertEqual(4 + ("sequence".length * 2 + 8));
        data.rewindRead(5);
        expect(data.getReadPosition()).assertEqual(5);
        expect(data.readInt() != 16).assertTrue();
        expect(data.getReadPosition()).assertEqual(4 + 5);
        expect(data.readString() != "sequence").assertTrue();
        expect(data.getReadPosition()).assertEqual(4 + 5);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0450---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0460
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0460
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0460", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0460---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let token = "";
        for (let i = 0; i < (40 * K - 1); i++) {
          token += "a";
        }
        data.writeString(token);
        expect(data.getReadPosition()).assertEqual(0);
        expect(data.readString().length).assertEqual(40 * K - 1);
        expect(data.getReadPosition()).assertEqual(token.length * 2 + 6);
        data.rewindRead((token.length * 2 + 6) - 1);
        expect(data.getReadPosition()).assertEqual((token.length * 2 + 6) - 1);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0460---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0470
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0470
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0470", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0470---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let token = "";
        for (let i = 0; i < (40 * K - 1); i++) {
          token += "a";
        }
        data.writeString(token);
        expect(data.getReadPosition()).assertEqual(0);
        expect(data.readString().length).assertEqual(40 * K - 1);
        expect(data.getReadPosition()).assertEqual(token.length * 2 + 6);
        data.rewindRead((token.length * 2 + 6) + 1);
        expect(data.getReadPosition()).assertEqual(token.length * 2 + 6);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0470---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0480
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0480
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0480", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0480---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.rewindRead(0);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0480---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0490
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0490
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0490", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0490---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = 2;
        data.writeByte(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_BYTE, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readByte()).assertEqual(token);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0490---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0500
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0500
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0500---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
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
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0500---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0510
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0510
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0510", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0510---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeByte(-129);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_BYTE, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readByte()).assertEqual(127);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0510---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0520
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0520
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0520", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0520---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeByte(128);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_BYTE, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readByte()).assertEqual(-128);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0520---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0530
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0530
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0530", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0530---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeByte(2);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0530---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0540
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0540
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0540", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0540---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.readByte();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0540---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0550
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0550
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0550", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0550---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let short = 8;
        data.writeShort(short);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_SHORT, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readShort()).assertEqual(short);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0550---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0560
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0560
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0560", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0560---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
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
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0560---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0570
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0570
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0570", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0570---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeShort(-32769);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_SHORT, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readShort() == 32767).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0570---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0580
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0580
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0580", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0580---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeShort(32768);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_SHORT, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readShort() == -32768).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0580---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0590
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0590
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0590", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0590---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeShort(0);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0590---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0600
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0600
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0600---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeShort(0);
        data.reclaim();
        data.readShort();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0600---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0610
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0610
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0610", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0610---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = 2;
        data.writeInt(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readInt()).assertEqual(token);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0610---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0620
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0620
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0620", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0620---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
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
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0620---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0630
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0630
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0630", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0630---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeInt(-2147483649);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readInt()).assertEqual(2147483647);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0630---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0640
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0640
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0640", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0640---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeInt(2147483648);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readInt()).assertEqual(-2147483648);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0640---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0650
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0650
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0650", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0650---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeInt(0);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0650---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0660
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0660
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0660", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0660---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeInt(0);
        data.reclaim();
        data.readInt();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0660---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0670
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0670
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0670", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0670---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let long = 9007199254740991;
        data.writeLong(long);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_LONG, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readLong()).assertEqual(long);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0670---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0680
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0680
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0680", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0680---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let long = -9007199254740992;
        data.writeLong(long);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_LONG, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readLong() == long).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0680---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0690
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0690
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0690", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0690---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let long = -9223372036854775300;
        data.writeLong(long);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_LONG, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readLong()).assertEqual(-9223372036854776000);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0690---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0700
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0700
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0700---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let short = 9223372036854775300;
        data.writeLong(short);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_LONG, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let readlong = result.reply.readLong();
          expect(readlong != 0).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0700---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0710
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0710
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0710", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0710---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeLong(0);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0710---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0720
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0720
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0720", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0720---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeLong(0);
        data.reclaim();
        data.readLong();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0720---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0730
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0730
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0730", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0730---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = 2.2;
        data.writeFloat(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readFloat()).assertEqual(token);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0730---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0740
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0740
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0740", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0740---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = 1.4E-45;
        data.writeFloat(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readFloat()).assertEqual(token);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0740---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0750
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0750
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0750", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0750---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = 3.4028235E38;
        data.writeFloat(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readFloat()).assertEqual(token);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0750---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0760
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0760
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0760", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0760---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = (3.4028235E38) + 1;
        data.writeFloat(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readFloat()).assertEqual(3.4028235e+38);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0760---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0770
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0770
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0770", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0770---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = (1.4E-45) - 1;
        data.writeFloat(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readFloat()).assertEqual(-1);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0770---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0780
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0780
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0780", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0780---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeFloat(1.0);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0780---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0790
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0790
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0790", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0790---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeFloat(1.0);
        data.reclaim();
        data.readFloat();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0790---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0800
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0800
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0800---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = 4.9E-324;
        data.writeDouble(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_DOUBLE, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readDouble()).assertEqual(token);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0800---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0810
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0810
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0810", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0810---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = 1.79E+308;
        data.writeDouble(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_DOUBLE, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readDouble()).assertEqual(token);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0810---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0820
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0820
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0820", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0820---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = (4.9E-324) - 1;
        data.writeDouble(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_DOUBLE, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readDouble()).assertEqual(-1);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0820---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0830
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0830
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0830", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0830---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeDouble(1.0);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0830---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0840
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0840
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0840", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0840---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeDouble(1.0);
        data.reclaim();
        data.readDouble();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0840---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0850
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0850
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0850", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0850---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = true;
        data.writeBoolean(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_BOOLEAN, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readBoolean()).assertEqual(token);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0850---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0860
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0860
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0860", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0860---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = false;
        data.writeBoolean(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_BOOLEAN, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readBoolean()).assertEqual(token);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0860---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0870
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0870
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0870", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0870---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeBoolean(true);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0870---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0880
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0880
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0880", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0880---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeBoolean(true);
        data.reclaim();
        data.readBoolean();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0880---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0890
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0890
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0890", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0890---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = 0;
        data.writeChar(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readChar()).assertEqual(token);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0890---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0900
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0900
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0900---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = 255;
        data.writeChar(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readChar()).assertEqual(token);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0900---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0910
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0910
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0910", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0910---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = -1;
        data.writeChar(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readChar()).assertEqual(255);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0910---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0920
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0920
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0920", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0920---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = 256;
        data.writeChar(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readChar()).assertEqual(0);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0920---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0930
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0930
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0930", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0930---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeChar(56);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0930---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0940
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0940
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0940", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0940---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeChar(56);
        data.reclaim();
        data.readChar();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0940---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0950
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0950
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0950", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0950---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let token = "";
        for (let i = 0; i < (40 * K - 1); i++) {
          token += "a";
        }
        data.writeString(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readString()).assertEqual(token);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0950---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0960
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0960
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0960", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0960---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let token = "";
        for (let i = 0; i < 40 * K; i++) {
          token += "a";
        }
        data.writeString(token);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0960---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0970
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0970
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0970", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0970---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeString("rpc");
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0970---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0980
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0980
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0980", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0980---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeString("rpc");
        data.reclaim();
        data.readString();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0980---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_0990
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_0990
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_0990", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_0990---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let sequenceable = new MySequenceable(1, "ipctest");
        data.writeParcelable(sequenceable);
        let ret = new MySequenceable(0, "");
        data.readParcelable(ret);
        expect(ret.str).assertEqual(sequenceable.str);
        expect(ret.num).assertEqual(sequenceable.num);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is: " + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_0990---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1000
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1000
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1000---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let sequenceable = new MySequenceable(1, "ipctest");
        data.writeParcelable(sequenceable);
        let ret = new MySequenceable(1, "");
        data.readParcelable(ret);
        expect(ret.str).assertEqual(sequenceable.str);
        expect(ret.num).assertEqual(sequenceable.num);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1000---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1010
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1010
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1010---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let sequenceable = new MySequenceable(1, "ipctest");
        data.writeParcelable(sequenceable);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_SEQUENCEABLE, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let ret = new MySequenceable(0, "");
          result.reply.readParcelable(ret);
          expect(ret.str).assertEqual(sequenceable.str);
          expect(ret.num).assertEqual(sequenceable.num);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1010---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1020
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1020
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1020---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let sequenceable = new MySequenceable(2, "ipctest");
        data.writeParcelable(sequenceable);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_SEQUENCEABLE, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let ret = new MySequenceable(0, "");
          result.reply.readParcelable(ret);
          expect(ret.str).assertEqual(sequenceable.str);
          expect(ret.num).assertEqual(sequenceable.num);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1020---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1030
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1030
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1030---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let sequenceable = new MySequenceable(1, "ipctest");
        data.reclaim();
        data.writeParcelable(sequenceable);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1030---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1040
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1040
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1040---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let sequenceable = new MySequenceable(1, "ipctest");
        data.writeParcelable(sequenceable);
        let ret = new MySequenceable(0, "");
        data.reclaim();
        data.readParcelable(ret);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1040---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1050
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1050
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1050---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeInt(10);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let ret = new MySequenceable(0, "");
          result.reply.readParcelable(ret);
          expect(ret.str).assertEqual("");
          expect(ret.num).assertEqual(0);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1050---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1060
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1060
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1060---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let ByteArraylet: number[] = [1, 2, 3, 4, 5];
        data.writeByteArray(ByteArraylet);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_BYTEARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readByteArray()).assertDeepEquals(ByteArraylet);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1060---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1070
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1070
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1070---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let ByteArraylet: number[] = [-128, 0, 1, 2, 127];
        data.writeByteArray(ByteArraylet);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_BYTEARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let newArr: number[] = new Array(5);
          result.reply.readByteArray(newArr);
          expect(newArr).assertDeepEquals(ByteArraylet);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1070---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1080
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1080
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1080---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let ByteArraylet: number[] = [];
        for (let i: number = 0; i < (50 * K - 1); i++) {
          ByteArraylet[i] = 1;
        }
        data.writeByteArray(ByteArraylet);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_BYTEARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let newArr: number[] = [];
          result.reply.readByteArray(newArr);
          let assertE = isEqualArray(ByteArraylet,newArr);
          expect(assertE).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1080---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1090
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1090
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1090---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let ByteArraylet: number[] = [-129, 0, 1, 2, 128];
        data.writeByteArray(ByteArraylet);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_BYTEARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let shortArryDataReply: number[] = result.reply.readByteArray();
          expect(shortArryDataReply[0] == 127).assertTrue();
          expect(shortArryDataReply[1] == ByteArraylet[1]).assertTrue();
          expect(shortArryDataReply[2] == ByteArraylet[2]).assertTrue();
          expect(shortArryDataReply[3] == ByteArraylet[3]).assertTrue();
          expect(shortArryDataReply[4] == -128).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1090---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1100
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1100
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1100---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let ByteArraylet: number[] = [];
        for (let i: number = 0; i < 50 * K; i++) {
          ByteArraylet[i] = 1;
        }
        data.writeByteArray(ByteArraylet);
        console.info(logTag + "writeByteArray success");
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1100---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1110
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1110
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1110---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let ByteArrayVar: number[] = [1, 2, 3, 4, 5];
        data.reclaim();
        data.writeByteArray(ByteArrayVar);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1110---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1120
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1120
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1120---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let ByteArrayVar: number[] = [1, 2, 3, 4, 5];
        data.writeByteArray(ByteArrayVar);
        data.reclaim();
        data.readByteArray();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1120---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1130
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1130
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1130---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wShortArryData: number[] = [-1, 0, 1];
        data.writeShortArray(wShortArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_SHORTARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readShortArray()).assertDeepEquals(wShortArryData);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1130---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1140
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1140
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1140---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wShortArryData: number[] = [];
        for (let i: number = 0; i < (50 * 1024 - 1); i++) {
          wShortArryData[i] = 1;
        }
        data.writeShortArray(wShortArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_SHORTARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let rShortArryData: number[] = [];
          result.reply.readShortArray(rShortArryData);
          let assertE = isEqualArray(wShortArryData,rShortArryData);
          expect(assertE).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1140---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1150
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1150
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1150---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wShortArryData: number[] = [-32768, 0, 1, 2, 32767];
        data.writeShortArray(wShortArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_SHORTARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readShortArray()).assertDeepEquals(wShortArryData);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1150---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1160
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1160
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1160---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let eShortArryData: number[] = [-32769, 32768];
        data.writeShortArray(eShortArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_SHORTARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let erShortArryData: number[] = [32767, -32768];
          expect(result.reply.readShortArray()).assertDeepEquals(erShortArryData);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1160---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1170
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1170
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1170---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let eShortArryData: number[] = [];
        for (let i: number = 0; i < 50 * K; i++) {
          eShortArryData[i] = 1;
        }
        data.writeShortArray(eShortArryData);
        console.info(logTag + "writeByteArray success");
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect('e.code' != errCode).assertTrue();
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1170---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1180
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1180
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1180---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let ByteArrayVar: number[] = [1, 2, 3, 4, 5];
        data.reclaim();
        data.writeShortArray(ByteArrayVar);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1180---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1190
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1190
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1190---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let ByteArrayVar: number[] = [1, 2, 3, 4, 5];
        data.writeShortArray(ByteArrayVar);
        data.reclaim();
        data.readShortArray();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1190---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1200
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1200
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1200---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let intArryData: number[] = [100, 111, 112];
        data.writeIntArray(intArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readIntArray()).assertDeepEquals(intArryData);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1200---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1210
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1210
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1210---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let intArryData: number[] = [];
        for (let i: number = 0; i < (50 * K - 1); i++) {
          intArryData[i] = 1;
        };
        data.writeIntArray(intArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let newArr: number[] = [];
          result.reply.readIntArray(newArr);
          let assertE = isEqualArray(intArryData,newArr);
          expect(assertE).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1200---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1220
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1220
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1220---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let intArryData: number[] = [-2147483648, 0, 1, 2, 2147483647];
        data.writeIntArray(intArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readIntArray()).assertDeepEquals(intArryData);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1220---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1230
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1230
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1230---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let intArryData: number[] = [-2147483649, 0, 1, 2, 2147483648];
        data.writeIntArray(intArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let shortArryDataReply: number[] = result.reply.readIntArray();
          expect(shortArryDataReply[0] == 2147483647).assertTrue();
          expect(shortArryDataReply[1] == intArryData[1]).assertTrue();
          expect(shortArryDataReply[2] == intArryData[2]).assertTrue();
          expect(shortArryDataReply[3] == intArryData[3]).assertTrue();
          expect(shortArryDataReply[4] == -2147483648).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1230---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1240
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1240
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1240", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1240---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let intArryData: number[] = [];
        for (let i: number = 0; i < 50 * K; i++) {
          intArryData[i] = 1;
        }
        data.writeIntArray(intArryData);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect('e.code' != errCode).assertTrue();
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1240---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1250
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1250
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1250---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let ByteArrayVar: number[] = [1, 2, 3, 4, 5];
        data.reclaim();
        data.writeIntArray(ByteArrayVar);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1250---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1260
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1260
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1260", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1260---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let ByteArrayVar: number[] = [1, 2, 3, 4, 5];
        data.writeIntArray(ByteArrayVar);
        data.reclaim();
        data.readIntArray();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1260---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1270
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1270
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1270", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1270---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wLongArryData: number[] = [-9007199254740992, 0, 1, 2, 9007199254740991];
        data.writeLongArray(wLongArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_LONGARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let rLongArryData: number[] = [];
          result.reply.readLongArray(rLongArryData);
          expect(rLongArryData).assertDeepEquals(wLongArryData);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1270---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1280
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1280
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1280", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1280---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wLongArryData: number[] = [];
        for (let i: number = 0; i < (25 * K - 1); i++) {
          wLongArryData[i] = 11;
        };
        data.writeLongArray(wLongArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_LONGARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let rLongArryData: number[] = [];
          result.reply.readLongArray(rLongArryData);
          let assertE = isEqualArray(wLongArryData,rLongArryData);
          expect(assertE).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1280---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1290
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1290
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1290", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1290---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wLongArryData: number[] = [-9999999999999999, 9999999999999999];
        data.writeLongArray(wLongArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_LONGARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let rLongArryData: number[] = result.reply.readLongArray();
          let newlongdata: number[] = [-10000000000000000, 10000000000000000];
          expect(rLongArryData[0]).assertEqual(newlongdata[0]);
          expect(rLongArryData[1]).assertEqual(newlongdata[1]);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1290---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1300
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1300
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1300---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let wLongArryData: number[] = [];
        for (let i: number = 0; i < 25 * K; i++) {
          wLongArryData[i] = 11;
        };
        data.writeLongArray(wLongArryData);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect('e.code' != errCode).assertTrue();
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1300---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1310
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1310
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1310", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1310---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let ByteArrayVar: number[] = [1, 2, 3, 4, 5];
        data.reclaim();
        data.writeLongArray(ByteArrayVar);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1310---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1320
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1320
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1320", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1320---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let ByteArrayVar: number[] = [1, 2, 3, 4, 5];
        data.writeLongArray(ByteArrayVar);
        data.reclaim();
        data.readLongArray();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1320---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1330
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1330
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1330", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1330---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wfloatArryData: number[] = [1.4E-45, 1.3, 3.4028235E38];
        data.writeFloatArray(wfloatArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOATARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let newArr: number[] = new Array(3);
          result.reply.readFloatArray(newArr);
          expect(newArr).assertDeepEquals(wfloatArryData);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1330---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1340
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1340
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1340", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1340---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wfloatArryData: number[] = [(1.4E-45) - 1, 1.3, (3.4028235E38) + 1];
        data.writeFloatArray(wfloatArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOATARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let newArr = result.reply.readFloatArray();
          expect(newArr[0]).assertEqual(-1);
          expect(newArr[1]).assertEqual(1.3);
          expect(newArr[2]).assertEqual(3.4028235e+38);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1340---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1350
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1350
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1350---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wfloatArryData: number[] = [];
        for (let i: number = 0; i < (25 * K - 1); i++) {
          wfloatArryData[i] = 1.1;
        };
        data.writeFloatArray(wfloatArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_FLOATARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let rFloatArrayData: number[] = [];
          result.reply.readFloatArray(rFloatArrayData);
          let assertE = isEqualArray(wfloatArryData,rFloatArrayData);
          expect(assertE).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1350---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1360
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1360
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1360", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1300---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let wfloatArryData: number[] = [];
        for (let i: number = 0; i < (25 * K); i++) {
          wfloatArryData[i] = 1.1;
        };
        data.writeFloatArray(wfloatArryData);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect('e.code' != errCode).assertTrue();
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1360---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1370
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1370
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1370", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1370---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let wFloatArray = [1.1, 2.2, 3.3];
        data.reclaim();
        data.writeFloatArray(wFloatArray);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1370---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1380
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1380
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1380", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1380---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let wFloatArray = [1.1, 2.2, 3.3];
        data.writeFloatArray(wFloatArray);
        data.reclaim();
        data.readFloatArray();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1380---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1390
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1390
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1390", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1390---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wDoubleArryData: number[] = [4.9E-324, 235.67, 1.79E+308];
        data.writeDoubleArray(wDoubleArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_DOUBLEARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readDoubleArray()).assertDeepEquals(wDoubleArryData);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1390---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1400
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1400
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1400---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wDoubleArryData: number[] = [];
        for (let i: number = 0; i < (25 * K - 1); i++) {
          wDoubleArryData[i] = 11.1;
        };
        data.writeDoubleArray(wDoubleArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_DOUBLEARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let rDoubleArryData: number[] = [];
          result.reply.readDoubleArray(rDoubleArryData);
          let assertE = isEqualArray(wDoubleArryData,rDoubleArryData);
          expect(assertE).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1400---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1410
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1410
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1410", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1410---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let eDoubleArryData: number[] = [(4.9E-324) - 1, (1.79E+308) + 1];
        data.writeDoubleArray(eDoubleArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_DOUBLEARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let rDoubleArryData = result.reply.readDoubleArray();
          expect(rDoubleArryData[0]).assertEqual(-1);
          expect(rDoubleArryData[1]).assertEqual(1.79e+308);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1410---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1420
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1420
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1420", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1420---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let eDoubleArryData: number[] = [];
        for (let i = 0; i < 25 * K; i++) {
          eDoubleArryData[i] = 11.1;
        }
        data.writeDoubleArray(eDoubleArryData);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect('e.code' != errCode).assertTrue();
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1420---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1430
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1430
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1430", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1430---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let ByteArrayVar = [11.1, 22.2, 33.3];
        data.reclaim();
        data.writeDoubleArray(ByteArrayVar);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1430---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1440
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1440
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1440", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1440---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let ByteArrayVar = [11.1, 22.2, 33.3];
        data.writeDoubleArray(ByteArrayVar);
        data.reclaim();
        data.readDoubleArray();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1440---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1450
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1450
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1450", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1450---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wBooleanArryData: boolean[] = [true, false, false];
        data.writeBooleanArray(wBooleanArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_BOOLEANARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readBooleanArray()).assertDeepEquals(wBooleanArryData);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1450---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1460
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1460
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1460", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1460---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wBooleanArryData: boolean[] = [];
        for (let i: number = 0; i < (50 * K - 1); i++) {
          if (i % 2 == 0) {
            wBooleanArryData[i] = false;
          } else {
            wBooleanArryData[i] = true;
          }
        }
        data.writeBooleanArray(wBooleanArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_BOOLEANARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let rBooleanArryData: boolean[] = [];
          result.reply.readBooleanArray(rBooleanArryData);
          let assertE = isEqualArray(wBooleanArryData,rBooleanArryData);
          expect(assertE).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1460---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1470
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1470
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1470", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1470---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let wBooleanArryData: boolean[] = [];
        for (let i: number = 0; i < 50 * K; i++) {
          if (i % 2 == 0) {
            wBooleanArryData[i] = false;
          } else {
            wBooleanArryData[i] = true;
          };
        }
        data.writeBooleanArray(wBooleanArryData);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect('e.code' != errCode).assertTrue();
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1470---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1480
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1480
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1480", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1480---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let wBooleanArryData = [false, true, false];
        data.reclaim();
        data.writeBooleanArray(wBooleanArryData);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1480---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1490
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1490
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1490", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1490---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let wBooleanArryData = [false, true, false];
        data.writeBooleanArray(wBooleanArryData);
        data.reclaim();
        data.readBooleanArray();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1490---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1500
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1500
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1500---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wCharArryData: number[] = [0, 97, 255];
        data.writeCharArray(wCharArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_CHARARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readCharArray()).assertDeepEquals(wCharArryData);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1500---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1510
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1510
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1510", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1510---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wCharArryData: number[] = [];
        for (let i: number = 0; i < (50 * K - 1); i++) {
          wCharArryData[i] = 96;
        };
        data.writeCharArray(wCharArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_CHARARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let rCharArryData: number[] = [];
          result.reply.readCharArray(rCharArryData);
          let assertE = isEqualArray(wCharArryData,rCharArryData);
          expect(assertE).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1510---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1520
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1520
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1520", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1520---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let errorCharArryData: number[] = [];
        for (let i = 0; i < 50 * K; i++) {
          errorCharArryData[i] = 96;
        };
        data.writeCharArray(errorCharArryData);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect('e.code' != errCode).assertTrue();
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1520---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1530
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1530
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1530", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1530---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let ByteArrayVar: number[] = [97, 98, 88];
        data.reclaim();
        data.writeCharArray(ByteArrayVar);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1530---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1540
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1540
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1540", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1540---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let ByteArrayVar: number[] = [97, 98, 88];
        data.writeCharArray(ByteArrayVar);
        data.reclaim();
        data.readCharArray();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1540---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1550
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1550
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1550", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1550---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wStringArryData: string[] = ["abc", "hello", "beauty"];
        data.writeStringArray(wStringArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRINGARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readStringArray()).assertDeepEquals(wStringArryData);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1550---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1560
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1560
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1560", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1560---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let wStringArryData: string[] = [];
        for (let i = 0; i < (10 * K - 1); i++) {
          wStringArryData[i] = "heddSDF";
        };
        data.writeStringArray(wStringArryData);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRINGARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let rStringArryData: string[] = [];
          result.reply.readStringArray(rStringArryData);
          let assertE = isEqualArray(wStringArryData,rStringArryData);
          expect(assertE).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1560---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1570
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1570
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1570", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1570---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let wStringArryData: string[] = [];
        for (let i = 0; i < 10 * K; i++) {
          wStringArryData[i] = "heddSDF";
        }
        data.writeStringArray(wStringArryData);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect('e.code' != errCode).assertTrue();
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1570---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1580
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1580
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1580", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1580---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let ByteArrayVar = ["abc", "def"];
        data.reclaim();
        data.writeStringArray(ByteArrayVar);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1580---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1590
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1590
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1590", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1590---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let ByteArrayVar: string[] = ["abc", "def"];
        data.writeStringArray(ByteArrayVar);
        data.reclaim();
        data.readStringArray();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1590---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1600
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1600
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1600---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeNoException();
        data.writeInt(6);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_NOEXCEPTION, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          result.reply.readException();
          expect(result.reply.readInt()).assertEqual(6);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1600---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1610
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1610
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1610", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1610---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeNoException();
        data.writeInt(1232222223444);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_NOEXCEPTION, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          result.reply.readException();
          expect(result.reply.readInt() != 1232222223444).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1610---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1620
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1620
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1620", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1620---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeNoException();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1620---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1630
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1630
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1630", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1630---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.readException();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1630---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1640
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1640
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1640", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1640---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let sequenceable = [new MySequenceable(1, "aaa"),
          new MySequenceable(2, "bbb"), new MySequenceable(3, "ccc")];
        data.writeParcelableArray(sequenceable);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_SEQUENCEABLEARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let s = [new MySequenceable(0, ""), new MySequenceable(0, ""),
            new MySequenceable(0, "")];
          result.reply.readParcelableArray(s);
          for (let i = 0; i < s.length; i++) {
            expect(s[i].str).assertEqual(sequenceable[i].str);
            expect(s[i].num).assertEqual(sequenceable[i].num);
          }
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1640---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1650
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1650
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1650", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1650---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let sequenceable = [new MySequenceable(4, "abc"),
          new MySequenceable(5, "bcd"), new MySequenceable(6, "cef")];
        data.writeParcelableArray(sequenceable);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_SEQUENCEABLEARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let s = [new MySequenceable(0, ""),
            new MySequenceable(0, ""), new MySequenceable(0, "")];
          result.reply.readParcelableArray(s);
          for (let i = 0; i < s.length; i++) {
            expect(s[i].str).assertEqual(sequenceable[i].str);
            expect(s[i].num).assertEqual(sequenceable[i].num);
          };
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1650---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1660
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1660
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1660", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1660---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let a = [new MySequenceable(1, "aaa"), new MySequenceable(2, "bbb"),
          new MySequenceable(3, "ccc")];
        data.reclaim();
        data.writeParcelableArray(a);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1660---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1670
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1670
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1670", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1670---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let a = [new MySequenceable(1, "aaa"), new MySequenceable(2, "bbb"),
          new MySequenceable(3, "ccc")];
        let b = [new MySequenceable(0, ""), new MySequenceable(0, ""), new MySequenceable(0, "")];
        data.writeParcelableArray(a);
        data.reclaim();
        data.readParcelableArray(b);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1670---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1680
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1680
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1680", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1680---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
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
          expect(result.reply.readChar()).assertEqual(97);
          expect(result.reply.readString()).assertEqual("HelloWorld");
          let s = new MySequenceable(0,"");
          result.reply.readParcelable(s);
          expect(s.num).assertEqual(1);
          expect(s.str).assertEqual("aaa");
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1680---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1700
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1700
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1700---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeByteArray([1, 2, 3]);
        data.writeShortArray([4, 5, 6]);
        data.writeIntArray([7, 8, 9]);
        data.writeLongArray([10, 11, 12]);
        data.writeFloatArray([1.1, 1.2, 1.3]);
        data.writeDoubleArray([2.1, 2.2, 2.3]);
        data.writeBooleanArray([true, true, false]);
        data.writeCharArray([65, 97, 122]);
        data.writeStringArray(["abc", "seggg"]);
        let a = [new MySequenceable(1, "aaa"), new MySequenceable(2, "bbb"),
          new MySequenceable(3, "ccc")]
        data.writeParcelableArray(a);
        await gIRemoteObject.sendMessageRequest(CODE_ALL_ARRAY_TYPE, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.readByteArray()).assertDeepEquals([1, 2, 3]);
          expect(result.reply.readShortArray()).assertDeepEquals([4, 5, 6]);
          expect(result.reply.readIntArray()).assertDeepEquals([7, 8, 9]);
          expect(result.reply.readLongArray()).assertDeepEquals([10, 11, 12]);
          expect(result.reply.readFloatArray()).assertDeepEquals([1.1, 1.2, 1.3]);
          expect(result.reply.readDoubleArray()).assertDeepEquals([2.1, 2.2, 2.3]);
          expect(result.reply.readBooleanArray()).assertDeepEquals([true, true, false]);
          expect(result.reply.readCharArray()).assertDeepEquals([65, 97, 122]);
          expect(result.reply.readStringArray()).assertDeepEquals(["abc", "seggg"]);
          let b = [new MySequenceable(0, ""), new MySequenceable(0, ""),
            new MySequenceable(0, "")];
          result.reply.readParcelableArray(b);
          for (let i = 0; i < b.length; i++) {
            expect(b[i].str).assertEqual(a[i].str);
            expect(b[i].num).assertEqual(a[i].num);
          }
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1700---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1710
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1710
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1710", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1710---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        data.writeByteArray([1, 2, 3]);
        data.writeShortArray([4, 5, 6]);
        data.writeIntArray([7, 8, 9]);
        data.writeLongArray([10, 11, 12]);
        data.writeFloatArray([1.1, 1.2, 1.3]);
        data.writeDoubleArray([2.1, 2.2, 2.3]);
        data.writeBooleanArray([true, true, false]);
        data.writeCharArray([65, 97, 122]);
        data.writeStringArray(["abc", "seggg"]);
        let a = [new MySequenceable(1, "aaa"), new MySequenceable(2, "bbb"),
          new MySequenceable(3, "ccc")]
        data.writeParcelableArray(a);
        await gIRemoteObject.sendMessageRequest(CODE_ALL_ARRAY_TYPE, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let ByteArray: number[] = new Array();
          result.reply.readByteArray(ByteArray);
          expect(ByteArray).assertDeepEquals([1, 2, 3]);
          let ShortArray: number[] = new Array();
          result.reply.readShortArray(ShortArray);
          expect(ShortArray).assertDeepEquals([4, 5, 6]);
          let IntArray: number[] = new Array();
          result.reply.readIntArray(IntArray);
          expect(IntArray).assertDeepEquals([7, 8, 9]);
          let LongArray: number[] = new Array();
          result.reply.readLongArray(LongArray);
          expect(LongArray).assertDeepEquals([10, 11, 12]);
          let FloatArray: number[] = new Array();
          result.reply.readFloatArray(FloatArray);
          expect(FloatArray).assertDeepEquals([1.1, 1.2, 1.3]);
          let DoubleArray: number[] = new Array();
          result.reply.readDoubleArray(DoubleArray);
          expect(DoubleArray).assertDeepEquals([2.1, 2.2, 2.3]);
          let BooleanArray: boolean[] = new Array();
          result.reply.readBooleanArray(BooleanArray);
          expect(BooleanArray).assertDeepEquals([true, true, false]);
          let CharArray: number[] = new Array();
          result.reply.readCharArray(CharArray);
          expect(CharArray).assertDeepEquals([65, 97, 122]);
          let StringArray: string[] = new Array();
          result.reply.readStringArray(StringArray);
          expect(StringArray).assertDeepEquals(["abc", "seggg"]);
          let b = [new MySequenceable(0, ""), new MySequenceable(0, ""),
            new MySequenceable(0, "")];
          result.reply.readParcelableArray(b);
          for (let i = 0; i < b.length; i++) {
            expect(b[i].str).assertEqual(a[i].str);
            expect(b[i].num).assertEqual(a[i].num);
          }
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1710---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1720
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1720
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1720", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1720---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let listeners = [new TestRemoteObject("rpcListener"), new TestRemoteObject("rpcListener2"), new TestRemoteObject("rpcListener3")];
        data.writeRemoteObjectArray(listeners);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_REMOTEOBJECTARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let rlisteners: Array<rpc.IRemoteObject> = new Array(3);
          result.reply.readRemoteObjectArray(rlisteners);
          for (let index = 0; index < rlisteners.length; index++) {
            expect(rlisteners[index] != null).assertTrue();
            console.info(logTag + " readRemoteObjectArray is success:");
          }
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1720---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1730
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1730
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1730", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1730---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let listeners = [new TestListener("rpcListener", checkResult),new TestListener("rpcListener2", checkResult),
          new TestListener("rpcListener3", checkResult)];
        data.writeRemoteObjectArray(listeners);
        data.writeInt(123);
        data.writeString("rpcListenerTest");
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_REMOTEOBJECTARRAY_1, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.code).assertEqual(CODE_WRITE_REMOTEOBJECTARRAY_1);
          expect(result.data).assertEqual(data);
          expect(result.reply).assertEqual(reply);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1730---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1740
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1740
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1740", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1740---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let listeners = [new TestListener("rpcListener", checkResult),new TestListener("rpcListener2", checkResult),
          new TestListener("rpcListener3", checkResult)];
        data.writeRemoteObjectArray(listeners);
        data.writeInt(123);
        data.writeString("rpcListenerTest");
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_REMOTEOBJECTARRAY_2, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          result.reply.readException();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1740---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1750
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1750
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1750", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1750---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let listeners = [new TestRemoteObject("rpcListener"), new TestRemoteObject("rpcListener2"), new TestRemoteObject("rpcListener3")];
        data.reclaim();
        data.writeRemoteObjectArray(listeners);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1750---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1760
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1760
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1760", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1760---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let listeners = [new TestRemoteObject("rpcListener"), new TestRemoteObject("rpcListener2"), new TestRemoteObject("rpcListener3")];
        data.writeRemoteObjectArray(listeners);
        data.reclaim();
        data.readRemoteObjectArray();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1760---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1770
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1770
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1770", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1770---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      let pathDir = context.filesDir;
      try {
        let filePath = pathDir + "/test1.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        expect(data.containFileDescriptors()).assertFalse();
        rpc.MessageSequence.closeFileDescriptor(file.fd);
        expect(data.containFileDescriptors()).assertFalse();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1770---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1780
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1780
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1780", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1780---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      let pathDir = context.filesDir;
      try {
        let filePath = pathDir + "/test1.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        expect(data.containFileDescriptors()).assertFalse();
        data.writeFileDescriptor(file.fd);
        expect(data.containFileDescriptors()).assertTrue();
        rpc.MessageSequence.closeFileDescriptor(file.fd);
        expect(data.containFileDescriptors()).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1780---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1790
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1790
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1790", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1790---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      let pathDir = context.filesDir;
      try {
        let filePath = pathDir + "/test1.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        let newdescriptor = rpc.MessageSequence.dupFileDescriptor(file.fd);
        expect(newdescriptor != 0).assertTrue();
        expect(data.containFileDescriptors()).assertFalse();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1790---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1800
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1800
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1800---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      let pathDir = context.filesDir;
      try {
        let filePath = pathDir + "/test1.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        data.writeFileDescriptor(file.fd);
        expect(data.containFileDescriptors()).assertTrue();
        let newdescriptor = rpc.MessageSequence.dupFileDescriptor(file.fd);
        expect(newdescriptor != 0).assertTrue();
        expect(data.containFileDescriptors()).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1800---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1810
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1810
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1810", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1810---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      let pathDir = context.filesDir;
      try {
        let filePath = pathDir + "/test1.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        data.writeFileDescriptor(file.fd);
        expect(data.containFileDescriptors()).assertTrue();
        let rdescrt = data.readFileDescriptor();
        expect(rdescrt != 0).assertTrue();
        expect(data.containFileDescriptors()).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1810---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1820
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1820
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1820", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1820---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      let pathDir = context.filesDir;
      try {
        let filePath = pathDir + "/test1.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        data.writeFileDescriptor(file.fd);
        let newdescriptor = rpc.MessageSequence.dupFileDescriptor(file.fd);
        expect(newdescriptor != 0).assertTrue();
        expect(data.containFileDescriptors()).assertTrue();
        let rdescrt = data.readFileDescriptor();
        expect(rdescrt != 0).assertTrue();
        expect(data.containFileDescriptors()).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1820---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1830
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1830
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1830", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1830---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let rdescrt = data.readFileDescriptor();
        expect(rdescrt != 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1830---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1840
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1840
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1840", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1840---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      let pathDir = context.filesDir;
      try {
        let filePath = pathDir + "/test1.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        data.writeFileDescriptor(file.fd);
        expect(data.containFileDescriptors()).assertTrue();
        let rdescrt = data.readFileDescriptor();
        expect(rdescrt != 0).assertTrue();
        let newdescriptor = rpc.MessageSequence.dupFileDescriptor(file.fd);
        expect(newdescriptor != 0).assertTrue();
        let newrdescrt = data.readFileDescriptor();
        expect(newrdescrt != 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1840---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1850
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1850
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1850", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1850---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      let pathDir = context.filesDir;
      try {
        let filePath = pathDir + "/test1.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        data.reclaim();
        data.writeFileDescriptor(file.fd);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1850---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1860
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1860
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1860", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1860---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      let pathDir = context.filesDir;
      try {
        let filePath = pathDir + "/test1.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        data.writeFileDescriptor(file.fd);
        expect(data.containFileDescriptors()).assertTrue();
        data.reclaim();
        let rdescrt = data.readFileDescriptor();
        expect(rdescrt != 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1860---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1870
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1870
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1870", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1870---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      let context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      let pathDir = context.filesDir;
      try {
        let filePath = pathDir + "/test1.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        data.writeFileDescriptor(file.fd);
        expect(data.containFileDescriptors()).assertTrue();
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_FILESDIR, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let rdescrt = result.reply.readFileDescriptor();
          expect(rdescrt != 0).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1870---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1880
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1880
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1880", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1880--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let ashmem = rpc.Ashmem.create("ashmem", K);
        data.writeAshmem(ashmem);
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1880--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1890
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1890
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1890", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1890--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let ashmem = rpc.Ashmem.create("ashmem", K);
        data.writeAshmem(ashmem);
        let ashmemdata = data.readAshmem();
        expect(ashmemdata != null).assertTrue();
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1890--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1900
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1900
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1900--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        data.writeAshmem(null);
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1900--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1910
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1910
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1910", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1910---------------------------");
      let data = rpc.MessageSequence.create();
      try{
        let ashmem = rpc.Ashmem.create("JsAshmemTest", K);
        data.reclaim();
        data.writeAshmem(ashmem);
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1910 ---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1920
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1920
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1920", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1920---------------------------");
      let data = rpc.MessageSequence.create();
      try{
        let ashmem = rpc.Ashmem.create("JsAshmemTest", K);
        data.writeAshmem(ashmem);
        data.reclaim();
        data.readAshmem();
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        expect(data.getSize() == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1920 ---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1930
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1930
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1930", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1930---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try{
        expect(data.getRawDataCapacity()).assertEqual(128 * M);
        data.writeIntArray([1, 2, 3, 4, 5]);
        expect(data.getRawDataCapacity()).assertEqual(128 * M);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          expect(result.reply.getRawDataCapacity()).assertEqual(128 * M);
          expect(result.reply.readIntArray()).assertDeepEquals([1, 2, 3, 4, 5]);
          expect(result.reply.getRawDataCapacity()).assertEqual(128 * M);
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      } finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1930---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1940
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1940
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1940", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1940--------------------");
      let data: rpc.MessageSequence = new rpc.MessageSequence();
      try{
        let TEST_LEN_32K = 32 * K;
        let buffer = new ArrayBuffer(TEST_LEN_32K);
        let size = buffer.byteLength;
        let int32View = new Int32Array(buffer);
        int32View.fill(1);
        data.writeRawDataBuffer(buffer, size);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1940--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1950
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1950
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1950", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1950--------------------");
      let data: rpc.MessageSequence = new rpc.MessageSequence();
      try{
        let TEST_LEN_128M = 128 * M;
        let buffer = new ArrayBuffer(TEST_LEN_128M);
        let size = buffer.byteLength;
        let int32View = new Int32Array(buffer);
        int32View.fill(1);
        data.writeRawDataBuffer(buffer, size);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1950--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1960
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1960
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1960", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1960--------------------");
      let data: rpc.MessageSequence = new rpc.MessageSequence();
      try{
        let TEST_LEN_32K = 32 * K;
        let buffer = new ArrayBuffer(TEST_LEN_32K);
        let int32View = new Int32Array(buffer);
        int32View.fill(1);
        let errSize = 0;
        data.writeRawDataBuffer(buffer, errSize);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1960--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1970
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1970
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1970", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1970--------------------");
      let data: rpc.MessageSequence = new rpc.MessageSequence();
      try{
        let TEST_LEN_32K = 32 * K;
        let buffer = new ArrayBuffer(TEST_LEN_32K);
        let int32View = new Int32Array(buffer);
        int32View.fill(1);
        let errSize = -1;
        data.writeRawDataBuffer(buffer, errSize);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1970--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1980
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1980
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1980", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1980--------------------");
      let data: rpc.MessageSequence = new rpc.MessageSequence();
      try{
        let TEST_LEN_128M = 128 * M;
        let buffer = new ArrayBuffer(TEST_LEN_128M + 4);
        let size = buffer.byteLength;
        let int32View = new Int32Array(buffer);
        int32View.fill(1);
        data.writeRawDataBuffer(buffer, size);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1980--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_1990
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_1990
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_1990", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_1990--------------------");
      let data: rpc.MessageSequence = new rpc.MessageSequence();
      try{
        let TEST_LEN_32K = 32 * K;
        let buffer = new ArrayBuffer(TEST_LEN_32K);
        let size = buffer.byteLength;
        let int32View = new Int32Array(buffer);
        int32View.fill(1);
        data.writeRawDataBuffer(buffer, size);
        let readBuffer = data.readRawDataBuffer(size);
        let readInt32Arr = new Int32Array(readBuffer);
        let assertE = isEqualArrayBuffer(readInt32Arr,int32View);
        expect(assertE).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_1990--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2000
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2000
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2000--------------------");
      let data: rpc.MessageSequence = new rpc.MessageSequence();
      try{
        let TEST_LEN_64K = 64 * K;
        let buffer = new ArrayBuffer(TEST_LEN_64K + 4);
        let size = buffer.byteLength;
        let int32View = new Int32Array(buffer);
        int32View.fill(1);
        data.writeRawDataBuffer(buffer, size);
        let readBuffer = data.readRawDataBuffer(size);
        let readInt32Arr = new Int32Array(readBuffer);
        let assertE = isEqualArrayBuffer(readInt32Arr,int32View);
        expect(assertE).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2000--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2010
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2010
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2010--------------------");
      let data: rpc.MessageSequence = new rpc.MessageSequence();
      try{
        let TEST_LEN_128M = 128 * M;
        let buffer = new ArrayBuffer(TEST_LEN_128M);
        let size = buffer.byteLength;
        let int32View = new Int32Array(buffer);
        int32View.fill(1);
        data.writeRawDataBuffer(buffer, size);
        data.readRawDataBuffer(TEST_LEN_128M + 1);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2010--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2020
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2020
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2020--------------------");
      let data: rpc.MessageSequence = new rpc.MessageSequence();
      try{
        let TEST_LEN_32K = 32 * K;
        let buffer = new ArrayBuffer(TEST_LEN_32K);
        let size = buffer.byteLength;
        let int32View = new Int32Array(buffer);
        int32View.fill(1);
        data.writeRawDataBuffer(buffer, size);
        let readBuffer = data.readRawDataBuffer(0);
        let readInt32Arr = new Int32Array(readBuffer);
        expect(readInt32Arr.length == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2020--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2030
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2030
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2030--------------------");
      let data: rpc.MessageSequence = new rpc.MessageSequence();
      try{
        let TEST_LEN_32K = 32 * K;
        let buffer = new ArrayBuffer(TEST_LEN_32K);
        let size = buffer.byteLength;
        let int32View = new Int32Array(buffer);
        int32View.fill(1);
        data.writeRawDataBuffer(buffer, size);
        let readBuffer = data.readRawDataBuffer(-1);
        let readInt32Arr = new Int32Array(readBuffer);
        expect(readInt32Arr.length == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error).assertEqual(null);
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2030--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2040
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2040
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2040--------------------");
      let data: rpc.MessageSequence = new rpc.MessageSequence();
      try{
        let TEST_LEN_32K = 32 * K;
        let buffer = new ArrayBuffer(TEST_LEN_32K);
        let size = buffer.byteLength;
        let int32View = new Int32Array(buffer);
        int32View.fill(1);
        data.writeRawDataBuffer(buffer, size);
        let readBuffer = data.readRawDataBuffer(TEST_LEN_32K - 1);
        let readInt32Arr = new Int32Array(readBuffer);
        expect(readInt32Arr.length == 0).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2040--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2050
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2050
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2050--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(5);
        let int8View = new Int8Array(buffer);
        for (let i = 0; i < int8View.length; i++) {
          int8View[i] = i + 1;
        };
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2050 int8View is:" + int8View);
        data.writeArrayBuffer(buffer, rpc.TypeCode.INT8_ARRAY);
        let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.INT8_ARRAY);
        let int8Array = new Int8Array(arrayBuffer);
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2050 int8Array is:" + int8Array);

      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2050--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2060
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2060
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2060--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(12);
        let uInt8View = new Uint8Array(buffer);
        for (let i = 0; i < uInt8View.length; i++) {
          uInt8View[i] = i + 10;
        };
        data.writeArrayBuffer(buffer, rpc.TypeCode.UINT8_ARRAY);
        let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.UINT8_ARRAY);
        let uInt8Array = new Uint8Array(arrayBuffer);
        let assertE = isEqualArrayBuffer(uInt8View,uInt8Array);
        expect(assertE).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2060--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2070
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2070
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2070--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(10);
        let int16View = new Int16Array(buffer);
        for (let i = 0; i < int16View.length; i++) {
          int16View[i] = i + 20;
        };
        data.writeArrayBuffer(buffer, rpc.TypeCode.INT16_ARRAY);
        let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.INT16_ARRAY);
        let int16Array = new Int16Array(arrayBuffer);
        let assertE = isEqualArrayBuffer(int16View,int16Array);
        expect(assertE).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2070--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2080
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2080
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2080--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(12);
        let uInt16View = new Uint16Array(buffer);
        for (let i = 0; i < uInt16View.length; i++) {
          uInt16View[i] = i + 20;
        };
        data.writeArrayBuffer(buffer, rpc.TypeCode.UINT16_ARRAY);
        let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.UINT16_ARRAY);
        let uInt16Array = new Uint16Array(arrayBuffer);
        let assertE = isEqualArrayBuffer(uInt16View,uInt16Array);
        expect(assertE).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2080--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2090
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2090
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2090--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(20);
        let int32View = new Int32Array(buffer);
        for (let i = 0; i < int32View.length; i++) {
          int32View[i] = 2 * i + 1;
        };
        data.writeArrayBuffer(buffer, rpc.TypeCode.INT32_ARRAY);
        let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.INT32_ARRAY);
        let int32Array = new Int32Array(arrayBuffer);
        let assertE = isEqualArrayBuffer(int32Array,int32View);
        expect(assertE).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2090--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2100
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2100
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2100--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(12);
        let uInt32View = new Uint32Array(buffer);
        for (let i = 0; i < uInt32View.length; i++) {
          uInt32View[i] = i + 30;
        };
        data.writeArrayBuffer(buffer, rpc.TypeCode.UINT32_ARRAY);
        let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.UINT32_ARRAY);
        let uInt32Array = new Uint32Array(arrayBuffer);
        let assertE = isEqualArrayBuffer(uInt32View,uInt32Array);
        expect(assertE).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2100--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2110
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2110
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2110--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(12);
        let float32View = new Float32Array(buffer);
        for (let i = 0; i < float32View.length; i++) {
          float32View[i] = i + 100;
        };
        data.writeArrayBuffer(buffer, rpc.TypeCode.FLOAT32_ARRAY);
        let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.FLOAT32_ARRAY);
        let float32Array = new Float32Array(arrayBuffer);
        let assertE = isEqualArrayBuffer(float32View,float32Array);
        expect(assertE).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2110--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2120
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2120
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2120--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(24);
        let float64View = new Float64Array(buffer);
        for (let i = 0; i < float64View.length; i++) {
          float64View[i] = i + 200;
        };
        data.writeArrayBuffer(buffer, rpc.TypeCode.FLOAT64_ARRAY);
        let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.FLOAT64_ARRAY);
        let float64Array = new Float64Array(arrayBuffer);
        let assertE = isEqualArrayBuffer(float64View,float64Array);
        expect(assertE).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2120--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2130
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2130
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2130--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(24);
        let int64View = new BigInt64Array(buffer);
        for (let i = 0; i < int64View.length; i++) {
          int64View[i] = BigInt(1110 + i);
        };
        data.writeArrayBuffer(buffer, rpc.TypeCode.BIGINT64_ARRAY);
        let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.BIGINT64_ARRAY);
        let int64Array = new BigInt64Array(arrayBuffer);
        expect(int64View[0]).assertEqual(int64Array[0]);
        expect(int64View[1]).assertEqual(int64Array[1]);
        expect(int64View[2]).assertEqual(int64Array[2]);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2130--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2140
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2140
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2140--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(24);
        let uInt64View = new BigUint64Array(buffer);
        for (let i = 0; i < uInt64View.length; i++) {
          uInt64View[i] = BigInt(i + 40);
        };
        data.writeArrayBuffer(buffer, rpc.TypeCode.BIGUINT64_ARRAY);
        let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.BIGUINT64_ARRAY);
        let Iunt64Array = new BigUint64Array(arrayBuffer);
        expect(uInt64View[0]).assertEqual(Iunt64Array[0]);
        expect(uInt64View[1]).assertEqual(Iunt64Array[1]);
        expect(uInt64View[2]).assertEqual(Iunt64Array[2]);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2140--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2150
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2150
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2150--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(24);
        let uInt64View = new BigUint64Array(buffer);
        for (let i = 0; i < uInt64View.length; i++) {
          uInt64View[i] = BigInt(i + 400);
        };
        data.writeArrayBuffer(buffer, 12);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2150--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2160
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2160
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2160--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(24);
        let uInt64View = new BigUint64Array(buffer);
        for (let i = 0; i < uInt64View.length; i++) {
          uInt64View[i] = BigInt(i + 40);
        };
        data.writeArrayBuffer(buffer, -2);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2160--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2170
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2170
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2170--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(10);
        let int16View = new Int16Array(buffer);
        for (let i = 0; i < int16View.length; i++) {
          int16View[i] = i + 20;
        };
        data.writeArrayBuffer(buffer, rpc.TypeCode.INT16_ARRAY);
        data.readArrayBuffer(13);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2170--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2180
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2180
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2180--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(10);
        let int16View = new Int16Array(buffer);
        for (let i = 0; i < int16View.length; i++) {
          int16View[i] = i + 20;
        };
        data.writeArrayBuffer(buffer, rpc.TypeCode.INT16_ARRAY);
        data.readArrayBuffer(-5);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2180--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2190
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2190
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2190--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(10);
        let int16View = new Int16Array(buffer);
        for (let i = 0; i < int16View.length; i++) {
          int16View[i] = i + 20;
        };
        data.reclaim();
        data.writeArrayBuffer(buffer, rpc.TypeCode.INT16_ARRAY);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2190--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2200
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2200
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2200--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try{
        let buffer = new ArrayBuffer(200);
        let int16View = new Int16Array(buffer);
        for (let i = 0; i < int16View.length; i++) {
          int16View[i] = i + 20;
        };
        data.writeArrayBuffer(buffer, rpc.TypeCode.INT16_ARRAY);
        let arrayBuffer = data.readArrayBuffer(rpc.TypeCode.INT16_ARRAY);
        let int16Array = new Int16Array(arrayBuffer);
        let assertE = isEqualArrayBuffer(int16View,int16Array);
        expect(assertE).assertTrue();
        data.rewindRead(0);
        data.reclaim();
        data.readArrayBuffer(rpc.TypeCode.INT16_ARRAY);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        let e: BusinessError = error as BusinessError;
        let errCode: string = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
        expect(e.code).assertEqual(errCode);
        expect(e.message != null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2200--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2210
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2210
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2210--------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try{
        let buffer1 = new ArrayBuffer(200);
        let int16View = new Int16Array(buffer1);
        for (let i = 0; i < int16View.length; i++) {
          int16View[i] = i + 20;
        };
        let buffer2 = new ArrayBuffer(200);
        let int8View = new Int8Array(buffer2);
        for (let i = 0; i < int8View.length; i++) {
          int8View[i] = i * 2;
        };
        data.writeArrayBuffer(buffer1, rpc.TypeCode.INT16_ARRAY);
        data.writeArrayBuffer(buffer2, rpc.TypeCode.INT8_ARRAY);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_ARRAYBUFFER, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let reply1 = result.reply.readArrayBuffer(rpc.TypeCode.INT8_ARRAY);
          let int8Array = new Int8Array(reply1);
          let reply2 = result.reply.readArrayBuffer(rpc.TypeCode.INT16_ARRAY);
          let int16Array = new Int16Array(reply2);
          let assertE1 = isEqualArrayBuffer(int8View,int8Array);
          expect(assertE1).assertTrue();
          let assertE2 = isEqualArrayBuffer(int16View,int16Array);
          expect(assertE2).assertTrue();
        });
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      }finally{
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2210--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2220
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2220
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2220--------------------");
      try{
        let testab = new TestProxy(gIRemoteObject).asObject();
        expect(testab != null).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2220--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2230
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2230
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("--------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2230--------------------");
      try{
        let testAbilityStub = new TestRemoteObject("testObject");
        expect(testAbilityStub.asObject() != null).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_testcase error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("--------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2230--------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2240
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2240
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2240", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2240---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeString("a");
        let res = data.readString();
        expect(res).assertEqual("a");
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2240 error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2240---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2250
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2250
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2250---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let input ='';
        const targetLength = strlen;
        for (let i = 0; i < targetLength; i++) {
          input += 'a';
        }
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2250 input.length is:" + input.length);
        data.writeString(input);
        let res = data.readString();
        expect(res).assertEqual(input);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2250 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2250 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2250---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2260
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2260
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2260", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2260---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let input ='';
        const targetLength = strlen - 1;
        for (let i = 0; i < targetLength; i++) {
          input += 'a';
        }
        data.writeString(input);
        let res = data.readString();
        expect(res).assertEqual(input);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2260 error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        console.info(logTag + "reclaim done");
        data.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2260---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2270
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2270
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2270", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2270---------------------------");
      try {
       rpc.MessageSequence.closeFileDescriptor(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2270 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2270 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2270 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2270---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2280
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2280
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2280", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2280---------------------------");
      try {
       rpc.MessageSequence.closeFileDescriptor(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2280 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2280 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2280 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2280---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2290
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2290
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2290", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2290---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeRemoteObject(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2290 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2290 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2290 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2290---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2300
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2300
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2300---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeRemoteObject(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2300 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2300 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2300 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2300---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2310
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2310
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2310", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2310---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeInterfaceToken(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2310 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2310 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2310 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2310---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2320
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2320
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2320", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2320---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeInterfaceToken(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2320 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2320 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2320 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2320---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2330
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2330
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2330", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2330---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.setSize(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2330 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2330 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2330 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2330---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2340
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2340
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2340", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2340---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.setSize(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2340 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2340 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2340 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2340---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2350
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2350
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2350---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.setCapacity(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2350 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2350 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2350 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2350---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2360
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2360
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2360", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2360---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.setCapacity(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2360 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2360 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2360 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2360---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2370
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2370
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2370", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2370---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.rewindRead(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2370 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2370 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2370 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2370---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2380
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2380
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2380", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2380---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.rewindRead(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2380 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2380 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2380 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2380---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2390
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2390
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2390", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2390---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.rewindWrite(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2390 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2390 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2390 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2390---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2400
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2400
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2400---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.rewindWrite(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2400 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2400 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2400 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2400---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2410
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2410
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2410", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2410---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeByte(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2410 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2410 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2410 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2410---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2420
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2420
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2420", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2420---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeByte(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2420 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2420 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2420 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2420---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2430
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2430
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2430", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2430---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeShort(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2430 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2430 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2430 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2430---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2440
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2440
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2440", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2440---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeShort(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2440 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2440 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2440 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2440---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2450
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2450
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2450", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2450---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeInt(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2450 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2450 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2450 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2450---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2460
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2460
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2460", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2460---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeInt(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2460 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2460 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2460 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2460---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2470
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2470
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2470", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2470---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeLong(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2470 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2470 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2470 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2470---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2480
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2480
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2480", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2480---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeLong(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2480 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2480 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2480 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2480---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2490
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2490
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2490", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2490---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeFloat(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2490 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2490 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2490 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2490---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2500
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2500
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2500---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeFloat(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2500 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2500 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2500 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2500---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2510
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2510
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2510", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2510---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeDouble(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2510 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2510 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2510 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2510---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2520
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2520
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2520", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2520---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeDouble(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2520 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2520 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2520 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2520---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2530
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2530
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2530", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2530---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeChar(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2530 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2530 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2530 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2530---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2540
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2540
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2540", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2540---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeChar(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2540 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2540 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2540 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2540---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2550
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2550
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2550", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2550---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeParcelable(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2550 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2550 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2550 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2550---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2560
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2560
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2560", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2560---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeParcelable(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2560 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2560 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2560 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2560---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2570
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2570
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2570", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2570---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeByteArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2570 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2570 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2570 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2570---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2580
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2580
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2580", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2580---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeByteArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2580 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2580 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2580 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2580---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2590
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2590
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2590", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2590---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeShortArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2590 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2590 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2590 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2590---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2600
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2600
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2600---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeShortArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2600 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2600 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2600 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2600---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2610
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2610
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2610", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2610---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeIntArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2610 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2610 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2610 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2610---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2620
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2620
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2620", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2620---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeIntArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2620 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2620 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2620 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2620---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2630
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2630
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2630", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2630---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeLongArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2630 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2630 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2630 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2630---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2640
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2640
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2640", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2640---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeLongArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2640 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2640 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2640 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2640---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2650
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2650
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2650", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2650---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeFloatArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2650 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2650 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2650 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2650---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2660
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2660
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2660", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2660---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeFloatArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2660 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2660 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2660 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2660---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2670
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2670
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2670", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2670---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeDoubleArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2670 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2670 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2670 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2670---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2680
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2680
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2680", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2680---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeDoubleArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2680 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2680 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2680 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2680---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2690
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2690
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2690", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2690---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeCharArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2690 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2690 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2690 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2690---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2700
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2700
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2700---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeCharArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2700 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2700 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2700 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2700---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2710
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2710
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2710", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2710---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeStringArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2710 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2710 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2710 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2710---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2720
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2720
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2720", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2720---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeStringArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2720 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2720 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2720 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2720---------------------------");
    });
    
    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2730
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2730
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2730", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2730---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeParcelableArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2730 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2730 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2730 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2730---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2740
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2740
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2740", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2740---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeParcelableArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2740 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2740 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2740 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2740---------------------------");
    });
	
	  /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2750
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2750
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2750", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2750---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let input: Array<rpc.Parcelable> = [];
        data.writeParcelableArray(input);
	    	let res: Array<rpc.Parcelable> = [];
        data.readParcelableArray(res);
        expect(res.length == 0).assertTrue();
      } catch (err) {
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2750 err in catch is: ' + err);
        expect(err == null).assertTrue();
      } finally {
        data.reclaim();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2750 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2750---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2760
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2760
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2760", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2760---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeRemoteObjectArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2760 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2760 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2760 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2760---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2770
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2770
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2770", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2770---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeRemoteObjectArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2770 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2770 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2770 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2770---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2780
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2780
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2780", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2780---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readByteArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2780 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2780 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2780 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2780---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2790
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2790
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2790", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2790---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readByteArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2790 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2790 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2790 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2790---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2800
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2800
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2800---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readShortArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2800 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2800 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2800 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2800---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2810
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2810
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2810", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2810---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readShortArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2810 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2810 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2810 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2810---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2820
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2820
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2820", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2820---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readIntArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2820 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2820 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2820 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2820---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2830
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2830
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2830", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2830---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readIntArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2830 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2830 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2830 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2830---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2840
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2840
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2840", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2840---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readLongArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2840 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2840 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2840 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2840---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2850
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2850
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2850", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2850---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readLongArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2850 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2850 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2850 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2850---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2860
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2860
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2860", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2860---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readFloatArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2860 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2860 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2860 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2860---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2870
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2870
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2870", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2870---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readFloatArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2870 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2870 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2870 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2870---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2880
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2880
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2880", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2880---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readDoubleArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2880 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2880 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2880 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2880---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2890
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2890
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2890", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2890---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readDoubleArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2890 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2890 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2890 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2890---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2900
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2900
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2900---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readCharArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2900 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2900 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2900 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2900---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2910
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2910
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2910", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2910---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readCharArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2910 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2910 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2910 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2910---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2920
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2920
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2920", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2920---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readStringArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2920 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2920 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2920 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2920---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2930
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2930
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2930", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2930---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readStringArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2930 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2930 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2930 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2930---------------------------");
    });
    
    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2940
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2940
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2940", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2940---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readParcelableArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2940 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2940 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2940 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2940---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2950
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2950
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2950", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2950---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readParcelableArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2950 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2950 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2950 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2950---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2960
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2960
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2960", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2960---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readRemoteObjectArray(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2960 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2960 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2960 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2960---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2970
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2970
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2970", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2970---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readRemoteObjectArray(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2970 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2970 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2970 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2970---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2980
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2980
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2980", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2980---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        let a: Array<rpc.IRemoteObject> = [];
        data.writeRemoteObjectArray(a);
        let res: Array<rpc.IRemoteObject> = [];
        data.readRemoteObjectArray(res);
        expect(res.length == 0).assertTrue();
      } catch (err) {
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2980 err in catch is: ' + err);
        expect(err == null).assertTrue();
      } finally {
        data.reclaim();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2980 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2980---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_2990
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_2990
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_2990", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2990---------------------------");
      try {
       rpc.MessageSequence.dupFileDescriptor(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2990 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_2990 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_2990 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_2990---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3000
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3000
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_3000---------------------------");
      try {
       rpc.MessageSequence.dupFileDescriptor(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3000 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3000 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3000 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3000---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3010
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3010
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2990---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeFileDescriptor(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3010 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3010 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3010 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3010---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3020
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3020
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_3020---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeFileDescriptor(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3020 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3020 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3020 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3020---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3030
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3030
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_2990---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeAshmem(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3030 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3030 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3030 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3030---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3040
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3040
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_3040---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeAshmem(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3040 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3040 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3040 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3040---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3050
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3050
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_3050---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let arr = [1, 2, 3, 4, 5]
      try {
        data.writeRawData(null, arr.length);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3050 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3050 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3050 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3050---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3060
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3060
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_3060---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
       let arr = [1, 2, 3, 4, 5]
      try {
        data.writeRawData(undefined, arr.length);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3060 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3060 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3060 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3060---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3070
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3070
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_3070---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let arr = [1, 2, 3, 4, 5]
      try {
        data.writeRawData(arr, null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3070 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3070 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3070 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3070---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3080
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3080
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_3080---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
       let arr = [1, 2, 3, 4, 5]
      try {
        data.writeRawData(arr, undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3080 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3080 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3080 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3080---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3090
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3090
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_3090---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let arr = []
      try {
        data.writeRawData(arr, arr.length);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3090 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3090 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3090 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3090---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3100
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3100
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_3100---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readRawData(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3100 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3100 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3100 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3100---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3110
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3110
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_3110---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readRawData(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3110 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3110 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3110 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3110---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3120
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3120
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_3120---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readRawDataBuffer(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3120 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3120 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3120 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3120---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3130
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3130
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_3110---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.readRawDataBuffer(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3130 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3130 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3130 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3130---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3140
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3140
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_3140---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeArrayBuffer(null, rpc.TypeCode.INT16_ARRAY);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3140 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3140 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3140 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3140---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageSequence_3150
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageSequence_3150
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageSequence_3150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageSequence_3150---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      try {
        data.writeArrayBuffer(undefined, rpc.TypeCode.INT16_ARRAY);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3150 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_MessageSequence_3150 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_MessageSequence_3150 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageSequence_3150---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0010
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0010
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0010---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();

      try{
        data.writeString("a");
        await gIRemoteObject.sendMessageRequest(CODE_MAX, data, reply, option)
        .then((result) => {
          console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0010 CODE_MAX sendMessageRequest success');
         expect(result.errCode).assertEqual(0);
          let res = result.reply.readString();
          expect(res).assertEqual("a");
        }).catch((err: BusinessError) => {
          console.info(logTag +  'SUB_IPC_RemoteObject_sendMessageRequest_0100 err in catch is: ' + err);
          expect(err == null).assertTrue();
        }).finally(() => {
          data.reclaim();
          reply.reclaim();
          console.info(logTag +  'SUB_IPC_RemoteObject_sendMessageRequest_0100 reclaim done');
        })
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteObject_0010 error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0010---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0020
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0020
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0020---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try{
        data.writeString("a");
        await gIRemoteObject.sendMessageRequest(CODE_MAX + 1, data, reply, option)
        .then((result) => {
          console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0020 CODE_MAX + 1 sendMessageRequest success');
          expect(result.errCode).assertEqual(0);
          let res = result.reply.readString();
          expect(res).assertEqual("a");
        }).catch((err: BusinessError) => {
          console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0020 err in catch is: ' + err);
          console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0030 error code is: ' + err.code);
          expect(err != null).assertTrue();
        }).finally(() => {
          data.reclaim();
          reply.reclaim();
          console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0020 reclaim done');
        })
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0020 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0020 error code is: ' + err.code);
        expect(err == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0020---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0030
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0030
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0030---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try{
        data.writeString("a");
        await gIRemoteObject.sendMessageRequest(CODE_MIN - 1, data, reply, option)
        .then((result) => {
          console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0030 CODE_MIN - 1 sendMessageRequest success');
          expect(result.errCode).assertEqual(0);
          let res = result.reply.readString();
          expect(res).assertEqual("a");
        }).catch((err: BusinessError) => {
          console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0030 err in catch is: ' + err);
          console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0030 error code is: ' + err.code);
          expect(err != null).assertTrue();
        }).finally(() => {
          data.reclaim();
          reply.reclaim();
          console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0030 reclaim done');
        })
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0030 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0030 error code is: ' + err.code);
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0030---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0040
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0040
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0040---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();

      try{
        data.writeString("a");
        await gIRemoteObject.sendMessageRequest(CODE_MAX, data, reply, option, sendMessageRequestCallback)
        await sleep(2000);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteObject_0040 error is:" + error);
        expect(error == null).assertTrue();
      } finally {
         data.reclaim();
         reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0040---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0050
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0050
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0050---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try{
        data.writeString("a");
        await gIRemoteObject.sendMessageRequest(CODE_MAX + 1, data, reply, option, sendMessageRequestCallback)
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0050 sendMessageRequestCallback is done');
        await sleep(2000);
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0050 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0050 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0050---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0060
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0060
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0060---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();

      try{
        data.writeString("a");
        await gIRemoteObject.sendMessageRequest(CODE_MIN, data, reply, option, sendMessageRequestCallback)
        await sleep(2000);
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0060 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0060 error code is: ' + err.code);
        expect(err == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0060---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0070
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0070
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0070---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try{
        data.writeString("a");
        await gIRemoteObject.sendMessageRequest(CODE_MIN -1, data, reply, option, sendMessageRequestCallback)
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0070 sendMessageRequestCallback is done');
        await sleep(2000);
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0070 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0070 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0070---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0080
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0080
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0080---------------------------");
      let data: rpc.MessageParcel = rpc.MessageParcel.create();
      let reply: rpc.MessageParcel = rpc.MessageParcel.create();
      let option: rpc.MessageOption = new rpc.MessageOption();

      try{
        data.writeString("a");
        await gIRemoteObject.sendRequest(CODE_MAX, data, reply, option)
        await sleep(2000);
        let res = reply.readString();
        expect(res).assertEqual("a");
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteObject_0080 error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0080---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0090
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0090
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0090---------------------------");
      let data: rpc.MessageParcel = rpc.MessageParcel.create();
      let reply: rpc.MessageParcel = rpc.MessageParcel.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try{
        data.writeString("a");
        await gIRemoteObject.sendRequest(CODE_MAX + 1, data, reply, option)
        await sleep(2000);
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0090 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0090 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0090---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0100
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0100
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0100---------------------------");
      let data: rpc.MessageParcel = rpc.MessageParcel.create();
      let reply: rpc.MessageParcel = rpc.MessageParcel.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try{
        data.writeString("a");
        await gIRemoteObject.sendRequest(CODE_MIN - 1, data, reply, option)
        await sleep(2000);
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0100 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0100 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0100---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0110
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0110
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0110---------------------------");
      let data: rpc.MessageParcel = rpc.MessageParcel.create();
      let reply: rpc.MessageParcel = rpc.MessageParcel.create();
      let option: rpc.MessageOption = new rpc.MessageOption();

      try{
        data.writeString("a");
        await gIRemoteObject.sendRequest(CODE_MAX, data, reply, option, sendRequestCallback)
        await sleep(2000);
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteObject_0110 error is:" + error);
        expect(error == null).assertTrue();
      } finally {
         data.reclaim();
         reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0110---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0120
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0120
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0120---------------------------");
      let data: rpc.MessageParcel = rpc.MessageParcel.create();
      let reply: rpc.MessageParcel = rpc.MessageParcel.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try{
        data.writeString("a");
        await gIRemoteObject.sendRequest(CODE_MAX + 1, data, reply, option, sendRequestCallback)
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0120 sendRequestCallback is done');
        await sleep(2000);
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0120 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0120 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0120---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0130
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0130
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0130---------------------------");
      let data: rpc.MessageParcel = rpc.MessageParcel.create();
      let reply: rpc.MessageParcel = rpc.MessageParcel.create();
      let option: rpc.MessageOption = new rpc.MessageOption();

      try{
        data.writeString("a");
        await gIRemoteObject.sendRequest(CODE_MIN, data, reply, option, sendRequestCallback)
        await sleep(2000);
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0130 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0130 error code is: ' + err.code);
        expect(err == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0130---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0140
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0140
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0140---------------------------");
      let data: rpc.MessageParcel = rpc.MessageParcel.create();
      let reply: rpc.MessageParcel = rpc.MessageParcel.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try{
        data.writeString("a");
        await gIRemoteObject.sendRequest(CODE_MIN - 1, data, reply, option, sendRequestCallback)
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0140 sendRequestCallback is done');
        await sleep(2000);
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0140 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0140 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0140---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0150
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0150
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0150---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();

      try{
        data.writeString("a");
        await gIRemoteObject.sendMessageRequest(CODE_MIN, data, reply, option)
        .then((result) => {
          console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0150 CODE_MIN sendMessageRequest success');
         expect(result.errCode).assertEqual(0);
          let res = result.reply.readString();
          expect(res).assertEqual("a");
        }).catch((err: BusinessError) => {
          console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0150 err in catch is: ' + err);
          expect(err == null).assertTrue();
        }).finally(() => {
          data.reclaim();
          reply.reclaim();
          console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0150 reclaim done');
        })
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteObject_0150 error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0150---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0160
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0160
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0160---------------------------");
      let data: rpc.MessageParcel = rpc.MessageParcel.create();
      let reply: rpc.MessageParcel = rpc.MessageParcel.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try{
        data.writeString("a");
        await gIRemoteObject.sendRequest(CODE_MIN, data, reply, option)
        await sleep(2000);
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0160 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0160 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0160---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0170
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0170
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0170---------------------------");
      try{
       let object = new TestAbilityStub("Test1");
       let res = object.queryLocalInterface("");
       expect(res).assertEqual(null);
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0170 error is: ' + err);
        expect(err == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0170---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0180
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0180
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0180---------------------------");
      try{
       let object = new TestAbilityStub("Test1");
       object.queryLocalInterface(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0180 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0180 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0180---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0190
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0190
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0190---------------------------");
      try{
       let object = new TestAbilityStub("Test1");
       object.queryLocalInterface(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0190 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0190 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0190---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0200
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0200
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0200---------------------------");
      try{
       let object = new TestAbilityStub("Test1");
       let res = object.getLocalInterface("");
       expect(res).assertEqual(null);
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0200 error is: ' + err);
        expect(err == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0200---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0210
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0210
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0210---------------------------");
      try{
       let object = new TestAbilityStub("Test1");
       object.getLocalInterface(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0210 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0210 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0210---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0220
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0220
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0220---------------------------");
      try{
       let object = new TestAbilityStub("Test1");
       object.getLocalInterface(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0220 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0220 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0220---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0230
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0230
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0230---------------------------");
      try{
       let object = new TestAbilityStub("");
       let broker = object.getLocalInterface("")
       let res = object.modifyLocalInterface(broker, "");
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0230 error is: ' + err);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0230---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0240
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0240
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0240", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0240---------------------------");
      try{
       let object = new TestAbilityStub("Test1");
       let broker = object.getLocalInterface('Test1')
       let res = object.modifyLocalInterface(broker, null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0240 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0240 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0240---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0250
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0250
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0250---------------------------");
      try{
       let object = new TestAbilityStub("Test1");
       let broker = object.getLocalInterface('Test1')
       let res = object.modifyLocalInterface(broker, undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0250 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0250 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0250---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0260
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0260
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0260", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0260---------------------------");
      try{
       let object = new TestAbilityStub("Test1");
       let res = object.modifyLocalInterface(null, "test");
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0260 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0260 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0260---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0270
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0270
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0270", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0270---------------------------");
      try{
       let object = new TestAbilityStub("Test1");
       let res = object.modifyLocalInterface(undefined, "test");
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0270 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0270 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0270---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0280
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0280
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0280", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0280---------------------------");
      try{
       let object = new TestAbilityStub("");
       let broker = object.getLocalInterface('')
       let res = object.attachLocalInterface(broker, "");
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0280 error is: ' + err);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0280---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0290
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0290
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0290", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0290---------------------------");
      try{
       let object = new TestAbilityStub("Test1");
       let broker = object.getLocalInterface('Test1')
       let res = object.attachLocalInterface(broker, null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0290 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0290 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0290---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0300
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0300
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0300---------------------------");
      try{
       let object = new TestAbilityStub("Test1");
       let broker = object.getLocalInterface('Test1')
       let res = object.attachLocalInterface(broker, undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0300 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0300 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0300---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0310
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0310
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0310", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0310---------------------------");
      try{
       let object = new TestAbilityStub("Test1");
       let res = object.attachLocalInterface(null, "test");
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0310 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0310 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0310---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteObject_0320
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteObject_0320
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteObject_0320", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteObject_0320---------------------------");
      try{
       let object = new TestAbilityStub("Test1");
       let res = object.attachLocalInterface(undefined, "test");
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0320 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteObject_0320 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteObject_0320---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0010
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0010
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0010---------------------------");
      try {
        let res = gIRemoteObject.getLocalInterface("rpcTestAbility");
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0010 getLocalInterface: " + res);
        expect(res != null).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0010 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0010 error code is: ' + err.code);
        let errCode = `${rpc.ErrorCode.ONLY_REMOTE_OBJECT_PERMITTED_ERROR}`;
        expect(err.code == errCode).assertTrue();
        expect(err.message != null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0010---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0020
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0020
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0020---------------------------");
      try {
        gIRemoteObject.getLocalInterface(null);
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0020 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0020 error code is: ' + err.code);
        expect(err.code == 1900006).assertTrue();
        expect(err.message != null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0020---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0030
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0030
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0030---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        let isDead = gIRemoteObject.isObjectDead();
        expect(isDead == false).assertTrue();
        gIRemoteObject.registerDeathRecipient(recipient, 0);
        let isDead1 = gIRemoteObject.isObjectDead();
        expect(isDead1 == false).assertTrue();
        gIRemoteObject.unregisterDeathRecipient(recipient, 0);
        gIRemoteObject.registerDeathRecipient(recipient, 0);
        gIRemoteObject.unregisterDeathRecipient(recipient, 0);
        gIRemoteObject.unregisterDeathRecipient(recipient, 0);
        let isDead2 = gIRemoteObject.isObjectDead();
        expect(isDead2 == false).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_testcase error: " + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0030---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0040
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0040
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0040---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.registerDeathRecipient(recipient, 0);
        gIRemoteObject.registerDeathRecipient(recipient, 0);
        gIRemoteObject.unregisterDeathRecipient(recipient, 0);
        gIRemoteObject.unregisterDeathRecipient(recipient, 0);
        gIRemoteObject.unregisterDeathRecipient(recipient, 0);
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0040: unregisterDeathRecipient2 is success");
        expect(recipient != null).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_testcase error: " + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0040---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0050
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0050
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0050---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.registerDeathRecipient(recipient, -(2 * G));
        gIRemoteObject.unregisterDeathRecipient(recipient, -(2 * G));
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0050: unregisterDeathRecipient2 is success");
        expect(recipient != null).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_testcase error: " + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0050---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0060
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0060
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0060---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.registerDeathRecipient(recipient, (2 * G - 1));
        gIRemoteObject.unregisterDeathRecipient(recipient, (2 * G - 1));
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0060: unregisterDeathRecipient2 is success");
        expect(recipient != null).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_testcase error: " + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0060---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0070
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0070
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0070---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.registerDeathRecipient(recipient, 2 * G);
        gIRemoteObject.unregisterDeathRecipient(recipient, 2 * G);
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0070: unregisterDeathRecipient2 is success");
        expect(recipient != null).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_testcase error: " + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0070---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0080
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0080
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0080---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.registerDeathRecipient(recipient, -(2 * G + 1));
        gIRemoteObject.unregisterDeathRecipient(recipient, -(2 * G + 1));
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0080: unregisterDeathRecipient is success");
        expect(recipient != null).assertTrue();
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_testcase error: " + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0080---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0090
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0090
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0090---------------------------");
      try {
        let result = gIRemoteObject.getDescriptor();
        expect(result).assertEqual("rpcTestAbility");
      } catch (error) {
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_testcase error: " + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0090---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0100
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0100
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0100---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.addDeathRecipient(null, 0);
      } catch (err ) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0100 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0100 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0100 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0100---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0110
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0110
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0110---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.addDeathRecipient(recipient, null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0110 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0110 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0110 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0110---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0120
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0120
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0120---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.addDeathRecipient(undefined, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0120 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0120 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0120 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0120---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0130
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0130
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0130---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.addDeathRecipient(recipient, undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0130 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0130 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0130 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0130---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0140
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0140
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0140---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.registerDeathRecipient(null, 0);
      } catch (err ) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0140 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0140 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0140 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0140---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0150
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0150
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0150---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.registerDeathRecipient(recipient, null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0150 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0150 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0150 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0150---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0160
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0160
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0160---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.registerDeathRecipient(undefined, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0160 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0160 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0160 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0160---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0170
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0170
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0170---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.registerDeathRecipient(recipient, undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0170 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0170 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0170 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0170---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0180
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0180
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0180---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.removeDeathRecipient(null, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0180 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0180 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0180 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0180---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0190
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0190
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0190---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.removeDeathRecipient(recipient, null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0190 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0190 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0190 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0190---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0200
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0200
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0200---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.removeDeathRecipient(undefined, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0200 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0200 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0200 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0200---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0210
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0210
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0210---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.removeDeathRecipient(recipient, undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0210 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0210 error code is: ' + err.code);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0210 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0210---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0220
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0220
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0220---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.unregisterDeathRecipient(null, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0220 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0220 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0220 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0220---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0230
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0230
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0230---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.unregisterDeathRecipient(recipient, null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0230 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0230 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0230 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0230---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0240
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0240
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0240", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0240---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.unregisterDeathRecipient(undefined, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0240 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0240 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0240 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0240---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0250
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0250
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0250---------------------------");
      try {
        let recipient = new MyregisterDeathRecipient();
        gIRemoteObject.unregisterDeathRecipient(recipient, undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0250 err in catch is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0250 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0250 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0250---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0260
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0260
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0260", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0260---------------------------");
      try {
        gIRemoteObject.getLocalInterface(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0260 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0260 error code is: ' + err.code);
        expect(err.code == 1900006).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0260 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0260---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0270
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0270
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0270", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0270---------------------------");
      try{
        let res = gIRemoteObject.queryLocalInterface("");
        expect(res).assertEqual(null);
      } catch (err) {
        err = err as BusinessError;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0270 error is: ' + err);
        expect(err == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0270---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0280
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0280
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0280", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0280---------------------------");
      try{
        let res = gIRemoteObject.queryLocalInterface(null);
        expect(res == null).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0280 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0280 error code is: ' + err.code);
        expect(err == null).assertTrue();
      } finally {
        expect(testFlag).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0280---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0290
     * @tc.number SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0290
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改RPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0290", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0290---------------------------");
      try{
        let res = gIRemoteObject.queryLocalInterface(undefined);
        expect(res == null).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0290 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0290 error code is: ' + err.code);
        expect(err == null).assertTrue();
      } finally {
        expect(testFlag).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_RemoteProxy_0290---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0010
     * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0010
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0010---------------------------");
      try {
        let remoteObject = new TestRemoteObject("aaa");
        let ret = rpc.IPCSkeleton.flushCommands(remoteObject);
        expect(ret != null).assertTrue();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0010 error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0010---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0030
     * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0030
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0030---------------------------");
      try {
        let remoteObject = null;
        let ret = rpc.IPCSkeleton.flushCommands(remoteObject);
        expect(ret != null).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0030 error is:" + err);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0030 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0030---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0040
     * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0040
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0040---------------------------");
      try {
        let remoteObject = undefined;
        let ret = rpc.IPCSkeleton.flushCommands(remoteObject);
        expect(ret != null).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0040 error is:" + err);
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0040 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0040---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0050
     * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0050
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0050---------------------------");
      try {
        let samgr = rpc.IPCSkeleton.getContextObject();
          expect(samgr != null).assertTrue();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0050 error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0050---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0060
     * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0060
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0060---------------------------");
      try {
        let id = "";
        let ret = rpc.IPCSkeleton.setCallingIdentity(id);
        expect(ret).assertTrue();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0060 error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0060---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0080
     * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0080
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0080---------------------------");
      try {
        let id = "";
        for (let i = 0; i < (40 * K - 1); i++) {
          id += "a";
        };
        let ret = rpc.IPCSkeleton.setCallingIdentity(id);
        expect(ret).assertTrue();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0080 error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0080---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0090
     * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0090
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0090---------------------------");
      try {
        let id = null;
        let ret = rpc.IPCSkeleton.setCallingIdentity(id);
        expect(ret).assertTrue();
        console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0090 ret is:" + ret);
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0090 error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0090---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0100
     * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0100
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0100---------------------------");
      try {
        let id = undefined;
        let ret = rpc.IPCSkeleton.setCallingIdentity(id);
        expect(ret).assertTrue();
        console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0100 ret is:" + ret);
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0100 error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0100---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0110
     * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0110
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0110---------------------------");
      try {
        let getCallingPid = rpc.IPCSkeleton.getCallingPid();
        let getCallingUid = rpc.IPCSkeleton.getCallingUid();
        let callingDeviceID = rpc.IPCSkeleton.getCallingDeviceID();
        let localDeviceID = rpc.IPCSkeleton.getLocalDeviceID();
        let isLocalCalling = rpc.IPCSkeleton.isLocalCalling();
        let id = rpc.IPCSkeleton.resetCallingIdentity();
        console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0110 : " + id);
        let ret = rpc.IPCSkeleton.setCallingIdentity(id);
        expect(getCallingUid != null).assertTrue();
        expect(getCallingPid != null).assertTrue();
        expect(callingDeviceID).assertEqual("");
        expect(localDeviceID).assertEqual("");
        expect(isLocalCalling).assertTrue();
        expect(id).assertEqual("");
        expect(ret).assertTrue();
      } catch (error) {
          console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0110 error is:" + error);
          expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0110---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0120
     * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0120
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0120---------------------------");
      try {
          let remoteObject = new TestRemoteObject("aaa");
          rpc.IPCSkeleton.flushCmdBuffer(remoteObject);
          console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0130 RpcServer: flushCmdBuffer is success");
      } catch (error) {
          console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0120 error is:" + error);
          expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0120---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0140
     * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0140
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0140---------------------------");
      try {
        let remoteObject = null;
        rpc.IPCSkeleton.flushCmdBuffer(remoteObject);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0140 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0140 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0140 reclaim done");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0140---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0150
     * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0150
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0150---------------------------");
      try {
        let remoteObject = undefined;
        rpc.IPCSkeleton.flushCmdBuffer(remoteObject);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0150 error is: ' + err);
        console.info(logTag +  'SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0150 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err != null).assertTrue();
    } finally {
        expect(testFlag).assertFalse();
        console.info(logTag + "SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0140 reclaim done");
    }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0150---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0160
     * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0160
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0160---------------------------");
      try {
          let id = "";
          rpc.IPCSkeleton.restoreCallingIdentity(id);
          console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0160 restoreCallingIdentity is success");
      } catch (error) {
          console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0160 error is:" + error);
          expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0160---------------------------");
    });

    /**
      * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0180
      * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0180
      * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0180---------------------------");
      try {
          let id = "";
          for (let i = 0; i < (40 * K - 1); i++) {
              id += "a";
          };
          rpc.IPCSkeleton.restoreCallingIdentity(id);
          console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0180 restoreCallingIdentity is success");
      } catch (error) {
          console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0180 error is:" + error);
          expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0180---------------------------");
    });

    /**
      * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0190
      * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0190
      * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0190---------------------------");
      try {
          let id = null;
          rpc.IPCSkeleton.restoreCallingIdentity(id);
      } catch (error) {
          console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0190 error is:" + error);
          expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0190---------------------------");
    });

    /**
      * @tc.name   SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0200
      * @tc.number SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0200
      * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0200---------------------------");
      try {
          let id = undefined;
          rpc.IPCSkeleton.restoreCallingIdentity(id);
      } catch (error) {
          console.info("SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0200 error is:" + error);
          expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_IPCSkeleton_0200---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0010
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0010
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0010---------------------------");
      let option : rpc.MessageOption = new rpc.MessageOption();
      let tftime : number = rpc.MessageOption.TF_WAIT_TIME;
      try {
        let time = option.getWaitTime();
        expect(time).assertEqual(tftime);
        option.setWaitTime(16);
        let time2 = option.getWaitTime();
        expect(time2).assertEqual(16);
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0010---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0020
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0020
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0020---------------------------");
      let option : rpc.MessageOption = new rpc.MessageOption();
      let tftime : number = rpc.MessageOption.TF_WAIT_TIME;
      try {
        let time = option.getWaitTime();
        expect(time).assertEqual(tftime);
        option.setWaitTime(0);
        let time2 = option.getWaitTime();
        expect(time2).assertEqual(tftime);
        option.setWaitTime(60);
        let time3 = option.getWaitTime();
        expect(time3).assertEqual(60);
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0020---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0030
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0030
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0030---------------------------");
      let option : rpc.MessageOption = new rpc.MessageOption();
      let tftime : number = rpc.MessageOption.TF_WAIT_TIME;
      try {
        let option = new rpc.MessageOption();
        let time = option.getWaitTime();
        expect(time).assertEqual(tftime);
        option.setWaitTime(-1);
        let time2 = option.getWaitTime();
        expect(time2).assertEqual(tftime);
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0030---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0040
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0040
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0040---------------------------");
      let option : rpc.MessageOption = new rpc.MessageOption();
      let tftime : number = rpc.MessageOption.TF_WAIT_TIME;
      try {
        let time = option.getWaitTime();
        expect(time).assertEqual(tftime);
        option.setWaitTime(61);
        let time2 = option.getWaitTime();
        expect(time2).assertEqual(61);
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0040---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0050
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0050
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0050---------------------------");
      let option : rpc.MessageOption = new rpc.MessageOption();
      let tfsync : number = rpc.MessageOption.TF_SYNC;
      let tfasync : number = rpc.MessageOption.TF_ASYNC;
      try {
        let flog = option.getFlags();
        expect(flog).assertEqual(tfsync);
        option.setFlags(1);
        let flog2 = option.getFlags();
        expect(flog2).assertEqual(tfasync);
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0050---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0060
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0060
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0060---------------------------");
      let option : rpc.MessageOption = new rpc.MessageOption();
      let tfsync : number = rpc.MessageOption.TF_SYNC;
      let tfasync : number = rpc.MessageOption.TF_ASYNC;
      try {
        let flog = option.getFlags();
        expect(flog).assertEqual(tfsync);
        option.setFlags(1);
        let flog2 = option.getFlags();
        expect(flog2).assertEqual(tfasync);
        option.setFlags(0);
        let flog3 = option.getFlags();
        expect(flog3).assertEqual(tfasync);
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0060---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0070
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0070
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0070---------------------------");
      let option : rpc.MessageOption = new rpc.MessageOption();
      let tfsync : number = rpc.MessageOption.TF_SYNC;
      try {
        let flog = option.getFlags();
        expect(flog).assertEqual(tfsync);
        option.setFlags(-1);
        let flog2 = option.getFlags();
        expect(flog2).assertEqual(-1);
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0070---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0080
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0080
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0080---------------------------");
      let option : rpc.MessageOption = new rpc.MessageOption();
      let tfsync : number = rpc.MessageOption.TF_SYNC;
      try {
        let flog = option.getFlags();
        expect(flog).assertEqual(tfsync);
        option.setFlags(3);
        let flog2 = option.getFlags();
        expect(flog2).assertEqual(3);
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0080---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0090
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0090
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0090---------------------------");
      try {
        expect(rpc.MessageOption.TF_SYNC).assertEqual(0);
        expect(rpc.MessageOption.TF_ASYNC).assertEqual(1);
        expect(rpc.MessageOption.TF_WAIT_TIME).assertEqual(8);
        expect(rpc.MessageOption.TF_ACCEPT_FDS).assertEqual(0x10);
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0090---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0100
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0100
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0100---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        option.setWaitTime(20);
        option.setFlags(0);
        let token = "option";
        data.writeString(token);
        expect(option.getFlags()).assertEqual(0);
        expect(option.getWaitTime()).assertEqual(20);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
          let replyReadResult = result.reply.readString();
          expect(replyReadResult).assertEqual(token);
          expect(option.getFlags()).assertEqual(0);
          expect(option.getWaitTime()).assertEqual(20);
        });
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0100---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0110
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0110
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0110---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        option.setFlags(1);
        let token = "option";
        data.writeString(token);
        expect(option.getFlags()).assertEqual(1);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
          let replyReadResult = result.reply.readString();
          expect(replyReadResult).assertEqual("");
          expect(option.getFlags()).assertEqual(1);
        });
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0110---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0120
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0120
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0120---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        option.setFlags(3);
        let token = "option";
        data.writeString(token);
        expect(option.getFlags()).assertEqual(3);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
          let replyReadResult = result.reply.readString();
          expect(replyReadResult).assertEqual("");
          expect(option.getFlags()).assertEqual(3);
        });
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0120---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0130
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0130
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0130---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        option.setFlags(1);
        let token = "option";
        data.writeString(token);
        expect(option.getFlags()).assertEqual(1);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
          let replyReadResult = result.reply.readString();
          expect(replyReadResult).assertEqual("");
          expect(option.getFlags()).assertEqual(1);
        });
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0130---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0140
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0140
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0140---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
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
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0140---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0150
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0150
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0150---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        option.setAsync(true);
        let token = "option";
        data.writeString(token);
        expect(gIRemoteObject != undefined).assertTrue();
        await gIRemoteObject.sendMessageRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
          expect(result.errCode).assertEqual(0);
          let isAsyncData = option.isAsync();
          expect(isAsyncData).assertTrue();
          let replyReadResult = result.reply.readString();
          expect(replyReadResult).assertEqual("");
        });
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0150---------------------------");
    })


    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0160
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0160
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0160---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
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
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption error is:" + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0160---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0170
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0170
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0170---------------------------");
      let option : rpc.MessageOption = new rpc.MessageOption();
      let tftime : number = rpc.MessageOption.TF_WAIT_TIME;
      try {
        let time = option.getWaitTime();
        expect(time).assertEqual(tftime);
        option.setWaitTime(0);
        let time2 = option.getWaitTime();
        expect(time2).assertEqual(tftime);
        option.setWaitTime(3000);
        let time3 = option.getWaitTime();
        expect(time3).assertEqual(3000);
        option.setWaitTime(3000 + 1);
        let time4 = option.getWaitTime();
        expect(time4).assertEqual(3000);
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption_0170 error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0170---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0180
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0180
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0180---------------------------");
      let option : rpc.MessageOption = new rpc.MessageOption();
      try {
        option.setFlags(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_MessageOption_0180 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_MessageOption_0180 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption_0180 ashmem is close");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0180---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_MessageOption_0190
     * @tc.number SUB_DSoftbus_IPC_API_Stage_MessageOption_0190
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_MessageOption_0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_MessageOption_0190---------------------------");
      let option : rpc.MessageOption = new rpc.MessageOption();
      try {
        option.setFlags(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_MessageOption_0190 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_MessageOption_0190 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info("SUB_DSoftbus_IPC_API_Stage_MessageOption_0190 ashmem is close");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_MessageOption_0190---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0010
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0010
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0010---------------------------");
      try {
        let mapSize = 2 * G - 1;
        let ashmem = rpc.Ashmem.create("JsAshmemTest", mapSize);
        let size = ashmem.getAshmemSize();
        expect(size).assertEqual(mapSize);
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0010---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0020
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0020
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0020---------------------------");
      try {
        let mapSize = 2 * G;
        let ashmem = rpc.Ashmem.create("JsAshmemTest ", mapSize);
        ashmem.getAshmemSize();
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        expect(error != null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0020---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0030
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0030
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0030---------------------------");
        try {
            let mapSize = K;
            let ashmem = rpc.Ashmem.create("JsAshmemTest", mapSize);
            let ashmem2 = rpc.Ashmem.create(ashmem);
            let size = ashmem2.getAshmemSize();
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0030: size " + size);
            expect(size).assertEqual(mapSize);
        } catch (error) {
            console.info("SUB_DSoftbus_IPC_API_Ashmem error is:" + error);
            expect(error == null).assertTrue();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0030---------------------------");
    })    

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0040
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0040
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0040---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("JsAshmemTest", 4 * K);
        let result = ashmem.mapTypedAshmem(rpc.Ashmem.PROT_READ | rpc.Ashmem.PROT_WRITE);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0040: run mapTypedAshmem is success" + result);
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0040---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0050
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0050
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0050---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("JsAshmemTest", (2 * G - 1))
        ashmem.mapTypedAshmem(999);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0050: run mapTypedAshmem is success");
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        expect(error.code == 401).assertTrue();
        expect(error.message != null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0050---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0060
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0060
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0060---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("JsAshmemTest", (2 * G))
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0060: ashmem " + ashmem);
        let result = ashmem.mapTypedAshmem(rpc.Ashmem.PROT_READ | rpc.Ashmem.PROT_WRITE);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0060: run mapTypedAshmem is success");
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        expect(error.message != null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0060---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0070
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0070
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0070---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("JsAshmemTest", K);
        ashmem.mapReadWriteAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0070: run mapReadWriteAshmem is success");
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0070---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0080
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0080
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0080---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("JsAshmemTest", 4096);
        ashmem.mapTypedAshmem(rpc.Ashmem.PROT_READ);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0080: run mapTypedAshmem is success");
        ashmem.unmapAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0080: run unmapAshmem success");
        ashmem.mapReadWriteAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0080: run mapReadWriteAshmem is success");
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0080---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0090
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0090
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0090---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("JsAshmemTest", 4096);
        ashmem.mapReadonlyAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0090: run mapReadonlyAshmem is success");
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0090---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0100
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0100
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0100---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("JsAshmemTest", K);
        ashmem.setProtectionType(rpc.Ashmem.PROT_WRITE);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0100: run setProtectionType is success");
        ashmem.setProtectionType(rpc.Ashmem.PROT_READ);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0100: run setProtectionType is success");
        ashmem.mapReadWriteAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0100: run mapReadWriteAshmem success");
        ashmem.setProtectionType(rpc.Ashmem.PROT_NONE);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0100: run setProtectionType is success");
        ashmem.setProtectionType(rpc.Ashmem.PROT_READ);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0100: run setProtectionType is success");
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0100---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0110
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0110
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0110---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("JsAshmemTest", K);
        ashmem.setProtectionType(3);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0110: run setProtectionType is success");
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0110---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0120
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0120
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0120---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("JsAshmemTest", K);
        ashmem.setProtectionType(rpc.Ashmem.PROT_EXEC);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0120: run setProtectioniswrite is success");
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0120---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0130
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0130
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0130---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("JsAshmemTest", K);
        ashmem.mapTypedAshmem(rpc.Ashmem.PROT_WRITE);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0130: run mapTypedAshmem is success");
        ashmem.unmapAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0130: run unmapAshmem success");
        ashmem.closeAshmem();
        ashmem.mapReadonlyAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0130: run mapReadonlyAshmem is success");
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        expect(error == null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0130---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0140
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0140
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0140---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("ashmem", (2 * G + 1));
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0140: ashmem " + ashmem);
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(error.code == errCode).assertTrue();
        expect(error.message != null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0140---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0150
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0150
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0150---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("ashmem", (4 * G - 1));
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0150: ashmem " + ashmem);
        ashmem.mapReadWriteAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0150: run mapReadWriteAshmem is success");
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        let errCode = `${rpc.ErrorCode.OS_MMAP_ERROR}`;
        expect(error.code != errCode).assertTrue();
        expect(error.message != null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0150---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0160
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0160
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0160---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("ashmem", 0);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0160: ashmem " + ashmem);
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(error.code == errCode).assertTrue();
        expect(error.message != null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0160---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0170
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0170
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0170---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
        ashmem.setProtectionType(0);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0170: run setProtectionType is success");
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        expect(error == null).assertTrue();
        expect(error).assertEqual(null);
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0170---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0180
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0180
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0180---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
        ashmem.setProtectionType(null);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0180: run setProtectionType is success");
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        let errCode = `${rpc.ErrorCode.OS_IOCTL_ERROR}`;
        expect(error.code != errCode).assertTrue();
        expect(error.message != null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0180---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0190
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0190
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0190---------------------------");
      try {
        let mapSize = 2 * G;
        let ashmem = rpc.Ashmem.create("JsAshmemTest ", mapSize);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0190: run  create success " + ashmem);
        let size = ashmem.getAshmemSize();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0190: run getAshmemSize success, size is " + size);
        expect(size).assertEqual(mapSize);
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(error.code == errCode).assertTrue();
        expect(error != null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0190---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0200
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0200
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0200---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("JsAshmemTest", (2 * G - 1));
        let result = ashmem.mapTypedAshmem(999);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0200: run mapAshmemis is " + result);
        expect(result).assertEqual(false);
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(error.code == errCode).assertTrue();
        expect(error != null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0200---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0210
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0210
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0210---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("JsAshmemTest", (2 * G - 1));
        let result = ashmem.mapTypedAshmem(999);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0210: run mapTypedAshmem is success");
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        let errCode = `${rpc.ErrorCode.OS_MMAP_ERROR}`;
        expect(error.code != errCode).assertTrue();
        expect(error != null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0210---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0220
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0220
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0220---------------------------");
      try {
        let ashmem = rpc.Ashmem.create("JsAshmemTest", (2 * G - 1));
        let result = ashmem.mapTypedAshmem(rpc.Ashmem.PROT_READ | rpc.Ashmem.PROT_WRITE);
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0220: run mapTypedAshmem is success");
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      } catch (error) {
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem error is:" + error);
        let errCode = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
        expect(error.code != errCode).assertTrue();
        expect(error != null).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0220---------------------------");
    })

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0230
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0230
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0230---------------------------");
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
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0230 error is:" + error);
            expect(error == null).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0230---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0240
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0240
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0240", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0240---------------------------");
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
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0240 error is:" + error);
            expect(error == null).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0240---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0250
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0250
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0250---------------------------");
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
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0250 error is:" + error);
            expect(error.code == 1900003).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0250---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0260
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0260
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0260", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0260---------------------------");
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
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0260 error is:" + error);
            expect(error.code == 1900003).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0260---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0270
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0270
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0270", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0270---------------------------");
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
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0270 error is:" + error);
            expect(error.code == 1900003).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0270---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0280
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0280
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0280", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0280---------------------------");
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
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0280 error is:" + error);
            expect(error.code == 1900003).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0280---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0290
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0290
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0290", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0290---------------------------");
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
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0290 error is:" + error);
            expect(error.code == 1900003).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0290---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0300
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0300
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0300---------------------------");
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
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0300 error is:" + error);
            expect(error.code == 1900003).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0300---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0310
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0310
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0310", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0310---------------------------");
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
            let assertE = isEqualArrayBuffer(readInt32Arr,ashnenInt32Arr);
            expect(assertE).assertTrue();
        } catch (error) {
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0310 error is:" + error);
            expect(error== null).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0310---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0320
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0320
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0320", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0320---------------------------");
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
            let assertE = isEqualArrayBuffer(readInt32Arr,ashnenInt32Arr);
            expect(assertE).assertTrue();
        } catch (error) {
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0320 error is:" + error);
            expect(error== null).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0320---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0330
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0330
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0330", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0330---------------------------");
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
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0330 error is:" + error);
            expect(error.code == 1900004).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0330---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0340
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0340
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0340", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0340---------------------------");
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
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0340 error is:" + error);
            expect(error.code == 1900004).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0340---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0350
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0350
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0350---------------------------");
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
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0350 error is:" + error);
            expect(error.code == 1900004).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0350---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0360
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0360
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0360", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0360---------------------------");
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
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0360 error is:" + error);
            expect(error.code == 1900004).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0360---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0370
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0370
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0370", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0370---------------------------");
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
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0370 error is:" + error);
            expect(error.code == 1900004).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0370---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0380
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0380
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0380", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0380---------------------------");
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
            console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0380 error is:" + error);
            expect(error.code == 1900004).assertTrue();
        } finally {
            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            data.reclaim();
        }
        console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0380---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0390
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0390
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0390", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0390---------------------------");
      let ashmem: rpc.Ashmem;
      try {
        ashmem = rpc.Ashmem.createAshmem('', 1024 * 1024);
        expect(ashmem == undefined).assertTrue();
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0390 ashmem is: ' + ashmem);
      } catch (err) {
          err = err as BusinessError;
          testFlag = false;
          console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0390 error is: ' + err);
          console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0390 error code is: ' + err.code);
          expect(err.message != null).assertTrue();
      } finally {
          expect(testFlag).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0390---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0400
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0400
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0400---------------------------");
      let ashmem: rpc.Ashmem;
      try {
        ashmem = rpc.Ashmem.createAshmem(null, 1024 * 1024);
        expect(ashmem == undefined).assertTrue();
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0400 ashmem is: ' + ashmem);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0400 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0400 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
          expect(testFlag).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0400---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0410
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0410
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0410", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0410---------------------------");
      let ashmem: rpc.Ashmem;
      try {
        ashmem = rpc.Ashmem.createAshmem(undefined, 1024 * 1024);
        expect(ashmem == undefined).assertTrue();
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0410 ashmem is: ' + ashmem);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0410 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0410 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0410---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0420
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0420
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0420", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0420---------------------------");
      let ashmem: rpc.Ashmem;
      try {
        ashmem = rpc.Ashmem.createAshmem("ashmemtest", null);
        expect(ashmem == undefined).assertTrue();
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0420 ashmem is: ' + ashmem);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0420 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0420 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
          expect(testFlag).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0420---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0430
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0430
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0430", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0430---------------------------");
      let ashmem: rpc.Ashmem;
      try {
        ashmem = rpc.Ashmem.createAshmem("ashmemtest", undefined);
        expect(ashmem == undefined).assertTrue();
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0430 ashmem is: ' + ashmem);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0430 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0430 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0430---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0440
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0440
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0440", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0440---------------------------");
      let ashmem: rpc.Ashmem;
      try {
        ashmem = rpc.Ashmem.create('', 1024 * 1024);
        expect(ashmem != null).assertTrue();
      } catch (error) {
          console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0440 error is:" + error);
          expect(error != null).assertTrue();
      } finally {
          console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0440 ashmem is close");
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0440---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0450
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0450
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0450", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0450---------------------------");
      let ashmem: rpc.Ashmem;
      try {
        ashmem = rpc.Ashmem.create(null, 1024 * 1024);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0450 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0450 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
          expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0450---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0460
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0460
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0460", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0460---------------------------");
      let ashmem: rpc.Ashmem;
      try {
         ashmem = rpc.Ashmem.create(null, 1024 * 1024);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0460 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0460 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0460---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0470
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0470
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0470", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0470---------------------------");
      let ashmem: rpc.Ashmem;
      try {
        ashmem = rpc.Ashmem.create("ashmemtest", null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0470 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0470 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
          expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0470---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0480
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0480
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0480", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0480---------------------------");
      let ashmem: rpc.Ashmem;
      try {
         ashmem = rpc.Ashmem.create("ashmemtest", undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0480 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0480 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0480---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0490
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0490
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0490", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0490---------------------------");
      let ashmem: rpc.Ashmem;
      try {
        ashmem = rpc.Ashmem.create(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0490 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0490 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
          expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0490---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0500
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0500
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0500---------------------------");
      let ashmem: rpc.Ashmem;
      try {
         ashmem = rpc.Ashmem.create(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0500 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0500 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0500---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0510
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0510
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0510", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0510---------------------------");
      let ashmem: rpc.Ashmem;
      try {
        ashmem = rpc.Ashmem.createAshmemFromExisting(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0510 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0510 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
          expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0510---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0520
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0520
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0520", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0520---------------------------");
      let ashmem: rpc.Ashmem;
      try {
         ashmem = rpc.Ashmem.createAshmemFromExisting(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0520 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0520 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0520---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0530
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0530
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0530", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0530---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      try {
        let res = ashmem.mapAshmem(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0530 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0530 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0530---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0540
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0540
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0540", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0540---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      try {
        let res = ashmem.mapAshmem(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0540 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0540 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0540---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0550
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0550
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0550", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0550---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      try {
        let res = ashmem.mapTypedAshmem(null);
       
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0550 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0550 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0550---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0560
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0560
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0560", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0560---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      try {
        let res = ashmem.mapTypedAshmem(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0560 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0560 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0560---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0570
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0570
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0570", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0570---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      try {
        let res = ashmem.setProtectionType(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0570 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0570 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0570---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0580
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0580
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0580", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0580---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      try {
        
        let res = ashmem.setProtectionType(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0580 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0580 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0580---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0590
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0590
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0590", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0590---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      try {
        let res = ashmem.setProtection(null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0590 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0590 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0590---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0600
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0600
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0600---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      try {
        let res = ashmem.setProtection(undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0600 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0600 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0600---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0610
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0610
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0610", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0610---------------------------");
      let ashmem: rpc.Ashmem;
      let ByteArray = [1, 2, 3, 4, 5];
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.writeToAshmem(null, 5, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0610 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0610 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0610---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0620
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0620
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0620", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0620---------------------------");
      let ashmem: rpc.Ashmem;
      let ByteArray = [1, 2, 3, 4, 5];
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      try {
        ashmem.mapReadWriteAshmem();
        ashmem.writeToAshmem(undefined, 5, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0620 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0620 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0620 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0620---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0630
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0630
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0630", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0630---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        let ByteArray = [1, 2, 3, 4, 5];
        ashmem.writeToAshmem(ByteArray, null, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0630 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0630 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0630 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0630---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0640
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0640
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0640", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0640---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        let ByteArray = [1, 2, 3, 4, 5];
        ashmem.writeToAshmem(ByteArray, undefined, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0640 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0640 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0640 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0640---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0650
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0650
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0650", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0650---------------------------");
      let ashmem: rpc.Ashmem;
      let ByteArray = [1, 2, 3, 4, 5];
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.writeToAshmem(ByteArray, 5, null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0650 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0650 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0650 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0650---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0660
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0660
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0660", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0660---------------------------");
      let ashmem: rpc.Ashmem;
      let ByteArray = [1, 2, 3, 4, 5];
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.writeToAshmem(ByteArray, 5, undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0660 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0660 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0660 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0660---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0670
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0670
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0670", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0670---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.writeDataToAshmem(null, 5, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0670 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0670 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0670 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0670---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0680
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0680
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0680", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0680---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        let ByteArray = [1, 2, 3, 4, 5];
        ashmem.writeDataToAshmem(undefined, 5, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0680 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0680 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0680 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0680---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0690
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0690
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0690", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0690---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
        ashmem.mapReadWriteAshmem();
      try {
        let buffer = new ArrayBuffer(1 * 10); 
        let int8View = new Int8Array(buffer);
        for (let i = 0; i < int8View.length; i++) {
          int8View[i] = i * 2 + 1;
          if (i % 2 != 0) {
            int8View[i] = -int8View[i];
          }
        }
        ashmem.writeDataToAshmem(buffer, null, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0690 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0690 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0690 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0690---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0700
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0700
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0700---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        let buffer = new ArrayBuffer(1 * 10); 
        let int8View = new Int8Array(buffer);
        for (let i = 0; i < int8View.length; i++) {
          int8View[i] = i * 2 + 1;
          if (i % 2 != 0) {
            int8View[i] = -int8View[i];
          }
        }
        ashmem.writeDataToAshmem(buffer, undefined, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0700 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0700 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0700 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0700---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0710
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0710
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0710", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0710---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        let buffer = new ArrayBuffer(1 * 10); 
        let int8View = new Int8Array(buffer);
        for (let i = 0; i < int8View.length; i++) {
          int8View[i] = i * 2 + 1;
          if (i % 2 != 0) {
            int8View[i] = -int8View[i];
          }
        }
        ashmem.writeDataToAshmem(buffer, 5, null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0710 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0710 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0710 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0710---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0720
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0720
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0720", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0720---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        let buffer = new ArrayBuffer(1 * 10); 
        let int8View = new Int8Array(buffer);
        for (let i = 0; i < int8View.length; i++) {
          int8View[i] = i * 2 + 1;
          if (i % 2 != 0) {
            int8View[i] = -int8View[i];
          }
        }
        ashmem.writeDataToAshmem(buffer, 5, undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0720 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0720 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0720 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0720---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0730
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0730
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0730", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0730---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
        ashmem.mapReadWriteAshmem();
      try {
        let ByteArray = [1, 2, 3, 4, 5];
        ashmem.writeAshmem(null, 5, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0730 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0730 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0730 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0730---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0740
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0740
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0740", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0740---------------------------");
      let ashmem: rpc.Ashmem;
      let ByteArray = [1, 2, 3, 4, 5];
        ashmem = rpc.Ashmem.create("test", 1024 * 1024);
        ashmem.mapReadWriteAshmem();
      try {
        ashmem.writeAshmem(undefined, 5, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0740 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0740 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0740 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0740---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0750
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0750
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0750", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0750---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        let ByteArray = [1, 2, 3, 4, 5];
        ashmem.writeAshmem(ByteArray, null, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0750 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0750 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0750 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0750---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0760
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0760
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0760", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0760---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        let ByteArray = [1, 2, 3, 4, 5];
        ashmem.writeAshmem(ByteArray, undefined, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0760 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0760 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0760 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0760---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0770
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0770
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0770", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0770---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        let ByteArray = [1, 2, 3, 4, 5];
        ashmem.writeAshmem(ByteArray, 5, null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0770 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0770 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0770 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0770---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0780
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0780
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0780", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0780---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        let ByteArray = [1, 2, 3, 4, 5];
        ashmem.writeAshmem(ByteArray, 5, undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0780 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0780 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0780 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0780---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0790
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0790
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0790", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0790---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.readAshmem(null, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0790 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0790 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0790 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0790---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0800
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0800
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0800---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.readAshmem(undefined, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0800 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0800 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0800 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0800---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0810
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0810
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0810", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0810---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.readAshmem(5, null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0810 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0810 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0810 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0810---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0820
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0820
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0820", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0820---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.readAshmem(5, undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0820 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0820 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0820 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0820---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0830
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0830
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0830", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0830---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.readDataFromAshmem(null, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0830 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0830 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0830 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0830---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0840
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0840
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0840", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0840---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.readDataFromAshmem(undefined, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0840 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0840 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0840 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0840---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0850
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0850
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0850", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0850---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.readDataFromAshmem(5, null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0850 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0850 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0850 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0850---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0860
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0860
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0860", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0860---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.readDataFromAshmem(5, undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0860 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0860 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0860 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0860---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0870
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0870
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0870", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0870---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.readFromAshmem(null, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0870 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0870 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0870 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0870---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0880
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0880
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0880", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0880---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.readFromAshmem(undefined, 0);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0880 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0880 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0880 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0880---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0890
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0890
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0890", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0890---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.readFromAshmem(5, null);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0890 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0890 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0890 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0890---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_Ashmem_0900
     * @tc.number SUB_DSoftbus_IPC_API_Stage_Ashmem_0900
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_Ashmem_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_Ashmem_0900---------------------------");
      let ashmem: rpc.Ashmem;
      ashmem = rpc.Ashmem.create("test", 1024 * 1024);
      ashmem.mapReadWriteAshmem();
      try {
        ashmem.readFromAshmem(5, undefined);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0900 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_Ashmem_0900 error code is: ' + err.code);
        expect(err.message != null).assertTrue();
      } finally {
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
        console.info("SUB_DSoftbus_IPC_API_Stage_Ashmem_0900 ashmem is close");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_Ashmem_0900---------------------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_onRemoteMessageRequest_0500
     * @tc.number SUB_DSoftbus_IPC_API_Stage_onRemoteMessageRequest_0500
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_onRemoteMessageRequest_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_onRemoteMessageRequest_0500---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let TestCallerInfoObject = new TestCallerInfo("TestCallerInfo")
        data.writeRemoteObject(TestCallerInfoObject)
        await gIRemoteObject.sendMessageRequest(CODE_TESTCALLERINFO, data, reply, option)
          .then((result) => {
            expect(result.errCode).assertEqual(0);
          }).catch((err: Error) => {
           console.info('SUB_DSoftbus_IPC_API_Stage_onRemoteMessageRequest_0500 err in catch is: ' + err);
            expect(err != null).assertTrue();
          }).finally(() => {
            data.reclaim();
            reply.reclaim();
            console.info('SUB_DSoftbus_IPC_API_Stage_onRemoteMessageRequest_0500 reclaim done');
          })
      } catch (error) {
        error = error as BusinessError;
        console.info("SUB_DSoftbus_IPC_API_Stage_onRemoteMessageRequest_0500 error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info("SUB_DSoftbus_IPC_API_Stage_onRemoteMessageRequest_0500 done");
        expect(testFlag).assertTrue();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_onRemoteMessageRequest_0500---------------------------");
    });

    /**
     * @tc.name      SUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0100
     * @tc.number    SUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0100
     * @tc.desc      test getLocalInterface
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async () => {
      console.info('-------------------- start SUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0100 --------------------');
      try {
        let des = '';
        const targetLength = strlen;
        for (let i = 0; i < targetLength; i++) {
          des += 'a';
        }
        let testObject = new TestListener('testObject', checkResult);
        testObject.modifyLocalInterface(testObject.getLocalInterface('testObject'), 'testObject')
        let res = testObject.getLocalInterface(des);
        expect(res).assertEqual(des);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0100 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info('SUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0100 reclaim done');
      }
      console.info('-------------------- end SUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0200
     * @tc.number    SUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0200
     * @tc.desc      test getLocalInterface
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async () => {
      console.info('-------------------- start SUB_IPC_RmoSUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0200teProxy_getLocalInterface_ErrorCode_0200 --------------------');
      try {
        let des = '';
        const targetLength = strlen + 1;
        for (let i = 0; i < targetLength; i++) {
          des += 'a';
        }
        let testObject = new TestListener('testObject', checkResult);
        testObject.modifyLocalInterface(testObject.getLocalInterface('testObject'), 'testObject')
        let res = testObject.getLocalInterface(des);
        expect(res).assertEqual(des);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0200 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info('SUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0200 reclaim done');
      }
      console.info('-------------------- end SUB_DSoftbus_IPC_API_Stage_getLocalInterface_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name      SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0100
     * @tc.number    SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0100
     * @tc.desc      test modifyLocalInterface ErrorCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async () => {
      console.info('-------------------- start SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0100 --------------------');
      try {
        let des ='';
        const targetLength = strlen + 1;
        for (let i = 0; i < targetLength; i++) {
          des += 'a';
        }
        let testObject = new TestListener('testObject', checkResult);
        testObject.modifyLocalInterface(testObject.getLocalInterface('testObject'), des)
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0100 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info('SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0100 reclaim done');
      }
      console.info('-------------------- end SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0200
     * @tc.number    SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0200
     * @tc.desc      test modifyLocalInterface ErrorCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async () => {
      console.info('-------------------- start SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0200 --------------------');
      try {
        let des = '';
        const targetLength = strlen;
        for (let i = 0; i < targetLength; i++) {
          des += 'a';
        }
        let testObject = new TestListener('testObject', checkResult);
        testObject.modifyLocalInterface(testObject.getLocalInterface('testObject'), des)
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info( 'SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0200 error is: ' + err);
        console.info( 'SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        console.info( 'SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0200 reclaim done');
        console.info('SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0100 testFlag is: ' + testFlag);
      }
      console.info('-------------------- end SUB_DSoftbus_IPC_API_Stage_modifyLocalInterface_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name      SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0100
     * @tc.number    SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0100
     * @tc.desc      test restoreCallingIdentity
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async () => {
      console.info('-------------------- start SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0100 --------------------');
      try {
        let des ='';
        const targetLength = strlen + 1;
        for (let i = 0; i < targetLength; i++) {
          des += 'a';
        }
        rpc.IPCSkeleton.restoreCallingIdentity(des);
        console.info('SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0100 testFlag is: ' + testFlag);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info('SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0100 error is: ' + err);
        console.info('SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0100 error code is: ' + err.code);
        expect(err.message == null).assertTrue();
      } finally {
        expect(testFlag).assertTrue();
        console.info( 'SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0100 reclaim done');
      }
      console.info('-------------------- end SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0200
     * @tc.number    SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0200
     * @tc.desc      test restoreCallingIdentity
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async () => {
      console.info('-------------------- start SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0200 --------------------');
      try {
        let des = '';
        const targetLength = strlen;
        for (let i = 0; i < targetLength; i++) {
          des += 'a';
        }
        rpc.IPCSkeleton.restoreCallingIdentity(des);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        console.info( 'SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0200 error is: ' + err);
        console.info( 'SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0200 error code is: ' + err.code);
        expect(err.message == null).assertTrue();
      } finally {
        expect(testFlag).assertTrue();
        console.info( 'SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0200 reclaim done');
      }
      console.info('-------------------- end SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0300
     * @tc.number SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0300
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("---------------------start SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0300---------------------------");
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply: rpc.MessageSequence = rpc.MessageSequence.create();
      let option: rpc.MessageOption = new rpc.MessageOption();
      try {
        let TestCallerInfoObject = new TestCallerInfo("TestCallerInfo1")
        data.writeRemoteObject(TestCallerInfoObject)
        await gIRemoteObject.sendMessageRequest(CODE_TESTCALLERINFO_1, data, reply, option)
          .then((result) => {
            expect(result.errCode).assertEqual(0);
          }).catch((err: Error) => {
           console.info('SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0300 err in catch is: ' + err);
            expect(err != null).assertTrue();
          }).finally(() => {
            data.reclaim();
            reply.reclaim();
            console.info('SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0300 reclaim done');
          })
      } catch (error) {
        error = error as BusinessError;
        console.info("SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0300 error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        console.info("SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0300 done");
        expect(testFlag).assertFalse();
      }
      console.info("---------------------end SUB_DSoftbus_IPC_API_Stage_restoreCallingIdentity_ErrorCode_0300---------------------------");
    });
    console.info("-----------------------SUB_DSoftbus_IPC_API_Stage_MessageSequence_Test is end-----------------------");
  })
}