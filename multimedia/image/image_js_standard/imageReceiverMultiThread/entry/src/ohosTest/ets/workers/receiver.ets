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

import worker, { MessageEvents } from '@ohos.worker';
import imageApi from '@ohos.multimedia.image';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@kit.BasicServicesKit';

const parentPort = worker.workerPort;
const CAPACITY = 8;
const JPEG = imageApi.ComponentType.JPEG;
let isFirstlisten = false;
let numID: number;

async function createRecriver() {
  let size: image.Size = {
    width: 640,
    height: 480
  }
  let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, CAPACITY);
  let imageReceiverSurfaceId: string = await receiver.getReceivingSurfaceId();
  console.info('imageReceiverSurfaceId is: ' + imageReceiverSurfaceId);

  receiver.on('imageArrival', () => {
    console.info('worker::on in ' + numID);
    if (isFirstlisten) {
      return
    }

    console.info('worker::on in in  ' + imageReceiverSurfaceId);
    isFirstlisten = true;
    receiver.readLatestImage((err, img) => {
      console.info('worker::readLatestImage ' + imageReceiverSurfaceId);
      img.getComponent(JPEG, (err: BusinessError, component: image.Component) => {
        if (err) {
          console.error(`Failed to get the component.code ${err.code},message is ${err.message}`);
        } else {
          console.info('Succeeded in getting component.');
          parentPort.postMessage(numID);
        }
      });
    });
  })
  parentPort.postMessage(imageReceiverSurfaceId);

}

parentPort.onmessage = async (e: MessageEvents) => {
    createRecriver();
    numID = e.data;
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