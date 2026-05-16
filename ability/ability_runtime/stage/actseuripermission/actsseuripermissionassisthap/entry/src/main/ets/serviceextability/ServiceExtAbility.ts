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
import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility';
import commonEvent from '@ohos.commonEvent';
import fs from '@ohos.file.fs';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';

function log(info: string) {
  console.error("[ServiceExtApp]:: ", info);
}

export function readUri(uri: string) {
  try {
    log(`uri = ${uri}`)
    let file = fs.openSync(uri, fs.OpenMode.READ_ONLY);
    log(`open file successfully!`);
    let buf = new ArrayBuffer(1024);
    let readLen = fs.readSync(file.fd, buf, { offset: 0 });
    let fileContent = String.fromCharCode.apply(null, new Uint8Array(buf.slice(0, readLen)));
    log("read success: " + fileContent);
    fs.closeSync(file);
    return "read ok!";
  } catch (e) {
    return "read failed: " + JSON.stringify(e);
  }
}

let EVENT_READ_SUCCESS: string = 'Event_Read_Successfully';
let EVENT_READ_FAILED: string = 'Event_Read_FAILED';

export default class ServiceExtAbility extends ServiceExtensionAbility {
  onCreate(want: Want) {
    log("ServiceExtAbility OnCreate")
  }

  onRequest(want: Want, startId) {
    log("ServiceExtAbility onRequest");
    if (!want.parameters.publish_event) {
      log("no need to publish event.");
      return;
    }
    let testcase: string = "";
    if (want.parameters.testcase) {
      testcase = String(want.parameters.testcase);
    }
    let uri = want.uri;
    if (!uri) {
      uri = want.parameters['ability.params.stream'][0];
    }
    let res = readUri(uri);
    log(`uri = ${uri}, res = ${res}`);
    let resultEvent = EVENT_READ_FAILED + testcase;
    if (res === "read ok!") {
      resultEvent = EVENT_READ_SUCCESS + testcase;
    }
    commonEvent.publish(resultEvent, (err: BusinessError) => {
      log(`publish ${resultEvent}, err = ${JSON.stringify(err)}`);
    });
  }

  onDestroy() {
    log("ServiceExtAbility onDestroy");
  }
}
