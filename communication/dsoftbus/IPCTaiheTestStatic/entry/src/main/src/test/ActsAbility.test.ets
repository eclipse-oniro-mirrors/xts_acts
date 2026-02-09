import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import rpc from '@ohos.rpc';
import common from '@ohos.app.ability.common';
import fileIo from '@ohos.file.fs';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let gIRemoteObject: rpc.IRemoteObject;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let bundleNameRpc: string = "com.example.actsipctaiheservicetest.static";
let abilityNameRpc: string = "ServiceAbility";
let connectId: long;
let isDead: boolean = false;
let testFlag: boolean = true;
let strlen: int = 40960;

class MyParcelable implements rpc.Parcelable {
  num: int = 0;
  str: string = "";

  constructor(num: int, str: string) {
    this.num = num;
    this.str = str;
  }

  marshalling(dataOut: rpc.MessageSequence): boolean {
    dataOut.writeInt(this.num);
    dataOut.writeString(this.str);
    return true;
  }

  unmarshalling(dataIn: rpc.MessageSequence): boolean {
    this.num = dataIn.readInt();
    this.str = dataIn.readString();
    return true;
  }

}

class MyParcelable_False implements rpc.Parcelable {
  num: int = 0;
  str: string = "";

  constructor(num: int, str: string) {
    this.num = num;
    this.str = str;
  }

  marshalling(dataOut: rpc.MessageSequence): boolean {
    dataOut.writeInt(this.num);
    dataOut.writeString(this.str);
    return false;
  }

  unmarshalling(dataIn: rpc.MessageSequence): boolean {
    this.num = dataIn.readInt();
    this.str = dataIn.readString();
    return false;
  }
}

class TestRemoteObject extends rpc.RemoteObject {
  constructor(descriptor: string) {
    super(descriptor);
  }

  onRemoteMessageRequest(code: int, data: rpc.MessageSequence, reply: rpc.MessageSequence, options: rpc.MessageOption): boolean {
    hilog.info(domain, tag, '%{public}s', '++++++++++++++++++ remoteObject begin ++++++++++++++++++');
    hilog.info(domain, tag, '%{public}s', 'into onRemoteMessageRequest');
    if (code == 1) {
      hilog.info(domain, tag, '%{public}s', 'code is 1');
      let res = data.readInt();
      hilog.info(domain, tag, '%{public}s', 'readInt, res is :' + res);
      reply.writeInt(999);
      return true;
    } else {
      hilog.info(domain, tag, '%{public}s', 'code err:' + code);
      return false;
    }
    hilog.info(domain, tag, '%{public}s', '++++++++++++++++++ remoteObject end ++++++++++++++++++');
    return false;
  }
}

class TestStub extends rpc.RemoteObject {
  constructor(descriptor: string) {
    super(descriptor);
  }

  asObject() {
    return this;
  }

  onRemoteMessageRequest(code: int, data: rpc.MessageSequence, reply: rpc.MessageSequence, options: rpc.MessageOption): boolean {
    hilog.info(domain, tag, '%{public}s', '++++++++++++++++++ remoteObject begin ++++++++++++++++++');
    hilog.info(domain, tag, '%{public}s', 'into onRemoteMessageRequest');
    if (code == 1) {
      hilog.info(domain, tag, '%{public}s', 'code is 1');
      let res = data.readInt();
      hilog.info(domain, tag, '%{public}s', 'readInt, res is :' + res);
      reply.writeInt(123);
      return true;
    } else {
      hilog.info(domain, tag, '%{public}s', 'code err:' + code);
    }
    hilog.info(domain, tag, '%{public}s', '++++++++++++++++++ remoteObject end ++++++++++++++++++');
    return false;
  }
}

class TestCallerInfo extends rpc.RemoteObject {
  constructor(descriptor: string) {
    super(descriptor);
  }

  onRemoteMessageRequest(code: int, data: rpc.MessageSequence, reply: rpc.MessageSequence, option: rpc.MessageOption,
    callingInfo?: rpc.CallingInfo): boolean {
    hilog.info(domain, tag, '%{public}s', "TestCallerInfo onRemoteMessageRequest in code is: " + code);
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
        hilog.info(domain, tag, '%{public}s', "TestCallerInfo onRemoteMessageRequest error is:" + error);
        testFlag = false;
        return false;
      }
      return true;
    } else {
      hilog.info(domain, tag, '%{public}s', "unknown code: " + code);
      return false;
    }
  }
}


class MyDeathRecipient implements rpc.DeathRecipient {
  onRemoteDied: () => void = () => {
    hilog.info(domain, tag, '%{public}s', 'into onRemoteDied');
    isDead = true;
  }
}

class TestRemoteStub extends rpc.RemoteObject {
  constructor(descriptor: string) {
    super(descriptor);
    try{
      hilog.info(domain, tag, '%{public}s', ' into TestRemoteStub');
      hilog.info(domain, tag, '%{public}s', ' TestRemoteStub descriptor.length: ' + descriptor.length);
      let broker: rpc.IRemoteBroker = this.getLocalInterface(descriptor)
      hilog.info(domain, tag, '%{public}s', ' TestRemoteStub broker: ' + broker);
      this.modifyLocalInterface(broker, descriptor);
      hilog.info(domain, tag, '%{public}s', ' modifyLocalInterface done');
    } catch(err) {
      err = err as BusinessError;
      hilog.info(domain, tag, '%{public}s', 'TestRemoteStub error is: ' + err);
      hilog.info(domain, tag, '%{public}s', 'TestRemoteStub error code is: ' + err.code);
      expect(err.code).assertEqual(0);
    }
  }
}

class TestOption extends rpc.MessageOption{
  constructor() {
    super();
  }
}

class TestOption2 extends rpc.MessageOption{
  constructor(syncFlags: int, waitTime: int) {
    super(syncFlags, waitTime);
  }
}

class TestOption1 extends rpc.MessageOption{
  constructor(syncFlags: int) {
    super(syncFlags);
  }
}

class TestOptionBoolean extends rpc.MessageOption{
  constructor(isAsync: boolean) {
    super(isAsync);
  }
}

function isEqualArrayBuffer(
  arr1: Int8Array | Uint8Array | Int16Array | Uint16Array | Int32Array | Uint32Array | Float32Array | Float64Array,
  arr2: Int8Array | Uint8Array | Int16Array | Uint16Array | Int32Array | Uint32Array | Float32Array | Float64Array,
): boolean {
  //就检查两个参数是否都是TypeArray
  if (!ArrayBuffer.isView(arr1) || !ArrayBuffer.isView(arr2)) {
    return false;
  }

  // 检查长度是否相同
  if (arr1.length != arr2.length) {
    return false;
  }

  // 直接比较底层字节数据
  const view1 = new Uint8Array(arr1.buffer, arr1.byteOffset, arr1.byteLength);
  const view2 = new Uint8Array(arr2.buffer, arr2.byteOffset, arr2.byteLength);

  // 逐个字节比较
  for (let i = 0; i < view1.length; i++) {
    if (view1[i] != view2[i]) {
      return false;
    }
  }

  return true;
}

function sendMessageRequestCallback(err: BusinessError | null, result: rpc.RequestResult | undefined) {

  try {
    if (result != null) {
      hilog.info(domain, tag, '%{public}s', 'sendMessageRequest Callback');
      expect(result.errCode).assertEqual(0);
      let res = result.reply.readInt();
      hilog.info(domain, tag, '%{public}s', 'sendMessageRequest Callback read result ' + res);
      expect(res).assertEqual(999);
    }
  } catch(error) {
    hilog.info(domain, tag, '%{public}s', 'sendMessageRequest Callback err is ' + error);
  }
}

function sendMessageRequestCallback_Proxy(err: BusinessError | null, result: rpc.RequestResult | undefined) {

  try {
    if (result != null) {
      hilog.info(domain, tag, '%{public}s', 'sendMessageRequestCallback_Proxy Callback');
      expect(result.errCode).assertEqual(0);
      let res = result.reply.readRemoteObject();
    }
  } catch(error) {
    hilog.info(domain, tag, '%{public}s', 'sendMessageRequest Callback err is ' + error);
    expect(error != null).assertTrue();
  }
}

function sendMessageRequestCallback_Proxy_ReadAndWrite(err: BusinessError | null, result: rpc.RequestResult | undefined) {
  try {
    if (result != null) {
      hilog.info(domain, tag, '%{public}s', 'sendMessageRequestCallback_Proxy_ReadAndWrite Callback');
      expect(result.errCode).assertEqual(0);
      let res = result.reply.readInt();
      hilog.info(domain, tag, '%{public}s', 'sendMessageRequest Callback readInt is ' + res);
      expect(res).assertEqual(112233);
      let res_s = result.reply.readString();
      hilog.info(domain, tag, '%{public}s', 'sendMessageRequest Callback readString is ' + res_s);
      expect(res_s).assertEqual("ipctest");
    }
  } catch(error) {
    hilog.info(domain, tag, '%{public}s', 'sendMessageRequest Callback err is ' + error);
    expect(error != null).assertTrue();
  }
}

async function toConnectAbility() {
  hilog.info(domain, tag, '%{public}s', " -----toConnectAbility-----");
  let want: Want = {
    bundleName: bundleNameRpc,
    abilityName: abilityNameRpc
  };
  try {
    hilog.info(domain, tag, '%{public}s', '-----connectServiceExtensionAbility is begin-----');
    let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
    hilog.info(domain, tag, '%{public}s', 'connectServiceExtensionAbility, context: ' + context);
    connectId = context.connectServiceExtensionAbility(want, {
      onConnect: (elementName: bundleManager.ElementName, remote: rpc.IRemoteObject) =>  {
        hilog.info(domain, tag, '%{public}s', "ConnectOptions is  onConnect");
        gIRemoteObject = remote;
        hilog.info(domain, tag, '%{public}s', "ConnectOptions gIRemoteObject is " + gIRemoteObject);
      },
      onDisconnect: (elementName: bundleManager.ElementName) =>  {
        hilog.info(domain, tag, '%{public}s', "ConnectOptions is  onDisconnect");
      },
      onFailed: (code: int) => {
        hilog.info(domain, tag, '%{public}s', "ConnectOptions is  onFailed");
      }
    });
    hilog.info(domain, tag, '%{public}s', "connectServiceExtensionAbility success. got id: " + connectId);
  } catch (err) {
    hilog.error(domain, tag, '%{public}s', "connectServiceExtensionAbility failed: " + err);
  } finally {
    hilog.info(domain, tag, '%{public}s', "connectServiceExtensionAbility success. got id: " + connectId);
  }
}

async function disConnectAbility() {
  hilog.info(domain, tag, '%{public}s', " -----disConnectAbility-----");
  try {
    hilog.info(domain, tag, '%{public}s', '-----disconnectServiceExtensionAbility is begin-----');
    let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
    hilog.info(domain, tag, '%{public}s', 'disconnectServiceExtensionAbility, context: ' + context);
    context.disconnectServiceExtensionAbility(connectId).then(() => {
      hilog.info(domain, tag, '%{public}s', 'disconnectServiceExtensionAbility, done');
    }).catch((err) => {
      hilog.error(domain, tag, '%{public}s', "disconnectServiceExtensionAbility failed: " + err);
    });
  } catch (err) {
    hilog.error(domain, tag, '%{public}s', "disConnectAbility failed: " + err);
  } finally {
    hilog.info(domain, tag, '%{public}s', "disConnectAbility done  got id: " + connectId);
  }
}

export default function abilityTest() {

  describe("abilityTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    const CODE_TEST_ONE = 1;
    const CODE_TESTCALLERINFO: int = 100;
    beforeAll(async() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll in');
      try {
        await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actsipctaihetest.static");
        await Utils.msSleep(6000);
        await  toConnectAbility();
        await Utils.msSleep(4000);
        hilog.info(domain, tag, '%{public}s', 'beforeAll gIRemoteObject is ' + gIRemoteObject);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'beforeAll error is: ' + error);
      }
      hilog.info(domain, tag, '%{public}s', 'beforeAll done');
    })

    /**
     * @tc.name   SUB_IPC_MessageSequence_WriteInt_ReadInt_0100
     * @tc.number SUB_IPC_MessageSequence_WriteInt_ReadInt_0100
     * @tc.desc   test MessageSequence WriteInt and ReadInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_WriteInt_ReadInt_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);

      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_WriteInt_ReadInt_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input = 123;
        data.writeInt(input);
        let res = data.readInt();
        expect(res == input).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteInt_ReadInt_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteInt_ReadInt_0100 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_WriteInt_ReadInt_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100
     * @tc.number SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100
     * @tc.desc   test MessageSequence WriteInterfaceToken and ReadInterfaceToken
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input = "this is interfaceToken";
        data.writeInterfaceToken(input);
        let res = data.readInterfaceToken();
        expect(res == input).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_setCapacity_getCapacity_0100
     * @tc.number SUB_IPC_MessageSequence_setCapacity_getCapacity_0100
     * @tc.desc   test MessageSequence setCapacity and getCapacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_setCapacity_getCapacity_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_setCapacity_getCapacity_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input = 666;
        data.setCapacity(input);
        let res = data.getCapacity();
        expect(res == input).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setCapacity_getCapacity_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setCapacity_getCapacity_0100 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_setCapacity_getCapacity_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeNoException_readException_0100
     * @tc.number SUB_IPC_MessageSequence_writeNoException_readException_0100
     * @tc.desc   test MessageSequence writeNoException and readException
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeNoException_readException_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeNoException_readException_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        data.writeNoException();
        data.readException();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeNoException_readException_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeNoException_readException_0100 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeNoException_readException_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeLong_readLong_0100
     * @tc.number SUB_IPC_MessageSequence_writeLong_readLong_0100
     * @tc.desc   test MessageSequence writeLong and readLong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeLong_readLong_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeLong_readLong_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input = 99999999999;
        data.writeLong(input);
        let res = data.readLong();
        expect(res == input).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLong_readLong_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLong_readLong_0100 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeLong_readLong_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100
     * @tc.number SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100
     * @tc.desc   test MessageSequence writeBoolean and readBoolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input = true;
        data.writeBoolean(input);
        let res = data.readBoolean();
        expect(res).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200
     * @tc.number SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200
     * @tc.desc   test MessageSequence writeBoolean and readBoolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input = false;
        data.writeBoolean(input);
        let res = data.readBoolean();
        expect(res).assertFalse();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeString_readString_0100
     * @tc.number SUB_IPC_MessageSequence_writeString_readString_0100
     * @tc.desc   test MessageSequence writeString and readString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeString_readString_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeString_readString_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input = "this is test write and read string";
        data.writeString(input);
        let res = data.readString();
        expect(res == input).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeString_readString_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeString_readString_0100 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeString_readString_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeByteArray_0100
     * @tc.number SUB_IPC_MessageSequence_writeByteArray_0100
     * @tc.desc   test MessageSequence writeByteArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeByteArray_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeByteArray_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeByteArray(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByteArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByteArray_0100 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeByteArray_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100
     * @tc.number SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100
     * @tc.desc   test MessageSequence writeIntArray and readIntArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeIntArray(input);
        let res = data.readIntArray();
        expect(res.length > 0).assertTrue();
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200
     * @tc.number SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200
     * @tc.desc   test MessageSequence writeIntArray and readIntArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeIntArray(input);
        let res: Array<int> = new Array<int>(input.length);
        data.readIntArray(res);
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeIntArray_readIntArray_0300
     * @tc.number SUB_IPC_MessageSequence_writeIntArray_readIntArray_0300
     * @tc.desc   test MessageSequence writeIntArray and readIntArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeIntArray_readIntArray_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeIntArray_readIntArray_0300 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input: Array<int> = [];
        data.writeIntArray(input);
        let res = data.readIntArray();
        expect(res.length == 0).assertTrue();
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_readIntArray_0300 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_readIntArray_0300 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeIntArray_readIntArray_0300 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100
     * @tc.number   SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100
     * @tc.desc     test MessageSequence writeDoubleArray and readDoubleArray
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input: Array<double> = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9];
        data.writeDoubleArray(input);
        let res = data.readDoubleArray();
        expect(res.length > 0).assertTrue();
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200
     * @tc.number   SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200
     * @tc.desc     test MessageSequence writeDoubleArray and readDoubleArray
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input: Array<double> = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9];
        data.writeDoubleArray(input);
        let res: Array<double> = new Array<double>(input.length);
        data.readDoubleArray(res);
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0300
     * @tc.number SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0300
     * @tc.desc   test MessageSequence writeDoubleArray and readDoubleArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0300 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input: Array<double> = [];
        data.writeDoubleArray(input);
        let res = data.readDoubleArray();
        expect(res.length == 0).assertTrue();
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0300 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0300 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0300 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100
     * @tc.number   SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100
     * @tc.desc     test MessageSequence writeStringArray and readStringArray
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input: Array<string> = ["this", "is", "a", "test", "stirng", "array"];
        data.writeStringArray(input);
        let res = data.readStringArray();
        expect(res.length > 0).assertTrue();
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200
     * @tc.number SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200
     * @tc.desc   test MessageSequence writeStringArray and readStringArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input: Array<string> = ["this", "is", "a", "test", "stirng", "array"];
        data.writeStringArray(input);
        let res: Array<string> = new Array<string>(input.length);
        data.readStringArray(res);
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeStringArray_readStringArray_0300
     * @tc.number SUB_IPC_MessageSequence_writeStringArray_readStringArray_0300
     * @tc.desc   test MessageSequence writeBooleanArray and readBooleanArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeStringArray_readStringArray_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeStringArray_readStringArray_0300 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input: Array<string> = [];
        data.writeStringArray(input);
        let res = data.readStringArray();
        expect(res.length == 0).assertTrue();
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_readStringArray_0300 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_readStringArray_0300 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeStringArray_readStringArray_0300 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100
     * @tc.number   SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100
     * @tc.desc     test MessageSequence writeBooleanArray and readBooleanArray
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input: Array<boolean> = [true, false, true, false, true, false, true, false, true, false];
        data.writeBooleanArray(input);
        let res = data.readBooleanArray();
        expect(res.length > 0).assertTrue();
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200
     * @tc.number SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200
     * @tc.desc   test MessageSequence writeBooleanArray and readBooleanArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input: Array<boolean> = [false, true, false, true, false, true, false, true, false, true];
        data.writeBooleanArray(input);
        let res: Array<boolean> = new Array<boolean>(input.length);
        data.readBooleanArray(res);
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0300
     * @tc.number SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0300
     * @tc.desc   test MessageSequence writeBooleanArray and readBooleanArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0300 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let input: Array<boolean> = [];
        data.writeBooleanArray(input);
        let res = data.readBooleanArray();
        expect(res.length == 0).assertTrue();
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0300 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0300 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0300 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100
     * @tc.number   SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100
     * @tc.desc     test MessageSequence writeParcelable and readParcelable
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100 --------------------');

      let data =  rpc.MessageSequence.create();
      try {
        let parcelable = new MyParcelable(1, "this is a test parcelable");
        data.writeParcelable(parcelable);
        let res: MyParcelable = new MyParcelable(0, "");
        data.readParcelable(res);
        expect(res.num).assertEqual(1);
        expect(res.str).assertEqual("this is a test parcelable");
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100
     * @tc.number SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100
     * @tc.desc   test MessageSequence writeParcelableArray and readParcelableArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100 --------------------');

      let data =  rpc.MessageSequence.create();
      try {
        let parcelable1 = new MyParcelable(1, "this is a test parcelable 1");
        let parcelable2 = new MyParcelable(2, "this is a test parcelable 2");
        let parcelable3 = new MyParcelable(3, "this is a test parcelable 3");
        let input: Array<rpc.Parcelable> = [parcelable1, parcelable2, parcelable3];
        data.writeParcelableArray(input);
        let res: Array<rpc.Parcelable> = [new MyParcelable(0, ""), new MyParcelable(0, ""), new MyParcelable(0, "")];
        data.readParcelableArray(res);
        for (let i = 0; i < res.length; i++) {
          expect((res[i] as MyParcelable).num).assertEqual((input[i] as MyParcelable).num);
          expect((res[i] as MyParcelable).str).assertEqual((input[i] as MyParcelable).str);
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100 reclaim done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100
     * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100
     * @tc.desc   test MessageSequence writeRawDataBuffer with int32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100 --------------------');

      let data =  rpc.MessageSequence.create();
      let buffer = new ArrayBuffer(4 * 10);
      let int32View = new Int32Array(buffer);
      for (let i = 0; i < int32View.length; i++) {
        int32View[i] = i * 2 + 1;
        if (i % 2 != 0) {
          int32View[i] = -int32View[i];
        }
      }
      let size: int = buffer.byteLength as int;

      try {
        data.writeRawDataBuffer(buffer, size);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100 reclaim done');
        data.reclaim();
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100
     * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100
     * @tc.desc   test MessageSequence writeRawDataBuffer and readRawDataBuffer with int32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100 --------------------');

      let data =  rpc.MessageSequence.create();
      let buffer = new ArrayBuffer(4 * 10);
      let int32View = new Int32Array(buffer);
      for (let i = 0; i < int32View.length; i++) {
        int32View[i] = i * 2 + 1;
        if (i % 2 != 0) {
          int32View[i] = -int32View[i];
        }
      }
      let size: int = buffer.byteLength as int;

      try {
        data.writeRawDataBuffer(buffer, size);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }

      try {
        let result = data.readRawDataBuffer(size);
        let readInt32View = new Int32Array(result);
        let assertE = isEqualArrayBuffer(readInt32View, int32View);
        expect(assertE).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100 reclaim done');
        data.reclaim();
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100
     * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100
     * @tc.desc   test MessageSequence writeRawDataBuffer with uint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100 --------------------');

      let data =  rpc.MessageSequence.create();
      let buffer = new ArrayBuffer(1 * 10);
      let uint8View = new Uint8Array(buffer);
      for (let i = 0; i < uint8View.length; i++) {
        uint8View[i] = i * 2 + 1;
      }
      let size: int = buffer.byteLength as int;

      try {
        data.writeRawDataBuffer(buffer, size);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100 reclaim done');
        data.reclaim();
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100
     * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100
     * @tc.desc   test MessageSequence writeRawDataBuffer and readRawDataBuffer with uint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100 --------------------');

      let data =  rpc.MessageSequence.create();
      let buffer = new ArrayBuffer(1 * 10);
      let uint8View = new Uint8Array(buffer);
      for (let i = 0; i < uint8View.length; i++) {
        uint8View[i] = i * 2 + 1;
      }
      let size: int = buffer.byteLength as int;

      try {
        data.writeRawDataBuffer(buffer, size);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }

      try {
        let result = data.readRawDataBuffer(size);
        let readUint8View = new Uint8Array(result);
        let assertE = isEqualArrayBuffer(readUint8View, uint8View);
        expect(assertE).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100 reclaim done');
        data.reclaim();
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100
     * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100
     * @tc.desc   test MessageSequence writeRawDataBuffer with int8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100 --------------------');

      let data =  rpc.MessageSequence.create();
      let buffer = new ArrayBuffer(1 * 10);
      let int8View = new Int8Array(buffer);
      for (let i = 0; i < int8View.length; i++) {
        int8View[i] = i * 2 + 1;
        if (i % 2 != 0) {
          int8View[i] = -int8View[i];
        }
      }
      let size: int = buffer.byteLength as int;

      try {
        data.writeRawDataBuffer(buffer, size);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100 reclaim done');
        data.reclaim();
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100
     * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100
     * @tc.desc   test MessageSequence writeRawDataBuffer and readRawDataBuffer with int8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100 --------------------');

      let data =  rpc.MessageSequence.create();
      let buffer = new ArrayBuffer(1 * 10);
      let int8View = new Int8Array(buffer);
      for (let i = 0; i < int8View.length; i++) {
        int8View[i] = i * 2 + 1;
        if (i % 2 != 0) {
          int8View[i] = -int8View[i];
        }
      }
      let size: int = buffer.byteLength as int;

      try {
        data.writeRawDataBuffer(buffer, size);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }

      try {
        let result = data.readRawDataBuffer(size);
        let readInt8View = new Uint8Array(result);
        let assertE = isEqualArrayBuffer(readInt8View, int8View);
        expect(assertE).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100 reclaim done');
        data.reclaim();
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100
     * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100
     * @tc.desc   test MessageSequence writeRawDataBuffer with float32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100 --------------------');

      let data =  rpc.MessageSequence.create();
      let buffer = new ArrayBuffer(4 * 10);
      let float32View = new Float32Array(buffer);
      for (let i = 0; i < float32View.length; i++) {
        float32View[i] = i * 2 + i * 1.0 / 10;
        if (i % 2 != 0) {
          float32View[i] = -float32View[i];
        }
      }
      let size: int = buffer.byteLength as int;

      try {
        data.writeRawDataBuffer(buffer, size);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100 reclaim done');
        data.reclaim();
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100
     * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100
     * @tc.desc   test MessageSequence writeRawDataBuffer and readRawDataBuffer with float32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100 --------------------');

      let data =  rpc.MessageSequence.create();
      let buffer = new ArrayBuffer(4 * 10);
      let float32View = new Float32Array(buffer);
      for (let i = 0; i < float32View.length; i++) {
        float32View[i] = i * 2 + i * 1.0 / 10;
        if (i % 2 != 0) {
          float32View[i] = -float32View[i];
        }
      }
      let size: int = buffer.byteLength as int;

      try {
        data.writeRawDataBuffer(buffer, size);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }

      try {
        let result = data.readRawDataBuffer(size);
        let readFloat32View = new Float32Array(result);
        let assertE = isEqualArrayBuffer(readFloat32View, float32View);
        expect(assertE).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100 reclaim done');
        data.reclaim();
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_Ashmem_create_0100
     * @tc.number SUB_IPC_Ashmem_create_0100
     * @tc.desc   test create Ashmem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_Ashmem_create_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem_create_0100 --------------------');

      try {
        let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_create_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_create_0100 finally done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmem_create_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_Ashmem_getAshmemSize_0100
     * @tc.number SUB_IPC_Ashmem_getAshmemSize_0100
     * @tc.desc   test Ashmem getAshmemSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_Ashmem_getAshmemSize_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem_getAshmemSize_0100 --------------------');

      try {
        let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
        let size = ashmem.getAshmemSize();
        expect(size == 1024 * 1024).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_getAshmemSize_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_getAshmemSize_0100 finally done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmem_getAshmemSize_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100
     * @tc.number SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100
     * @tc.desc   test MessageSequence writeAshmem Ashmem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100 --------------------');

      let data = rpc.MessageSequence.create();
      try {
        let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
        data.writeAshmem(ashmem);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100 reclaim done');
        data.reclaim();
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100
     * @tc.number SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100
     * @tc.desc   test MessageSequence writeAshmem and readAshmem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100 --------------------');

      let data = rpc.MessageSequence.create();
      let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
      try {
        data.writeAshmem(ashmem);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100 finally done');
      }

      try {
        let res = data.readAshmem();
        expect(res.getAshmemSize() == ashmem.getAshmemSize()).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100 finally done');
        data.reclaim();
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageOption_create_0100
     * @tc.number SUB_IPC_MessageOption_create_0100
     * @tc.desc   test MessageOption create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageOption_create_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_create_0100 --------------------');
      try {
        let option = new rpc.MessageOption();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_0100 finally done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_create_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageOption_create_0200
     * @tc.number   SUB_IPC_MessageOption_create_0200
     * @tc.desc     test MessageOption create
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageOption_create_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_create_0200 --------------------');
      try {
        let waitTime: int = 8;
        let option = new TestOption();
        let res = option.isAsync();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_0200 res is: ' + res);
        expect(res).assertFalse();
        let res1: int = option.getWaitTime();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_0200 res1 is: ' + res1);
        expect(res1 == waitTime).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_0200 finally done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_create_0200 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageOption_create_0300
     * @tc.number   SUB_IPC_MessageOption_create_0300
     * @tc.desc     test MessageOption create
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageOption_create_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_create_0300 --------------------');
      try {
        let option = new TestOptionBoolean(true);
        let option1 = new TestOptionBoolean(false);
        let res1 = option.isAsync();
        let res2 = option1.isAsync();
        expect(res2).assertFalse();
        expect(res1).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_0300 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_0300 finally done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_create_0300 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageOption_create_0400
     * @tc.number   SUB_IPC_MessageOption_create_0400
     * @tc.desc     test MessageOption create
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageOption_create_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_create_0400 --------------------');
      try {
        let flag1 = 0;
        let flag2 = 1;
        let option1 = new TestOption1(flag1);
        let option2 = new TestOption1(flag2);
        let res1 = option1.isAsync();
        let res2 = option2.isAsync();
        expect(res1).assertFalse();
        expect(res2).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_0400 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_0400 finally done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_create_0400 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageOption_create_0500
     * @tc.number   SUB_IPC_MessageOption_create_0500
     * @tc.desc     test MessageOption create
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageOption_create_0500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_create_0500 --------------------');
      try {
        let flag: int = 1;
        let waitTime: int = 1;
        let option = new TestOption2(flag, waitTime);
        let res1 = option.isAsync();
        let res2: int = option.getWaitTime();
        expect(res1).assertTrue();
        expect(res2 == waitTime).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_0500 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_0500 finally done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_create_0500 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageOption_create_one_value_0100
     * @tc.number   SUB_IPC_MessageOption_create_one_value_0100
     * @tc.desc     test MessageOption create with ont input
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageOption_create_one_value_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_create_one_value_0100 --------------------');
      try {
        let option = new rpc.MessageOption(true);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_one_value_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_one_value_0100 finally done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_create_one_value_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageOption_isAsync_0100
     * @tc.number SUB_IPC_MessageOption_isAsync_0100
     * @tc.desc   test MessageOption is async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageOption_isAsync_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_isAsync_0100 --------------------');

      try {
        let option = new rpc.MessageOption(true);
        let res = option.isAsync();
        expect(res).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_isAsync_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_isAsync_0100 finally done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_isAsync_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageOption_isAsync_false_0100
     * @tc.number SUB_IPC_MessageOption_isAsync_false_0100
     * @tc.desc   test MessageOption is async false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageOption_isAsync_false_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_isAsync_false_0100 --------------------');

      try {
        let option = new rpc.MessageOption(false);
        let res = option.isAsync();
        expect(res).assertFalse();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_isAsync_false_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_isAsync_false_0100 finally done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_isAsync_false_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_Ashmem_create_with_other_ashmem_0100
     * @tc.number SUB_IPC_Ashmem_create_with_other_ashmem_0100
     * @tc.desc   test create Ashmem with other ashmem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_Ashmem_create_with_other_ashmem_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem_create_with_other_ashmem_0100 --------------------');

      try {
        let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
        let newAshmem = rpc.Ashmem.create(ashmem);
        expect(ashmem.getAshmemSize() == newAshmem.getAshmemSize()).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_create_with_other_ashmem_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_create_with_other_ashmem_0100 finally done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmem_create_with_other_ashmem_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_Ashmem_mapReadWriteAshmem_0100
     * @tc.number SUB_IPC_Ashmem_mapReadWriteAshmem_0100
     * @tc.desc   test create Ashmem with other ashmem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_Ashmem_mapReadWriteAshmem_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem_mapReadWriteAshmem_0100 --------------------');

      try {
        let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
        ashmem.mapReadWriteAshmem();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_mapReadWriteAshmem_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_mapReadWriteAshmem_0100 finally done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmem_mapReadWriteAshmem_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_IPCSkeleton_getCallingPid_0100
     * @tc.number SUB_IPC_IPCSkeleton_getCallingPid_0100
     * @tc.desc   test IPCSkeleton getCallingPid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_IPCSkeleton_getCallingPid_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_IPCSkeleton_getCallingPid_0100 --------------------');

      try {
        let callerPid = rpc.IPCSkeleton.getCallingPid();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingPid_0100 callerPid is: ' + callerPid);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingPid_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingPid_0100 finally done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_IPCSkeleton_getCallingPid_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_IPCSkeleton_getCallingUid_0100
     * @tc.number SUB_IPC_IPCSkeleton_getCallingUid_0100
     * @tc.desc   test IPCSkeleton getCallingUid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_IPCSkeleton_getCallingUid_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_IPCSkeleton_getCallingUid_0100 --------------------');

      try {
        let callerUid = rpc.IPCSkeleton.getCallingUid();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingUid_0100 callerUid is: ' + callerUid);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingUid_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingUid_0100 finally done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_IPCSkeleton_getCallingUid_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_IPCSkeleton_getCallingTokenId_0100
     * @tc.number SUB_IPC_IPCSkeleton_getCallingTokenId_0100
     * @tc.desc   test IPCSkeleton getCallingTokenId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_IPCSkeleton_getCallingTokenId_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_IPCSkeleton_getCallingTokenId_0100 --------------------');

      try {
        let callerTokenId = rpc.IPCSkeleton.getCallingTokenId();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingTokenId_0100 callerTokenId is: ' + callerTokenId);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingTokenId_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingTokenId_0100 finally done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_IPCSkeleton_getCallingTokenId_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeRemoteObject_0100
     * @tc.number SUB_IPC_MessageSequence_writeRemoteObject_0100
     * @tc.desc   test MessageSequence writeRemoteObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeRemoteObject_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRemoteObject_0100 --------------------');

      let data =  rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        data.writeRemoteObject(testRemoteObject);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_0100 reclaim done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRemoteObject_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100
     * @tc.number SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100
     * @tc.desc   test MessageSequence writeRemoteObject and readRemoteObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100 --------------------');

      let data =  rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        data.writeRemoteObject(testRemoteObject);
        let res = data.readRemoteObject();
        expect(res != null).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100 reclaim done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readFileDescriptor_0100
     * @tc.number SUB_IPC_MessageSequence_readFileDescriptor_0100
     * @tc.desc   test MessageSequence readFileDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readFileDescriptor_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readFileDescriptor_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
        let pathDir = context.filesDir;
        let filePath = pathDir + "/test1.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        data.writeFileDescriptor(file.fd);
        let res = data.readFileDescriptor();
        expect(res >= file.fd).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFileDescriptor_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFileDescriptor_0100 error is: ' + err.code);
        expect(err == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFileDescriptor_0100 reclaim done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readFileDescriptor_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeFileDescriptor_0100
     * @tc.number SUB_IPC_MessageSequence_writeFileDescriptor_0100
     * @tc.desc   test MessageSequence writeFileDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeFileDescriptor_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeFileDescriptor_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
        let pathDir = context.filesDir;
        let filePath = pathDir + "/test4.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        data.writeFileDescriptor(file.fd);

      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeFileDescriptor_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_closeFileDescriptor_0100
     * @tc.number SUB_IPC_MessageSequence_closeFileDescriptor_0100
     * @tc.desc   test MessageSequence closeFileDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_closeFileDescriptor_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_closeFileDescriptor_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
        let pathDir = context.filesDir;
        let filePath = pathDir + "/test4.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        data.writeFileDescriptor(file.fd);
        rpc.MessageSequence.closeFileDescriptor(file.fd);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_closeFileDescriptor_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_closeFileDescriptor_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_closeFileDescriptor_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteObject_sendMessageRequest_0100
     * @tc.number SUB_IPC_RemoteObject_sendMessageRequest_0100
     * @tc.desc   test RemoteObject sendMessageRequest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteObject_sendMessageRequest_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_sendMessageRequest_0100 --------------------');

      let data = rpc.MessageSequence.create();
      let reply = rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        let option = new rpc.MessageOption();
        data.writeInt(666);
        await testRemoteObject.sendMessageRequest(1, data, reply, option)
          .then((ret: rpc.RequestResult) => {
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0100 errCode is: ' + JSON.stringify(ret.errCode) );
            let res = ret.reply.readInt();
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0100 res is: ' + res);
            expect(res == 999).assertTrue();
          }).catch((err) => {
            expect(err == null).assertTrue();
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0100 err in catch is: ' + err);
            expect(err == null).assertTrue();
          }).finally(() => {
            data.reclaim();
            reply.reclaim();
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0100 reclaim done');
          })

      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_sendMessageRequest_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteObject_sendMessageRequest_0200
     * @tc.number SUB_IPC_RemoteObject_sendMessageRequest_0200
     * @tc.desc   test RemoteObject sendMessageRequest SYNC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteObject_sendMessageRequest_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_sendMessageRequest_0200 --------------------');

      let data = rpc.MessageSequence.create();
      let reply = rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        let option = new rpc.MessageOption();
        option.setAsync(false);
        data.writeInt(666);
        testRemoteObject.sendMessageRequest(1, data, reply, option);
        await Utils.msSleep(3000);
        let res = reply.readInt();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0200 res is: ' + res);
        expect(res == 999).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0200 reclaim done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_sendMessageRequest_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteObject_sendMessageRequest_0300
     * @tc.number SUB_IPC_RemoteObject_sendMessageRequest_0300
     * @tc.desc   test RemoteObject sendMessageRequest ASYNC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteObject_sendMessageRequest_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_sendMessageRequest_0300 --------------------');

      let data = rpc.MessageSequence.create();
      let reply = rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        let option = new rpc.MessageOption();
        option.setAsync(true);
        data.writeInt(666);
        testRemoteObject.sendMessageRequest(1, data, reply, option);
        await Utils.msSleep(3000);
        let res = reply.readInt();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0300 res is: ' + res);
        expect(res == 999).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0300 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0300 reclaim done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_sendMessageRequest_0300 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteObject_sendMessageRequest_0400
     * @tc.number SUB_IPC_RemoteObject_sendMessageRequest_0400
     * @tc.desc   test RemoteObject sendMessageRequest SYNC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteObject_sendMessageRequest_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_sendMessageRequest_0400 --------------------');

      let data = rpc.MessageSequence.create();
      let reply = rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        let option = new rpc.MessageOption();
        option.setAsync(false);
        data.writeInt(666);
        await testRemoteObject.sendMessageRequest(1, data, reply, option)
          .then((ret: rpc.RequestResult) => {
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0400 .then.data is: ' + JSON.stringify(ret.data) );
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0400 .then.reply is: ' + JSON.stringify(ret.reply) );
            let res = reply.readInt();
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0400 res is: ' + res);
            expect(res == 999).assertTrue();
          }).catch((err) => {
            expect(err == null).assertTrue();
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0400 err in catch is: ' + err);
          })
          .finally(() => {
            data.reclaim();
            reply.reclaim();
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0400 reclaim done');
          })
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0400 error is: ' + error);
        expect(error == null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_sendMessageRequest_0400 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100
     * @tc.number SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100
     * @tc.desc   test RemoteObject sendMessageRequest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100 --------------------');

      let data = rpc.MessageSequence.create();
      let reply = rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        let option = new rpc.MessageOption();
        data.writeInt(666);
        testRemoteObject.sendMessageRequest(1, data, reply, option, sendMessageRequestCallback);
        await Utils.msSleep(2000);

      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteObject_getDescriptor_0100
     * @tc.number SUB_IPC_RemoteObject_getDescriptor_0100
     * @tc.desc   test RemoteObject getDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteObject_getDescriptor_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_getDescriptor_0100 --------------------');

      let data = rpc.MessageSequence.create();
      let reply = rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        let res = testRemoteObject.getDescriptor();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getDescriptor_0100 res is: ' + res);
        expect(res == "testObject").assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getDescriptor_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getDescriptor_0100 reclaim done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_getDescriptor_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteObject_getCallingPid_0100
     * @tc.number SUB_IPC_RemoteObject_getCallingPid_0100
     * @tc.desc   test RemoteObject getCallingPid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteObject_getCallingPid_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_getCallingPid_0100 --------------------');

      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        let res = testRemoteObject.getCallingPid();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingPid_0100 res is: ' + res);
        expect(res == rpc.IPCSkeleton.getCallingPid()).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingPid_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingPid_0100 finally done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_getCallingPid_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteObject_getCallingUid_0100
     * @tc.number SUB_IPC_RemoteObject_getCallingUid_0100
     * @tc.desc   test RemoteObject getCallingUid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteObject_getCallingUid_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_getCallingUid_0100 --------------------');

      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        let res = testRemoteObject.getCallingUid();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingUid_0100 res is: ' + res);
        expect(res == rpc.IPCSkeleton.getCallingUid()).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingUid_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingUid_0100 finally done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_getCallingUid_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_registerDeathRecipient_0100
     * @tc.number SUB_IPC_registerDeathRecipient_0100
     * @tc.desc   test registerDeathRecipient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_registerDeathRecipient_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_registerDeathRecipient_0100 --------------------');

      try {
        let deathRecipient = new MyDeathRecipient();
        let samgr = rpc.IPCSkeleton.getContextObject();
        samgr.registerDeathRecipient(deathRecipient, 0);
        samgr.unregisterDeathRecipient(deathRecipient, 0);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_registerDeathRecipient_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_registerDeathRecipient_0100 finally done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_registerDeathRecipient_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_registerDeathRecipient_0200
     * @tc.number SUB_IPC_registerDeathRecipient_0200
     * @tc.desc   test registerDeathRecipient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_registerDeathRecipient_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_registerDeathRecipient_0200 --------------------');
      try {
        let deathRecipient = new MyDeathRecipient();
        gIRemoteObject?.registerDeathRecipient(deathRecipient, 0);
        gIRemoteObject?.unregisterDeathRecipient(deathRecipient, 0);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_registerDeathRecipient_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_registerDeathRecipient_0200 finally done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_registerDeathRecipient_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteProxy_SendMessageRequest_0100
     * @tc.number SUB_IPC_RemoteProxy_SendMessageRequest_0100
     * @tc.desc   test RemoteProxy SendMessageRequest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteProxy_SendMessageRequest_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_SendMessageRequest_0100 --------------------');

      let data = rpc.MessageSequence.create();
      let reply = rpc.MessageSequence.create();
      let option = new rpc.MessageOption();
      try {
        // CheckSystemAbility
        data.writeInterfaceToken("ohos.samgr.accessToken");
        data.writeInt(4700);
        data.writeBoolean(true);

        let samgr = rpc.IPCSkeleton.getContextObject();

        await samgr.sendMessageRequest(12, data, reply, option)
          .then((ret: rpc.RequestResult) => {
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_0100 .then.errCode is: ' + ret.errCode);
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_0100 .then.code is: ' + ret.code);
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_0100 .then.reply is: ' + ret.reply);
          }).catch((err) => {
            expect(err == null).assertTrue();
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_0100 err in catch is: ' + err);
          })
          .finally(() => {
            data.reclaim();
            reply.reclaim();
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_0100 reclaim done');
          })
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_SendMessageRequest_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100
     * @tc.number SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100
     * @tc.desc   test RemoteProxy SendMessageRequest after write and read Proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 --------------------');

      let dataM = rpc.MessageSequence.create();

      let data = rpc.MessageSequence.create();
      let reply = rpc.MessageSequence.create();
      let option = new rpc.MessageOption();
      try {
        // CheckSystemAbility
        data.writeInterfaceToken("ohos.samgr.accessToken");
        data.writeInt(4700);
        data.writeBoolean(true);

        let samgr = rpc.IPCSkeleton.getContextObject();

        dataM.writeRemoteObject(samgr);
        let res = dataM.readRemoteObject();

        await res.sendMessageRequest(12, data, reply, option)
          .then((ret: rpc.RequestResult) => {
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 .then.errCode is: ' + ret.errCode);
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 .then.code is: ' + ret.code);
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 .then.data is: ' + JSON.stringify(ret.data) );
            expect(ret.data != null).assertTrue();
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 .then.reply is: ' + JSON.stringify(ret.reply) );
          }).catch((err) => {
            expect(err == null).assertTrue();
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 err in catch is: ' + err);
          })
          .finally(() => {
            data.reclaim();
            reply.reclaim();
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 reclaim done');
          })
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200
     * @tc.number SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200
     * @tc.desc   test RemoteProxy SendMessageRequest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        let reply = rpc.MessageSequence.create();
        let option = new rpc.MessageOption();
        data.writeInt(4700);
        data.writeBoolean(true);

        gIRemoteObject?.sendMessageRequest(1, data, reply, option)
          .then((ret: rpc.RequestResult) => {
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200 .then.errCode is: ' + ret.errCode);
            let res = reply.readInt();
            expect(res).assertEqual(4700);
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200 reply res is: ' + res);
          })
          .catch((err) => {
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200 err in catch is: ' + err);
            expect(err == null).assertTrue();
          })
          .finally(() => {
            data.reclaim();
            reply.reclaim();
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200 reclaim done');
          })
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200 error is: ' + error);
        expect(error == null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100
     * @tc.number SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100
     * @tc.desc   test RemoteProxy SendMessageRequest  callback after write and read Proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100 --------------------');

      let dataM = rpc.MessageSequence.create();

      let data = rpc.MessageSequence.create();
      let reply = rpc.MessageSequence.create();
      let option = new rpc.MessageOption();
      try {
        // CheckSystemAbility
        data.writeInterfaceToken("ohos.samgr.accessToken");
        data.writeInt(4700);
        data.writeBoolean(true);

        let samgr = rpc.IPCSkeleton.getContextObject();

        dataM.writeRemoteObject(samgr);
        let res = dataM.readRemoteObject();

        res.sendMessageRequest(12, data, reply, option, sendMessageRequestCallback_Proxy);
        await Utils.msSleep(2000);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100 reclaim done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200
     * @tc.number SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200
     * @tc.desc   test RemoteProxy SendMessageRequest  callback after write and read Proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200 --------------------');
      let data = rpc.MessageSequence.create();
      let reply = rpc.MessageSequence.create();
      try {
        let option = new rpc.MessageOption();
        data.writeInt(112233);
        data.writeString("ipctest");

        gIRemoteObject?.sendMessageRequest(2, data, reply, option, sendMessageRequestCallback_Proxy_ReadAndWrite);
        await Utils.msSleep(2000);

      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteProxy_IsObjectDead_0100
     * @tc.number SUB_IPC_RemoteProxy_IsObjectDead_0100
     * @tc.desc   test RemoteProxy IsObjectDead
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteProxy_IsObjectDead_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_IsObjectDead_0100 --------------------');

      let dataM = rpc.MessageSequence.create();

      let data = rpc.MessageSequence.create();
      let reply = rpc.MessageSequence.create();
      let option = new rpc.MessageOption();
      try {
        // CheckSystemAbility
        data.writeInterfaceToken("ohos.samgr.accessToken");
        data.writeInt(4700);
        data.writeBoolean(true);

        let samgr = rpc.IPCSkeleton.getContextObject();

        dataM.writeRemoteObject(samgr);
        let res = dataM.readRemoteObject();

        let result = res.isObjectDead();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_IsObjectDead_0100 result is: ' + result);
        expect(result).assertFalse();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_IsObjectDead_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        reply.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_IsObjectDead_0100 reclaim done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_IsObjectDead_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_RemoteProxy_IsObjectDead_0200
     * @tc.number   SUB_IPC_RemoteProxy_IsObjectDead_0200
     * @tc.desc     test RemoteProxy IsObjectDead
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_RemoteProxy_IsObjectDead_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_IsObjectDead_0200 --------------------');
      try {
        let result = gIRemoteObject?.isObjectDead();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_IsObjectDead_0200 result is: ' + result);
        expect(result).assertFalse();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_IsObjectDead_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_IsObjectDead_0200 reclaim done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_IsObjectDead_0200 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_RemoteProxy_getDescriptor_0100
     * @tc.number   SUB_IPC_RemoteProxy_getDescriptor_0100
     * @tc.desc     test RemoteProxy getDescriptor
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_RemoteProxy_getDescriptor_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_getDescriptor_0100 --------------------');

      let dataM = rpc.MessageSequence.create();

      let data = rpc.MessageSequence.create();
      let option = new rpc.MessageOption();
      try {
        // CheckSystemAbility
        data.writeInterfaceToken("ohos.samgr.accessToken");
        data.writeInt(4700);
        data.writeBoolean(true);

        let samgr = rpc.IPCSkeleton.getContextObject();

        dataM.writeRemoteObject(samgr);
        let res = dataM.readRemoteObject();
        let reult = res.getDescriptor();
        expect(reult == "").assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_getDescriptor_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_getDescriptor_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_getDescriptor_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteProxy_getDescriptor_0200
     * @tc.number SUB_IPC_RemoteProxy_getDescriptor_0200
     * @tc.desc   test RemoteProxy getDescriptor RemoteProxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteProxy_getDescriptor_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_getDescriptor_0200 --------------------');
      try {
        let reult = gIRemoteObject?.getDescriptor();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_getDescriptor_0200 getDescriptor is: ' + reult);
        expect(reult).assertEqual("rpcTestAbility");
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_getDescriptor_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_getDescriptor_0200 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_getDescriptor_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_IRemoteBroker_asObject_0100
     * @tc.number SUB_IPC_IRemoteBroker_asObject_0100
     * @tc.desc   test asObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_IRemoteBroker_asObject_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_IRemoteBroker_asObject_0100 --------------------');

      let data = rpc.MessageSequence.create();
      let reply = rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestStub("testObject");
        let testRemoteObject1 = testRemoteObject.asObject();
        let option = new rpc.MessageOption();
        option.setAsync(false);
        data.writeInt(666);
        await testRemoteObject1.sendMessageRequest(1, data, reply, option)
          .then((ret: rpc.RequestResult) => {
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IRemoteBroker_asObject_0100 .then.data is: ' + JSON.stringify(ret.data) );
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IRemoteBroker_asObject_0100 .then.reply is: ' + JSON.stringify(ret.reply) );
            let res = reply.readInt();
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IRemoteBroker_asObject_0100 res is: ' + res);
            expect(res == 123).assertTrue();
          }).catch((err) => {
            expect(err == null).assertTrue();
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IRemoteBroker_asObject_0100 err in catch is: ' + err);
          });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IRemoteBroker_asObject_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IRemoteBroker_asObject_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_IRemoteBroker_asObject_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_Parcelable_Marshalling_Unmarshalling_0100
     * @tc.number SUB_IPC_Parcelable_Marshalling_Unmarshalling_0100
     * @tc.desc   test MessageSequence Marshalling Unmarshalling return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_Parcelable_Marshalling_Unmarshalling_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Parcelable_Marshalling_Unmarshalling_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let parcelable = new MyParcelable(1, "this is a test parcelable");
        let parcelable_false = new MyParcelable_False(2, "this is a test parcelable");
        let res1 = parcelable.marshalling(data);
        expect(res1).assertTrue();
        let res2 = parcelable_false.marshalling(data);
        expect(res2).assertFalse();
        let res3 = parcelable.unmarshalling(data);
        expect(res3).assertTrue();
        let res4 = parcelable_false.unmarshalling(data);
        expect(res4).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Parcelable_Marshalling_Unmarshalling_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Parcelable_Marshalling_Unmarshalling_0100 error is: ' + err.code);
        expect(err == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Parcelable_Marshalling_Unmarshalling_0100  done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Parcelable_Marshalling_Unmarshalling_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteObject_OnRemoteMessageRequest_0100
     * @tc.number SUB_IPC_RemoteObject_OnRemoteMessageRequest_0100
     * @tc.desc   test RemoteObject onRemoteMessageRequest return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteObject_OnRemoteMessageRequest_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_OnRemoteMessageRequest_0100 --------------------');

      let data = rpc.MessageSequence.create();
      let reply = rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        let option = new rpc.MessageOption();
        let res1 = testRemoteObject.onRemoteMessageRequest(1, data, reply, option)
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_OnRemoteMessageRequest_0100 res1 is: ' + res1);
        expect(res1).assertTrue();
        let res2 = testRemoteObject.onRemoteMessageRequest(100, data, reply, option)
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_OnRemoteMessageRequest_0100 res2 is: ' + res2);
        expect(res2).assertFalse();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_OnRemoteMessageRequest_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_OnRemoteMessageRequest_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_onRemoteMessageRequest_0500
     * @tc.number SUB_IPC_onRemoteMessageRequest_0500
     * @tc.desc   [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_onRemoteMessageRequest_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "---------------------start SUB_IPC_onRemoteMessageRequest_0500---------------------------");
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
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_onRemoteMessageRequest_0500 err in catch is: ' + err);
            expect(err != null).assertTrue();
          }).finally(() => {
            data.reclaim();
            reply.reclaim();
            hilog.info(domain, tag, '%{public}s', 'SUB_IPC_onRemoteMessageRequest_0500 reclaim done');
          })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, '%{public}s', "SUB_IPC_onRemoteMessageRequest_0500 error is:" + error);
        expect(error).assertEqual(null);
      } finally {
        hilog.info(domain, tag, '%{public}s', "SUB_IPC_onRemoteMessageRequest_0500 done");
        expect(testFlag).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', "---------------------end SUB_IPC_onRemoteMessageRequest_0500---------------------------");
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100
     * @tc.number   SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100
     * @tc.desc     test writeRemoteObject errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        data.reclaim();
        data.writeRemoteObject(testRemoteObject);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100
     * @tc.desc   test readRemoteObject errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        data.writeRemoteObject(testRemoteObject);
        data.reclaim();
        data.readRemoteObject();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100
     * @tc.desc   test writeInterfaceToken errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeInterfaceToken("ipctest");
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200
     * @tc.number SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200
     * @tc.desc   test RemoteProxy SendMessageRequest after write and read Proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeInterfaceToken("");
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100
     * @tc.desc   test readInterfaceToken errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeInterfaceToken("testRemoteObject");
        data.reclaim();
        data.readInterfaceToken();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100
     * @tc.desc   test setCapacity errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.setCapacity(64);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100
     * @tc.desc   test writeNoException errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeNoException();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readException_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readException_ErrorCode_0100
     * @tc.desc   test readException errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readException_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readException_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.readException();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readException_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readException_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readException_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readException_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeInt_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeInt_ErrorCode_0100
     * @tc.desc   test writeInt errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_writeInt_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeInt_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeInt(0);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInt_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInt_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInt_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeInt_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readInt_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readInt_ErrorCode_0100
     * @tc.desc   test readInt errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readInt_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readInt_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeInt(0);
        data.reclaim();
        data.readInt();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readInt_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readInt_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readInt_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readInt_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeLong_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeLong_ErrorCode_0100
     * @tc.desc   test writeLong errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_writeLong_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeLong_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeLong(0);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLong_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLong_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLong_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeLong_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readLong_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readLong_ErrorCode_0100
     * @tc.desc   test readLong errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readLong_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readLong_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeLong(0);
        data.reclaim();
        data.readLong();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLong_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLong_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLong_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readLong_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100
     * @tc.desc   test writeBoolean errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeBoolean(true);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100
     * @tc.desc   test readBoolean errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeBoolean(true);
        data.reclaim();
        data.readBoolean();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeString_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeString_ErrorCode_0100
     * @tc.desc   test writeString errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_writeString_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeString_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.reclaim();
        data.writeString("test");
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeString_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeString_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeString_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeString_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readString_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readString_ErrorCode_0100
     * @tc.desc   test readString errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readString_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readString_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeString("test");
        data.reclaim();
        data.readString();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readString_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readString_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readString_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readString_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100
     * @tc.desc   test writeParcelable errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let parcelable = new MyParcelable(1, "this is a test parcelable");
        data.reclaim();
        data.writeParcelable(parcelable);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100
     * @tc.desc   test readParcelable errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {

        let parcelable = new MyParcelable(1, "this is a test parcelable");
        data.writeParcelable(parcelable);
        data.reclaim();
        let res: MyParcelable = new MyParcelable(0, "");
        data.readParcelable(res);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100
     * @tc.desc   test writeIntArray errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.reclaim();
        data.writeIntArray(input);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100
     * @tc.desc   test readIntArray errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeIntArray(input);
        let res: Array<int> = new Array<int>(input.length);
        data.reclaim();
        data.readIntArray(res);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200
     * @tc.number SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200
     * @tc.desc   test readIntArray errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeIntArray(input);
        data.reclaim();
        let res = data.readIntArray();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100
     * @tc.desc   test writeDoubleArray errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<double> = [1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1];
        data.reclaim();
        data.writeDoubleArray(input);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100
     * @tc.desc   test readDoubleArray errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<double> = [1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1];
        data.writeDoubleArray(input);
        let res: Array<double> = new Array<double>(input.length);
        data.reclaim();
        data.readDoubleArray(res);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200
     * @tc.number SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200
     * @tc.desc   test readDoubleArray errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<double> = [1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1];
        data.writeDoubleArray(input);
        data.reclaim();
        let res = data.readDoubleArray();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100
     * @tc.desc   test writeBooleanArray errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<Boolean> = [false, true, false, true, false, true, false, true, false, true];
        data.reclaim();
        data.writeBooleanArray(input);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100
     * @tc.desc   test readBooleanArray errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<Boolean> = [false, true, false, true, false, true, false, true, false, true];
        data.writeBooleanArray(input);
        let res: Array<Boolean> = new Array<Boolean>(input.length);
        data.reclaim();
        data.readBooleanArray(res);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200
     * @tc.number SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200
     * @tc.desc   test readBooleanArray errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<Boolean> = [false, true, false, true, false, true, false, true, false, true];
        data.writeBooleanArray(input);
        data.reclaim();
        let res = data.readBooleanArray();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100
     * @tc.desc   test writeStringArray errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<String> = ["this", "is", "a", "test", "stirng", "array"];
        data.reclaim();
        data.writeStringArray(input);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100
     * @tc.desc   test readStringArray errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<String> = ["this", "is", "a", "test", "stirng", "array"];
        data.writeStringArray(input);
        let res: Array<String> = new Array<String>(input.length);
        data.reclaim();
        data.readStringArray(res);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200
     * @tc.number SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200
     * @tc.desc   test readStringArray errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<String> = ["this", "is", "a", "test", "stirng", "array"];
        data.writeStringArray(input);
        data.reclaim();
        let res = data.readStringArray();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100
     * @tc.desc   test writeParcelableArray errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let parcelable1 = new MyParcelable(1, "this is a test parcelable 1");
        let parcelable2 = new MyParcelable(2, "this is a test parcelable 2");
        let parcelable3 = new MyParcelable(3, "this is a test parcelable 3");
        let input: Array<rpc.Parcelable> = [parcelable1, parcelable2, parcelable3];
        data.reclaim();
        data.writeParcelableArray(input);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100
     * @tc.desc   test readParcelableArray errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let parcelable1 = new MyParcelable(1, "this is a test parcelable 1");
        let parcelable2 = new MyParcelable(2, "this is a test parcelable 2");
        let parcelable3 = new MyParcelable(3, "this is a test parcelable 3");
        let input: Array<rpc.Parcelable> = [parcelable1, parcelable2, parcelable3];
        data.writeParcelableArray(input);
        data.reclaim();
        let res: Array<rpc.Parcelable> = [new MyParcelable(0, ""), new MyParcelable(0, ""), new MyParcelable(0, "")];

        data.readParcelableArray(res);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100
     * @tc.desc   test writeByteArray errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.reclaim();
        data.writeByteArray(input);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100
     * @tc.desc   test MessageSequence writeAshmem Ashmem errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100 --------------------');

      let data = rpc.MessageSequence.create();
      try {
        let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
        data.reclaim();
        data.writeAshmem(ashmem);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100
     * @tc.desc   test MessageSequence writeAshmem Ashmem errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100 --------------------');

      let data = rpc.MessageSequence.create();
      try {
        let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
        data.writeAshmem(ashmem);
        data.reclaim();
        let res = data.readAshmem();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100
     * @tc.desc   test MessageSequence writeRawDataBuffer errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      let TEST_LEN_128M = 128 * 1024 * 1024;
      try {
        let buffer = new ArrayBuffer(TEST_LEN_128M + 4);
        let size = buffer.byteLength;
        let int32View = new Int32Array(buffer);
        int32View.fill(1);
        data.writeRawDataBuffer(buffer, size);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100
     * @tc.desc   test MessageSequence readRawDataBuffer errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      let TEST_LEN_128M = 128 * 1024 * 1024;
      try {
        let buffer = new ArrayBuffer(TEST_LEN_128M);
        let size = buffer.byteLength;
        let int32View = new Int32Array(buffer);
        int32View.fill(1);
        data.writeRawDataBuffer(buffer, size);
        let readBuffer = data.readRawDataBuffer(TEST_LEN_128M + 1)
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100
     * @tc.desc   test MessageSequence readFileDescriptor errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
        let pathDir = context.filesDir;
        let filePath = pathDir + "/test1.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        data.writeFileDescriptor(file.fd);
        data.reclaim();
        let res = data.readFileDescriptor();

      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100 error is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100 reclaim done');
      }

      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100
     * @tc.desc   test MessageSequence writeFileDescriptor errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
        let pathDir = context.filesDir;
        let filePath = pathDir + "/test3.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        data.reclaim();
        data.writeFileDescriptor(file.fd);

      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100 error is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100  done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeFileDescriptor_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200
     * @tc.number SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200
     * @tc.desc   test MessageSequence writeFileDescriptor errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
        let pathDir = context.filesDir;
        let filePath = pathDir + "/test3.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);

        rpc.MessageSequence.closeFileDescriptor(file.fd);
        data.writeFileDescriptor(file.fd);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200 error is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200  done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300
     * @tc.number SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300
     * @tc.desc   test MessageSequence writeFileDescriptor errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        data.writeFileDescriptor(-1);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300 error is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300  done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100
     * @tc.number SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100
     * @tc.desc   test MessageSequence closeFileDescriptor errCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100 --------------------');
      let data =  rpc.MessageSequence.create();
      try {
        rpc.MessageSequence.closeFileDescriptor(-1);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100 error is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100  done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name    SUB_IPC_Ashmem_0100
     * @tc.number  SUB_IPC_Ashmem_0100
     * @tc.desc    test SUB_IPC_Ashmem
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("SUB_IPC_Ashmem_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem_0100 --------------------');
      let ashmem = rpc.Ashmem.create("ashmem1", 1024 * 1024);
      try {
        let ashmem1 = rpc.Ashmem.create("ashmem", 1024 * 1024);
        let ashmem2 = rpc.Ashmem.create(ashmem1);
        let size1 = ashmem1.getAshmemSize();
        let size2 = ashmem2.getAshmemSize();
        expect(size1 == 1024 * 1024).assertTrue();
        expect(size1 == 1024 * 1024).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_0100 done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmem_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_writeCharArray_0100
     * @tc.number    SUB_IPC_MessageSequence_writeCharArray_0100
     * @tc.desc      test writeCharArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeCharArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeCharArray_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let a: Array<int> = [97, 98];
        data.writeCharArray(a);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeCharArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeCharArray_0100  done');
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeCharArray_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ReadFloatArray_0100
     * @tc.number    SUB_IPC_MessageSequence_ReadFloatArray_0100
     * @tc.desc      test SUB_IPC_MessageSequence_ReadFloatArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ReadFloatArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadFloatArray_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let b: Double = 2;
        let c: Double = 3;
        let a: Array<Double> = [b, c];
        data.writeFloatArray(a);
        let res = data.readFloatArray();
        expect(res.length > 0).assertTrue();
        expect(res).assertDeepEquals(a);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadFloatArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadFloatArray_0100  done');
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadFloatArray_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ReadFloatArray_0200
     * @tc.number    SUB_IPC_MessageSequence_ReadFloatArray_0200
     * @tc.desc      test SUB_IPC_MessageSequence_ReadFloatArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ReadFloatArray_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadFloatArray_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let b: Double = 2;
        let c: Double = 3;
        let a: Array<Double> = [b, c];
        data.writeFloatArray(a);
        let res: Array<Double> = new Array<Double>(a.length);
        data.readFloatArray(res);
        expect(res).assertDeepEquals(a);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadFloatArray_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadFloatArray_0200  done');
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadFloatArray_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ReadFloatArray_0300
     * @tc.number    SUB_IPC_MessageSequence_ReadFloatArray_0300
     * @tc.desc      test SUB_IPC_MessageSequence_ReadFloatArray return null
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ReadFloatArray_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadFloatArray_0300 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let a: Array<Double> = [];
        data.writeFloatArray(a);
        let res = data.readFloatArray();
        expect(res.length == 0).assertTrue();
        expect(res).assertDeepEquals(a);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadFloatArray_0300 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadFloatArray_0300  done');
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadFloatArray_0300 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ReadLongArray_0100
     * @tc.number    SUB_IPC_MessageSequence_ReadLongArray_0100
     * @tc.desc      test ReadLongArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ReadLongArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadLongArray_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<long> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeLongArray(input);
        let res: Array<long> = new Array<long>(input.length);
        res = data.readLongArray();
        expect(res.length > 0).assertTrue();
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadLongArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadLongArray_0100  done');
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadLongArray_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ReadLongArray_0200
     * @tc.number    SUB_IPC_MessageSequence_ReadLongArray_0200
     * @tc.desc      test ReadLongArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ReadLongArray_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadLongArray_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<long> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeLongArray(input);
        let res: Array<long> = new Array<long>(input.length);
        data.readLongArray(res);
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadLongArray_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadLongArray_0200  done');
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadLongArray_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ReadLongArray_0300
     * @tc.number    SUB_IPC_MessageSequence_ReadLongArray_0300
     * @tc.desc      test ReadLongArray return null
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ReadLongArray_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadLongArray_0300 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<long> = [];
        data.writeLongArray(input);
        let res: Array<long> = new Array<long>(input.length);
        res = data.readLongArray();
        expect(res.length == 0).assertTrue();
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadLongArray_0300 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadLongArray_0300  done');
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadLongArray_0300 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ReadShortArray_0100
     * @tc.number    SUB_IPC_MessageSequence_ReadShortArray_0100
     * @tc.desc      test SUB_IPC_MessageSequence_ReadShortArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ReadShortArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadShortArray_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeShortArray(input);
        let res: Array<int> = new Array<int>(input.length);
        res = data.readShortArray();
        expect(res.length > 0).assertTrue();
        expect(res).assertDeepEquals(input);
      } catch (error) {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadShortArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadShortArray_0100  done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadShortArray_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ReadShortArray_0200
     * @tc.number    SUB_IPC_MessageSequence_ReadShortArray_0200
     * @tc.desc      test SUB_IPC_MessageSequence_ReadShortArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ReadShortArray_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadShortArray_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeShortArray(input);
        let res: Array<int> = new Array<int>(input.length);
        data.readShortArray(res);
        expect(res).assertDeepEquals(input);
      } catch (error) {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadShortArray_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadShortArray_0200  done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadShortArray_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ReadShortArray_0300
     * @tc.number    SUB_IPC_MessageSequence_ReadShortArray_0300
     * @tc.desc      test SUB_IPC_MessageSequence_ReadShortArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ReadShortArray_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadShortArray_0300 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [];
        data.writeShortArray(input);
        let res: Array<int> = new Array<int>(input.length);
        res = data.readShortArray();
        expect(res.length == 0).assertTrue();
        expect(res).assertDeepEquals(input);
      } catch (error) {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadShortArray_0300 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadShortArray_0300  done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadShortArray_0300 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_WriteChar_0100
     * @tc.number    SUB_IPC_MessageSequence_WriteChar_0100
     * @tc.desc      test SUB_IPC_MessageSequence_writeChar
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_WriteChar_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeChar_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: byte = 97;
        data.writeChar(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeChar_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeChar_0100  done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeChar_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_WriteDouble_0100
     * @tc.number    SUB_IPC_MessageSequence_WriteDouble_0100
     * @tc.desc      test SUB_IPC_MessageSequence_writeDouble
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_WriteDouble_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeDouble_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let a: double = 9.7;
        data.writeDouble(a);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDouble_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDouble_0100  done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeDouble_0100 --------------------');
    });


    /**
     * @tc.name      SUB_IPC_MessageSequence_writeFloat_0100
     * @tc.number    SUB_IPC_MessageSequence_WriteFloat_0100
     * @tc.desc      test SUB_IPC_MessageSequence_writeFloat_0100
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeFloat_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteFloat_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input = 1.2;
        data.writeFloat(input);
      } catch (error) {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteFloat_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteFloat_0100  done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteFloat_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_WriteShort_0100
     * @tc.number    SUB_IPC_MessageSequence_WriteShort_0100
     * @tc.desc      test SUB_IPC_MessageSequence_writeShort
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_WriteShort_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteShort_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input = 123;
        data.writeShort(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteShort_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteShort_0100  done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteShort_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_WriteByte_0100
     * @tc.number    SUB_IPC_MessageSequence_WriteByte_0100
     * @tc.desc      test SUB_IPC_MessageSequence_writeByte
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_WriteByte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteByte_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input = 1;
        data.writeByte(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteByte_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteByte_0100  done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteByte_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ReadByteArray_0100
     * @tc.number    SUB_IPC_MessageSequence_ReadByteArray_0100
     * @tc.desc      test SUB_IPC_MessageSequence_ReadByteArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ReadByteArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadByteArray_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeByteArray(input);
        let res = data.readByteArray();
        expect(res.length > 0).assertTrue();
        expect(res).assertDeepEquals(input);
        hilog.info(domain, tag, 'SUB_IPC_MessageSequence_ReadByteArray_0100 res ' + res);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadByteArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadByteArray_0100  done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadByteArray_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ReadByteArray_200
     * @tc.number    SUB_IPC_MessageSequence_ReadByteArray_200
     * @tc.desc      test SUB_IPC_MessageSequence_ReadByteArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ReadByteArray_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadByteArray_200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeByteArray(input);
        let res: Array<int> = new Array<int>(input.length);
        data.readByteArray(res);
        expect(res).assertDeepEquals(input);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadByteArray_200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadByteArray_200  done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadByteArray_200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ReadByteArray_0300
     * @tc.number    SUB_IPC_MessageSequence_ReadByteArray_0300
     * @tc.desc      test SUB_IPC_MessageSequence_ReadByteArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ReadByteArray_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadByteArray_0300 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [];
        data.writeByteArray(input);
        let res = data.readByteArray();
        expect(res.length == 0).assertTrue();
        expect(res).assertDeepEquals(input);
        hilog.info(domain, tag, 'SUB_IPC_MessageSequence_ReadByteArray_0300 res ' + res);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadByteArray_0300 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadByteArray_0300  done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadByteArray_0300 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_RewindWriteAndRead_0100
     * @tc.number    SUB_IPC_MessageSequence_RewindWriteAndRead_0100
     * @tc.desc      test SUB_IPC_MessageSequence_RewindWriteAndRead
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_RewindWriteAndRead_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_RewindWriteAndRead_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.rewindRead(0);
        data.rewindWrite(0);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_RewindWriteAndRead_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_RewindWriteAndRead_0100  done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_RewindWriteAndRead_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_RewindWriteAndRead_0200
     * @tc.number    SUB_IPC_MessageSequence_RewindWriteAndRead_0200
     * @tc.desc      test SUB_IPC_MessageSequence_RewindWriteAndRead
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_RewindWriteAndRead_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_RewindWriteAndRead_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeInt(1);
        data.writeString("a");
        data.writeInt(2);
        let resInt = data.readInt();
        expect(resInt == 1).assertTrue();
        let resString = data.readString();
        expect(resString).assertEqual("a");
        let resInt1 = data.readInt();
        expect(resInt1 == 2).assertTrue();
        data.rewindRead(0);
        let resInt2 = data.readInt();
        expect(resInt2 == 1).assertTrue();
        data.rewindWrite(0);
        data.writeInt(5);
        data.rewindRead(0);
        let res1 = data.readInt();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_RewindWriteAndRead_0200 res1 is: ' + res1);
        expect(res1 == 5).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_RewindWriteAndRead_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_RewindWriteAndRead_0200 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_RewindWriteAndRead_0200  done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_RewindWriteAndRead_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_SetSize_0100
     * @tc.number    SUB_IPC_MessageSequence_SetSize_0100
     * @tc.desc      test SUB_IPC_MessageSequence_SetSize
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_SetSize_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_SetSize_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.setSize(100000);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_SetSize_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_SetSize_0100  done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_SetSize_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_SetSize_0200
     * @tc.number    SUB_IPC_MessageSequence_SetSize_0200
     * @tc.desc      test SetSize different size
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_SetSize_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_SetSize_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.setSize(100000);
        data.setSize(50);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_SetSize_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_SetSize_0200  done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_SetSize_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_dupFileDescriptor_0100
     * @tc.number    SUB_IPC_MessageSequence_dupFileDescriptor_0100
     * @tc.desc      test SUB_IPC_MessageSequence_dupFileDescriptor
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_dupFileDescriptor_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_dupFileDescriptor_0100 --------------------');

      try {
        let res = rpc.MessageSequence.dupFileDescriptor(1);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_dupFileDescriptor_0100 res is: ' + res);
        expect(res != null).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_dupFileDescriptor_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_dupFileDescriptor_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_WriteRemoteObjectArray_0100
     * @tc.number    SUB_IPC_MessageSequence_WriteRemoteObjectArray_0100
     * @tc.desc      test SUB_IPC_MessageSequence_writeRemoteObjectArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_WriteRemoteObjectArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteRemoteObjectArray_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let testRemtoeObject = new TestRemoteObject("testObject");
        let testRemtoeObject1 = new TestRemoteObject("testObject1");
        let a: Array<rpc.IRemoteObject> = [testRemtoeObject, testRemtoeObject1];
        data.writeRemoteObjectArray(a);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteRemoteObjectArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteRemoteObjectArray_0100 done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteRemoteObjectArray_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ReadRemoteObjectArray_0100
     * @tc.number    SUB_IPC_MessageSequence_ReadRemoteObjectArray_0100
     * @tc.desc      test ReadRemoteObjectArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ReadRemoteObjectArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadRemoteObjectArray_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let testRemtoeObject = new TestRemoteObject("testObject");
        let testRemtoeObject1 = new TestRemoteObject("testObject1");
        let a: Array<rpc.IRemoteObject> = [testRemtoeObject, testRemtoeObject1];
        data.writeRemoteObjectArray(a);
        let res: Array<rpc.IRemoteObject> = new Array<rpc.IRemoteObject>(a.length);
        data.readRemoteObjectArray(res);
        for (let index = 0; index < res.length; index++) {
          expect(res[index] != null).assertTrue();
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadRemoteObjectArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadRemoteObjectArray_0100 done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadRemoteObjectArray_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ReadRemoteObjectArray_0200
     * @tc.number    SUB_IPC_MessageSequence_ReadRemoteObjectArray_0200
     * @tc.desc      test ReadRemoteObjectArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ReadRemoteObjectArray_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadRemoteObjectArray_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let testRemtoeObject = new TestRemoteObject("testObject");
        let testRemtoeObject1 = new TestRemoteObject("testObject1");
        let a: Array<rpc.IRemoteObject> = [testRemtoeObject, testRemtoeObject1];
        data.writeRemoteObjectArray(a);
        let res: Array<rpc.IRemoteObject> = new Array<rpc.IRemoteObject>(a.length);
        res = data.readRemoteObjectArray();
        expect(res.length > 0).assertTrue();
        for (let index = 0; index < res.length; index++) {
          expect(res[index] != null).assertTrue();
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadRemoteObjectArray_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadRemoteObjectArray_0200 done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadRemoteObjectArray_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ReadRemoteObjectArray_0300
     * @tc.number    SUB_IPC_MessageSequence_ReadRemoteObjectArray_0300
     * @tc.desc      test ReadRemoteObjectArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ReadRemoteObjectArray_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadRemoteObjectArray_0300 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let a: Array<rpc.IRemoteObject> = [];
        data.writeRemoteObjectArray(a);
        let res: Array<rpc.IRemoteObject> = new Array<rpc.IRemoteObject>(a.length);
        res = data.readRemoteObjectArray();
        expect(res.length == 0).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadRemoteObjectArray_0300 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadRemoteObjectArray_0300 done');
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadRemoteObjectArray_0300 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Ashmen_CloseAshmem_0100
     * @tc.number    SUB_IPC_Ashmen_CloseAshmem_0100
     * @tc.desc      test Ashmen_CloseAshmem
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_Ashmen_CloseAshmem_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmen_CloseAshmem_0100 --------------------');
      let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
      try {
        ashmem.closeAshmem();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_CloseAshmem_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        ashmem.closeAshmem();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_CloseAshmem_0100 done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmen_CloseAshmem_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Ashmen_UnMapAshmem_0100
     * @tc.number    SUB_IPC_Ashmen_UnMapAshmem_0100
     * @tc.desc      test SUB_IPC_Ashmen_UnMapAshmem
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_Ashmen_UnMapAshmem_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmen_UnMapAshmem_0100 --------------------');
      let ashmem = rpc.Ashmem.create("ashmem1", 1024 * 1024);
      try {
        ashmem.mapTypedAshmem(3);
        ashmem.unmapAshmem();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_UnMapAshmem_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_UnMapAshmem_0100 done');
        ashmem.closeAshmem();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmen_UnMapAshmem_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageOption_GetFlagsAndSetFlags_0100
     * @tc.number    SUB_IPC_MessageOption_GetFlagsAndSetFlags_0100
     * @tc.desc      test SUB_IPC_MessageOption_GetFlagsAndSetFlags SYNC
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageOption_GetFlagsAndSetFlags_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageOption_GetFlagsAndSetFlags_0100 --------------------');
      try {
        let option = new rpc.MessageOption();
        let flag = rpc.MessageOption.TF_SYNC;
        option.setFlags(flag);
        let res = option.getFlags();
        expect(res == flag).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_GetFlagsAndSetFlags_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageOption_GetFlagsAndSetFlags_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageOption_GetFlagsAndSetFlags_0200
     * @tc.number    SUB_IPC_MessageOption_GetFlagsAndSetFlags_0200
     * @tc.desc      test SUB_IPC_MessageOption_GetFlagsAndSetFlags ASYNC
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageOption_GetFlagsAndSetFlags_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageOption_GetFlagsAndSetFlags_0200 --------------------');
      try {
        let option = new rpc.MessageOption();
        let flag = rpc.MessageOption.TF_ASYNC;
        option.setFlags(flag);
        let res = option.getFlags();
        expect(res == flag).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_GetFlagsAndSetFlags_0200 error is: ' + error);
        expect(error == null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageOption_GetFlagsAndSetFlags_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageOption_GetWaitTimeAndSetWaitTime_0100
     * @tc.number    SUB_IPC_MessageOption_GetWaitTimeAndSetWaitTime_0100
     * @tc.desc      test SUB_IPC_MessageOption_GetWaitTimeAndSetWaitTime
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageOption_GetWaitTimeAndSetWaitTime_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageOption_GetWaitTimeAndSetWaitTime_0100 --------------------');
      try {
        let option = new rpc.MessageOption();
        let time = 10
        option.setWaitTime(time);
        let res = option.getWaitTime();
        expect(res == time).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_GetWaitTimeAndSetWaitTime_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageOption_GetWaitTimeAndSetWaitTime_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_GetSize_0100
     * @tc.number    SUB_IPC_MessageSequence_GetSize_0100
     * @tc.desc      test SUB_IPC_MessageSequence_GetSize
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_GetSize_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetSize_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let size: int = 123;
        data.setSize(size);
        let res: long = data.getSize();
        expect(res == 0).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetSize_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetSize_0100 done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetSize_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_GetWritableBytes_0100
     * @tc.number    SUB_IPC_MessageSequence_GetWritableBytes_0100
     * @tc.desc      test SUB_IPC_MessageSequence_GetWritableBytes
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_GetWritableBytes_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetWritableBytes_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let size: long = data.getWritableBytes();
        expect(size == 0).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetWritableBytes_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetWritableBytes_0100 done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetWritableBytes_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_GetWritableBytes_0200
     * @tc.number    SUB_IPC_MessageSequence_GetWritableBytes_0200
     * @tc.desc      test SUB_IPC_MessageSequence_GetWritableBytes
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_GetWritableBytes_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetWritableBytes_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeInt(10)
        let size: long = data.getWritableBytes();
        expect(size == 60).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetWritableBytes_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetWritableBytes_0200 done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetWritableBytes_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_GetReadableBytes_0100
     * @tc.number    SUB_IPC_MessageSequence_GetReadableBytes_0100
     * @tc.desc      test SUB_IPC_MessageSequence_GetReadableBytes
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_GetReadableBytes_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetReadableBytes_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let size: long = data.getReadableBytes();
        expect(size == 0).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetReadableBytes_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetReadableBytes_0100 done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetReadableBytes_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_GetReadableBytes_0200
     * @tc.number    SUB_IPC_MessageSequence_GetReadableBytes_0200
     * @tc.desc      test SUB_IPC_MessageSequence_GetReadableBytes
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_GetReadableBytes_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetReadableBytes_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeInt(1);
        data.writeLong(2);
        let size: long = data.getReadableBytes();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetReadableBytes_0200 size is: ' + size);
        expect(size == 12).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetReadableBytes_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetReadableBytes_0200 done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetReadableBytes_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_GetReadPosition_0100
     * @tc.number    SUB_IPC_MessageSequence_GetReadPosition_0100
     * @tc.desc      test SUB_IPC_MessageSequence_GetReadPosition
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_GetReadPosition_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetReadPosition_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let size: long = data.getReadPosition();
        expect(size == 0).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetReadPosition_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetReadPosition_0100 done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetReadPosition_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_GetReadPosition_0200
     * @tc.number    SUB_IPC_MessageSequence_GetReadPosition_0200
     * @tc.desc      test SUB_IPC_MessageSequence_GetReadPosition
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_GetReadPosition_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetReadPosition_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeInt(10);
        data.writeLong(125);
        data.readInt();
        let size: long = data.getReadPosition();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetReadPosition_0200 size is: ' + size);
        expect(size == 4).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetReadPosition_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetReadPosition_0200 done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetReadPosition_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_GetWritePosition_0100
     * @tc.number    SUB_IPC_MessageSequence_GetWritePosition_0100
     * @tc.desc      test SUB_IPC_MessageSequence_GetWritePosition
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_GetWritePosition_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetWritePosition_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let size: long = data.getWritePosition();
        expect(size == 0).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetWritePosition_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetWritePosition_0100 done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetWritePosition_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_GetWritePosition_0200
     * @tc.number    SUB_IPC_MessageSequence_GetWritePosition_0200
     * @tc.desc      test SUB_IPC_MessageSequence_GetWritePosition
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_GetWritePosition_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetWritePosition_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeInt(10);
        let size: long = data.getWritePosition();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetWritePosition_0200 size ' + size)
        expect(size == 4).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetWritePosition_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetWritePosition_0200 done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetWritePosition_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ContainFileDescriptors_0100
     * @tc.number    SUB_IPC_MessageSequence_ContainFileDescriptors_0100
     * @tc.desc      test SUB_IPC_MessageSequence_ContainFileDescriptors
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ContainFileDescriptors_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ContainFileDescriptors_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let ret: boolean = data.containFileDescriptors();
        expect(ret).assertFalse();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ContainFileDescriptors_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ContainFileDescriptors_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ContainFileDescriptors_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_ContainFileDescriptors_0200
     * @tc.number    SUB_IPC_MessageSequence_ContainFileDescriptors_0200
     * @tc.desc      test SUB_IPC_MessageSequence_ContainFileDescriptors
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_ContainFileDescriptors_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ContainFileDescriptors_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
        let pathDir = context.filesDir;
        let filePath = pathDir + "/test3.txt";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        data.writeFileDescriptor(file.fd);
        let ret: boolean = data.containFileDescriptors();
        expect(ret).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ContainFileDescriptors_0200 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ContainFileDescriptors_0200 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ContainFileDescriptors_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_GetRawDataCapacity_0100
     * @tc.number    SUB_IPC_MessageSequence_GetRawDataCapacity_0100
     * @tc.desc      test SUB_IPC_MessageSequence_GetRawDataCapacity
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_GetRawDataCapacity_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetRawDataCapacity_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let size: long = data.getRawDataCapacity();
        expect(size > 0).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetRawDataCapacity_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetRawDataCapacity_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetRawDataCapacity_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_readByte_0100
     * @tc.number    SUB_IPC_MessageSequence_readByte_0100
     * @tc.desc      test SUB_IPC_MessageSequence_readByte
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_readByte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readByte_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeByte(97);
        let res = data.readByte();
        expect(res == 97).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByte_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByte_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readByte_0100 --------------------');
    });


    /**
     * @tc.name      SUB_IPC_MessageSequence_readShort_0100
     * @tc.number    SUB_IPC_MessageSequence_readShort_0100
     * @tc.desc      test SUB_IPC_MessageSequence_readShort
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_readShort_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readShort_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeShort(123);
        let res = data.readShort();
        expect(res == 123).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShort_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShort_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readShort_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_readFloat_0100
     * @tc.number    SUB_IPC_MessageSequence_readFloat_0100
     * @tc.desc      test SUB_IPC_MessageSequence_readFloat
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_readFloat_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readFloat_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeFloat(123456);
        let res = data.readFloat();
        expect(res == 123456).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloat_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloat_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readFloat_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int8_0100
     * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int8_0100
     * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int8
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int8_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int8_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        console.println(`data gen`);
        let buffer = new ArrayBuffer(1 * 10);
        let int8View = new Int8Array(buffer);
        for (let i = 0; i < int8View.length; i++) {
          int8View[i] = i * 2 + 1;
          if (i % 2 != 0) {
            int8View[i] = -int8View[i];
          }
        }

        data.writeArrayBuffer(buffer, rpc.TypeCode.INT8_ARRAY);
        console.println(`writeArrayBuffer success`);
        console.println(`write ArrayBuffer is :` + int8View);

        let result = data.readArrayBuffer(rpc.TypeCode.INT8_ARRAY);
        let readInt8View = new Int8Array(result);
        console.println(`ArrayBuffer success`);
        console.println(`read data is :` + readInt8View);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s',
          'SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int8_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int8_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int8_0100 --------------------');
    });


    /**
     * @tc.name      SUB_IPC_WriteAndRead_ArrayBuffer_UInt8_0100
     * @tc.number    SUB_IPC_WriteAndRead_ArrayBuffer_UInt8_0100
     * @tc.desc      test SUB_IPC_WriteAndRead_ArrayBuffer_UInt8
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_WriteAndRead_ArrayBuffer_UInt8_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_WriteAndRead_ArrayBuffer_UInt8_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        console.println(`data gen`);
        let buffer = new ArrayBuffer(1 * 10);
        let uint8View = new Uint8Array(buffer);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i * 2 + 1;
        }

        try {
          data.writeArrayBuffer(buffer, rpc.TypeCode.UINT8_ARRAY);
          console.println(`writeArrayBuffer success`);
          console.println(`write ArrayBuffer is :` + uint8View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }

        try {
          let result = data.readArrayBuffer(rpc.TypeCode.UINT8_ARRAY);
          let readUInt8View = new Uint8Array(result);
          console.println(`ArrayBuffer success`);
          console.println(`read data is :` + readUInt8View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_UInt8_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_UInt8_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_WriteAndRead_ArrayBuffer_UInt8_0100 --------------------');
    });


    /**
     * @tc.name      SUB_IPC_WriteAndRead_ArrayBuffer_Int16_0100
     * @tc.number    SUB_IPC_WriteAndRead_ArrayBuffer_Int16_0100
     * @tc.desc      test SUB_IPC_WriteAndRead_ArrayBuffer_Int16
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_WriteAndRead_ArrayBuffer_Int16_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_WriteAndRead_ArrayBuffer_Int16_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        console.println(`data gen`);
        let buffer = new ArrayBuffer(2 * 10);
        let int16View = new Int16Array(buffer);
        for (let i = 0; i < int16View.length; i++) {
          int16View[i] = i * 2 + 1;
          if (i % 2 != 0) {
            int16View[i] = -int16View[i];
          }
        }

        try {
          data.writeArrayBuffer(buffer, rpc.TypeCode.INT16_ARRAY);
          console.println(`writeArrayBuffer success`);
          console.println(`write ArrayBuffer is :` + int16View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }

        try {
          let result = data.readArrayBuffer(rpc.TypeCode.INT16_ARRAY);
          let readInt16View = new Int16Array(result);
          console.println(`ArrayBuffer success`);
          console.println(`read data is :` + readInt16View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_Int16_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_Int16_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_WriteAndRead_ArrayBuffer_Int16_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_WriteAndRead_ArrayBuffer_UInt16_0100
     * @tc.number    SUB_IPC_WriteAndRead_ArrayBuffer_UInt16_0100
     * @tc.desc      test SUB_IPC_WriteAndRead_ArrayBuffer_UInt16
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_WriteAndRead_ArrayBuffer_UInt16_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_WriteAndRead_ArrayBuffer_UInt16_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        console.println(`data gen`);
        let buffer = new ArrayBuffer(2 * 10);
        let uint16View = new Uint16Array(buffer);
        for (let i = 0; i < uint16View.length; i++) {
          uint16View[i] = i * 2 + 1;
        }

        try {
          data.writeArrayBuffer(buffer, rpc.TypeCode.UINT16_ARRAY);
          console.println(`writeArrayBuffer success`);
          console.println(`write ArrayBuffer is :` + uint16View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }

        try {
          let result = data.readArrayBuffer(rpc.TypeCode.UINT16_ARRAY);
          let readUInt16View = new Uint16Array(result);
          console.println(`ArrayBuffer success`);
          console.println(`read data is :` + readUInt16View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_UInt16_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_UInt16_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_WriteAndRead_ArrayBuffer_UInt16_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_WriteAndRead_ArrayBuffer_UInt32_0100
     * @tc.number    SUB_IPC_WriteAndRead_ArrayBuffer_UInt32_0100
     * @tc.desc      test SUB_IPC_WriteAndRead_ArrayBuffer_UInt32
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_WriteAndRead_ArrayBuffer_UInt32_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_WriteAndRead_ArrayBuffer_UInt32_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        console.println(`data gen`);
        let buffer = new ArrayBuffer(4 * 10);
        let uint32View = new Uint32Array(buffer);
        for (let i = 0; i < uint32View.length; i++) {
          uint32View[i] = i * 2 + 1;
        }

        try {
          data.writeArrayBuffer(buffer, rpc.TypeCode.UINT32_ARRAY);
          console.println(`writeArrayBuffer success`);
          console.println(`write ArrayBuffer is :` + uint32View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }

        try {
          let result = data.readArrayBuffer(rpc.TypeCode.UINT32_ARRAY);
          let readUInt32View = new Uint32Array(result);
          console.println(`ArrayBuffer success`);
          console.println(`read data is :` + readUInt32View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_UInt32_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_UInt32_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_WriteAndRead_ArrayBuffer_UInt32_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_WriteAndRead_ArrayBuffer_Int32_0100
     * @tc.number    SUB_IPC_WriteAndRead_ArrayBuffer_Int32_0100
     * @tc.desc      test SUB_IPC_WriteAndRead_ArrayBuffer_Int32
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_WriteAndRead_ArrayBuffer_Int32_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_WriteAndRead_ArrayBuffer_Int32_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        console.println(`data gen`);
        let buffer = new ArrayBuffer(4 * 10);
        let int32View = new Int32Array(buffer);
        for (let i = 0; i < int32View.length; i++) {
          int32View[i] = i * 2 + 1;
        }

        try {
          data.writeArrayBuffer(buffer, rpc.TypeCode.INT32_ARRAY);
          console.println(`writeArrayBuffer success`);
          console.println(`write ArrayBuffer is :` + int32View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }

        try {
          let result = data.readArrayBuffer(rpc.TypeCode.INT32_ARRAY);
          let readInt32View = new Int32Array(result);
          console.println(`ArrayBuffer success`);
          console.println(`read data is :` + readInt32View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_Int32_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_Int32_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_WriteAndRead_ArrayBuffer_Int32_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_WriteAndRead_ArrayBuffer_Float32_0100
     * @tc.number    SUB_IPC_WriteAndRead_ArrayBuffer_Float32_0100
     * @tc.desc      test SUB_IPC_WriteAndRead_ArrayBuffer_Float32
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_WriteAndRead_ArrayBuffer_Float32_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_WriteAndRead_ArrayBuffer_Float32_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        console.println(`data gen`);
        let buffer = new ArrayBuffer(4 * 10);
        let float32View = new Float32Array(buffer);
        for (let i = 0; i < float32View.length; i++) {
          float32View[i] = i * 2 + i * 1.0 / 10;
          if (i % 2 != 0) {
            float32View[i] = -float32View[i];
          }
        }

        try {
          data.writeArrayBuffer(buffer, rpc.TypeCode.FLOAT32_ARRAY);
          console.println(`writeArrayBuffer success`);
          console.println(`write data is :` + float32View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }

        try {
          let result = data.readArrayBuffer(rpc.TypeCode.FLOAT32_ARRAY);
          let readFloat32View = new Float32Array(result);
          console.println(`readFloat32View success`);
          console.println(`ArrayBuffer is :` + readFloat32View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_Float32_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_Float32_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_WriteAndRead_ArrayBuffer_Float32_0100 --------------------');
    });


    /**
     * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Float64_0100
     * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Float64_0100
     * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Float64
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Float64_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Float64_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        console.println(`data gen`);
        let buffer = new ArrayBuffer(8 * 10);
        let float64View = new Float64Array(buffer);
        for (let i = 0; i < float64View.length; i++) {
          float64View[i] = i * 2 + i * 1.0 / 10;
          if (i % 2 != 0) {
            float64View[i] = -float64View[i];
          }
        }

        try {
          data.writeArrayBuffer(buffer, rpc.TypeCode.FLOAT64_ARRAY);
          console.println(`writeArrayBuffer success`);
          console.println(`write data is :` + float64View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }

        try {
          let result = data.readArrayBuffer(rpc.TypeCode.FLOAT64_ARRAY);
          let readFloat64View = new Float64Array(result);
          console.println(`readArrayBuffer success`);
          console.println(`ArrayBuffer is :` + readFloat64View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s',
          'SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Float64_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Float64_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Float64_0100 --------------------');
    });


    /**
     * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int64_0100
     * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int64_0100
     * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int64
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int64_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int64_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        console.println(`data gen`);
        let buffer = new ArrayBuffer(8 * 10);
        let bInt64View = new BigInt64Array(buffer);
        for (let i = 0; i < bInt64View.length; i++) {
          bInt64View[i] = i * 2 + 1;
          if (i % 2 != 0) {
            bInt64View[i] = -bInt64View[i];
          }
        }

        try {
          data.writeArrayBuffer(buffer, rpc.TypeCode.BIGINT64_ARRAY);
          console.println(`writeArrayBuffer success`);
          console.println(`write data is :` + bInt64View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }

        try {
          let result = data.readArrayBuffer(rpc.TypeCode.BIGINT64_ARRAY);
          let readInt64View = new BigInt64Array(result);
          console.println(`readArrayBuffer success`);
          console.println(`read data is :` + readInt64View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }

      } catch (error) {
        hilog.info(domain, tag, '%{public}s',
          'SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int64_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int64_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int64_0100 --------------------');
    });


    /**
     * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_UInt64_0100
     * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_UInt64_0100
     * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_UInt64
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_UInt64_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_UInt64_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        console.println(`data gen`);
        let buffer = new ArrayBuffer(8 * 10);
        let bUInt64View = new BigInt64Array(buffer);
        for (let i = 0; i < bUInt64View.length; i++) {
          bUInt64View[i] = i * 2 + 1;
        }

        try {
          data.writeArrayBuffer(buffer, rpc.TypeCode.BIGUINT64_ARRAY);
          console.println(`writeArrayBuffer success`);
          console.println(`write data is :` + bUInt64View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }

        try {
          let result = data.readArrayBuffer(rpc.TypeCode.BIGUINT64_ARRAY);
          let readUInt64View = new BigInt64Array(result);
          console.println(`readArrayBuffer success`);
          console.println(`read data is :` + readUInt64View);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s',
          'SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_UInt64 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_UInt64 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_UInt64_0100 --------------------');
    });


    /**
     * @tc.name      SUB_IPC_MessageSequence_writeRemoteObjectArray_0100
     * @tc.number    SUB_IPC_MessageSequence_writeRemoteObjectArray_0100
     * @tc.desc      test SUB_IPC_MessageSequence_writeRemoteObjectArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeRemoteObjectArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeRemoteObjectArray_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let testRemtoeObject = new TestRemoteObject("testObject");
        let testRemtoeObject1 = new TestRemoteObject("testObject1");
        let a: Array<rpc.IRemoteObject> = [testRemtoeObject, testRemtoeObject1];
        data.writeRemoteObjectArray(a);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_ error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObjectArray_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeRemoteObjectArray_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_readCharArray_0100
     * @tc.number    SUB_IPC_MessageSequence_readCharArray_0100
     * @tc.desc      test writeCharArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_readCharArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readCharArray_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let a: Array<int> = [97, 98];
        data.writeCharArray(a);
        let res = data.readCharArray();
        expect(res.length > 0).assertTrue();
        expect(res).assertDeepEquals(a);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_0100 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readCharArray_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_readCharArray_0200
     * @tc.number   SUB_IPC_MessageSequence_readCharArray_0200
     * @tc.desc     test readCharArray
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_readCharArray_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readCharArray_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5];
        data.writeCharArray(input);
        let res: Array<int> = new Array<int>(input.length);
        res = data.readCharArray();
        expect(res).assertDeepEquals(input);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_0200 error is: ' + err);
        expect(err == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_0200 reclaim done');
        done();
      }
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readCharArray_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_readCharArray_0300
     * @tc.number    SUB_IPC_MessageSequence_readCharArray_0300
     * @tc.desc      test writeCharArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_readCharArray_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readCharArray_0300 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let a: Array<int> = [];
        data.writeCharArray(a);
        let res = data.readCharArray();
        expect(res.length == 0).assertTrue();
        expect(res).assertDeepEquals(a);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_0300 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_0300 reclaim done');
        data.reclaim();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readCharArray_0300 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_writeLongArray_0100
     * @tc.number    SUB_IPC_MessageSequence_writeLongArray_0100
     * @tc.desc      test SUB_IPC_MessageSequence_writeLongArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeLongArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeLongArray_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let b: long = 2;
        let c: long = 3;
        let a: Array<long> = [b, c];
        data.writeLongArray(a);
        let res = data.readLongArray();
        expect(res).assertDeepEquals(a);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLongArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLongArray_0100 reclaim done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeLongArray_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_writeShortArray_0100
     * @tc.number    SUB_IPC_MessageSequence_writeShortArray_0100
     * @tc.desc      test SUB_IPC_MessageSequence_writeShortArray
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeShortArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeShortArray_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let a: Array<int> = [100, 101];
        data.writeShortArray(a);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeShortArray_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeShortArray_0100 reclaim done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeShortArray_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_readChar_0100
     * @tc.number    SUB_IPC_MessageSequence_readChar_0100
     * @tc.desc      test SUB_IPC_MessageSequence_readChar
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_readChar_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readChar_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let a: byte = 97;
        data.writeChar(a);
        let res = data.readChar();
        expect(a == res).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readChar_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readChar_0100 reclaim done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readChar_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_readDouble_0100
     * @tc.number    SUB_IPC_MessageSequence_readDouble_0100
     * @tc.desc      test readDouble
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_readDouble_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readDouble_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let a: double = 9.7;
        data.writeDouble(a);
        let res = data.readDouble();
        expect(a == res).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDouble_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDouble_0100 reclaim done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readDouble_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Skeleton_resetCallingIdentity_0100
     * @tc.number    SUB_IPC_Skeleton_resetCallingIdentity_0100
     * @tc.desc      test SUB_IPC_Skeleton_resetCallingIdentity
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_Skeleton_resetCallingIdentity_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Skeleton_resetCallingIdentity_0100 --------------------');
      try {
        let identity = rpc.IPCSkeleton.resetCallingIdentity();
        expect(identity != null).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_resetCallingIdentity_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_resetCallingIdentity_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_resetCallingIdentity_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Skeleton_restoreCallingIdentity_0100
     * @tc.number    SUB_IPC_Skeleton_restoreCallingIdentity_0100
     * @tc.desc      test SUB_IPC_Skeleton_restoreCallingIdentity
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_Skeleton_restoreCallingIdentity_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Skeleton_restoreCallingIdentity_0100 --------------------');
      try {
        let identity = rpc.IPCSkeleton.resetCallingIdentity();
        rpc.IPCSkeleton.restoreCallingIdentity(identity);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_restoreCallingIdentity_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_restoreCallingIdentity_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Skeleton_restoreCallingIdentity_0200
     * @tc.number    SUB_IPC_Skeleton_restoreCallingIdentity_0200
     * @tc.desc      test restoreCallingIdentity
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_Skeleton_restoreCallingIdentity_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Skeleton_restoreCallingIdentity_0200 --------------------');
      try {
        let des = '';
        const targetLength = strlen - 1;
        for (let i = 0; i < targetLength; i++) {
          des += 'a';
        }
        rpc.IPCSkeleton.restoreCallingIdentity(des);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        hilog.info(domain, tag, '%{public}s',  'SUB_IPC_Skeleton_restoreCallingIdentity_0200 error is: ' + err);
        expect(err.message == null).assertTrue();
      } finally {
        expect(testFlag).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_restoreCallingIdentity_0200 reclaim done');
        done();
      }
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Skeleton_restoreCallingIdentity_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Skeleton_getCallingDeviceID_0100
     * @tc.number    SUB_IPC_Skeleton_getCallingDeviceID_0100
     * @tc.desc      test SUB_IPC_Skeleton_getCallingDeviceID
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_Skeleton_getCallingDeviceID_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Skeleton_getCallingDeviceID_0100 --------------------');
      try {
        let deviceID = rpc.IPCSkeleton.getCallingDeviceID();
        expect(deviceID != null).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_getCallingDeviceID_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_getCallingDeviceID_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Skeleton_getLocalDeviceID_0100
     * @tc.number    SUB_IPC_Skeleton_getLocalDeviceID_0100
     * @tc.desc      test SUB_IPC_Skeleton_getLocalDeviceID
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_Skeleton_getLocalDeviceID_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Skeleton_getLocalDeviceID_0100 --------------------');
      try {
        let deviceID = rpc.IPCSkeleton.getLocalDeviceID();
        expect(deviceID != null).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_getLocalDeviceID_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_getLocalDeviceID_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Skeleton_isLocalCallin_0100
     * @tc.number    SUB_IPC_Skeleton_isLocalCallin_0100
     * @tc.desc      test SUB_IPC_Skeleton_isLocalCallin
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_Skeleton_isLocalCallin_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Skeleton_isLocalCallin_0100 --------------------');
      try {
        let ret = rpc.IPCSkeleton.isLocalCalling();
        expect(ret).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_isLocalCallin_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_isLocalCallin_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Skeleton_flushCmdBuffer_0100
     * @tc.number    SUB_IPC_Skeleton_flushCmdBuffer_0100
     * @tc.desc      test SUB_IPC_Skeleton_flushCmdBuffer
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_Skeleton_flushCmdBuffer_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Skeleton_flushCmdBuffer_0100 --------------------');
      let a: rpc.IRemoteObject = new TestRemoteObject("testObject");
      try {
        rpc.IPCSkeleton.flushCmdBuffer(a);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_flushCmdBuffer_0100 error is: ' + error);
        expect(error == null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_flushCmdBuffer_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Ashmen_MapReadOnlyAshmem_0100
     * @tc.number    SUB_IPC_Ashmen_MapReadOnlyAshmem_0100
     * @tc.desc      test SUB_IPC_Ashmen_MapReadOnlyAshmem
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_Ashmen_MapReadOnlyAshmem_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Ashmen_MapReadOnlyAshmem_0100 --------------------');
      let ashmem = rpc.Ashmem.create("ashmem1", 1024 * 1024);
      try {
        ashmem.mapTypedAshmem(7);
        ashmem.mapReadonlyAshmem();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_MapReadOnlyAshmem_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_MapReadOnlyAshmem_0100 reclaim done');
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Ashmen_MapReadOnlyAshmem --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Ashmen_MapTypedAshmem_0100
     * @tc.number    SUB_IPC_Ashmen_MapTypedAshmem_0100
     * @tc.desc      test SUB_IPC_Ashmen_MapTypedAshmem
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_Ashmen_MapTypedAshmem_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Ashmen_MapTypedAshmem_0100 --------------------');
      let ashmem = rpc.Ashmem.create("ashmem1", 1024 * 1024);
      try {
        ashmem.mapTypedAshmem(1);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_MapTypedAshmem_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_MapTypedAshmem_0100 reclaim done');
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Ashmen_MapTypedAshmem_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Ashmen_SetProtectionType_0100
     * @tc.number    SUB_IPC_Ashmen_SetProtectionType_0100
     * @tc.desc      test SUB_IPC_Ashmen_SetProtectionType
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_Ashmen_SetProtectionType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Ashmen_SetProtectionType_0100 --------------------');
      let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
      try {
        ashmem.mapReadWriteAshmem();
        ashmem.setProtectionType(3);
        hilog.info(domain, tag, '%{public}s', `SetProtectionType finshed`);
        let buffer = new ArrayBuffer(1 * 10);
        let int8View = new Int8Array(buffer);
        for (let i = 0; i < int8View.length; i++) {
          int8View[i] = i * 2 + 1;
          if (i % 2 != 0) {
            int8View[i] = -int8View[i];
          }
        }
        hilog.info(domain, tag, '%{public}s', `write data is ${int8View}`);
        console.println(`write data is ${int8View}`);
        let length: int = 10;
        let offset: int = 0;
        ashmem.writeDataToAshmem(buffer, length, offset);
        hilog.info(domain, tag, '%{public}s', `WriteDataToAshMem finshed`);
        let result = ashmem.readDataFromAshmem(length, offset);
        hilog.info(domain, tag, '%{public}s', `readDataFromAshmem success`);
        expect(result.byteLength > 0).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0100 error is: ' + err);
        expect(err == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0100 reclaim done');
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Ashmen_SetProtectionType_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Ashmen_SetProtectionType_0200
     * @tc.number    SUB_IPC_Ashmen_SetProtectionType_0200
     * @tc.desc      test SUB_IPC_Ashmen_SetProtectionType PROT_READ
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_Ashmen_SetProtectionType_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Ashmen_SetProtectionType_0200 --------------------');
      let ashmem1 = rpc.Ashmem.create("ashmem", 1024 * 1024);
      try {
        ashmem1.setProtectionType(rpc.Ashmem.PROT_READ);
        hilog.info(domain, tag, '%{public}s', `SetProtectionType finshed`);
        let buffer = new ArrayBuffer(1 * 10);
        let int8View = new Int8Array(buffer);
        for (let i = 0; i < int8View.length; i++) {
          int8View[i] = i * 2 + 1;
          if (i % 2 != 0) {
            int8View[i] = -int8View[i];
          }
        }
        hilog.info(domain, tag, '%{public}s', `write data is ${int8View}`);
        console.println(`write data is ${int8View}`);
        let length: int = 10;
        let offset: int = 0;
        ashmem1.writeDataToAshmem(buffer, length, offset);
        hilog.info(domain, tag, '%{public}s', `WriteDataToAshMem finshed`);
        let result = ashmem1.readDataFromAshmem(length, offset);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0200 error code is: ' + err.code);
        expect(err.code == 1900003).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0200 reclaim done');
        ashmem1.unmapAshmem();
        ashmem1.closeAshmem();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Ashmen_SetProtectionType_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Ashmen_SetProtectionType_0300
     * @tc.number    SUB_IPC_Ashmen_SetProtectionType_0300
     * @tc.desc      test SUB_IPC_Ashmen_SetProtectionType PROT_WRITE
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_Ashmen_SetProtectionType_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Ashmen_SetProtectionType_0300 --------------------');
      let ashmem2 = rpc.Ashmem.create("ashmem", 1024 * 1024);
      try {
        ashmem2.setProtectionType(rpc.Ashmem.PROT_WRITE);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0300 rpc.Ashmem.PROT_WRITE is: ' + rpc.Ashmem.PROT_WRITE);
        hilog.info(domain, tag, '%{public}s', `SetProtectionType finshed`);
        let buffer = new ArrayBuffer(1 * 10);
        let int8View = new Int8Array(buffer);
        for (let i = 0; i < int8View.length; i++) {
          int8View[i] = i * 2 + 1;
          if (i % 2 != 0) {
            int8View[i] = -int8View[i];
          }
        }
        hilog.info(domain, tag, '%{public}s', `write data is ${int8View}`);
        console.println(`write data is ${int8View}`);
        let length: int = 10;
        let offset: int = 0;
        ashmem2.writeDataToAshmem(buffer, length, offset);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0300 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0300 error code is: ' + err.code);
        expect(err.code == 1900003).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0300 reclaim done');
        ashmem2.unmapAshmem();
        ashmem2.closeAshmem();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Ashmen_SetProtectionType_0300 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Ashmen_SetProtectionType_0400
     * @tc.number    SUB_IPC_Ashmen_SetProtectionType_0400
     * @tc.desc      test SUB_IPC_Ashmen_SetProtectionType PROT_NONE
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_Ashmen_SetProtectionType_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Ashmen_SetProtectionType_0400 --------------------');
      let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
      try {
        ashmem.setProtectionType(rpc.Ashmem.PROT_NONE);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0400 rpc.Ashmem.PROT_NONE is: ' + rpc.Ashmem.PROT_NONE);
        hilog.info(domain, tag, '%{public}s', `SetProtectionType finshed`);
        let buffer = new ArrayBuffer(1 * 10);
        let int8View = new Int8Array(buffer);
        for (let i = 0; i < int8View.length; i++) {
          int8View[i] = i * 2 + 1;
          if (i % 2 != 0) {
            int8View[i] = -int8View[i];
          }
        }
        hilog.info(domain, tag, '%{public}s', `write data is ${int8View}`);
        console.println(`write data is ${int8View}`);
        let length: int = 10;
        let offset: int = 0;
        ashmem.writeDataToAshmem(buffer, length, offset);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0400 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0400 error code is: ' + err.code);
        expect(err.code == 1900003).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0400 reclaim done');
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Ashmen_SetProtectionType_0400 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Ashmen_SetProtectionType_0500
     * @tc.number    SUB_IPC_Ashmen_SetProtectionType_0500
     * @tc.desc      test SUB_IPC_Ashmen_SetProtectionType PROT_EXEC
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_Ashmen_SetProtectionType_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Ashmen_SetProtectionType_0500 --------------------');
      let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
      try {
        ashmem.mapReadWriteAshmem();
        ashmem.setProtectionType(rpc.Ashmem.PROT_EXEC);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0500 rpc.Ashmem.PROT_EXEC is: ' + rpc.Ashmem.PROT_EXEC);
        hilog.info(domain, tag, '%{public}s', `SetProtectionType finshed`);
        let buffer = new ArrayBuffer(1 * 10);
        let int8View = new Int8Array(buffer);
        for (let i = 0; i < int8View.length; i++) {
          int8View[i] = i * 2 + 1;
          if (i % 2 != 0) {
            int8View[i] = -int8View[i];
          }
        }
        hilog.info(domain, tag, '%{public}s', `write data is ${int8View}`);
        console.println(`write data is ${int8View}`);
        let length: int = 10;
        let offset: int = 0;
        ashmem.writeDataToAshmem(buffer, length, offset);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0500 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0500 error code is: ' + err.code);
        expect(err.code == 1900003).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType_0500 reclaim done');
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Ashmen_SetProtectionType_0500 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_RemoteObject_getLocalInterface_0100
     * @tc.number    SUB_IPC_RemoteObject_getLocalInterface_0100
     * @tc.desc      test getLocalInterface
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_RemoteObject_getLocalInterface_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_RemoteObject_getLocalInterface_0100 --------------------');
      try {
        let testRemoteObject = new TestRemoteObject('testObject');
        testRemoteObject.modifyLocalInterface(testRemoteObject.getLocalInterface('testObject'), 'testObject12');
        let res = testRemoteObject.getLocalInterface('testObject');
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getLocalInterface_0100 res is:' + res);
        expect(res != null).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getLocalInterface_0100 error is:' + err);
        expect(err == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getLocalInterface_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_RemoteObject_getLocalInterface_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_RemoteObject_getLocalInterface_0200
     * @tc.number    SUB_IPC_RemoteObject_getLocalInterface_0200
     * @tc.desc      test getLocalInterface ErrorCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_RemoteObject_getLocalInterface_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_RemoteObject_getLocalInterface_0200 --------------------');
      try {
        let des ='';
        const targetLength = strlen - 1;
        for (let i = 0; i < targetLength; i++) {
          des += 'a';
        }
        let testRemoteObject = new TestRemoteObject('testObject');
        testRemoteObject.modifyLocalInterface(testRemoteObject.getLocalInterface('testObject'), 'testObject')
        let res = testRemoteObject.getLocalInterface(des);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getLocalInterface_0200 error is: ' + err);
        expect(err.message == null).assertTrue();
      } finally {
        expect(testFlag).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getLocalInterface_0200 reclaim done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_RemoteObject_getLocalInterface_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_RemoteObject_modifyLocalInterface_0100
     * @tc.number    SUB_IPC_RemoteObject_modifyLocalInterface_0100
     * @tc.desc      test modifyLocalInterface
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_RemoteObject_modifyLocalInterface_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_RemoteObject_modifyLocalInterface_0100 --------------------');
      try {
        let testObject = new TestRemoteObject('testObject');
        let broker = testObject.getLocalInterface('testObject')
        testObject.modifyLocalInterface(broker,"testObject1")
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_modifyLocalInterface_0100 error is: ' + err);
        expect(err == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_modifyLocalInterface_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_RemoteObject_modifyLocalInterface_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_RemoteObject_modifyLocalInterface_0200
     * @tc.number    SUB_IPC_RemoteObject_modifyLocalInterface_0200
     * @tc.desc      test modifyLocalInterface
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_RemoteObject_modifyLocalInterface_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_RemoteObject_modifyLocalInterface_0200 --------------------');
      try {
        let testObject = new TestRemoteStub('testObject');
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_modifyLocalInterface_0200 error is: ' + err);
        expect(err == null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_modifyLocalInterface_0200 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_RemoteObject_modifyLocalInterface_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_RemoteObject_modifyLocalInterface_0300
     * @tc.number    SUB_IPC_RemoteObject_modifyLocalInterface_0300
     * @tc.desc      test modifyLocalInterface
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_RemoteObject_modifyLocalInterface_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_modifyLocalInterface_0300 --------------------');
      try {
        let des = '';
        const targetLength = strlen - 1;
        for (let i = 0; i < targetLength; i++) {
          des += 'a';
        }
        let testRemoteObject = new TestRemoteObject('testObject');
        testRemoteObject.modifyLocalInterface(testRemoteObject.getLocalInterface('testObject'), des)
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        hilog.info(domain, tag, '%{public}s',  'SUB_IPC_RemoteObject_modifyLocalInterface_0300 error is: ' + err);
        expect(err.message == null).assertTrue();
      } finally {
        expect(testFlag).assertTrue();
        hilog.info(domain, tag, '%{public}s',  'SUB_IPC_RemoteObject_modifyLocalInterface_0300 reclaim done');
        done();
      }
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_modifyLocalInterface_0300 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_setSize_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_setSize_ErrorCode_0100
     * @tc.desc      test setSize ErrorCode
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_setSize_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_setSize_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        data.reclaim();
        data.setSize(0);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setSize_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setSize_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_setSize_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_rewindRead_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_rewindRead_ErrorCode_0100
     * @tc.desc      test rewindRead ErrorCode
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_rewindRead_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_rewindRead_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        data.reclaim();
        data.rewindRead(0);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_rewindRead_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_rewindRead_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_rewindRead_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_rewindWrite_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_rewindWrite_ErrorCode_0100
     * @tc.desc      test rewindWrite ErrorCode
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_rewindWrite_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_rewindWrite_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        data.reclaim();
        data.rewindWrite(0);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_rewindWrite_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_rewindWrite_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_rewindWrite_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_writeByte_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_writeByte_ErrorCode_0100
     * @tc.desc      test writeByte ErrorCode
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeByte_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeByte_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        data.reclaim();
        data.writeByte(1);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByte_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByte_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeByte_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_readByte_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_readByte_ErrorCode_0100
     * @tc.desc      test readByte ErrorCode
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_readByte_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readByte_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        data.reclaim();
        data.readByte();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByte_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByte_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readByte_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_writeShort_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_writeShort_ErrorCode_0100
     * @tc.desc      test writeShort ErrorCode
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeShort_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeShort_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        data.reclaim();
        data.writeShort(1);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeShort_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeShort_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeShort_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_readShort_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_readShort_ErrorCode_0100
     * @tc.desc      test readShort ErrorCode
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_readShort_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readShort_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        data.reclaim();
        data.readShort();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShort_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShort_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readShort_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_writeFloat_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_writeFloat_ErrorCode_0100
     * @tc.desc      test writeFloat ErrorCode
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeFloat_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeFloat_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        data.reclaim();
        data.writeFloat(1.1);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFloat_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFloat_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeFloat_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_readFloat_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_readFloat_ErrorCode_0100
     * @tc.desc      test readFloat ErrorCode
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_readFloat_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readFloat_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        data.reclaim();
        data.readFloat();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloat_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloat_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readFloat_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_writeDouble_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_writeDouble_ErrorCode_0100
     * @tc.desc      test writeDouble ErrorCode
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeDouble_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeDouble_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        data.reclaim();
        data.writeDouble(1.12);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDouble_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDouble_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeDouble_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_readDouble_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_readDouble_ErrorCode_0100
     * @tc.desc      test readDouble ErrorCode
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_readDouble_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readDouble_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        data.reclaim();
        data.readDouble();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDouble_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDouble_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readDouble_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_writeChar_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_writeChar_ErrorCode_0100
     * @tc.desc      test writeChar ErrorCode
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeChar_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeChar_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        data.reclaim();
        data.writeChar(1);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeChar_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeChar_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeChar_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_readChar_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_readChar_ErrorCode_0100
     * @tc.desc      test readChar ErrorCode
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it("SUB_IPC_MessageSequence_readChar_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readChar_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        data.reclaim();
        data.readChar();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readChar_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readChar_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readChar_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_readByteArray_ErrorCode_0100
     * @tc.number   SUB_IPC_MessageSequence_readByteArray_ErrorCode_0100
     * @tc.desc     test readByteArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_readByteArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readByteArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5];
        data.writeByteArray(input);
        let res: Array<int> = new Array<int>(input.length);
        data.reclaim();
        data.readByteArray(res);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByteArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByteArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByteArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readByteArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_readByteArray_ErrorCode_0200
     * @tc.number   SUB_IPC_MessageSequence_readByteArray_ErrorCode_0200
     * @tc.desc     test readByteArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_readByteArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readByteArray_ErrorCode_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeByteArray(input);
        data.reclaim();
        let res = data.readByteArray();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByteArray_ErrorCode_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByteArray_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByteArray_ErrorCode_0200 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readByteArray_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_writeShortArray_ErrorCode_0100
     * @tc.number   SUB_IPC_MessageSequence_writeShortArray_ErrorCode_0100
     * @tc.desc     test writeShortArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeShortArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeShortArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.reclaim();
        data.writeShortArray(input);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeShortArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeShortArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeShortArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeShortArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_readShortArray_ErrorCode_0100
     * @tc.number   SUB_IPC_MessageSequence_readShortArray_ErrorCode_0100
     * @tc.desc     test readShortArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_readShortArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readShortArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeShortArray(input);
        let res: Array<int> = new Array<int>(input.length);
        data.reclaim();
        data.readShortArray(res);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShortArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShortArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShortArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readShortArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_readShortArray_ErrorCode_0200
     * @tc.number   SUB_IPC_MessageSequence_readShortArray_ErrorCode_0200
     * @tc.desc     test readShortArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_readShortArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readShortArray_ErrorCode_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeShortArray(input);
        data.reclaim();
        let res = data.readShortArray();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShortArray_ErrorCode_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShortArray_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShortArray_ErrorCode_0200 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readShortArray_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_writeLongArray_ErrorCode_0100
     * @tc.number   SUB_IPC_MessageSequence_writeLongArray_ErrorCode_0100
     * @tc.desc     test writeLongArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeLongArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeLongArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<long> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.reclaim();
        data.writeLongArray(input);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLongArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLongArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLongArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeLongArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_readLongArray_ErrorCode_0100
     * @tc.number   SUB_IPC_MessageSequence_readLongArray_ErrorCode_0100
     * @tc.desc     test readLongArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_readLongArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readLongArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<long> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeLongArray(input);
        let res: Array<long> = new Array<long>(input.length);
        data.reclaim();
        data.readLongArray(res);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLongArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLongArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLongArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readLongArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_readLongArray_ErrorCode_0200
     * @tc.number   SUB_IPC_MessageSequence_readLongArray_ErrorCode_0200
     * @tc.desc     test readLongArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_readLongArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readLongArray_ErrorCode_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<long> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        data.writeLongArray(input);
        let res: Array<long> = [];
        res = data.readLongArray();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLongArray_ErrorCode_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLongArray_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLongArray_ErrorCode_0200 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readLongArray_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_writeFloatArray_ErrorCode_0100
     * @tc.number   SUB_IPC_MessageSequence_writeFloatArray_ErrorCode_0100
     * @tc.desc     test writeFloatArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeFloatArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeFloatArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<Double> = [1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1];
        data.reclaim();
        data.writeFloatArray(input);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFloatArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFloatArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFloatArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeFloatArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0100
     * @tc.number   SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0100
     * @tc.desc     test readFloatArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<Double> = [1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1];
        data.writeFloatArray(input);
        let res: Array<Double> = new Array<Double>(input.length);
        data.reclaim();
        data.readFloatArray(res);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0200
     * @tc.number   SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0200
     * @tc.desc     test readFloatArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<Double> = [1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1];
        data.writeFloatArray(input);
        data.reclaim();
        let res = data.readFloatArray();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0200 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_writeCharArray_ErrorCode_0100
     * @tc.number   SUB_IPC_MessageSequence_writeCharArray_ErrorCode_0100
     * @tc.desc     test writeCharArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeCharArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeCharArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5];
        data.reclaim();
        data.writeCharArray(input);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeCharArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeCharArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeCharArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeCharArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_readCharArray_ErrorCode_0100
     * @tc.number   SUB_IPC_MessageSequence_readCharArray_ErrorCode_0100
     * @tc.desc     test readCharArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_readCharArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readCharArray_ErrorCode_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5];
        data.writeCharArray(input);
        let res: Array<int> = new Array<int>(input.length);
        data.reclaim();
        data.readCharArray(res);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readCharArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_readCharArray_ErrorCode_0200
     * @tc.number   SUB_IPC_MessageSequence_readCharArray_ErrorCode_0200
     * @tc.desc     test readCharArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_readCharArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readCharArray_ErrorCode_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5];
        data.writeCharArray(input);
        data.reclaim();
        let res = data.readCharArray();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_ErrorCode_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        data.reclaim();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_ErrorCode_0200 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readCharArray_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_writeRemoteObjectArray_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_writeRemoteObjectArray_ErrorCode_0100
     * @tc.desc      test writeRemoteObjectArray
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_writeRemoteObjectArray_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeRemoteObjectArray_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        let testRemtoeObject = new TestRemoteObject("testObject");
        let testRemtoeObject1 = new TestRemoteObject("testObject1");
        let a: Array<rpc.IRemoteObject> = [testRemtoeObject, testRemtoeObject1];
        data.reclaim();
        data.writeRemoteObjectArray(a);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObjectArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObjectArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObjectArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeRemoteObjectArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0100
     * @tc.number   SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0100
     * @tc.desc     test readRemoteObjectArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        let testRemtoeObject = new TestRemoteObject("testObject");
        let testRemtoeObject1 = new TestRemoteObject("testObject1");
        let a: Array<rpc.IRemoteObject> = [testRemtoeObject, testRemtoeObject1];
        data.writeRemoteObjectArray(a);
        let res: Array<rpc.IRemoteObject> =new Array<rpc.IRemoteObject>(a.length);
        data.reclaim();
        data.readRemoteObjectArray(res);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0200
     * @tc.number   SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0200
     * @tc.desc     test readRemoteObjectArray errCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0200 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let testRemtoeObject = new TestRemoteObject("testObject");
        let testRemtoeObject1 = new TestRemoteObject("testObject1");
        let a: Array<rpc.IRemoteObject> = [testRemtoeObject, testRemtoeObject1];
        data.writeRemoteObjectArray(a);
        data.reclaim();
        let res = data.readRemoteObjectArray();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0200 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode_0100
     * @tc.desc      test dupFileDescriptor ErrorCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode_0100 --------------------');

      try {
        let res = rpc.MessageSequence.dupFileDescriptor(-1);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode_0100
     * @tc.desc      test WriteArrayBuffer ErrorCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        let buffer = new ArrayBuffer(8 * 10);
        let bUInt64View = new BigInt64Array(buffer);
        for (let i = 0; i < bUInt64View.length; i++) {
          bUInt64View[i] = i * 2 + 1;
        }
        data.reclaim();
        data.writeArrayBuffer(buffer, rpc.TypeCode.BIGUINT64_ARRAY);

      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900009).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode_0100
     * @tc.number    SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode_0100
     * @tc.desc      test readArrayBuffer ErrorCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        let buffer = new ArrayBuffer(8 * 10);
        let bUInt64View = new BigInt64Array(buffer);
        for (let i = 0; i < bUInt64View.length; i++) {
          bUInt64View[i] = i * 2 + 1;
        }
        data.writeArrayBuffer(buffer, rpc.TypeCode.BIGUINT64_ARRAY);
        data.reclaim();
        let result = data.readArrayBuffer(rpc.TypeCode.BIGUINT64_ARRAY);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900010).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode_0100 reclaim done');
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_RemoteObject_getLocalInterface_ErrorCode_0100
     * @tc.number    SUB_IPC_RemoteObject_getLocalInterface_ErrorCode_0100
     * @tc.desc      test getLocalInterface ErrorCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_RemoteObject_getLocalInterface_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_RemoteObject_getLocalInterface_ErrorCode_0100 --------------------');
      try {
        let des ='';
        const targetLength = strlen + 1;
        for (let i = 0; i < targetLength; i++) {
          des += 'a';
        }
        let testRemoteObject = new TestRemoteObject('testObject');
        testRemoteObject.modifyLocalInterface(testRemoteObject.getLocalInterface('testObject'), 'testObject')
        let res = testRemoteObject.getLocalInterface(des);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getLocalInterface_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getLocalInterface_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getLocalInterface_ErrorCode_0100 reclaim done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_RemoteObject_getLocalInterface_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0100
     * @tc.number    SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0100
     * @tc.desc      test getLocalInterface
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0100 --------------------');
      try {
        let res = gIRemoteObject?.getLocalInterface('rpcTestAbility');
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 1900006).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0100 reclaim done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0200
     * @tc.number    SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0200
     * @tc.desc      test getLocalInterface
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0200 --------------------');
      try {
        let des = '';
        const targetLength = strlen;
        for (let i = 0; i < targetLength; i++) {
          des += 'a';
        }
        let testRemoteObject = new TestRemoteObject('testObject');
        testRemoteObject.modifyLocalInterface(testRemoteObject.getLocalInterface('testObject'), 'testObject')
        let res = testRemoteObject.getLocalInterface(des);
        expect(res).assertEqual(des);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0200 reclaim done');
        done();
      }
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RmoteProxy_getLocalInterface_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0100
     * @tc.number    SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0100
     * @tc.desc      test modifyLocalInterface ErrorCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0100 --------------------');
      try {
        let des ='';
        const targetLength = strlen + 1;
        for (let i = 0; i < targetLength; i++) {
          des += 'a';
        }
        let testRemoteObject = new TestRemoteObject('testObject');
        testRemoteObject.modifyLocalInterface(testRemoteObject.getLocalInterface('testObject'), des)
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        expect(testFlag).assertFalse();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0100 reclaim done');
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0200
     * @tc.number    SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0200
     * @tc.desc      test modifyLocalInterface ErrorCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0200 --------------------');
      try {
        let des = '';
        const targetLength = strlen;
        for (let i = 0; i < targetLength; i++) {
          des += 'a';
        }
        let testRemoteObject = new TestRemoteObject('testObject');
        testRemoteObject.modifyLocalInterface(testRemoteObject.getLocalInterface('testObject'), des)
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        hilog.info(domain, tag, '%{public}s',  'SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s',  'SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s',  'SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0200 reclaim done');
        expect(testFlag).assertFalse();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_modifyLocalInterface_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100
     * @tc.number    SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100
     * @tc.desc      test restoreCallingIdentity
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100 --------------------');
      try {
        let des ='';
        const targetLength = strlen + 1;
        for (let i = 0; i < targetLength; i++) {
          des += 'a';
        }
        rpc.IPCSkeleton.restoreCallingIdentity(des);
      } catch (err) {
        err = err as BusinessError;
        testFlag = false;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100 reclaim done');
        expect(testFlag).assertFalse();
        done();
      }
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0200
     * @tc.number    SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0200
     * @tc.desc      test restoreCallingIdentity
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0200 --------------------');
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
        hilog.info(domain, tag, '%{public}s',  'SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0200 error is: ' + err);
        hilog.info(domain, tag, '%{public}s',  'SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0200 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0200 reclaim done');
        expect(testFlag).assertFalse();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0200 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_Ashmen_MapTypedAshmem_ErrorCode_0100
     * @tc.number    SUB_IPC_Ashmen_MapTypedAshmem_ErrorCode_0100
     * @tc.desc      test SUB_IPC_Ashmen_MapTypedAshmem ErrorCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_Ashmen_MapTypedAshmem_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Ashmen_MapTypedAshmem_ErrorCode_0100 --------------------');
      let ashmem1 = rpc.Ashmem.create("ashmem1", 1024 * 1024);
      try {
        ashmem1.mapTypedAshmem(999);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_MapTypedAshmem_ErrorCode_0100 error is: ' + err);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_MapTypedAshmem_ErrorCode_0100 error code is: ' + err.code);
        expect(err.code == 401).assertTrue();
        expect(err.message != null).assertTrue();
      } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_MapTypedAshmem_ErrorCode_0100 reclaim done');
        ashmem1.unmapAshmem();
        ashmem1.closeAshmem();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Ashmen_MapTypedAshmem_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name      SUB_IPC_ErrorCode_0100
     * @tc.number    SUB_IPC_ErrorCode_0100
     * @tc.desc      test ErrorCode
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_ErrorCode_0100 --------------------');
      try {
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
      } catch (err) {
        err = err as BusinessError;
        expect(err.message == null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100 --------------------');
    });

    /**
     * @tc.name     SUB_IPC_onRemoteDied_0100
     * @tc.number   SUB_IPC_onRemoteDied_0100
     * @tc.desc     test onRemoteDied
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it("SUB_IPC_onRemoteDied_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_onRemoteDied_0100 --------------------');
      try {
        let deathRecipient = new MyDeathRecipient();
        gIRemoteObject?.registerDeathRecipient(deathRecipient, 0);
        await disConnectAbility();
        await Utils.msSleep(3000);
        let res = gIRemoteObject?.isObjectDead();
        expect(isDead).assertTrue();
        expect(res).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_onRemoteDied_0100 error is: ' + error);
        expect(error == null).assertTrue();
      } finally {
        await  toConnectAbility();
        await Utils.msSleep(4000);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_onRemoteDied_0100 finally done');
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_onRemoteDied_0100 --------------------');
    });
  })
}