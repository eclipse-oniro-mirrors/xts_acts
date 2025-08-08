/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import commonEvent from '@ohos.commonEventManager';
import Logger from '../log/HiAdLog';

const TAG = 'EventPublish';

export class EventPublish {
  static publishEvents(event: string, options) {
    // 发布公共事件
    commonEvent.publish(event, options, (err) => {
      if (err) {
        Logger.e(TAG, `PublishCallBack err=${JSON.stringify(err)}`);
      } else {
        Logger.i(TAG, `Publish success, event: ${JSON.stringify(options)}`);
      }
    })
  }
}