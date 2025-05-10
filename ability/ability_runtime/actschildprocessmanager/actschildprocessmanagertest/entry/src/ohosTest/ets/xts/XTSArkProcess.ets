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

import ChildProcess from '@ohos.app.ability.ChildProcess';
import { BusinessError } from '@ohos.base';
import { ChildProcessArgs } from '@ohos.app.ability.ChildProcessArgs';
import { publishEvent } from '../utils/Utils';
import fs from '@ohos.file.fs';
import util from '@ohos.util';

export default class XTSArkProcess extends ChildProcess {
  public static EVENT = 'Acts_XTSArkProcess_OnStart_Event';

  onStart(args?: ChildProcessArgs) {
    console.log(`XTSArkProcess onStart() called, args:${JSON.stringify(args)}`);
    console.log(`XTSArkProcess entryParams is ${args?.entryParams}`);
    console.log(`XTSArkProcess fds is ${JSON.stringify(args?.fds)}`);

    if (args?.fds?.length == 0) {
      publishEvent(XTSArkProcess.EVENT, args?.entryParams, '');
      return;
    }

    this.readFile(args?.fds?.fd1)
      .then((str) => {
        console.log(`XTSArkProcess read length${str.length}, Result:${str} `);
        publishEvent(XTSArkProcess.EVENT, args?.entryParams, str);
      })
      .catch((err: BusinessError) => {
        console.error(`XTSArkProcess read error, errorCode: ${err.code}, errorMsg:${err.message}`);
        publishEvent(XTSArkProcess.EVENT, args?.entryParams, '');
      })

    console.log(`XTSArkProcess end() called`);
  }

  async readFile(fd?: number): Promise<string> {
    let buf = new ArrayBuffer(4);
    fs.readSync(fd, buf);
    let decoder = util.TextDecoder.create('utf-8');
    let str = decoder.decodeWithStream(new Uint8Array(buf));
    return new Promise<string>((resolve, reject) => {
      resolve(str);
    });
  }
}