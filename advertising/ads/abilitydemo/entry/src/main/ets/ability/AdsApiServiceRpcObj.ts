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

import { rpc } from '@kit.IPCKit';
import Logger from '../log/HiAdLog';
import { AdContentRsp } from './AdContentRsp';
import { JSON } from '@kit.ArkTS';
import { advertising } from '@kit.AdsKit';

const TAG = 'AdsApiServiceRpcObj';

/**
 * AdsApiService返回给调用方的rpc对象，用于调用方给service发送数据
 */
export default class AdsApiServiceRpcObj extends rpc.RemoteObject {
  constructor(descriptor: string) {
    super(descriptor);
  }

  async onRemoteMessageRequest(code: number, data: rpc.MessageSequence, reply: rpc.MessageSequence,
    options: rpc.MessageOption): Promise<boolean> {
    Logger.i(TAG, `enter onRemoteMessageRequest`);
    const interfaceToken: string = data.readInterfaceToken();
    Logger.i(TAG, `interfaceToken value is : ${interfaceToken}`);
    Logger.i(TAG, `get the code from rpc value is : ${code}`);

    const replyRpcObj = data.readRemoteObject();
    const rpcCallbackFunc = this.buildRpcCallback(code, replyRpcObj);
    return await this.doCheckCode(code, rpcCallbackFunc, data);
  }

  async doCheckCode(code: number, rpcCallbackFunc: IRpcCallback, data: rpc.MessageSequence): Promise<boolean> {
    const ads: Array<advertising.Advertisement> = [];
    ads.push({
      adType: 7,
      uniqueId: '122222',
      rewardVerifyConfig: null,
      rewarded: false,
      shown: false,
      clicked: false
    });
    const slot1: string = 'test1';
    const resMap: Map<string, Array<advertising.Advertisement>> = new Map();
    resMap.set(slot1, ads);
    if (code === 1) {
      // 读取并解析请求参数
      this.checkCode(data, rpcCallbackFunc, resMap);
    }
    if (code === 2) {
      // 读取响应体
      const buffer: Array<string> = [];
      data.readStringArray(buffer);
      const respStr: string = buffer.join('');
      Logger.i(TAG, `get the respStr from rpc value is : ${respStr}`);
      let adContentRsp: AdContentRsp = JSON.parse(respStr);
      Logger.i(TAG, `json parse to adContentRsp value is : ${JSON.stringify(adContentRsp)}`);
      Logger.i(TAG, `json parse to testType value is : ${adContentRsp.testType}`);

      if (adContentRsp.testType === '21800001') {
        Logger.i(TAG, `testType is  : 21800001`);
        rpcCallbackFunc(21800001, 'System internal error.');
      } else if (adContentRsp.testType === '21800005') {
        Logger.i(TAG, `testType is  : 21800005`);
        rpcCallbackFunc(21800005, 'System internal error.');
      } else if (adContentRsp.testType === 'error') {
        Logger.i(TAG, `testType is  : error`);
        return Promise.reject(false);
      } else if (adContentRsp.testType === 'ok') {
        Logger.i(TAG, `testType is  : ok`);
        rpcCallbackFunc(200, JSON.stringify(resMap));
      } else {
        Logger.i(TAG, `no testType`);
        rpcCallbackFunc(200, JSON.stringify(resMap));
      }
    }
    return true;
  }

  private checkCode(data: rpc.MessageSequence, rpcCallbackFunc: IRpcCallback, resMap: Map<string, Array<advertising.Advertisement>>): void {
    const reqData = {
      // read reqParams
      reqParams: data.readString(),
      // read adOptions
      adOptions: data.readString(),
    };
    let adRequestParams = this.buildAdRequestParams(reqData.reqParams);
    const adRequestParam = adRequestParams[0];
    if (adRequestParam.adType === 2) {
      rpcCallbackFunc(21800001, 'System internal error.');
    } else if (adRequestParam.adType === 7) {
      rpcCallbackFunc(200, JSON.stringify(resMap));
    } else {
      rpcCallbackFunc(200, JSON.stringify(resMap));
    }
  }

  private buildAdRequestParams(reqParams: string): advertising.AdRequestParams[] {
    let adRequestParams: advertising.AdRequestParams[] = JSON.parse(reqParams) as advertising.AdRequestParams[];
    adRequestParams.forEach((adRequestParam) => {
      Logger.i(TAG, `adRequestParam: ${adRequestParam}`);
      adRequestParam.packageName = 'com.acts.AdsServiceDemo';
      adRequestParam.requestStartTime = Date.now().toString();
    });
    return adRequestParams;
  }

  protected buildRpcCallback(rpcCode: number, replyRpcObj: rpc.IRemoteObject): IRpcCallback {
    return (respCode: number, respData: string) => {
      Logger.i(TAG, `resp code is: ${respCode}`);
      const data = rpc.MessageSequence.create();
      data.writeInt(respCode);
      data.writeString(respData);
      const reply = rpc.MessageSequence.create();
      replyRpcObj.sendMessageRequest(rpcCode, data, reply, new rpc.MessageOption(1))
        .catch(e => {
          Logger.e(TAG, `send message from kit to caller failed, code: ${e.code}, msg: ${e.message}`);
        })
        .finally(() => {
          data.reclaim();
          reply.reclaim();
        });
    };
  }
}

export interface IRpcCallback {
  (respCode: number, respData: string): void;
}
