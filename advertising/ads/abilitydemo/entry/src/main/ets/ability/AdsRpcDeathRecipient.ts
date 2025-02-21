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
import rpc from '@ohos.rpc';
import Logger from '../log/HiAdLog';

const TAG = 'AdsRpcDeathRecipient';

/**
 * 用于监听远程RPC对象的死亡状态
 */
export default class AdsRpcDeathRecipient implements rpc.DeathRecipient {
  /**
   * rpc远程对象来源
   */
  private callingUid: number;

  constructor(callingUid: number) {
    this.callingUid = callingUid;
  }

  onRemoteDied(): void {
    Logger.i(TAG, `remote rpc obj from ${this.callingUid} is died`);
  }
}




