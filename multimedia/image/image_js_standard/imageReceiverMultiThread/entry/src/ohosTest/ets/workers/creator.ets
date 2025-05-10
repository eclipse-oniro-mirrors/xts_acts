/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import worker from '@ohos.worker';
import imageApi from '@ohos.multimedia.image';

const parentPort = worker.workerPort;
console.info('worker:: new version')

const WIDTH = 8192;
const HEIGHT = 8;
const CAPACITY = 8;
const FORMATJPEG = imageApi.ImageFormat.JPEG;

function createCreator(threadId: Object) {
  const id: Object = threadId
  const creator = imageApi.createImageCreator(WIDTH, HEIGHT, FORMATJPEG, CAPACITY)
  if (creator == undefined) {
    return creator
  }
  creator.on('imageRelease', () => {
    console.info('worker::creator imageRelease IN');
  })
  creator.dequeueImage((err1, img) => {
    try {
      if (err1 || img == undefined) {
        console.info('dequeueImage fail: ' + err1);
        return;
      }
      console.info('dequeueImage Success: ' + id);
      creator.queueImage(img, (err2) => {
        if (err2) {
          console.info('queueImage failerr: ' + err2);
          return;
        }
        console.info('queueImage Success ' + id);
        parentPort.postMessage(id);
      })
    } catch (error0) {
      console.info('dequeueImage catch: ' + error0);
    }
  })
  return creator;
}


parentPort.onmessage = (e) => {
  let data: number = e.data;
  console.info('worker:: worker2 thread worker data is ' + data);
  let dummy = createCreator(data);
}

// Deserialization error
parentPort.onmessageerror = () => {
  console.info('worker:: worker.js onmessageerror');
}

// js execution error
parentPort.onerror = (data) => {
  console.info('worker:: worker.js onerror ' + data.lineno + ', msg = ' + data.message + ', filename = ' +
  data.filename + ', colno = ' + data.colno);
}