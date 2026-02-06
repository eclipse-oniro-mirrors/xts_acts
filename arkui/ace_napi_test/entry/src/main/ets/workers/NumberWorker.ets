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
import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import napitest from 'libnapitest.so';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessage = (e: MessageEvents) => {
  console.info('NumberWorker received message:', e.data);
  switch (e.data) {
    case 'createInt32': {
      let result = napitest.NapiCreateInt32Test();
      console.info('NumberWorker: NapiCreateInt32Test result is ' + result);
      workerPort.postMessage(result);
      break;
    }
    case 'createUint32': {
      let result = napitest.NapiCreateUint32Test();
      console.info('NumberWorker: NapiCreateUint32Test result is ' + result);
      workerPort.postMessage(result);
      break;
    }
    case 'createInt64': {
      let result = napitest.NapiCreateInt64Test();
      console.info('NumberWorker: NapiCreateInt64Test result is ' + result);
      workerPort.postMessage(result);
      break;
    }
    case 'createDouble': {
      let result = napitest.NapiCreateDoubleTest();
      console.info('NumberWorker: NapiCreateDoubleTest result is ' + result);
      workerPort.postMessage(result);
      break;
    }
    case 'getValueInt32': {
      let result = napitest.NapiGetValueInt32Test();
      console.info('NumberWorker: NapiGetValueInt32Test result is ' + result);
      workerPort.postMessage(result);
      break;
    }
    case 'getValueUint32': {
      let result = napitest.NapiGetValueUint32Test();
      console.info('NumberWorker: NapiGetValueUint32Test result is ' + result);
      workerPort.postMessage(result);
      break;
    }
    case 'getValueInt64': {
      let result = napitest.NapiGetValueInt64Test();
      console.info('NumberWorker: NapiGetValueInt64Test result is ' + result);
      workerPort.postMessage(result);
      break;
    }
    case 'getValueDouble': {
      let result = napitest.NapiGetValueDoubleTest();
      console.info('NumberWorker: NapiGetValueDoubleTest result is ' + result);
      workerPort.postMessage(result);
      break;
    }
    case 'combinedTest': {
      // 混合操作测试：创建和获取操作同时进行
      let createResult = napitest.NapiCreateInt32Test();
      let getResult = napitest.NapiGetValueInt32Test();
      let combinedResult = createResult && getResult;
      console.info('NumberWorker: combinedTest result is ' + combinedResult);
      workerPort.postMessage(combinedResult);
      break;
    }
    default:
      console.warn('NumberWorker: Unknown message type:', e.data);
      workerPort.postMessage(false);
      break;
  }
};
