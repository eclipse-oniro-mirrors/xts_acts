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
import imageApi from "@ohos.multimedia.image";

const parentPort = worker.workerPort;
console.info("worker:: new version")

const WIDTH = 8192;
const HEIGHT = 8;
const CAPACITY = 8;
const { JPEG: FORMATJPEG } = imageApi.ImageFormat;
const { JPEG } = imageApi.ComponentType;
let isFirstlisten = false;

function createRecriver(threadId) {
    const id = threadId
    const receiver = imageApi.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
    if (receiver == undefined) {
        return receiver
    }
    receiver.on("imageArrival", () => {
        console.info("worker::on in " + id);
        if (isFirstlisten) {
            return
        }
        console.info("worker::on in in  " + id);
        isFirstlisten = true;
        receiver.readLatestImage((err, img) => {
            console.info("worker::readLatestImage " + id);
            img.getComponent(JPEG, (err2, component) => {
                console.info("worker::getComponent err " + JSON.stringify(err2));
                parentPort.postMessage(id);
            });
        });
    })
    return receiver;
}

parentPort.onclose = function () {
    console.info("worker::worker.js onclose");
}

parentPort.onmessage = function (e) {
    let data = e.data;
    console.info("worker:: worker thread worker data is " + data);
    let receiver = createRecriver(data);
    if (receiver != undefined) {
        var dummy = receiver.test;
    }
}

// Deserialization error
parentPort.onmessageerror = function () {
    console.info("worker:: worker.js onmessageerror");
}

// js execution error
parentPort.onerror = function (data) {
    console.info("worker:: worker.js onerror " + data.lineno + ", msg = " + data.message + ", filename = " + data.filename + ", colno = " + data.colno);
}