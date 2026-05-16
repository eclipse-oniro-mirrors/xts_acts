/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import napitest from 'libnapitest.so';
// import napitest from 'libentry.so';

declare class ArkTools {
  static forceFullGC(): void;
}

interface WorkerMessage {
  messageType: string;
  value: Length | object | boolean;
}

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessage = (e: MessageEvents) => {
  console.info('Worker received message:', e.data);
  const data: WorkerMessage = e.data;
  switch (data.messageType) {
    case 'getLastError': {
      const receivedValue = data.value;
      console.info('Worker: received value is ' + receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === 2000;
      workerPort.postMessage(value);
      break;
    }
    case 'isError': {
      const receivedValue = data.value;
      console.info('Worker: received value is ' + receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === false;
      workerPort.postMessage(value);
      break;
    }
    case 'createError': {
      const receivedValue = data.value;
      console.info('Worker: received value is ' + receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'createRangeError': {
      const receivedValue = data.value;
      console.info('Worker: received value is ' + receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'isExceptionPending': {
      const receivedValue = data.value;
      console.info('Worker: received value is ' + receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'createReference': {
      const receivedValue = data.value;
      console.info('Worker: received value is ' + receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'referenceRefAndUnref': {
      const receivedValue = data.value;
      console.info('Worker: received value is ' + receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'createArrayAndGetLength': {
      const receivedValue = data.value;
      console.info('Worker: received value is ' + receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue.toString() === '1,2';
      workerPort.postMessage(value);
      break;
    }
    case 'createExternal': {
      const receivedValue = data.value;
      console.info('Worker: received value is ' + receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'createExternalArraybuffer': {
      const receivedValue = data.value;
      console.info('Worker: received value is ' + receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue instanceof ArrayBuffer;
      workerPort.postMessage(value);
      break;
    }
    case 'createObject': {
      const receivedValue = data.value;
      console.info('Worker: createObject value is ', receivedValue);
      ArkTools.forceFullGC();
      const createObjectRes = receivedValue instanceof Object;
      workerPort.postMessage(createObjectRes);
      break;
    }
    case 'createSymbol': {
      const receivedValue = data.value;
      console.info('Worker: createSymbol value is ', receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'createTypeArray': {
      const receivedValue = data.value;
      console.info('Worker: createTypeArray value is ', receivedValue);
      ArkTools.forceFullGC();
      const isArrayType = receivedValue instanceof Int32Array;
      workerPort.postMessage(isArrayType);
      break;
    }
    case 'getValueBool': {
      const receivedValue = data.value;
      console.info('Worker: getValueBool value is ', receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === false;
      workerPort.postMessage(value);
      break;
    }
    case 'createAndGetInt32': {
      const receivedValue = data.value;
      console.info('Worker: createAndGetInt32 value is ', receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === 32;
      workerPort.postMessage(value);
      break;
    }
    case 'createAndGetUInt32': {
      const receivedValue = data.value;
      console.info('Worker: createAndGetUInt32 value is ', receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === 32;
      workerPort.postMessage(value);
      break;
    }
    case 'createAndGetInt64': {
      const receivedValue = data.value;
      console.info('Worker: createAndGetInt64 value is ', receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === 23;
      workerPort.postMessage(value);
      break;
    }
    case 'createDouble': {
      const receivedValue = data.value;
      console.info('Worker: createDouble value is ', receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === 24.67;
      workerPort.postMessage(value);
      break;
    }
    case 'createAndGetStringUtf16': {
      const receivedValue = data.value;
      console.info('Worker: createAndGetStringUtf16 value is ', receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === 'he';
      workerPort.postMessage(value);
      break;
    }
    case 'stringUtf16OfCase': {
      const receivedValue = data.value;
      console.info('Worker: stringUtf16OfCase value is ', receivedValue);
      ArkTools.forceFullGC();
      const value: boolean = receivedValue === 'abc2';
      workerPort.postMessage(value);
      break;
    }
    case 'getValueDouble': {
      const receivedValue = data.value;
      console.info('Worker: getValueDouble value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 24.5;
      workerPort.postMessage(value);
      break;
    }
    case 'getValueExternal': {
      const receivedValue = data.value;
      console.info('Worker: getValueExternal value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'getNull': {
      const receivedValue = data.value;
      console.info('Worker: getNull value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue == 0;
      workerPort.postMessage(value);
      break;
    }
    case 'getUndefined': {
      const receivedValue = data.value;
      console.info('Worker: getUndefined value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue == 0;
      workerPort.postMessage(value);
      break;
    }
    case 'coerceToBool': {
      const receivedValue = data.value;
      console.info('Worker: coerceToBool value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === false;
      workerPort.postMessage(value);
      break;
    }
    case 'coerceToNumber': {
      const receivedValue = data.value;
      console.info('Worker: coerceToNumber value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 12;
      workerPort.postMessage(value);
      break;
    }
    case 'coerceToObject': {
      const receivedValue = data.value;
      console.info('Worker: coerceToObject value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = JSON.stringify(receivedValue) === '[2,3]';
      workerPort.postMessage(value);
      break;
    }
    case 'coerceToString': {
      const receivedValue = data.value;
      console.info('Worker: coerceToString value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === '123';
      workerPort.postMessage(value);
      break;
    }
    case 'typeOf': {
      const receivedValue = data.value;
      console.info('Worker: typeOf value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'isArray': {
      const receivedValue = data.value;
      console.info('Worker: isArray value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'strictEquals': {
      const receivedValue = data.value;
      console.info('Worker: strictEquals value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'getPropertyNames': {
      const receivedValue = data.value;
      console.info('Worker: getPropertyNames value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'setProperty': {
      const receivedValue = data.value;
      console.info('Worker: setProperty value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue instanceof Object;
      workerPort.postMessage(value);
      break;
    }
    case 'getProperty': {
      const receivedValue = data.value;
      console.info('Worker: getProperty value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue instanceof Object;
      workerPort.postMessage(value);
      break;
    }
    case 'hasProperty': {
      const receivedValue = data.value;
      console.info('Worker: hasProperty value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'setAndDeleteProperty': {
      const receivedValue = data.value;
      console.info('Worker: setAndDeleteProperty value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'hasOwnProperty': {
      const receivedValue = data.value;
      console.info('Worker: hasOwnProperty value is ', receivedValue);
      ArkTools.forceFullGC();
      workerPort.postMessage(receivedValue);
      break;
    }
    case 'setNamedProperty': {
      const receivedValue = data.value;
      console.info('Worker: setNamedProperty value is ', receivedValue);
      ArkTools.forceFullGC();
      workerPort.postMessage(receivedValue);
      break;
    }
    case 'getNamedProperty': {
      const receivedValue = data.value;
      console.info('Worker: getNamedProperty value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 'zhangsan';
      workerPort.postMessage(value);
      break;
    }
    case 'hasNamedProperty': {
      const receivedValue = data.value;
      console.info('Worker: hasNamedProperty value is ', receivedValue);
      ArkTools.forceFullGC();
      workerPort.postMessage(receivedValue);
      break;
    }
    case 'setElement': {
      const receivedValue = data.value;
      console.info('Worker: setElement value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue instanceof Object;
      workerPort.postMessage(value);
      break;
    }
    case 'getElement': {
      const receivedValue = data.value;
      console.info('Worker: getElement value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue instanceof Object;
      workerPort.postMessage(value);
      break;
    }
    case 'hasElement': {
      const receivedValue = data.value;
      console.info('Worker: hasElement value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue instanceof Object;
      workerPort.postMessage(value);
      break;
    }
    case 'deleteElement': {
      const receivedValue = data.value;
      console.info('Worker: deleteElement value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue instanceof Object;
      workerPort.postMessage(value);
      break;
    }
    case 'defineProperties': {
      const receivedValue = data.value;
      console.info('Worker: defineProperties value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue instanceof Object;
      workerPort.postMessage(value);
      break;
    }
    case 'callFunctionNull': {
      const receivedValue = data.value;
      console.info('Worker: callFunctionNull value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 1;
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateFunctionFuncNull': {
      const receivedValue = data.value;
      console.info('Worker: napiCreateFunctionFuncNull value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'napiGetCbInfo': {
      const receivedValue = data.value;
      console.info('Worker: napiGetCbInfo value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 12.06;
      workerPort.postMessage(value);
      break;
    }
    case 'unwrap': {
      const receivedValue = data.value;
      console.info('Worker: unwrap value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'removeWrap': {
      const receivedValue = data.value;
      console.info('Worker: removeWrap value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'getVersion': {
      const receivedValue = data.value;
      console.info('Worker: getVersion value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 8;
      workerPort.postMessage(value);
      break;
    }
    case 'createPromise': {
      const receivedValue = data.value;
      console.info('Worker: createPromise value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'resolveAndRejectDeferred': {
      const receivedValue = data.value;
      console.info('Worker: resolveAndRejectDeferred value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'isPromise': {
      const receivedValue = data.value;
      console.info('Worker: isPromise value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateThreadsafeFunction': {
      const receivedValue = data.value;
      console.info('Worker: napiCreateThreadsafeFunction value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'napiDeleteSerializationDataTest': {
      const receivedValue = data.value;
      console.info('Worker: napiDeleteSerializationDataTest value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 2000;
      workerPort.postMessage(value);
      break;
    }
    case 'napiCallThreadsafeFunction': {
      const receivedValue = data.value;
      console.info('Worker: napiCallThreadsafeFunction value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'napiAnotherThreadSafeTest': {
      const receivedValue = data.value;
      console.info('Worker: napiAnotherThreadSafeTest value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 1;
      workerPort.postMessage(value);
      break;
    }
    case 'napiRefThreadsafeFunction': {
      const receivedValue = data.value;
      console.info('Worker: napiRefThreadsafeFunction value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateDate': {
      const receivedValue = data.value;
      console.info('Worker: napiCreateDate value is ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 1;
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateBigintInt64': {
      const receivedValue = data.value;
      console.info('Worker: napiCreateBigintInt64 value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 1;
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateBigintUint64': {
      const receivedValue = data.value;
      console.info('Worker: napiCreateBigintUint64 value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 1;
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateBigintWords': {
      const receivedValue = data.value;
      console.info('Worker: napiCreateBigintWords value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 1;
      workerPort.postMessage(value);
      break;
    }
    case 'GetAllPropertyNamesEnvNull': {
      const receivedValue = data.value;
      console.info('Worker: GetAllPropertyNamesEnvNull value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 1;
      workerPort.postMessage(value);
      break;
    }
    case 'napiSetInstanceData': {
      const receivedValue = data.value;
      console.info('Worker: napiSetInstanceData value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 1;
      workerPort.postMessage(value);
      break;
    }
    case 'getModuleFileName': {
      const receivedValue = data.value;
      console.info('Worker: getModuleFileName value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue >= 0;
      workerPort.postMessage(value);
      break;
    }
    case 'createAsyncResource': {
      const receivedValue = data.value;
      console.info('Worker: createAsyncResource value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue instanceof Object;
      workerPort.postMessage(value);
      break;
    }
    case 'asyncWorkWithQos': {
      const receivedValue = data.value;
      console.info('Worker: asyncWorkWithQos value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'napiRunScriptPathEnvNull': {
      const receivedValue = data.value;
      console.info('Worker: napiRunScriptPathEnvNull value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 1;
      workerPort.postMessage(value);
      break;
    }
    case 'napiLoadModuleTest': {
      const receivedValue = data.value;
      console.info('Worker: napiLoadModuleTest value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'createObjectWithProperties': {
      const receivedValue = data.value;
      console.info('Worker: createObjectWithProperties value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'createObjectWithNamedProperties': {
      const receivedValue = data.value;
      console.info('Worker: createObjectWithNamedProperties value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 0;
      workerPort.postMessage(value);
      break;
    }
    case 'coerceToNativeBindingObjectEnvNull': {
      const receivedValue = data.value;
      console.info('Worker: coerceToNativeBindingObjectEnvNull value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 1;
      workerPort.postMessage(value);
      break;
    }
    case 'napiSerializeTest': {
      const receivedValue = data.value;
      console.info('Worker: napiSerializeTest value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 2000;
      workerPort.postMessage(value);
      break;
    }
    case 'napiDeSerializeTest': {
      const receivedValue = data.value;
      console.info('Worker: napiDeSerializeTest value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === 2000;
      workerPort.postMessage(value);
      break;
    }
    case 'napiIsSendableTest': {
      const receivedValue = data.value;
      console.info('Worker: napiIsSendableTest value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = receivedValue === false;
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateSendableObjectTest': {
      const receivedValue = Number(data.value);
      console.info('Worker: napiCreateSendableObject value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = napitest.NapiIsSendable(receivedValue);
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateSendableArrayTest': {
      const receivedValue = Number(data.value);
      console.info('Worker: napiCreateSendableArrayTest value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = napitest.NapiIsSendable(receivedValue);
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateSendableArrayWithLengthTest': {
      const receivedValue = Number(data.value);
      console.info('Worker: napiCreateSendableArrayWithLengthTest value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = napitest.NapiIsSendable(receivedValue);
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateSendableArrayBufferTest': {
      const receivedValue = Number(data.value);
      console.info('Worker: napiCreateSendableArrayBufferTest value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = napitest.NapiIsSendable(receivedValue);
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateSendableTypedArrayTest': {
      const receivedValue = Number(data.value);
      console.info('Worker: napiCreateSendableTypedArrayTest value is: ', receivedValue);
      ArkTools.forceFullGC();
      const value = napitest.NapiIsSendable(receivedValue);
      workerPort.postMessage(value);
      break;
    }
    case 'napiWrapSendableTest': {
      const receivedValue = data.value as object;
      console.info('Worker: napiWrapSendableTest value is: ', receivedValue);
      let res1 = napitest.NapiUnwrapSendable(receivedValue) == 'data';
      let res2 = napitest.NapiRemoveWrapSendable(receivedValue) == 'data';
      let res3 = napitest.NapiUnwrapSendable(receivedValue) == undefined;
      workerPort.postMessage(res1 && res2 && res3);
      break;
    }
    case 'napiWrapSendableWithSizeTest': {
      const receivedValue = data.value as object;
      console.info('Worker: napiWrapSendableWithSizeTest value is: ', receivedValue);
      let res1 = napitest.NapiUnwrapSendable(receivedValue) == 'data';
      let res2 = napitest.NapiRemoveWrapSendable(receivedValue) == 'data';
      let res3 = napitest.NapiUnwrapSendable(receivedValue) == undefined;
      workerPort.postMessage(res1 && res2 && res3);
      break;
    }
    default:
      console.warn('Worker received unknown message type.');
      break;
  }
};