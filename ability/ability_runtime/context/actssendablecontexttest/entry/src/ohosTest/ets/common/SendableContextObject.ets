/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import sendableContextManager from '@ohos.app.ability.sendableContextManager';
import common from '@ohos.app.ability.common';

@Sendable
export class SendableContextObject {
  constructor(sendableContext: sendableContextManager.SendableContext, contextName: string) {
    this.sendableContext = sendableContext;
    this.contextName = contextName;
  }

  public sendableContext: sendableContextManager.SendableContext;
  public contextName: string;
}

export class NormalContextObject {
  constructor(context: common.Context, contextName: string) {
    this.normalContext = context;
    this.contextName = contextName;
  }

  public normalContext: common.Context;
  public contextName: string;
}

