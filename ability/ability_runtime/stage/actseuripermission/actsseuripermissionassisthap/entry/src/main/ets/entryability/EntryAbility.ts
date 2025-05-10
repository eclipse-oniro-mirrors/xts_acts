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
import commonEvent from '@ohos.commonEvent';
import UIAbility from '@ohos.app.ability.UIAbility';
import fs from '@ohos.file.fs';
import hilog from '@ohos.hilog';
import Want from '@ohos.app.ability.Want';
import type window from '@ohos.window';
import { BusinessError } from '@ohos.base';

let EVENT_READ_SUCCESS: string = 'Event_Read_Successfully';
let EVENT_READ_FAILED: string = 'Event_Read_FAILED';

function log(info: string) {
  console.error("[ServiceExtApp]:: ", info);
}

function readUri(uri: string) {
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

function setWantParam(want: Want) {
  let publish_event: boolean = false;
  let uri: string = "";
  let testcase: string = "";
  if (want) {
    if (want.uri) {
      uri = want.uri;
    } else if (want.parameters['ability.params.stream']) {
      uri = want.parameters['ability.params.stream'][0];
    } else if (want.parameters["uri"]) {
      uri = String(want.parameters["uri"]);
    }
    if (want.parameters["testcase"]) {
      testcase = String(want.parameters["testcase"]);
    }
    if (want.parameters["publish_event"]) {
      publish_event = Boolean(want.parameters["publish_event"]);
    }
  } else {
    log("want is null.");
  }
  AppStorage.setOrCreate<boolean>("publish_event", publish_event);
  AppStorage.setOrCreate<string>("uri", uri);
  AppStorage.setOrCreate<string>("testcase", testcase);
}

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam) {
    log("EntryAbility OnCreate");
    setWantParam(want);
  }

  onNewWant(want: Want, launchParam) {
    log("EntryAbility onNewWant");
    setWantParam(want);
  }

  onDestroy() {
    log("EntryAbility OnDestroy");
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    log("EntryAbility onWindowStageCreate");
    windowStage.loadContent('pages/Index', (err: BusinessError, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    log("EntryAbility onForeground")
    let publish_event = AppStorage.get<boolean>("publish_event");
    if (!publish_event) {
      log("not need publish event.");
      return;
    }
    let testcase = AppStorage.get<string>("testcase");
    let uri = AppStorage.get<string>("uri");
    let res = readUri(uri);
    log(`EntryAbility uri = ${uri}, res = ${res}`);
    if (res === "read ok!") {
      commonEvent.publish(EVENT_READ_SUCCESS + testcase, (err) => {
        log(`EntryAbility publish ${EVENT_READ_SUCCESS + testcase}, err = ${JSON.stringify(err)}`);
      });
    } else {
      commonEvent.publish(EVENT_READ_FAILED + testcase, (err) => {
        log(`EntryAbility publish ${EVENT_READ_FAILED + testcase}, err = ${JSON.stringify(err)}`);
      });
    }
    log("EntryAbility singleRes: " + res);
    this.context.terminateSelf();
  }

  onBackground() {
    log("EntryAbility onBackground");
  }
}
