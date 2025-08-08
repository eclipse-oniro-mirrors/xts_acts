
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';

const baiduUrl: string = "https://www.baidu.com";
const baiduPinRight: string = 'Q6TCQAWqP4t+eq41xnKaUgJdrPWqyG5L+Ni2YzMhqdY=';
const baiduPinWrong: string= 'AAAAQAWqP4t+eq41xnKaUgJdrPWqyG5L+Ni2YzMhqdY=';

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};


export default function HttpCertificatePinTest() {
  describe('HttpCertificatePinTest', () => {

    /**
     * @tc.number: SUB_NetworkMgr_Http_CertificatePin_0100
     * @tc.name  : testHttpCertificatePin0100
     * @tc.desc  : test certificatePin with wrong baidu's PIN value
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testHttpCertificatePin0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = 'testHttpCertificatePin0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        let requestOptions: http.HttpRequestOptions = {
          usingProtocol: http.HttpProtocol.HTTP1_1,
          header: { 'content-type': 'application/json' },
          certificatePinning: { publicKeyHash: baiduPinWrong, hashAlgorithm: 'SHA-256' }
        }
        httpRequest.on("headersReceive", (data: Object) => {
          console.info("Rcv headers");
        });
        httpRequest.on("dataEnd", () => {
          console.info("Rcv data end");
        });
        httpRequest.request(baiduUrl, requestOptions, (err, data) => {
          if (err) {
            console.info("HTTP Request error: " + JSON.stringify(err));
            httpRequest.destroy();
            done();
          } else {
            console.info("HTTP Request data: " + JSON.stringify(data));
            httpRequest.destroy();
            done();
          }
        })
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_CertificatePin_0200
     * @tc.name  : testHttpCertificatePin0200
     * @tc.desc  : test certificatePin with correct baidu's PIN value
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testHttpCertificatePin0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = 'testHttpCertificatePin0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        let requestOptions: http.HttpRequestOptions = {
          usingProtocol: http.HttpProtocol.HTTP1_1,
          header: { 'content-type': 'application/json' },
          certificatePinning: {publicKeyHash: baiduPinRight, hashAlgorithm: 'SHA-256'},
        }

        httpRequest.on("headersReceive", (data: Object) => {
          console.info("Rcv headers");
        });
        httpRequest.on("dataEnd", () => {
          console.info("Rcv data end");
        });
        httpRequest.request(baiduUrl, requestOptions, (err, data) => {
          if (err) {
            console.info("HTTP Request error: " + JSON.stringify(err));
            httpRequest.destroy();
            done();
          } else {
            console.info("HTTP Request data: " + JSON.stringify(data));
            httpRequest.destroy();
            done();
          }
        })
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });
  });
}

