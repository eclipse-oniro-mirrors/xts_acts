import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import rpc from '@ohos.rpc';

let domain: int = 0x0000;
let tag: string = 'testTag';

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

export default function abilityTestReturnValue() {

  describe("abilityTestReturnValue", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe abilityTestReturnValue start');

    /**
     * @tc.name   SUB_IPC_MessageSequence_create_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_create_ReturnValue_0100
     * @tc.desc   test MessageSequence create return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_create_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_create_ReturnValue_0100 --------------------');
      try {
        let data = rpc.MessageSequence.create();
        expect(data != null).assertTrue();
        expect(typeof data === 'object').assertTrue();
        data.reclaim();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_create_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_create_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readRemoteObject_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readRemoteObject_ReturnValue_0100
     * @tc.desc   test MessageSequence readRemoteObject return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readRemoteObject_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readRemoteObject_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        data.writeRemoteObject(testRemoteObject);
        let result = data.readRemoteObject();
        expect(result != null).assertTrue();
        expect(typeof result === 'object').assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObject_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readRemoteObject_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_getSize_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_getSize_ReturnValue_0100
     * @tc.desc   test MessageSequence getSize return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_getSize_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_getSize_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let result = data.getSize();
        expect(typeof result === 'int').assertTrue();
        expect(result >= 0).assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_getSize_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_getSize_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_getCapacity_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_getCapacity_ReturnValue_0100
     * @tc.desc   test MessageSequence getCapacity return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_getCapacity_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_getCapacity_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input = 123;
        data.setCapacity(input);
        let result = data.getCapacity();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_getCapacity_ReturnValue_0100 result is: ' + result);
        expect(typeof result === 'int').assertTrue();
        expect(result > 0).assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_getCapacity_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_getCapacity_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_getWritableBytes_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_getWritableBytes_ReturnValue_0100
     * @tc.desc   test MessageSequenceSequence getWritableBytes return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_getWritableBytes_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_getWritableBytes_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let result = data.getWritableBytes();
        expect(typeof result === 'int').assertTrue();
        expect(result >= 0).assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_getWritableBytes_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_getWritableBytes_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_getReadableBytes_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_getReadableBytes_ReturnValue_0100
     * @tc.desc   test MessageSequence getReadableBytes return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_getReadableBytes_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_getReadableBytes_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeInt(123);
        let result = data.getReadableBytes();
        expect(typeof result === 'int').assertTrue();
        expect(result >= 0).assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_getReadableBytes_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_getReadableBytes_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_getReadPosition_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_getReadPosition_ReturnValue_0100
     * @tc.desc   test MessageSequence getReadPosition return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_getReadPosition_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_getReadPosition_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeInt(123);
        let result = data.getReadPosition();
        expect(typeof result === 'int').assertTrue();
        expect(result >= 0).assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_getReadPosition_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_getReadPosition_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_getWritePosition_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_getWritePosition_ReturnValue_0100
     * @tc.desc   test MessageSequence getWritePosition return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_getWritePosition_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_getWritePosition_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        data.writeInt(123);
        let result = data.getWritePosition();
        expect(typeof result === 'int').assertTrue();
        expect(result > 0).assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_getWritePosition_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_getWritePosition_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readByte_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readByte_ReturnValue_0100
     * @tc.desc   test MessageSequence readByte return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readByte_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readByte_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input = 65;
        data.writeByte(input);
        let result = data.readByte();
        expect(typeof result === 'int').assertTrue();
        expect(result).assertEqual(input);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByte_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readByte_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readShort_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readShort_ReturnValue_0100
     * @tc.desc   test MessageSequence readShort return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readShort_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readShort_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input = 12345;
        data.writeShort(input);
        let result = data.readShort();
        expect(typeof result === 'int').assertTrue();
        expect(result).assertEqual(input);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShort_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readShort_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readInt_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readInt_ReturnValue_0100
     * @tc.desc   test MessageSequence readInt return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readInt_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readInt_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input = 123456789;
        data.writeInt(input);
        let result = data.readInt();
        expect(typeof result === 'int').assertTrue();
        expect(result).assertEqual(input);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readInt_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readInt_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readLong_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readLong_ReturnValue_0100
     * * @tc.desc   test MessageSequence readLong return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readLong_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readLong_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input = 1234567890123;
        data.writeLong(input);
        let result = data.readLong();
        expect(typeof result === 'long').assertTrue();
        expect(result).assertEqual(input);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLong_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readLong_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readFloat_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readFloat_ReturnValue_0100
     * @tc.desc   test MessageSequence readFloat return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readFloat_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readFloat_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: double = 3.14;
        data.writeFloat(input);
        let result: double = data.readFloat();
         hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloat_ReturnValue_0100 typeof result is: ' + typeof result);
        expect(typeof result === 'number').assertTrue();
        expect(result).assertEqual(input);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloat_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readFloat_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readDouble_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readDouble_ReturnValue_0100
     * @tc.desc   test MessageSequence readDouble return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readDouble_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readDouble_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: double = 3.1415926535;
        data.writeDouble(input);
        let result: double = data.readDouble();
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDouble_ReturnValue_0100 typeof result is: ' + typeof result);
        expect(typeof result === 'number').assertTrue();
        expect(result).assertEqual(input);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDouble_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readDouble_ReturnValue_0100 --------------------');
    });
 
    /**
     * @tc.name   SUB_IPC_MessageSequence_readChar_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readChar_ReturnValue_0100
     * @tc.desc   test MessageSequence readChar return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readChar_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readChar_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input = 65;
        data.writeChar(input);
        let result = data.readChar();
        expect(typeof result === 'int').assertTrue();
        expect(result).assertEqual(input);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readChar_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readChar_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readByteArray_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readByteArray_ReturnValue_0100
     * @tc.desc   test MessageSequence readByteArray return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readByteArray_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readByteArray_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1, 2, 3, 4, 5];
        data.writeByteArray(input);
        let result = data.readByteArray();
        expect(result != null).assertTrue();
        expect(Array.isArray(result)).assertTrue();
        expect(result.length).assertEqual(input.length);
        expect(result).assertDeepEquals(input);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByteArray_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readByteArray_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readShortArray_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readShortArray_ReturnValue_0100
     * @tc.desc   test MessageSequence readShortArray return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readShortArray_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPCSequence_readShortArray_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [100, 200, 300, 400, 500];
        data.writeShortArray(input);
        let result = data.readShortArray();
        expect(result != null).assertTrue();
        expect(Array.isArray(result)).assertTrue();
        expect(result.length).assertEqual(input.length);
        expect(result).assertDeepEquals(input);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShortArray_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readShortArray_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readIntArray_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readIntArray_ReturnValue_0100
     * @tc.desc   test MessageSequence readIntArray return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readIntArray_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readIntArray_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [1000, 2000, 3000, 4000, 5000];
        data.writeIntArray(input);
        let result = data.readIntArray();
        expect(result != null).assertTrue();
        expect(Array.isArray(result)).assertTrue();
        expect(result.length).assertEqual(input.length);
        expect(result).assertDeepEquals(input);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readIntArray_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readIntArray_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readLongArray_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readLongArray_ReturnValue_0100
     * @tc.desc   test MessageSequence readLongArray return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readLongArray_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readLongArray_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<long> = [1000000000, 2000000000, 3000000000];
        data.writeLongArray(input);
        let result = data.readLongArray();
        expect(result != null).assertTrue();
        expect(Array.isArray(result)).assertTrue();
        expect(result.length).assertEqual(input.length);
        expect(result).assertDeepEquals(input);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLongArray_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readLongArray_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readFloatArray_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readFloatArray_ReturnValue_0100
     * @tc.desc   test MessageSequence readFloatArray return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readFloatArray_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readFloatArray_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        data.writeFloatArray(input);
        let result = data.readFloatArray();
        expect(result != null).assertTrue();
        expect(Array.isArray(result)).assertTrue();
        expect(result.length).assertEqual(input.length);
        expect(result).assertDeepEquals(input);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloatArray_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readFloatArray_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readDoubleArray_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readDoubleArray_ReturnValue_0100
     * @tc.desc   test MessageSequence readDoubleArray return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readDoubleArray_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readDoubleArray_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<double> = [1.111, 2.222, 3.333, 4.444, 5.555];
        data.writeDoubleArray(input);
        let result = data.readDoubleArray();
        expect(result != null).assertTrue();
        expect(Array.isArray(result)).assertTrue();
        expect(result.length).assertEqual(input.length);
        expect(result).assertDeepEquals(input);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDoubleArray_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readDoubleArray_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readBooleanArray_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readBooleanArray_ReturnValue_0100
     * @tc.desc   test MessageSequence readBooleanArray return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readBooleanArray_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readBooleanArray_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<boolean> = [true, false, true, false, true];
        data.writeBooleanArray(input);
        let result = data.readBooleanArray();
        expect(result != null).assertTrue();
        expect(Array.isArray(result)).assertTrue();
        expect(result.length).assertEqual(input.length);
        expect(result).assertDeepEquals(input);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBooleanArray_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readBooleanArray_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readCharArray_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readCharArray_ReturnValue_0100
     * @tc.desc   test MessageSequence readCharArray return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readCharArray_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readCharArray_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<int> = [65, 66, 67, 68, 69];
        data.writeCharArray(input);
        let result = data.readCharArray();
        expect(result != null).assertTrue();
        expect(Array.isArray(result)).assertTrue();
        expect(result.length).assertEqual(input.length);
        expect(result).assertDeepEquals(input);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readCharArray_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readStringArray_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readStringArray_ReturnValue_0100
     * @tc.desc   test MessageSequence readStringArray return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readStringArray_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readStringArray_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let input: Array<string> = ["hello", "world", "test", "rpc"];
        data.writeStringArray(input);
        let result = data.readStringArray();
        expect(result != null).assertTrue();
        expect(Array.isArray(result)).assertTrue();
        expect(result.length).assertEqual(input.length);
        expect(result).assertDeepEquals(input);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readStringArray_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readStringArray_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readParcelableArray_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readParcelableArray_ReturnValue_0100
     * @tc.desc   test MessageSequence readParcelableArray return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readParcelableArray_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readParcelableArray_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let parcelable1 = new MyParcelable(1, "test1");
        let parcelable2 = new MyParcelable(2, "test2");
        let input: Array<rpc.Parcelable> = [parcelable1, parcelable2];
        data.writeParcelableArray(input);
        let result: Array<rpc.Parcelable> = [new MyParcelable(0, ""), new MyParcelable(0, "")];
        data.readParcelableArray(result);
        expect(result != null).assertTrue();
        expect(Array.isArray(result)).assertTrue();
        expect(result.length).assertEqual(input.length);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readParcelableArray_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readParcelableArray_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readRemoteObjectArray_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readRemoteObjectArray_ReturnValue_0100
     * @tc.desc   test MessageSequence readRemoteObjectArray return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readRemoteObjectArray_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readRemoteObjectArray_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let testRemoteObject1 = new TestRemoteObject("testObject1");
        let testRemoteObject2 = new TestRemoteObject("testObject2");
        let input: Array<rpc.IRemoteObject> = [testRemoteObject1, testRemoteObject2];
        data.writeRemoteObjectArray(input);
        let result = data.readRemoteObjectArray();
        expect(result != null).assertTrue();
        expect(Array.isArray(result)).assertTrue();
        expect(result.length).assertEqual(input.length);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObjectArray_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readRemoteObjectArray_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_dupFileDescriptor_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_dupFileDescriptor_ReturnValue_0100
     * @tc.desc   test MessageSequence dupFileDescriptor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_dupFileDescriptor_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_dupFileDescriptor_ReturnValue_0100 --------------------');
      try {
        let fd = 1;
        let result = rpc.MessageSequence.dupFileDescriptor(fd);
        expect(typeof result === 'int').assertTrue();
        expect(result >= 0).assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_dupFileDescriptor_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_dupFileDescriptor_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readFileDescriptor_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readFileDescriptor_ReturnValue_0100
     * @tc.desc   test MessageSequence readFileDescriptor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readFileDescriptor_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readFileDescriptor_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let fd = 1;
        data.writeFileDescriptor(fd);
        let result = data.readFileDescriptor();
        expect(typeof result === 'int').assertTrue();
        expect(result >= 0).assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFileDescriptor_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readFileDescriptor_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readAshmem_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readAshmem_ReturnValue_0100
     * @tc.desc   test MessageSequence readAshmem return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readAshmem_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readAshmem_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let ashmem = rpc.Ashmem.create("ashmem", 1024);
        data.writeAshmem(ashmem);
        let result = data.readAshmem();
        expect(result != null).assertTrue();
        expect(typeof result === 'object').assertTrue();
        expect(result.getAshmemSize()).assertEqual(1024);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readAshmem_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readAshmem_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_getRawDataCapacity_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_getRawDataCapacity_ReturnValue_0100
     * @tc.desc   test MessageSequence getRawDataCapacity return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_getRawDataCapacity_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_getRawDataCapacity_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let result = data.getRawDataCapacity();
        expect(typeof result === 'int').assertTrue();
        expect(result > 0).assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_getRawDataCapacity_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_getRawDataCapacity_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readRawDataBuffer_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readRawDataBuffer_ReturnValue_0100
     * @tc.desc   test MessageSequence readRawDataBuffer return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readRawDataBuffer_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readRawDataBuffer_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let buffer = new ArrayBuffer(10);
        let uint8View = new Uint8Array(buffer);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        let size: int = buffer.byteLength as int;
        data.writeRawDataBuffer(buffer, size);
        let result = data.readRawDataBuffer(size);
        expect(result != null).assertTrue();
        expect(result instanceof ArrayBuffer).assertTrue();
        expect(result.byteLength).assertEqual(size);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRawDataBuffer_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readRawDataBuffer_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageSequence_readArrayBuffer_ReturnValue_0100
     * @tc.number SUB_IPC_MessageSequence_readArrayBuffer_ReturnValue_0100
     * @tc.desc   test MessageSequence readArrayBuffer return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageSequence_readArrayBuffer_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readArrayBuffer_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let buffer = new Int32Array([1, 2, 3, 4, 5]);
        data.writeArrayBuffer(buffer.buffer, rpc.TypeCode.INT32_ARRAY);
        let result = data.readArrayBuffer(rpc.TypeCode.INT32_ARRAY);
        expect(result != null).assertTrue();
        expect(result instanceof ArrayBuffer).assertTrue();
        expect(result.byteLength > 0).assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readArrayBuffer_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readArrayBuffer_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_Parcelable_marshalling_ReturnValue_0100
     * @tc.number SUB_IPC_Parcelable_marshalling_ReturnValue_0100
     * @tc.desc   test Parcelable marshalling return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_Parcelable_marshalling_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Parcelable_marshalling_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let parcelable = new MyParcelable(123, "test");
        let result = parcelable.marshalling(data);
        expect(typeof result === 'boolean').assertTrue();
        expect(result).assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Parcelable_marshalling_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Parcelable_marshalling_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_Parcelable_unmarshalling_ReturnValue_0100
     * @tc.number SUB_IPC_Parcelable_unmarshalling_ReturnValue_0100
     * @tc.desc   test Parcelable unmarshalling return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_Parcelable_unmarshalling_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Parcelable_unmarshalling_ReturnValue_0100 --------------------');
      let data = rpc.MessageSequence.create();
      try {
        let parcelable1 = new MyParcelable(123, "test");
        parcelable1.marshalling(data);
        let parcelable2 = new MyParcelable(0, "");
        let result = parcelable2.unmarshalling(data);
        expect(typeof result === 'boolean').assertTrue();
        expect(result).assertTrue();
        expect(parcelable2.num).assertEqual(123);
        expect(parcelable2.str).assertEqual("test");
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Parcelable_unmarshalling_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      } finally {
        data.reclaim();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Parcelable_unmarshalling_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_IRemoteObject_getLocalInterface_ReturnValue_0100
     * @tc.number SUB_IPC_IRemoteObject_getLocalInterface_ReturnValue_0100
     * @tc.desc   test IRemoteObject getLocalInterface return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_IRemoteObject_getLocalInterface_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_IRemoteObject_getLocalInterface_ReturnValue_0100 --------------------');
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        let result = testRemoteObject.getLocalInterface("testDescriptor");
        expect(result != null).assertTrue();
        expect(typeof result === 'object').assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IRemoteObject_getLocalInterface_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_IRemoteObject_getLocalInterface_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageOption_getFlags_ReturnValue_0100
     * @tc.number SUB_IPC_MessageOption_getFlags_ReturnValue_0100
     * @tc.desc   test MessageOption getFlags return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageOption_getFlags_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_getFlags_ReturnValue_0100 --------------------');
      try {
        let option = new rpc.MessageOption();
        let result = option.getFlags();
        expect(typeof result === 'int').assertTrue();
        expect(result >= 0).assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_getFlags_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_getFlags_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_MessageOption_getWaitTime_ReturnValue_0100
     * @tc.number SUB_IPC_MessageOption_getWaitTime_ReturnValue_0100
     * @tc.desc   test MessageOption getWaitTime return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_MessageOption_getWaitTime_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_getWaitTime_ReturnValue_0100 --------------------');
      try {
        let option = new rpc.MessageOption();
        let result = option.getWaitTime();
        expect(typeof result === 'int').assertTrue();
        expect(result >= 0).assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_getWaitTime_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_getWaitTime_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_RemoteObject_getLocalInterface_ReturnValue_0100
     * @tc.number SUB_IPC_RemoteObject_getLocalInterface_ReturnValue_0100
     * @tc.desc   test RemoteObject getLocalInterface return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_RemoteObject_getLocalInterface_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_getLocalInterface_ReturnValue_0100 --------------------');
      try {
        let testRemoteObject = new TestRemoteObject("testObject");
        let result = testRemoteObject.getLocalInterface("testDescriptor");
        expect(result != null).assertTrue();
        expect(typeof result === 'object').assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getLocalInterface_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_getLocalInterface_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_IPCSkeleton_getContextObject_ReturnValue_0100
     * @tc.number SUB_IPC_IPCSkeleton_getContextObject_ReturnValue_0100
     * @tc.desc   test IPCSkeleton getContextObject return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_IPCSkeleton_getContextObject_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_IPCSkeleton_getContextObject_ReturnValue_0100 --------------------');
      try {
        let result = rpc.IPCSkeleton.getContextObject();
        expect(result != null).assertTrue();
        expect(typeof result === 'object').assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getContextObject_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_IPCSkeleton_getContextObject_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_Ashmem_create_ReturnValue_0100
     * @tc.number SUB_IPC_Ashmem_create_ReturnValue_0100
     * @tc.desc   test Ashmem create return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_Ashmem_create_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem_create_ReturnValue_0100 --------------------');
      try {
        let result = rpc.Ashmem.create("ashmem", 1024);
        expect(result != null).assertTrue();
        expect(typeof result === 'object').assertTrue();
        expect(result.getAshmemSize()).assertEqual(1024);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_create_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmem_create_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_Ashmem_getAshmemSize_ReturnValue_0100
     * @tc.number SUB_IPC_Ashmem_getAshmemSize_ReturnValue_0100
     * @tc.desc   test Ashmem getAshmemSize return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_Ashmem_getAshmemSize_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem_getAshmemSize_ReturnValue_0100 --------------------');
      try {
        let ashmem = rpc.Ashmem.create("ashmem", 1024);
        let result = ashmem.getAshmemSize();
        expect(typeof result === 'int').assertTrue();
        expect(result).assertEqual(1024);
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_getAshmemSize_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmem_getAshmemSize_ReturnValue_0100 --------------------');
    });

    /**
     * @tc.name   SUB_IPC_Ashmem_readDataFromAshmem_ReturnValue_0100
     * @tc.number SUB_IPC_Ashmem_readDataFromAshmem_ReturnValue_0100
     * @tc.desc   test Ashmem readDataFromAshmem return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_IPC_Ashmem_readDataFromAshmem_ReturnValue_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(500);
      hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem_readDataFromAshmem_ReturnValue_0100 --------------------');
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
        hilog.info(domain, tag, '%{public}s', `write data is ${int8View}`);
        let length: int = 10;
        let offset: int = 0;
        ashmem.writeDataToAshmem(buffer, length, offset);
        hilog.info(domain, tag, '%{public}s', `WriteDataToAshMem finshed`);
        let result = ashmem.readDataFromAshmem(length, offset);
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_readDataFromAshmem_ReturnValue_0100 result instanceof ArrayBuffer is: ' + result instanceof ArrayBuffer);
        expect(result != null).assertTrue();
        expect(result instanceof ArrayBuffer).assertTrue();
        expect(result.byteLength > 0).assertTrue();
     } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_readDataFromAshmem_ReturnValue_0100 error is: ' + err);
        expect(err === null).assertTrue();
     } finally {
        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_readDataFromAshmem_ReturnValue_0100 reclaim done');
        ashmem.unmapAshmem();
        ashmem.closeAshmem();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmem_readDataFromAshmemari_ReturnValue_0100 --------------------');
    });
  });
}