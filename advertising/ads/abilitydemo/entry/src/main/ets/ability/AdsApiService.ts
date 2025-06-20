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

import { ServiceExtensionAbility, Want } from '@kit.AbilityKit';
import { rpc } from '@kit.IPCKit';
import AdsApiServiceRpcObj from './AdsApiServiceRpcObj';
import Logger from '../log/HiAdLog';

const TAG: string = 'AdsApiService';

/**
 * ads kit对外提供的service对象，用于媒体侧交互
 */
export default class AdsApiService extends ServiceExtensionAbility {
  private descriptor: string = 'com.ohos.AdsApiService';

  /**
   * service初始化回调
   *
   * @param want want
   */
  onCreate(want: Want): void {
    Logger.i(TAG, `service onCreate`);
  }

  /**
   * service启动回调
   *
   * @param want want
   * @param startId service启动次数
   */
  onRequest(want: Want, startId: number): void {
    Logger.i(TAG, `service onRequest`);
  }

  /**
   * service建连回调
   *
   * @param want want
   * @returns 返回给调用端的RPC对象实例，用于商用端给kit发消息
   */
  onConnect(want: Want): rpc.RemoteObject | Promise<rpc.RemoteObject> {
    Logger.i(TAG, `service onConnect`);
    return new AdsApiServiceRpcObj(this.descriptor);
  }

  /**
   * service断连回调
   *
   * @param want want
   */
  onDisconnect(want: Want): void {
    Logger.i(TAG, `service onDisconnect`);
  }

  /**
   * service销毁回调
   */
  onDestroy(): void {
    Logger.i(TAG, `service onDestory`);
  }
}
