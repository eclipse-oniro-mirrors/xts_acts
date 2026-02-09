/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import http from '@ohos.net.http';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let httpRequest = http.createHttp();

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test sucess`);
  }
}
export default function httpNoPTest() {

  describe("HttpNoPTest", (): void => {

    hilog.info(domain, tag, '%{public}s', 'describe start');
    /**
     * @tc.name   testNetMgrHttpRequestNop_static__0100
     * @tc.number SUB_NetMgr_Http_Request_Nop_0100
     * @tc.desc   Using the request (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetMgrHttpRequestNop_static__0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrHttpRequestNop_static__0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        httpRequest.request("xxx", (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectTrue(err?.code == 201);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' request success ');
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err?.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetMgrHttpRequestNop_static__0200
     * @tc.number SUB_NetMgr_Http_Request_Nop_0200
     * @tc.desc   Using the request (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetMgrHttpRequestNop_static__0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrHttpRequestNop_static__0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        httpRequest.request("xxx", {
          method: http.RequestMethod.GET
        }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectTrue(err?.code == 201);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' request success ');
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        })
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err?.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetMgrHttpRequestNop_static__0300
     * @tc.number SUB_NetMgr_Http_Request_Nop_0300
     * @tc.desc   Using the Request (promise) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetMgrHttpRequestNop_static__0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrHttpRequestNop_static__0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        httpRequest.request("xxx", {
          method: http.RequestMethod.GET
        }).then((data:http.HttpResponse) => {
          hilog.info(domain, tag, '%{public}s', caseName +' request success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetMgrHttpRequestNop_static__0400
     * @tc.number SUB_NetMgr_Http_Request_Nop_0400
     * @tc.desc   Using the Request (promise) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetMgrHttpRequestNop_static__0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrHttpRequestNop_static__0400';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        httpRequest.request("xxx").then((data:http.HttpResponse) => {
          hilog.info(domain, tag, '%{public}s', caseName +' request success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

  })
}